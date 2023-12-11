<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class SignatureUtils {
    public static function createSignatureFromObj($checksumKey, $obj) {
        ksort($obj);
        $queryStrArr = [];
        foreach ($obj as $key => $value) {
            if (in_array($value, ["undefined", "null"]) || gettype($value) == "NULL") {
                $value = "";
            }

            if (is_array($value)) {
                $valueSortedElementObj = array_map(function ($ele) {
                    ksort($ele);
                    return $ele;
                }, $value);
                $value = json_encode($valueSortedElementObj);
            }
            $queryStrArr[] = $key . "=" . $value;
        }
        $queryStr = implode("&", $queryStrArr);
        $signature = hash_hmac('sha256', $queryStr, $checksumKey);
        return $signature;
    }

    public static function createSignaturePaymentRequest($checksumKey, $obj) {
        $dataStr = "amount={$obj["amount"]}&cancelUrl={$obj["cancelUrl"]}&description={$obj["description"]}&orderCode={$obj["orderCode"]}&returnUrl={$obj["returnUrl"]}";
        $signature = hash_hmac("sha256", $dataStr, $checksumKey);
        return $signature;
    }
}

class OrderController extends Controller
{
    private string $payOSClientId;
    private string $payOSApiKey;
    private string $payOSChecksumKey;

    public function __construct() { 
        $this->payOSClientId = env('PAYOS_CLIENT_ID');
        $this->payOSApiKey = env('PAYOS_API_KEY');
        $this->payOSChecksumKey = env('PAYOS_CHECKSUM_KEY');
    }

    public function createOrder(Request $request) {
        $body = json_decode($request->getContent(), true);
        if (!($body["amount"] && $body["description"] && $body["returnUrl"] && $body["cancelUrl"])){
            return response()->json([
                "error" => -1,
                "message" => "Invalid Parameter",
                "data" => null
            ]);
        }

        $body["orderCode"] = intval(substr(strval(microtime(true) * 10000), -6));

        $paymentRequestSignature = SignatureUtils::createSignaturePaymentRequest($this->payOSChecksumKey, $body);
        $body["signature"] = $paymentRequestSignature;
        
        
            $paymentRequest = curl_init();
            curl_setopt($paymentRequest, CURLOPT_URL, "https://api-merchant.payos.vn/v2/payment-requests");
            curl_setopt($paymentRequest, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($paymentRequest, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($paymentRequest, CURLOPT_HTTPHEADER, array(
                    "Content-Type: application/json",
                    "x-client-id: f2b4e28d-e17e-47aa-8a07-44eea991a2de",
                    "x-api-key: 63c7e25b-29b9-4743-9f55-c7ee5034445f"
                )
            );
            
            curl_setopt($paymentRequest, CURLOPT_POST, 1);
            curl_setopt($paymentRequest, CURLOPT_POSTFIELDS, json_encode($body));
            $response = curl_exec($paymentRequest);

            #Ensure to close curl
            curl_close($paymentRequest);
            $response = json_decode($response, true);

            // Check response data integrity
            $responseDataSignature = SignatureUtils::createSignatureFromObj($this->payOSChecksumKey, $response["data"]);
            if ($responseDataSignature != $response["signature"]) {
                return response()->json([
                    "error" => -1,
                    "message" => "Signature not match",
                    "data" => null
                ]);
            }

            return response()->json([
                "error" => 0,
                "message" => "Ok",
                "data" => [
                    "checkoutUrl" => $response["data"]["checkoutUrl"]
                ]
            ]);

            // Alternative way to make http request
            // $paymentRequest = curl_init();
            // curl_setopt($paymentRequest, CURLOPT_URL, "https://api-merchant.payos.vn/v2/payment-requests");
            // curl_setopt($paymentRequest, CURLOPT_RETURNTRANSFER, 1);
            // curl_setopt($paymentRequest, CURLOPT_HTTPHEADER, array(
            //         "Content-Type: application/json",
            //         "x-client-id: {$PAYOS_CLIENT_ID}",
            //         "x-api-key: {$PAYOS_API_KEY}"
            //     )
            // );
            
            // curl_setopt($paymentRequest, CURLOPT_POST, 1);
            // curl_setopt($paymentRequest, CURLOPT_POSTFIELDS, json_encode($body));
            // $response = curl_exec($paymentRequest);

            // #Ensure to close curl
            // curl_close($paymentRequest);
            // $response = json_decode($response, true);
        
    }

    public function getPaymentLinkInfoOfOrder(string $id) {
        
            $paymentRequest = curl_init();
            curl_setopt($paymentRequest, CURLOPT_URL, "https://api-merchant.payos.vn/v2/payment-requests/{$id}");
            curl_setopt($paymentRequest, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($paymentRequest, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($paymentRequest, CURLOPT_HTTPHEADER, array(
                    "Content-Type: application/json",
                    "x-client-id: f2b4e28d-e17e-47aa-8a07-44eea991a2de",
                    "x-api-key: 63c7e25b-29b9-4743-9f55-c7ee5034445f"
                )
            );
            
            curl_setopt($paymentRequest, CURLOPT_HTTPGET, 1);
            $response = curl_exec($paymentRequest);

            #Ensure to close curl
            curl_close($paymentRequest);
            $response = json_decode($response, true);

            $responseDataSignature = SignatureUtils::createSignatureFromObj($this->payOSChecksumKey, $response["data"]);
            if ($responseDataSignature != $response["signature"]) {
                return response()->json([
                    "error" => -1,
                    "message" => "Signature not match",
                    "data" => null
                ]);
            }
            return response()->json([
                "error" => 0,
                "message" => "Ok",
                "data" => $response["data"]
            ]);
        
    }

    public function cancelPaymentLinkOfOrder(Request $request, String $id) {
        $body = json_decode($request->getContent(), true);

        try {
            $cancelBody = is_array($body) && $body["cancellationReason"] ? $body : null;
            $response = Http::withHeaders([
                "x-client-id" => $this->payOSClientId,
                "x-api-key" => $this->payOSApiKey
                ])->post("https://api-merchant.payos.vn/v2/payment-requests/{$id}/cancel", $cancelBody)->json();
                
            $responseDataSignature = SignatureUtils::createSignatureFromObj($this->payOSChecksumKey, $response["data"]);
            if ($responseDataSignature != $response["signature"]) {
                return response()->json([
                    "error" => -1,
                    "message" => "Signature not match",
                    "data" => null
                ]);
            }
            return response()->json([
                "error" => 0,
                "message" => "Ok",
                "data" => $response["data"]
            ]);
        } catch (\Throwable $th) {
            //throw $th;
            return response()->json([
                "error" => -1,
                "message" => "Error",
                "data" => null
            ]);
        }
    }
}
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Http;
use App\Utils\SigntureUtils;
use SignatureUtils;

class CheckoutController extends Controller
{
    public function __construct() { }

    public function createPaymentLink(Request $request) {
        $YOUR_DOMAIN = "http://localhost:8080";
        $data = [
            "orderCode" => intval(substr(strval(microtime(true) * 10000), -6)),
            "amount" => 1000,
            "description" => "Thanh toan don hang",
            "returnUrl" => $YOUR_DOMAIN . "/success.html",
            "cancelUrl" => $YOUR_DOMAIN . "/cancel.html"
        ];
        $PAYOS_CLIENT_ID = env('PAYOS_CLIENT_ID');
        $PAYOS_API_KEY = env('PAYOS_API_KEY');
        $PAYOS_CHECKSUM_KEY = env('PAYOS_CHECKSUM_KEY');

        $requestSignature = SignatureUtils::createSignaturePaymentRequest($PAYOS_CHECKSUM_KEY, $data);
        $data["signature"] = $requestSignature;

        try {
            $response = Http::withHeaders([
                "x-client-id" => $PAYOS_CLIENT_ID,
                "x-api-key" => $PAYOS_API_KEY
            ])->post("https://api-merchant.payos.vn/v2/payment-requests", $data)->json();

            $responseDataSignature = SignatureUtils::createSignatureFromObj($PAYOS_CHECKSUM_KEY, $response["data"]);
            if ($responseDataSignature != $response["signature"]) {
                return "Signature not match";
            }
            return redirect($response["data"]["checkoutUrl"]);

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
            // curl_setopt($paymentRequest, CURLOPT_POSTFIELDS, json_encode($data));
            // $response = curl_exec($paymentRequest);

            // #Ensure to close curl
            // curl_close($paymentRequest);
            // $response = json_decode($response, true);
        } catch (\Throwable $th) {
            //throw $th;
            return "Error";
        }
    }
}
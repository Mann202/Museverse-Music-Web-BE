<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use SignatureUtils;

class PaymentController extends Controller
{
    //
    public function handlePayOSWebhook(Request $request) {
        $body = json_decode($request->getContent(), true);
        // Handle webhook test
        if (in_array($body["data"]["description"], ["Ma giao dich thu nghiem", "VQRIO123"])) {
            return response()->json([
                "error" => 0,
                "message" => "Ok",
                "data" => $body["data"]
            ]);
        }

        // Check webhook data integrity 
        $PAYOS_CHECKSUM_KEY = env('PAYOS_CHECKSUM_KEY');
        $webhookDataSignature = SignatureUtils::createSignatureFromObj($PAYOS_CHECKSUM_KEY, $body["data"]);
        if ($webhookDataSignature != $body["signature"]) {
            return response()->json([
                "error" => -1,
                "message" => "Signature not match",
                "data" => null
            ], 403);
        }

        $webhookData = $body["data"];
        /**
         * Source code uses data of webhook
         * ....
         * ....
         */
        return response()->json([
            "error" => 0,
            "message" => "Ok",
            "data" => $webhookData
        ]);
    }
}
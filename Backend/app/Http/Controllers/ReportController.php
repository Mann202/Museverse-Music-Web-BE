<?php

namespace App\Http\Controllers;

use App\Models\AlbumOrder;
use App\Models\Users;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ReportController extends Controller
{
    public function overview()
    {
        $userIds = Users::query()
            ->whereNotIn('accountTypeID', [3, 4])
            ->pluck('user_id')->toArray();

        $total = AlbumOrder::query()
            ->whereIn('cust_id', $userIds)
            ->sum('total_final');
        return response()->json([
            'total' => $total,
        ]);
    }

    public function reportUser(Request $request)
    {
        $userIds = Users::query()
            ->whereNotIn('accountTypeID', [3, 4])
            ->pluck('user_id')->toArray();
        $years = AlbumOrder::query()
            ->selectRaw('YEAR(created_at) as year')
            ->groupBy('year')
            ->pluck('year')
            ->toArray();

        $requestYear = $request->input('year');
        if (empty($requestYear)) {
            $requestYear = date('Y');
        }

        $data = AlbumOrder::query()
            ->whereIn('cust_id', $userIds)
            ->whereYear('created_at', $requestYear)
            ->selectRaw('MONTH(created_at) as month, SUM(total_final) as total')
            ->groupBy('month')
            ->orderBy('month')
            ->get();

        $months = [];
        $totals = [];
        foreach ($data as $item) {
            $months[] = 'Tháng ' . $item->month;
            $totals[] = $item->total;
        }

        return response()->json([
            'months' => $months,
            'totals' => $totals,
            'years' => $years,
        ]);
    }
}

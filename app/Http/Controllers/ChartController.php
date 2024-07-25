<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ChartController extends Controller
{

    public function index()
    {
        // Fetch the data from the database
        $videos = DB::table('videos')
                    ->select('channel_id', DB::raw('COUNT(*) as count'))
                    ->groupBy('channel_id')
                    ->get();

        // Prepare the data for Highcharts
        $data = [];
        $totalUploads = 0;

        foreach ($videos as $video) {
            $data[] = [
                'name' => 'Channel ' . $video->channel_id, // Assuming you want to display 'Channel' with ID
                'y' => $video->count
            ];
            $totalUploads += $video->count;
        }

        return view('charts', compact('data', 'totalUploads'));
    }
}

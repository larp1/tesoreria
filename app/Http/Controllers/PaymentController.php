<?php

namespace App\Http\Controllers;

use App\Models\Payment;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if ($request->total_pagar == 5000){
            $payment = new Payment;
            $payment->student_id = $request->id_student;
            $payment->month_id = $request->id_mes;
            $payment->amount = $request->total_pagar;
            $payment->year = date('Y');
            $payment->save();
        }
        else{
            $payment = Payment::where('month_id',$request['id_mes'])
            ->where('student_id',$request->id_student)->first();

            if (!empty($payment)){
                $payment->amount = $payment->amount+$request->total_pagar;
                $payment->save();
            }
            else{
                $payment = new Payment;
                $payment->student_id = $request->id_student;
                $payment->month_id = $request->id_mes;
                $payment->amount = $request->total_pagar;
                $payment->save();
            }
            
        }

        return back()->with('status',200);
    }
}

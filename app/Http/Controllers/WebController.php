<?php

namespace App\Http\Controllers;

use App\Models\Months;
use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class WebController extends Controller
{
    public function index()
    {
        // Tu lógica aquí
        $students = Student::leftJoin('payments','payments.student_id','=','students.id','payments.year','=','students.year')
        ->select('payments.student_id','students.name', 'students.last_name', DB::raw('SUM(amount) as amount'),'students.id')
        ->groupBy('payments.student_id','students.name','students.last_name','students.id')
        ->where('students.year', 2024)
        ->orderBy('students.last_name')
        ->get();
        
        return view('web.index',['students' => $students]);
    }

    public function detail(Request $request, $id){
        
        $student = Student::find($id);

        $months = Months::leftJoin('payments', function($join) use ($id){
                $join->on('payments.month_id','=','months.id');
                $join->where('payments.student_id',$id);
            }
        )
        ->leftjoin('students','students.id','=','payments.student_id')
        ->where('months.active',1)
        ->orderBy('months.id')
        ->select('months.id as id_month','months.name as month_name','payments.amount','students.name as student_name','students.last_name','students.id as id_student')
        ->get();
        
        return view('web.detail',['months' => $months, 'id_student' => $id, 'student_name' => ($student->name.' '.$student->last_name)]);
    }

    public function resumen(){
        return view('web.resumen');
    }

}

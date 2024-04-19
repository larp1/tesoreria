<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Student;

class StudentController extends Controller
{
    public function getStudents(){
        $students = Student::where('year', '=', 2024)->get();

        return $students;
    }
}

<?php

namespace Database\Seeders;

use App\Models\Student;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        Student::create(['name' => 'Vicente', 'last_name' => 'Aguilera']);
        Student::create(['name' => 'magdalena', 'last_name' => 'avilés']);
        Student::create(['name' => 'ema', 'last_name' => 'escobar']);
        Student::create(['name' => 'alonso', 'last_name' => 'canales']);
        Student::create(['name' => 'juan', 'last_name' => 'cañas']);
        Student::create(['name' => 'vicente', 'last_name' => 'castillo']);
        Student::create(['name' => 'mateo', 'last_name' => 'cortés']);
        Student::create(['name' => 'jesús', 'last_name' => 'farías']);
        Student::create(['name' => 'bruno', 'last_name' => 'garcía']);
        Student::create(['name' => 'dante', 'last_name' => 'gómez']);
        Student::create(['name' => 'tomas', 'last_name' => 'ibáñez']);
        Student::create(['name' => 'monserrat', 'last_name' => 'leiva']);
        Student::create(['name' => 'ana sofía', 'last_name' => 'morales']);
        Student::create(['name' => 'rodolfo', 'last_name' => 'muñoz']);
        Student::create(['name' => 'facundo', 'last_name' => 'odger']);
        Student::create(['name' => 'josefa', 'last_name' => 'orrego']);
        Student::create(['name' => 'leonor', 'last_name' => 'peralta']);
        Student::create(['name' => 'luciano', 'last_name' => 'piñones']);
        Student::create(['name' => 'maite', 'last_name' => 'rivera']);
        Student::create(['name' => 'leticia', 'last_name' => 'rivera']);
        Student::create(['name' => 'bruno', 'last_name' => 'rodríguez']);
        Student::create(['name' => 'florencia', 'last_name' => 'rodríguez']);
        Student::create(['name' => 'benjamín', 'last_name' => 'rodríguez']);
        Student::create(['name' => 'baltazar', 'last_name' => 'sáez']);
        Student::create(['name' => 'amelia', 'last_name' => 'salazar']);
        Student::create(['name' => 'naím', 'last_name' => 'sapiaín']);
        Student::create(['name' => 'vicente', 'last_name' => 'sandoval']);
        Student::create(['name' => 'nicolás', 'last_name' => 'thompson']);
        Student::create(['name' => 'maría jesús', 'last_name' => 'valencia']);
        Student::create(['name' => 'felipe', 'last_name' => 'villanueva']);
    }
}

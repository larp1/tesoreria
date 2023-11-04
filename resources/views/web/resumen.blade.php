@extends('web.master')
@section('content') 

@php
$cuotas_pagadas = 977000;
$rifa1= 290000;
$rifa2=120000;

$array_gastos = [
    'Egresos (antes de cambio de tesorera)' => 481500,
    'Compras hora del té Inglés' => 26390,
    'Compras hora del té Inglés' => 35339,
    'Árbol nativo Don Pedro' => 7000,
    'Reserva arriendo local paseo' => 100000,
    'Toldos & Laterales' => 55000,
    'Regalo día del Profesor' => 20000,
    'Comida día del alumno' => 48000
];

$array_ingresos = [
    'Cuotas recaudadas (antes de cambio de tesorera)' => 606000,
    'Cuotas recaudadas (desde el cambio de tesorera)' => 396000,
    'Rifa 1 (Lunes 25-09-2023)' => 290000,
    'Rifa 2 (30-10-2023)' => 120000,
];
@endphp

<form name="formulario" id="formulario" method="POST" action="" enctype="multipart/form-data">
    @csrf
    <div class="container-fluid mb-3">
        <h2>Resumen de caja</h2>
        <table class="table table-bordered table-striped table-hover table-sm" id="users-table">
            <caption>Lista de Egresos</caption>
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Monto</th>
                </tr>
            </thead>
            <tbody>
            @php
                $total_gastos = 0;
            @endphp
            @foreach ($array_gastos as $key => $value)
               <tr>
                    <td class="w-25">{{ $key }}</td>
                    <td class="w-75">${{ number_format($value,0,'','.') }}</td>
                </tr>
            @php
                $total_gastos += $value;
            @endphp    
            @endforeach                    
            </tbody>
            <tfoot>
                <tr class="table-primary">
                    <td class="text-end"><b>TOTAL GASTOS:</b></td>
                    <td class="font-weight-bold"><b>${{ number_format($total_gastos,0,'','.') }}</b></td>
                </tr>
            </tfoot>
        </table>

        <table class="table table-bordered table-striped table-hover table-sm" id="users-table">
            <caption>Lista de Ingresos</caption>
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Monto</th>
                </tr>
            </thead>
            <tbody>
            @php
                $total_ingreso = 0;
            @endphp
            @foreach ($array_ingresos as $key => $value)
               <tr>
                    <td class="w-25">{{ $key }}</td>
                    <td class="w-75">${{ number_format($value,0,'','.') }}</td>
                </tr>
            @php
                $total_ingreso += $value;
            @endphp    
            @endforeach                    
            </tbody>
            <tfoot>
                <tr class="table-primary">
                    <td class="text-end"><b>TOTAL INGRESOS:</b></td>
                    <td class="font-weight-bold"><b>${{ number_format($total_ingreso,0,'','.') }}</b></td>
                </tr>
            </tfoot>
        </table>

        <div class="alert alert-primary mt-3" role="alert">
            <i class="far fa-money"></i>
            <b>Resumen de caja:</b>
            <p class="ps-4">
                <b>Total Ingresos:</b>${{ number_format($total_ingreso,0,'','.') }}
                <br><b>Total Gastos:</b>${{ number_format($total_gastos,0,'','.') }}
                <br><b>Monto a favor:</b>${{ number_format($total_ingreso-$total_gastos,0,'','.') }}
            </p>
        </div>
    </div>    
    
@endsection
@push('scripts')
<script>
     $(document).ready(function() {

        $('button[data-user-id]').click(function() {
            var userId = $(this).data('user-id');
            var route = $(this).data('route');
            
            // Redirigir a la ruta con el ID como parte de la URL
            window.location.href = route;
        });
    } );
</script>
@endpush
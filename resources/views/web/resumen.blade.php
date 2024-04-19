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
    'Comida día del Profesor' => 48000,
    'Compras día del Profesor' => 16550,
    'Abono regalo fin de año' => 155000,
    'Convivencia fin de año (Cinta, Cajas papel y bolsa de dulces, Dulces para bolsas)'  => 100000,     
    'Bebidas mini en lata' => 16170,
    'Pago final agendas' => 156000,
    'Pago dulce salado y mini hambuguesas' =>94500,
    'Compras varias paseo (globos rojos, azules y amarillos, palo de brochetas, marco de cuadro)' =>20000,
    'Compras del supermercado para el paseo de curso' =>77780,
    'Pago total recinto paseo' =>425000,
    'Papel fotografico' =>5890,
    'Pan marraquta' =>5698,
    'Helado (mora mora y chocolito)' =>11230,
];

$array_ingresos = [
    'Cuotas recaudadas (antes de cambio de tesorera)' => 606000,
    'Cuotas recaudadas (desde el cambio de tesorera)' => 844000,
    'Rifa 1 (Lunes 25-09-2023)' => 280000,
    'Rifa 2 (30-10-2023)' => 172000
];

$array_gastos_2024 = [
    'Regalo cumpleaños' => 27860,
    //'Insumos regalo pascua de resurrección (conejito)' => 27480,
    'Huevitos de pascua' => 21710,
    'Tierra de hoja' => 17330
];
@endphp

<form name="formulario" id="formulario" method="POST" action="" enctype="multipart/form-data">
    @csrf
    <div class="container mb-3">
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
                $total_rifa = 0;
                $cuotas = 0;
            @endphp
            @foreach ($array_ingresos as $key => $value)
               <tr>
                    <td class="w-25">{{ $key }}</td>
                    <td class="w-75">${{ number_format($value,0,'','.') }}</td>
                </tr>
            @php
                 $total_ingreso += $value ;
                
                ++$cuotas;
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
        <div class="row">
            <div class="alert alert-primary mt-3 col-12" role="alert">
                <i class="far fa-money"></i>
                <b>Resumen de caja:</b>
                <p class="ps-4">
                    <b>Total Ingresos: </b>${{ number_format($total_ingreso,0,'','.') }}
                    <br><b>Total Gastos: </b>${{ number_format($total_gastos,0,'','.') }}
                    <br><b>A favor: </b>${{ number_format($total_ingreso-$total_gastos,0,'','.') }}
                </p>
            </div>            
        </div>        
    </div>  
    
    <div class="container mb-3">
        <h2>Resumen de caja 2024</h2>
        <h3>Saldo 2023: ${{ $caja_2023 = number_format($total_ingreso-$total_gastos,0,'','.') }}</h3>
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
            @foreach ($array_gastos_2024 as $key => $value)
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

        <div class="row">
            <div class="alert alert-primary mt-3 col-12" role="alert">
                <i class="far fa-money"></i>
                <b>Resumen de caja:</b>
                <p class="ps-4">
                    <br><b>A favor 2023: </b>${{ $caja_2023 }}
                    <br><b>Devolución bebidas paseo: </b>$14.240
                    <br><b>saldo 2024: </b>${{ number_format(71343 + 14240 - ($total_gastos),0,'','.') }}
                </p>
            </div>            
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
@extends('web.master')
@section('content') 


<form name="formulario" id="formulario" method="POST" action="" enctype="multipart/form-data">
    @csrf
    <div class="container-fluid mb-3">
        <h2>Lista de Alumnos</h2>
        <table class="table table-bordered table-striped table-hover table-sm" id="users-table">
            <caption>Lista de estudiantes del curso 3° Básico Saint Mary</caption>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Pagado</th>
                    <th>Saldo</th>
                    <th>Ver</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $totales = 0;
                    $saldos = 0;
                    $indice = 1;
                @endphp
                @foreach($students as $student)
                @php
                    $total = 0;
                    if ($student->amount > 0){
                        $total = $student->amount;
                    }                    
                    $saldo = 50000 - $total;

                    $totales += $total;
                    $saldos += $saldo;
                @endphp
                <tr>
                    <td>{{ $indice }}</td>
                    <td class="text-capitalize">{{ $student->name.' '.$student->last_name }}</td>
                    <td>${{ number_format($total,0,'','.') }}</td>
                    <td>${{ number_format($saldo,0,'','.') }}</td>
                    <td class="text-center"><button type="button" class="btn btn-primary" data-user-id="{{ $student->id }}" data-route="{{ route('student.detail', ['id' => $student->id]) }}"><i class="fa-solid fa-eye pe-2"></i>Ver</button></td>
                </tr>
                @php
                    ++$indice;
                @endphp
                @endforeach
            </tbody>
            <tfoot>
                <tr class="table-primary">
                    <th colspan="2" class="text-end">TOTALES:</th>
                    <th>${{ number_format($totales,0,'','.') }}</th>
                    <th>${{ number_format($saldos,0,'','.') }}</th>
                    <th></th>
                </tr>
            </tfoot>
        </table>
    </div>    
    
@endsection
@push('scripts')
<script>
     $(document).ready(function() {
        $('#users-table').dataTable( {
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"
            },
            dom: 'lftip',
            pageLength: 50
        } );

        $('button[data-user-id]').click(function() {
            var userId = $(this).data('user-id');
            var route = $(this).data('route');
            
            // Redirigir a la ruta con el ID como parte de la URL
            window.location.href = route;
        });
    } );
</script>
@endpush
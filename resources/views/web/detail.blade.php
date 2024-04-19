@extends('web.master')

@php 
    $valor_cuota = [
        2023 => 5000, 
        2024 => 6000
    ];
@endphp

@section('content')
    <form name="formulario" id="formulario" method="POST" action="{{route('month.payment')}}" enctype="multipart/form-data">
        <input type="hidden" id="id_mes" name="id_mes" value="">
        <input type="hidden" id="id_student" name="id_student" value="{{ $id_student }}">
        
        @csrf
        <div class="container">
            @if (session('status') == 200)
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    El pago se registró correctamente
                    <i class="far fa-smile-wink ps-2 fa-2x"></i>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            @endif
            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Pagar Mes de <span id="span_mes"></span> </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p><b>Saldo Total:</b> <span id="span_saldo"></span></p>

                            <div class="mb-3">
                                <label for="total_pagar" class="form-label"><b>Total a pagar:</b></label>
                                <input type="text" class="form-control" id="total_pagar" name="total_pagar" aria-describedby="pagar" min="1" max="{{$valor_cuota[date('Y')]}}" placeholder="Ingresa total a pagar">
                                <div id="pagadoHelp" class="form-text">Ingresa el monto a pagar, debe ser menor o igual al saldo</div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button class="btn btn-primary">Pagar</button>
                        </div>
                    </div>
                </div>
            </div>
            <h2 class="mt-0">Detalle de pagos {{ $months[0]->name . ' ' . $months[0]->last_name. ': '}} <span class="text-capitalize">{{$student_name }}</span></h2>
            <table class="table table-bordered table-striped table-hover table-lg" id="users-table">
                {{-- <caption>Detalle de pagos anuales de <span
                        class="text-capitalize">{{ $months[0]->name . ' ' . $months[0]->last_name }}</span></caption> --}}
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Mes</th>
                        <th>Total pagado</th>
                        <th>Saldo</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>
                    @php
                        $totales = 0;
                        $saldos = 0;
                        $indice = 1;
                        $mes = date('n');
                    @endphp
                    @foreach ($months as $month)
                        @php
                            $totales += $month->amount;
                            $saldo = $valor_cuota[date('Y')] - $month->amount;
                            $saldos += $saldo;
                        @endphp
                        <tr>
                            <td>{{ $indice }}</td>
                            <td class="text-capitalize">{{ $month->month_name }}</td>
                            <td>${{ number_format($month->amount, 0, '', '.') }}</td>
                            <td>${{ number_format($saldo, 0, '', '.') }}</td>
                            @if ($saldo > 0)
                                <td class=" text-center"><button type="button" data-bs-toggle="modal"
                                        data-bs-target="#exampleModal" class="btn btn-primary"
                                        data-saldo={{ $saldo }} data-mes={{ $month->id_month }}
                                        data-mes_name="{{ $month->month_name }}" onclick="pagar(this)"><i
                                        class="fas fa-check pe-2"></i>Pagar</button></td>
                            @else
                                <td class="text-center"><i class="fas fa-check text-success pe-1"></i> Pagado</td>
                            @endif
                        </tr>
                        @php
                            ++$indice;
                        @endphp
                    @endforeach
                </tbody>
                <tfoot>
                    <tr class="table-primary">
                        <th colspan="2" class="text-end">TOTALES:</th>
                        <th>${{ number_format($totales, 0, '', '.') }}</th>
                        <th>${{ number_format($saldos, 0, '', '.') }}</th>
                        <th></th>
                    </tr>
                </tfoot>
            </table>

            <div class="alert alert-success mt-3 p-3" role="alert">
                <i class="far fa-address-card"></i>
                <b>Datos para tranferencia:</b>
                <p class="ps-4 mb-0">
                    <b>Rut:</b> 15.051.675-7
                    <br><b>Nombre:</b> Andrea Vilches Estay
                    <br><b>Email:</b> andrea.vilches.estay@gmail.com
                    <br><b>Cuenta Vista:</b> 7000778537
                    <br><b>Banco:</b> Santander
                </p>
            </div>

            <div class="form-group row justify-content-end">
                <div class="col-lg-3 mb-3">
                    <a href="{{ route('index') }}" class="btn btn-secondary w-100">
                        <i class="fa-solid fa-chevron-left pe-2"></i>
                        Volver
                    </a>
                </div>
            </div>
        </div>
    @endsection
    @push('scripts')
        <script>
            $(document).ready(function() {
                $('#users-table').dataTable({
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"
                    },
                    dom: '',
                    pageLength: 50
                });
            });

            function pagar(objeto) {
                let saldo = objeto.dataset.saldo;
                let mes = objeto.dataset.mes;
                let mes_name = objeto.dataset.mes_name;

                document.getElementById('span_saldo').innerHTML = saldo;
                document.getElementById('span_mes').innerHTML = mes_name;
                document.getElementById('id_mes').value = mes;
                document.getElementById('total_pagar').value = saldo;
            }
        </script>
    @endpush

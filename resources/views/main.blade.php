@php
    use Illuminate\Support\Facades\Auth;
    $types = new \App\Models\incident_groups();
    $data_types = $types->all();
@endphp
@extends('header')
@section('main-content')

    @if(Auth::check())
<br>
<br>
    <div class="container-fluid">
        <div class="row">
            <div class="col text-center">
                <h3 style="margin-top: 15px; color: green">Для редактирования записи сделайте двойной клик по одному из полей
                    (заголовок, описание, тип или укрупнённая категория). Остальные поля не редактируемы по соображениям безопасности</h3>
            </div>
        </div>
        <br>
        <br>


        <div class="row">
            <div class="col">
                <table class="table table-striped table-success table-border text-center">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Заголовок</th>
                        <th scope="col">Описание</th>
                        <th scope="col">Тип</th>
                        <th scope="col">Укрупнённая категория</th>
                        <th scope="col">Статус</th>
                        <th scope="col">Текущий исполнитель</th>
                        <th scope="col">Создан</th>
                        <th scope="col">Обновлён</th>
                        <th scope="col">Действия</th>
                    </tr>
                    </thead>
                    <tbody>

                    @foreach($data as $d)
                        <form method="get" action="/edit">
                        <tr>
                            <input type="hidden" value="{{$d->id}}" name="record_id">
                                <th scope="row">
                                    <a style="text-decoration: none" href="/card?id={{$d->id}}">{{$d->id}}</a>
                                </th>
                            <td>
                                <span class="text_{{$d->id}}" style="display: block" ondblclick="edit_mode({{$d->id}})">{{$d->header}}</span>
                                <input  name="header" type="hidden" class="form-control editform_{{$d->id}}" style="" value="{{$d->header}}">
                            </td>
                            <td>
                                <span class="text_{{$d->id}}" style="display: block" ondblclick="edit_mode({{$d->id}})">{{$d->description}}</span>
                                <input  name="description" type="hidden" class="form-control editform_{{$d->id}}" style="" value="{{$d->description}}">
                            </td>
                            <td>
                                <span class="text_{{$d->id}}" style="display: block" ondblclick="edit_mode({{$d->id}})">{{$d->type}}</span>
                                <input  name="type" type="hidden" class="form-control editform_{{$d->id}}" style="" value="{{$d->type}}">
                            </td>
                            <td>
                                <span class="text_{{$d->id}}" style="display: block" ondblclick="edit_mode({{$d->id}})" span>{{\App\Models\incident_groups::find($d->group_view)->name}}</span>
{{--                                <input onfocusout="edit_mode({{$d->id}})" type="hidden" class="form-control editform_{{$d->id}}" style="" value="{{\App\Models\incident_groups::find($d->group_view)->name}}">--}}
                                <select style="display: none" class="form-select editform_{{$d->id}}" name="group_view" id="selector_for_hidden{{$d->id}}" required>

                                    {{--Укрупнённая категория данной записи в режиме редактирования--}}
                                    <option value="{{\App\Models\incident_groups::find($d->group_view)->id}}">{{\App\Models\incident_groups::find($d->group_view)->name}}</option>
                                @foreach($data_types as $dd)

                                        <option value="{{$dd->id}}">{{$dd->name}}</option>

                                @endforeach

                                </select>
                            </td>
                            <td>{{\App\Models\statuses::find($d->status)->name}}</td>
                            <td>{{\App\Models\User::find($d->user)->name}}</td>
                            <td>
                                <span class="text_{{$d->id}}" style="display: block" >{{$d->created_at}}</span>
                                <input type="hidden" class="form-control editform_{{$d->id}}" style="" value="{{$d->created_at}}">
                            </td>
                            <td>
                                <span class="text_{{$d->id}}" style="display: block" >{{$d->updated_at}}</span>
                                <input type="hidden" class="form-control editform_{{$d->id}}" style="" value="{{$d->updated_at}}">
                            </td>
                            <td>

                                <button type="submit" class="btn btn-success">Сохранить</button>
                            </td>
                        </tr>
                        </form>

                    @endforeach


                    </tbody>
                </table>

            </div>
        </div>
    </div>
    @else

    <div class="container-fluid">
        <div class="row">
            <div class="col text-center">
                <h3 style="margin-top: 120px;">Для просмотра записей в таблице необходимо <a href="/login">авторизоваться в системе</a></h3>
            </div>
        </div>
    </div>
    @endif




@endsection

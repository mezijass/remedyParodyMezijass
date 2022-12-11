@extends('header')

@section('main-content')

<br>
<br>

@php
$header = \App\Models\incident::find(request("id"));
$status = \App\Models\statuses::find($header->status)->name;
$group = \App\Models\incident_groups::find($header->group_view)->name;
$user = \App\Models\User::find($header->user)->name;
$description = $header->description;
@endphp

    <div class="container">
        <div class="row">
            <div class="col-6 text-center">
                <div class="card border-primary mb-3">
                    <div class="card-header">{{ $header->header }}</div>
                    <div class="card-body text-primary">
                        <h5 class="card-title">Статус инцидента: <b>{{ $status  }}</b></h5>
                        <h5 class="card-title">Назначен команде: <b>{{ $group }}</b></h5>
                        <h5 class="card-title">Текущий исполнитель: <b>{{ $user  }}</b></h5>
                        <p class="card-text">{{$description}}</p>
                    </div>
                    <div class="row">
                        <div class="col"><a style="margin-bottom: 15px;" class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop1">Изменить статус</a></div>


                        <!-- Модальное окно для изменения статуса -->
                        <div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Обновление статуса инцидента</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="/change_status">
                                            <input id="1" type="radio" name="change" value="1" class="form-radio-control"><label style="margin-left: 5px;" for="1" class="form-label">Назначен</label><br>
                                            <input id="2" type="radio" name="change" value="2" class="form-radio-control"><label style="margin-left: 5px;" for="2" class="form-label">Взят в работу</label><br>
                                            <input id="3" type="radio" name="change" value="3" class="form-radio-control"><label style="margin-left: 5px;" for="3" class="form-label">Решён</label><br>
                                            <input name="incident_id" type="hidden" value="{{request("id")}}">
                                            <button class="btn btn-warning">Изменить статус</button>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Отмена</button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="col"><a style="margin-bottom: 15px;" class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">Передать другому</a></div>


                        <!-- Модальное окно для переназначения пользователя -->
                        <div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Обновление статуса инцидента</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="/change_user">
                                            <select class="form-select" name="group_view" required>
                                                <option>Выберите категорию</option>
                                                @foreach(\App\Models\incident_groups::all() as $cat)
                                                    <option value="{{$cat->id}}">{{$cat->name}}</option>
                                                @endforeach
                                            </select>
                                            <br>
                                            <select class="form-select" name="user" required>
                                                <option>Выберите нового пользователя</option>
                                            @foreach(\App\Models\User::all() as $user)
                                                    <option value="{{$user->id}}">{{$user->name}}</option>
                                                @endforeach
                                            </select>
                                            <br>
                                            <input name="incident_id" type="hidden" value="{{request("id")}}">
                                            <button class="btn btn-warning">Переназначить инцидент</button>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Отмена</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                </div>
            </div>
            <div class="col-6 text-center">

                <nav id="navbar-example2" class="navbar navbar-light bg-light card border mb-3">
                    <a class="navbar-brand" href="#">Комментарии по инциденту</a>
                </nav>
                <div data-spy="scroll" data-target="#navbar-example2" data-offset="0" class="scrollspy-example">
                    @foreach(\App\Models\comments::all()->where('card_id',request("id")) as $result)
                        <div class="alert alert-primary" role="alert">
                            <div style="text-align: left"><p>{{$result->created_at}}</p>
                            <p>{{\App\Models\User::find($result->user_id)->name}}</p></div>
                            <div></div>
                            <div class="alert alert-warning" role="alert">
                                {{$result->comment_text}}
                            </div>
                        </div>
                    @endforeach
                    <form action="/addMessage" method="get" class="mb-4">
                        <textarea placeholder="Текст комметария..." class="form-control" name="text_comment"></textarea>
                        <input type="hidden" name="uid" value="{{Auth::user()->id}}">
                        <input type="hidden" name="card_id" value="{{request("id")}}">
                        <br><button type="submit" class="btn btn-warning container">Добавить комметарий</button>
                    </form>
                </div>

            </div>
        </div>
    </div>


@endsection

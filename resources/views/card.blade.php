@extends('header')

@section('main-content')

@php
$header = \App\Models\incident::find(request("id"));
$created_by = \App\Models\User::find($header->created_by)->name;
$status = \App\Models\statuses::find($header->status)->name;
$type = $header->type;
$group = \App\Models\incident_groups::find($header->group_view)->name;
$user = \App\Models\User::find($header->user)->name;
$description = $header->description;
$solution = $header->solution;
$current_inc_id = $header->id;
@endphp

<div class="container">
    <div class="mt-4 row">
      <div class="col-7 text-center">
        <div class="card border-primary mb-3">

          <!-- начало формы с полями инцидента и кнопкой "Сохранить" -->
          <form method="get" action="/editInCard">

            <!-- Номер инцидента -->
            <h5 class="mt-1 card-title">Номер инцидента: <b>
                <input type="hidden" value="{{$current_inc_id}}" name="record_id">
                <th scope="row">
                  <a style="text-decoration: none" href="/card?id={{$current_inc_id}}">{{$current_inc_id}}</a>
                </th>
              </b>
            </h5>

            <!-- Поле заголовок инцидента -->
            <div class="card-body text-primary">

                    <!-- поле статус инцидента -->
                    <div class="mb-3 row">
                      <label for="incType" class="col-sm-3 col-form-label myHeaderClass">Тип инцидента:</label>
                      <div class="col-sm-9">
                        <input type="text" readonly class="form-control-plaintext" id="incType" value="{{$type}}">
                      </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="incHeader" class="col-sm-3 col-form-label myHeaderClass">Заголовок:</label>
                        <div class="col-sm-9">
                        <input type="text" class="form-control" id="incHeader" name="header" value="{{$header->header}}" required>
                        </div>
                </div>

              <!-- поле инициатор -->
              <div class="mb-3 row">
                <label for="incCreator" class="col-sm-3 col-form-label myHeaderClass">Инициатор:</label>
                <div class="col-sm-9">
                  <input type="text" readonly class="form-control-plaintext" id="incCreator" value="{{$created_by}}">
                </div>
              </div>

              <!-- поле статус инцидента -->
              <div class="mb-3 row">
                <label for="incStatus" class="col-sm-3 col-form-label myHeaderClass">Статус инцидента:</label>
                <div class="col-sm-9">
                  <input type="text" readonly class="form-control-plaintext" id="incStatus" value="{{$status}}">
                </div>
              </div>

              <!-- Кнопка изменить статус -->
              <div class="container">
                <div class="row">
                  <a class="mb-3 btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop1">Изменить статус</a>
                </div>
              </div>

              <!-- поле назначен команде -->
              <div class="mb-3 row">
                <label for="incTeam" class="col-sm-3 col-form-label myHeaderClass">Назначен команде:</label>
                <div class="col-sm-9">
                  <input type="text" readonly class="form-control-plaintext" id="incTeam" value="{{$group}}">
                </div>
              </div>

              <!-- Поле текущий исполнитель -->
              <div class="mb-3 row">
                <label for="incWorker" class="col-sm-3 col-form-label myHeaderClass">Текущий исполнитель:</label>
                <div class="col-sm-9">
                  <input type="text" readonly class="form-control-plaintext" id="incWorker" value="{{$user}}">
                </div>
              </div>

              <!-- Кнопка передать инцидент -->
              <div class="container">
                <div class="row">
                  <a class="mb-3 btn btn-outline-primary btn-sm btn-block" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">Передать инцидент</a>
                </div>
              </div>

              <!-- поле описание инцидента -->
              <div class="container">
                <div class="mb-3 row">
                  <div class="col-2">
                    <label for="incDescription" class="form-label myHeaderClass">Описание инцидента:</label>
                  </div>
                  <div class="col-10">
                    <textarea class="form-control" id="incDescription" name="description" placeholder="Описание инцидента..." value="{{$description}}" required>{{$description}}</textarea>
                  </div>
                </div>
              </div>

              <!-- поле решение -->
              <div class="container">
                <div class="mb-3 row">
                  <div class="col-2">
                    <label for="incSolution" class="form-label myHeaderClass">Решение:</label>
                  </div>
                  <div class="col-10">
                    <textarea class="form-control" id="incSolution" name="solution" placeholder="Описание инцидента..." value="{{$solution}}">{{$solution}}</textarea>
                  </div>
                </div>
              </div>

              <!-- Кнопка сохранить -->
              <div class="container">
                <div class="row">
                    <button type="submit" class="btn btn-success">Сохранить</button>
                </div>
              </div>

            </div>
          </form>
          <div class="row">
            
            
            
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
                      <input id="1" type="radio" name="change" value="1" class="form-radio-control">
                      <label style="margin-left: 5px;" for="1" class="form-label">Назначен</label>
                      <br>
                      <input id="2" type="radio" name="change" value="2" class="form-radio-control">
                      <label style="margin-left: 5px;" for="2" class="form-label">Взят в работу</label>
                      <br>
                      <input id="3" type="radio" name="change" value="3" class="form-radio-control">
                      <label style="margin-left: 5px;" for="3" class="form-label">Решён</label>
                      <br>
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
                        <option>Выберите команду</option> @foreach(\App\Models\incident_groups::all() as $cat) <option value="{{$cat->id}}">{{$cat->name}}</option> @endforeach
                      </select>
                      <br>
                      <select class="form-select" name="user" required>
                        <option>Выберите нового пользователя</option> @foreach(\App\Models\User::all() as $user) <option value="{{$user->id}}">{{$user->name}}</option> @endforeach
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
      <div class="col-5 text-center">
        <nav id="navbar-example2" class="navbar navbar-light bg-light card border mb-3">
          <a class="navbar-brand" href="#">Комментарии по инциденту</a>
        </nav>
        <div data-spy="scroll" data-target="#navbar-example2" data-offset="0" class="scrollspy-example"> @foreach(\App\Models\comments::all()->where('card_id',request("id")) as $result) <div class="alert alert-primary" role="alert">
            <div style="text-align: left">
              <p>{{$result->created_at}}</p>
              <p>{{\App\Models\User::find($result->user_id)->name}}</p>
            </div>
            <div></div>
            <div class="alert alert-warning" role="alert">
              {{$result->comment_text}}
            </div>
          </div> @endforeach <form action="/addMessage" method="get" class="mb-4">
            <textarea placeholder="Текст комметария..." class="form-control" name="text_comment" required></textarea>
            <input type="hidden" name="uid" value="{{Auth::user()->id}}">
            <input type="hidden" name="card_id" value="{{request("id")}}">
            <br>
            <button type="submit" class="btn btn-warning container">Добавить комметарий</button>
          </form>
        </div>
      </div>
    </div>
  </div>

@endsection

@extends('header')

@section('main-content')



    <div class="container">
        <div class="row">
            <div class="col">

                <select class="form-select" name="user" style="margin-top: 60px;" onchange="document.location=this.options[this.selectedIndex].value">
                    @if(request('id'))
                        {{--Имя в селекторе если он уже выбран--}}
                        <option>{{\App\Models\User::find(request('id'))->name}}</option>
                    @else
                        <option>Выберите пользователя для назначения категорий</option>
                    @endif
                    @foreach(\App\Models\User::all() as $user)
                        <option value="user_groups?id={{$user->id}}">{{$user->name}}</option>
                    @endforeach
                </select>
                <br>
                <br>
                @if(request("id"))

                    <h4 style="text-align: center">Список категорий инцидентов для пользователя:</h4>
                    <table class="table table-secondary">
                        <thead>
                        <tr>
                            <th scope="col">Категория</th>
                            <th scope="col">Доступ</th>
                        </tr>
                        </thead>
                        <tbody>
                        <form action="/check_categories">
                        @foreach(\App\Models\incident_groups::all() as $cat)
                                @php
                                    // эта переменная HTML - атрибут checked, изначально не выставленный
                                    $st = "";
                                @endphp
                                @if(@count(\App\Models\incident_groups_user::all()->where('user_id','=',request('id'))->where('incident_group_id','=',$cat->id)) > 0)
                                    @php
                                        // но если в базе мы видим что на данного пользователя назначена данная группа, то загружаем галочку
                                        $st = "checked";
                                    @endphp

                                @endif
                            <tr>
                                <th scope="col">{{$cat->name}}</th>
                                <th scope="col"><input name="check_{{$cat->id}}" type="checkbox" {{$st}}></th>
                            </tr>
                        @endforeach


                        </tbody>
                    </table>
                    <input type="hidden" value="{{request('id')}}" name="uid">
                    <button class="btn btn-success">Сохранить</button>
                    </form>
                    <br>
                @endif

            </div>
        </div>
    </div>



@endsection()

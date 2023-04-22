@extends('header')

@section('main-content')

    <div class="container">
        <div class="row">
            <div class="col">

                <select class="form-select mb-2" name="group" style="margin-top: 60px;" onchange="document.location=this.options[this.selectedIndex].value">
                    @if(request('id'))
                        {{--Имя в селекторе если он уже выбран--}}
                        <option>{{\App\Models\incident_groups::find(request('id'))->name}}</option>
                    @else
                        <option>Выберите группу для просмотра справочника</option>
                    @endif
                    @foreach(\App\Models\incident_groups::all() as $group)
                        <option value="users?id={{$group->id}}">{{$group->name}}</option>
                    @endforeach
                </select>

                    <input  class="form-control me-2" type="search" placeholder="Введите имя сотрудника..." aria-label="Search" id="su" name="su" onchange="document.location='users?name='+this.value">
                    <button class="btn btn-outline-success mt-2">Искать</button>
            <br>
            <br>
                @if(request("id"))
                    <h4 style="text-align: center">Список сотрудников, которые входят в команду:</h4>
                        <table class="table table-secondary">
                            <thead>
                                <tr>
                                    <th scope="col">Сотрудник</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Должность</th>
                                    <th scope="col">Права доступа</th>
                                    <th scope="col">Команда</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach(\App\Models\User::all() as $cat)
                                    @if(@count(\App\Models\incident_groups_user::all()->where('incident_group_id','=',request('id'))->where('user_id','=',$cat->id)) > 0)
                                        <tr>
                                            <th scope="col">{{$cat->name}}</th>
                                            <th scope="col">{{$cat->email}}</th>
                                            <th scope="col">{{\App\Models\grade::find($cat->grade_id)->name}}</th>
                                            <th scope="col">{{\App\Models\groups::find($cat->groups_id)->name}}</th>
                                            <th scope="col">{{\App\Models\incident_groups::find(request('id'))->name}}</th>
                                        </tr>
                                    @endif
                                @endforeach
                            </tbody>
                        </table>
                    <br>
                @endif

                @if(request("name"))
                @php
                $searchname = request("name");
                //dd($searchname);
                @endphp
                    <h4 style="text-align: center">Список сотрудников, которые удовлетворяют запросу:</h4>
                        <table class="table table-secondary">
                            <thead>
                                <tr>
                                    <th scope="col">Сотрудник</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Должность</th>
                                    <th scope="col">Права доступа</th>
                                     <th scope="col">Команда</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach(\App\Models\User::where('name', 'LIKE', "%{$searchname}%")->get() as $cat)
                                
                                        <tr>
                                            <th scope="col">{{$cat->name}}</th>
                                            <th scope="col">{{$cat->email}}</th>
                                            <th scope="col">{{\App\Models\grade::find($cat->grade_id)->name}}</th>
                                            <th scope="col">{{\App\Models\groups::find($cat->groups_id)->name}}</th>
                                            <th scope="col">
                                                <select class="form-select" name="group_view_selector_users">
                      
                                                    <option hidden>Входит в команды...</option> 
                                                    
                                                    @foreach(\App\Models\incident_groups_user::where('user_id', '=', "$cat->id")->get() as $groupsperuser) 
                                                    <option value="{{$groupsperuser->incident_group_id}}">{{\App\Models\incident_groups::find($groupsperuser->incident_group_id)->name}}</option> 
                                                    @endforeach
                                                  
                                                  </select>
                                            </th>
                                        </tr>
                                @endforeach
                            </tbody>
                        </table>
                    <br>
                @endif
            </div>
        </div>
    </div>

@endsection()

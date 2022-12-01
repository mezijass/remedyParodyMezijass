@extends('header')
@section('main-content')

    <div class="container" style="margin-top: 100px;">
    <div class="row">
        <div class="col"></div>
        <div class="col">
            <form method="POST" action="{{ route('register') }}">
                @csrf
                <label for="name" class="form-label">Ваше имя</label>
                <input id="name" type="name" name="name" class="form-control" required autofocus>
                <br>
                <label for="email" class="form-label">Электронная почта</label>
                <input id="email" type="email" name="email" class="form-control" required>
                <br>
                <label for="password" class="form-label">Пароль</label>
                <input id="password" type="password" name="password" class="form-control" required>
                <br>
                <label for="password_confirmation" class="form-label">Подтвердите пароль</label>
                <input id="password_confirmation" type="password" name="password_confirmation" class="form-control" required>
                <br>
                <button class="btn btn-success">Зарегистрироваться</button>
            </form>
        </div>
        <div class="col"></div>
    </div>
</div>
@endsection

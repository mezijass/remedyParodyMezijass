@extends('header')
@section('main-content')


    <div class="container">
    <div class="row">
        <div class="col">
        </div>
        <div class="col">
            <form method="POST" action="{{ route('login') }}" style="margin-top: 90px;">
                @csrf

                <label for="mail" class="form-label">Электронная почта</label>
                <input id="mail" type="email" name="email" class="form-control" required autofocus>
                <br>
                <label for="password" class="form-label">Пароль</label>
                <input id="password" type="password" name="password" class="form-control" required autofocus>
                <br>
                <button type="submit" class="btn btn-success">Войти в систему</button>

            </form>
        </div>
        <div class="col"></div>
    </div>
</div>


@endsection

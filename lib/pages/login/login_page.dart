import 'package:bisu/pages/login/api_responser.dart';
import 'package:bisu/pages/home_page.dart';
import 'package:bisu/pages/login/login_api.dart';
import 'package:bisu/pages/login/user_login.dart';
import 'package:bisu/utils/alert.dart';
import 'package:bisu/utils/nav.dart';
import 'package:bisu/widgets/app_button.dart';
import 'package:bisu/widgets/app_img.dart';
import 'package:bisu/widgets/app_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _tLogin = TextEditingController(text: "user");

  final _tSenha = TextEditingController(text: "123");

  final _focusSenha = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            App_img("assets/images/logo.jpg",
            ),
             AppText(
              "Login",
              "Digite o login",
              controller: _tLogin,
              validator: _validateLogin,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              nextFocus: _focusSenha,
            ),
            SizedBox(height: 10),
            AppText(
              "Senha",
              "Digite a senha",
              controller: _tSenha,
              password: true,
              validator: _validateSenha,
              keyboardType: TextInputType.number,
              focusNode: _focusSenha,
            ),
            SizedBox(
              height: 20,
            ),
            AppButton(
              "Login",
              onPressed: _onClickLogin,
            ),
            Center(child: Text("Create User")), ],
        ),
      ),
    );

  }

  void _onClickLogin()async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login: $login, Senha: $senha");
    ApiResponse response  = await LoginApi.login(login, senha);
    if(response.ok){
      Usuario user = response.result;
      print(">>$user");
      push(context, HomePage(), replace: true);
    }else{
      alert(context, "Erro, tente novamente");
    }

  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Digite o login";
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Digite a senha";
    }
    if (text.length < 3) {
      return "A senha precisa ter pelo menos 5 caracteres";
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }
}

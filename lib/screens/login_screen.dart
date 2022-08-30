import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dashfleet_app/ui/input_decorations.dart';
import 'package:dashfleet_app/widgets/widgets.dart';
import 'package:dashfleet_app/providers/login_form_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
                child: Column(children: [
      const SizedBox(
        height: 160,
      ),
      CardContainer(
          child: Column(children: [
        const SizedBox(height: 10),
        Text('Login', style: Theme.of(context).textTheme.headline4),
        const SizedBox(height: 30),
        ChangeNotifierProvider(
            create: (_) => LoginFormProvider(), child: _LoginForm())
        // _LoginForm(loginForm: loginForm)
      ])),
      const SizedBox(height: 25),
      const Text(
        'Olvido su clave?',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 25),
    ]))));
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: loginForm.formKey,
        child: Column(
          children: [
            TextFormField(
                decoration: InputDecorations.authInputDecoration(
                    hintText: '+573202000078',
                    labelText: 'Celular',
                    prefixIcon: Icons.phone_android_rounded),
                autocorrect: false,
                keyboardType: TextInputType.phone,
                onChanged: (value) => loginForm.email = value,
                validator: (value) {
                  return (value != null && value.length == 13)
                      ? null
                      : 'El valor ingresado no parece un número de celular';
                }),
            const SizedBox(height: 30),
            TextFormField(
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'La contraseña debe de ser de 6 caracteres';
              },
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '*****',
                  labelText: 'Clave',
                  prefixIcon: Icons.lock_outline),
            ),
            const SizedBox(height: 30),
            SwitchListTile.adaptive(
                activeColor: Colors.green,
                title: const Text('Recordar'),
                value: true,
                onChanged: (_) {}),
            const SizedBox(height: 30),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.black,
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();

                        if (!loginForm.isValidForm()) return;

                        loginForm.isLoading = true;

                        await Future.delayed(const Duration(seconds: 2));

                        // TODO: validar si el login es correcto
                        loginForm.isLoading = false;

                        Navigator.pushReplacementNamed(context, 'tabs');
                      },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    child: Text(
                      loginForm.isLoading ? 'Espere' : 'Entrar',
                      style: const TextStyle(color: Colors.white),
                    )))
          ],
        ));
  }
}

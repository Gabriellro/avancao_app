import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../exceptions/_export_exceptions.dart';
import '../providers/_export_providers.dart';

enum AuthMode { singIn, singUp }

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthMode _authMode = AuthMode.singIn;
  bool _isLoading = false;
  bool _obscureText = true;

  // ignore: prefer_final_fields
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  bool _isSingIn() => _authMode == AuthMode.singIn;

  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(
          'Ocorreu um Erro',
          style: TextStyle(color: Colors.black),
        ),
        content: Text(
          msg,
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  Future<void> _submitForm() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    setState(() => _isLoading = true);

    _formKey.currentState?.save();

    AuthProvider authProvider = Provider.of(context, listen: false);

    try {
      if (_isSingIn()) {
        await authProvider.singIn(
          _authData['email']!,
          _authData['password']!,
        );
      } else {
        await authProvider.singUp(
          _authData['email']!,
          _authData['password']!,
        );
      }
    } on AuthException catch (error) {
      _showErrorDialog(error.toString());
    } catch (error) {
      _showErrorDialog('Ocorreu um erro inesperado!');
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_rounded),
                  labelText: 'E-mail*',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'exemplo@exemplo.com.br',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                    ),
                  ),
                  hintStyle: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: Theme.of(context).colorScheme.outline),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onSaved: (email) => _authData['email'] = email ?? '',
                validator: (value) {
                  final email = value ?? '';
                  return email.trim().isEmpty || !email.contains('@')
                      ? 'Informe um email valido!'
                      : null;
                },
              ),
              SizedBox(height: size.height * 0.04),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_rounded),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1),
                  ),
                  labelText: 'Senha',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: '******',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: Theme.of(context).colorScheme.outline),
                  suffixIcon: IconButton(
                    // padding: const EdgeInsets.only(top: 24),
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                    ),
                    onPressed: () => setState(() {
                      _obscureText = !_obscureText;
                    }),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                obscureText: _obscureText,
                validator: (value) {
                  final password = value ?? '';
                  return password.isEmpty || password.length < 2
                      ? 'Informe uma senha valida!'
                      : null;
                },
                onSaved: (password) => _authData['password'] = password ?? '',
              ),
              SizedBox(height: size.height * 0.02),
              const SizedBox(height: 24),
              Center(
                child: _isLoading == true
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 56,
                        child: FilledButton(
                          onPressed: () => _submitForm(),
                          child: Text(
                            'Entrar',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: 16),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Esqueceu a senha?',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

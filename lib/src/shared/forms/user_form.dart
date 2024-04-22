import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../widgets/_export_widgets.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  String? inputtedValue;
  String dataAtual = DateFormat('dd/MM/yyyy').format(DateTime.now());
  bool isChecked = true;

  MaskTextInputFormatter telefoneMaskFormatter =
      MaskTextInputFormatter(mask: '(##) #####-####');

  final Map<String, Object> _authData = {'nome': ''};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close_rounded),
        ),
        title: const Text('Novo usuário'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Salvar',
              ),
            ),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Pessoais',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  // prefixIconConstraints:
                  //     const BoxConstraints(minWidth: 24, maxHeight: 20),
                  // prefixIcon: const Padding(
                  //   padding: EdgeInsets.only(right: 20),
                  //   child: ,
                  // ),
                  labelText: "Nome *",
                  hintText: 'Nome',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).colorScheme.outline),
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onSaved: (nome) => _authData['nome'] = nome ?? '',
                // validator: (value) {
                //   final email = value ?? '';
                //   return email.trim().isEmpty || !email.contains('@')
                //       ? 'Informe um email valido!'
                //       : null;
                // },
              ),
              const SizedBox(height: 24),
              TextFormField(
                decoration: InputDecoration(
                  // prefixIconConstraints:
                  //     const BoxConstraints(minWidth: 24, maxHeight: 20),
                  // prefixIcon: const Padding(
                  //   padding: EdgeInsets.only(right: 20),
                  //   child: ,
                  // ),
                  labelText: "Sobrenome *",
                  hintText: 'Sobrenome',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).colorScheme.outline),
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onSaved: (sobrenome) =>
                    _authData['sobrenome'] = sobrenome ?? '',
                // validator: (value) {
                //   final email = value ?? '';
                //   return email.trim().isEmpty || !email.contains('@')
                //       ? 'Informe um email valido!'
                //       : null;
                // },
              ),
              const SizedBox(height: 24),
              TextFormField(
                decoration: InputDecoration(
                  // prefixIconConstraints:
                  //     const BoxConstraints(minWidth: 24, maxHeight: 20),
                  // prefixIcon: const Padding(
                  //   padding: EdgeInsets.only(right: 20),
                  //   child: Icon(Icons.email_outlined),
                  // ),
                  labelText: "E-mail *",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).colorScheme.outline),
                  suffixText: '@avancoinfo.com.br',
                ),
                initialValue:
                    _authData['nome'] != null || _authData['sobrenome'] == null
                        ? ''
                        : '${_authData['nome']}.${_authData['sobrenome']}',
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
              const SizedBox(height: 24),
              TextFormField(
                decoration: InputDecoration(
                  // prefixIconConstraints:
                  //     const BoxConstraints(minWidth: 24, maxHeight: 20),
                  // prefixIcon: const Padding(
                  //   padding: EdgeInsets.only(right: 20),
                  //   child: Icon(Icons.email_outlined),
                  // ),
                  labelText: "Telefone *",
                  hintText: "(31) 99999-9999",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).colorScheme.outline),
                ),
                inputFormatters: [telefoneMaskFormatter],
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onSaved: (email) => _authData['email'] = email ?? '',
                validator: (value) {
                  final email = value ?? '';
                  return email.trim().isEmpty || !email.contains('@')
                      ? 'Informe um email valido!'
                      : null;
                },
              ),
              const SizedBox(height: 24),
              Text(
                'Profissional',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 16),
              const DropdownMenuExample(
                label: 'Cargo',
                hint: 'Selecionar Cargo',
                items: ['Efetivado', 'Estágio'],
              ),
              const SizedBox(height: 24),
              const Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: DateTimeFormFild(
                      label: 'Admissão',
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: DropdownMenuExample(
                      label: 'Contrato',
                      hint: 'Selecionar Contrato',
                      items: ['Efetivado', 'Estágio'],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const DropdownMenuExample(
                label: 'Grupo de usuarios',
                hint: 'Selecionar Grupo de usuarios',
                items: ['Efetivado', 'Estágio'],
              ),
              const SizedBox(height: 24),
              const DropdownMenuExample(
                label: 'Gerenciar Equipes',
                hint: 'Selecionar Grupo de usuarios',
                items: ['Efetivado', 'Estágio'],
              ),
              const SizedBox(height: 24),
              const DropdownMenuExample(
                label: 'Equipe',
                hint: 'Selecionar Grupo de usuarios',
                items: ['Efetivado', 'Estágio'],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

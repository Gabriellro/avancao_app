import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modules/_export_modules.dart';
import '../providers/_export_providers.dart';

class BottomSheetSair extends StatefulWidget {
  const BottomSheetSair({super.key});

  @override
  State<BottomSheetSair> createState() => _BottomSheetSairState();
}

class _BottomSheetSairState extends State<BottomSheetSair> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Sair da conta?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Você será descoonectado e poderá realizar o login novamente depois.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: FilledButton(
                  onPressed: () {
                    Provider.of<AuthProvider>(context, listen: false).logout();
                    Navigator.of(context).pushReplacementNamed(
                      IsAuthPage.routeName,
                    );
                  },
                  child: const Text('Sair da conta'),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Voltar'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

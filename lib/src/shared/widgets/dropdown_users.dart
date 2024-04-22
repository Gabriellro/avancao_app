// import 'package:avancao_app/src/shared/http/http_client.dart';
// import 'package:flutter/material.dart';

// import '../models/_export_models.dart';
// import '../repositories/_export_repositories.dart';
// import '../stores/user_store.dart';

// class DropdownMenuExample extends StatefulWidget {
//   DropdownMenuExample({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
// }

// class _DropdownMenuExampleState extends State<DropdownMenuExample> {
//   final UserStore store = UserStore(
//     repository: UserRepository(client: HttpClient()),
//   );
//   @override
//   void initState() {
//     super.initState();
//     store.getUsers();
//   }

//   String? _selectedVal = '';
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField(
//       decoration: InputDecoration(
//         labelText: 'Usuários',
//         hintText: 'Selecione um Usuários',
//         hintStyle: Theme.of(context)
//             .textTheme
//             .bodyMedium
//             ?.copyWith(color: Theme.of(context).colorScheme.outline),
//       ),
//       icon: const Icon(Icons.arrow_drop_down_rounded),
//       items: store.state.value
//           .map(
//             (e) => DropdownMenuItem(value: e, child: Text(e)),
//           )
//           .toList(),
//       onChanged: (val) => setState(() => _selectedVal = val as String?),
//     );
//   }
// }

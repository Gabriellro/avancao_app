import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../models/_export_models.dart';

class UserListItem extends StatefulWidget {
  final UserModel userModel;
  const UserListItem({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  State<UserListItem> createState() => _UserListItemState();
}

class _UserListItemState extends State<UserListItem> {
  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      theme: const ExpandableThemeData(
        hasIcon: false,
      ),
      header: ListTile(
        contentPadding: const EdgeInsets.only(left: 16, right: 8),
        minLeadingWidth: 40,
        leading: Stack(
          alignment: Alignment.bottomRight,
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              child: Text(
                "${widget.userModel.nome[0]}${widget.userModel.sobrenome[0]}",
              ),
            ),
          ],
        ),
        title: Text(
          "${widget.userModel.nome} ${widget.userModel.sobrenome}",
        ),
        subtitle: Text(
          widget.userModel.email,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.9,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ListTile(
                        leading: Stack(
                          alignment: Alignment.bottomRight,
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              child: Text(
                                "${widget.userModel.nome[0]}${widget.userModel.sobrenome[0]}",
                              ),
                            ),
                          ],
                        ),
                        title: Text(
                          "${widget.userModel.nome} ${widget.userModel.sobrenome}",
                        ),
                      ),
                    ),
                    const Divider(),
                    Column(
                      children: [
                        ListTile(
                          onTap: (() {}),
                          leading: const SizedBox(
                            width: 40,
                            child: Icon(Icons.info_outline),
                          ),
                          title: const Text('Datalhes'),
                        ),
                        ListTile(
                          onTap: (() {}),
                          leading: const SizedBox(
                            width: 40,
                            child: Icon(Icons.edit_rounded),
                          ),
                          title: const Text('Editar'),
                        ),
                        ListTile(
                          onTap: (() {}),
                          leading: const SizedBox(
                            width: 40,
                            child: Icon(Icons.person_off),
                          ),
                          title: const Text('Inativar'),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
          icon: const Icon(
            Icons.more_vert_rounded,
          ),
        ),
      ),
      collapsed: const SizedBox.shrink(),
      expanded: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(),
              RichText(
                text: TextSpan(
                  text: 'Status: ',
                  style: Theme.of(context).textTheme.labelLarge,
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.userModel.ativo == 1 ? 'Ativo' : 'Inativo',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              RichText(
                text: TextSpan(
                  text: 'Data de Admissão: ',
                  style: Theme.of(context).textTheme.labelLarge,
                  children: <TextSpan>[
                    TextSpan(
                      text: DateFormat('dd/MM/yyyy')
                          .format(widget.userModel.admissao),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              RichText(
                text: TextSpan(
                  text: 'Grupo de Usuarios: ',
                  style: Theme.of(context).textTheme.labelLarge,
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.userModel.nivel == 1
                          ? 'Usuário Padrão'
                          : 'Teste',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 0.5),
            ],
          ),
        ),
      ),
    );
  }
}

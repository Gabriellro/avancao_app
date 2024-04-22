// import 'package:expandable/expandable.dart';
// import 'package:flutter/material.dart';

// import '../models/agente_model.dart';
// import 'package:intl/intl.dart';

// class AgenteItem extends StatefulWidget {
//   final bool isUser;

//   final AgenteModel agenteModel;
//   const AgenteItem({
//     Key? key,
//     required this.agenteModel,
//     this.isUser = false,
//   }) : super(key: key);

//   @override
//   State<AgenteItem> createState() => _AgenteItemState();
// }

// class _AgenteItemState extends State<AgenteItem> {
//   bool isChecked = true;
//   bool groupValue = true;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: isChecked ? const Color(0XFFE5E1E6) : Colors.transparent,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 24,
//           vertical: 8,
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(
//               child: ExpandablePanel(
//                 header: Row(
//                   children: [
//                     widget.isUser
//                         ? CircleAvatar(
//                             backgroundColor:
//                                 Theme.of(context).colorScheme.primaryContainer,
//                             child: Text(
//                               'Ga',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .titleMedium
//                                   ?.copyWith(
//                                     color: Theme.of(context)
//                                         .colorScheme
//                                         .onPrimaryContainer,
//                                   ),
//                             ),
//                           )
//                         : Container(
//                             width: 40,
//                             height: 40,
//                             decoration: ShapeDecoration(
//                               color: const Color(0xFFF0EDF1),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8)),
//                             ),
//                             child: Icon(
//                               widget.agenteModel.type == 'S'
//                                   ? Icons.display_settings_rounded
//                                   : Icons.personal_video_rounded,
//                               color: widget.agenteModel.isOnline
//                                   ? const Color(0xFF4CAF50)
//                                   : const Color(0xFFDF2A2A),
//                             ),
//                           ),
//                     const SizedBox(width: 16),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         RichText(
//                           text: TextSpan(
//                             text: widget.agenteModel.type == 'S'
//                                 ? 'Supervisor - '
//                                 : 'Caixa - ',
//                             style: Theme.of(context).textTheme.bodyLarge,
//                             children: <TextSpan>[
//                               TextSpan(text: widget.agenteModel.id),
//                             ],
//                           ),
//                         ),
//                         RichText(
//                           text: TextSpan(
//                             text: '${widget.agenteModel.ip} ',
//                             style: Theme.of(context).textTheme.labelSmall,
//                             children: <TextSpan>[
//                               TextSpan(
//                                 text: widget.agenteModel.isUpdate
//                                     ? 'Atualizado'
//                                     : 'Pendente ',
//                                 style: TextStyle(
//                                   color: widget.agenteModel.isUpdate
//                                       ? const Color(0xFF4CAF50)
//                                       : const Color(0xFFDF942A),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 collapsed: const SizedBox.shrink(),
//                 expanded: SizedBox(
//                   width: 237,
//                   height: 102,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       RichText(
//                         text: TextSpan(
//                           text: 'IP ',
//                           style: const TextStyle(
//                             color: Color(0xFF1B1B1F),
//                             fontSize: 14,
//                             fontFamily: 'Titillium Web',
//                             fontWeight: FontWeight.w600,
//                             letterSpacing: 0.02,
//                           ),
//                           children: <TextSpan>[
//                             TextSpan(
//                               text: widget.agenteModel.ip,
//                               style: const TextStyle(
//                                 color: Color(0xFF46464F),
//                                 fontSize: 12,
//                                 fontFamily: 'Titillium Web',
//                                 fontWeight: FontWeight.w400,
//                                 letterSpacing: 0.04,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 6),
//                       RichText(
//                         text: TextSpan(
//                           text: 'Última atualização ',
//                           style: const TextStyle(
//                             color: Color(0xFF1B1B1F),
//                             fontSize: 14,
//                             fontFamily: 'Titillium Web',
//                             fontWeight: FontWeight.w600,
//                             letterSpacing: 0.02,
//                           ),
//                           children: <TextSpan>[
//                             TextSpan(
//                               text: DateFormat('dd MMM yyyy').format(
//                                 widget.agenteModel.lastUpdate,
//                               ),
//                               style: const TextStyle(
//                                 color: Color(0xFF46464F),
//                                 fontSize: 12,
//                                 fontFamily: 'Titillium Web',
//                                 fontWeight: FontWeight.w400,
//                                 letterSpacing: 0.04,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 6),
//                       RichText(
//                         text: TextSpan(
//                           text: 'Último envio de venda ',
//                           style: const TextStyle(
//                             color: Color(0xFF1B1B1F),
//                             fontSize: 14,
//                             fontFamily: 'Titillium Web',
//                             fontWeight: FontWeight.w600,
//                             letterSpacing: 0.02,
//                           ),
//                           children: <TextSpan>[
//                             TextSpan(
//                               text: DateFormat('dd MMM yyyy').format(
//                                 widget.agenteModel.lastSell,
//                               ),
//                               style: const TextStyle(
//                                 color: Color(0xFF46464F),
//                                 fontSize: 12,
//                                 fontFamily: 'Titillium Web',
//                                 fontWeight: FontWeight.w400,
//                                 letterSpacing: 0.04,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 6),
//                       RichText(
//                         text: TextSpan(
//                           text: 'Versão ',
//                           style: const TextStyle(
//                             color: Color(0xFF1B1B1F),
//                             fontSize: 14,
//                             fontFamily: 'Titillium Web',
//                             fontWeight: FontWeight.w600,
//                             letterSpacing: 0.02,
//                           ),
//                           children: <TextSpan>[
//                             TextSpan(
//                               text: '${widget.agenteModel.version}',
//                               style: const TextStyle(
//                                 color: Color(0xFF46464F),
//                                 fontSize: 12,
//                                 fontFamily: 'Titillium Web',
//                                 fontWeight: FontWeight.w400,
//                                 letterSpacing: 0.04,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 40,
//               height: 40,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 16),
//                 child: Checkbox(
//                   checkColor: Colors.white,
//                   value: isChecked,
//                   onChanged: (bool? value) {
//                     setState(() {
//                       isChecked = value!;
//                     });
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

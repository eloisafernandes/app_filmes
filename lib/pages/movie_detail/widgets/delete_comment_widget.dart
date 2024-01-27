import 'package:flutter/material.dart';

typedef OnDeletedCallback = Future<void> Function();

class DeleteCommentWidget extends StatefulWidget {
  const DeleteCommentWidget({super.key, required this.onDeleted});
  final OnDeletedCallback onDeleted;

  @override
  State<DeleteCommentWidget> createState() => _DeleteCommentWidgetState();
}

class _DeleteCommentWidgetState extends State<DeleteCommentWidget> {
  bool isWaiting = false;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Deseja exluir este comentário?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar')
        ),
        TextButton(
          onPressed: !isWaiting ? onDeleted : null,
          child: const Text('Excluir')
        ),
      ],
    );


  }

  void onDeleted() async{
    setState(() => isWaiting = true);

    await widget.onDeleted();

    setState(() => isWaiting = false);
    
    if(!context.mounted) return;
    Navigator.pop(context);
  }
}
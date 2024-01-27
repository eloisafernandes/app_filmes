import 'package:app_filmes/pages/movie_detail/movie_detail_controller.dart';
import 'package:app_filmes/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddCommentWidget extends StatefulWidget {
  const AddCommentWidget({super.key});

  @override
  State<AddCommentWidget> createState() => _AddCommentWidgetState();
}

class _AddCommentWidgetState extends State<AddCommentWidget> {

  final controller = getIt<MovieDetailController>();
  final formKey = GlobalKey<FormState>();
  final commentNode = FocusNode();
  final commentController = TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: 
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
        child: Card(
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: EdgeInsets.all(8.0), 
            child: Row(
              children: [
                Expanded(
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      focusNode: commentNode,
                      controller: commentController,
                      textCapitalization: TextCapitalization.sentences,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(300)
                      ],
                      validator: (v){
                        if (v == null || v.isEmpty){
                          return 'Não pode ser vazio';

                        }
                        else if(v.length < 3){
                          return 'O mínimo de caracteres é 3';
                        }

                        return null;

                      },
                      decoration: const InputDecoration.collapsed(
                        hintText: "Adicionar comentário..."
                      ),
                      minLines: 2,
                      maxLines: 5,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: onSubmited, 
                  child: const Text('Enviar')
                )
              ]
            ),
          ),
        ),
      ),
    );
  }

  void onSubmited(){
    if (!formKey.currentState!.validate()) return;


    //todo: enviar p api
    controller.postComment(commentController.text).then((value) {
      commentNode.unfocus();
      formKey.currentState!.reset();
    }, onError: (error) => onError);


  }
  void onError(error){
    showDialog(
      context: context, 
      builder: (_) => AlertDialog(content: Text(error.toString())
      ,)
    );

  }
}
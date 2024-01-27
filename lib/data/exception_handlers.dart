

import 'package:dio/dio.dart';

class BadResquestExcepton extends DioException{
  BadResquestExcepton(RequestOptions r, Response? response): super(requestOptions: r, response: response);


  @override
  String toString(){
    if(response!= null){
      return  response!.data['errors'].values.first[0];
    }

    return 'Requisição inválida';
  }
}

class InternalServerErrorException extends DioException{
  InternalServerErrorException(RequestOptions r):super(requestOptions: r);


  @override
  String toString(){
    return "Ocorreu um erro desconhecido, por favor tente novamente mais tarde";
  }
}
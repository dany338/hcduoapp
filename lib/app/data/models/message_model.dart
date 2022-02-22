import 'package:get/get.dart';

class MessageModel {
  MessageModel({
    required message,
  }) {
    this.message.value = message;
  }

  RxString message = RxString('');

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson(arguments) => {
        "message": message,
      };
}

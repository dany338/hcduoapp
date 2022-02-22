import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hcduoapp/app/screens/notification/notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Mensaje'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  "${_.args.message}",
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Obx(
                () => Text(
                  "${_.args.message}",
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () =>
                    _.sendNotification("Envio de notification simulada"),
                child: const Text('Enviar Notificacion'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

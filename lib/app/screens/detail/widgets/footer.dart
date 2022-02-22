import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hcduoapp/app/core/theme/app_theme.dart';
import 'package:hcduoapp/app/data/models/historia_model.dart';
import 'package:hcduoapp/app/global/input_text.dart';
import 'package:hcduoapp/app/global/primary_button.dart';
import 'package:hcduoapp/app/screens/detail/detail_controller.dart';

class Footer extends StatefulWidget {
  @override
  FooterState createState() => FooterState();

  Footer({
    required this.historia,
  });
  final HistoriaModel historia;
}

class FooterState extends State<Footer> {
  final _dateController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _dateController.dispose();
    _priceController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 100.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "${widget.historia.documento}",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: AppTheme.blueDark, fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 10.0),
              GestureDetector(
                onTap: () => _settingModalBottomSheet(context),
                child: Container(
                  width: 120.0,
                  height: 40.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppTheme.cyan,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    "Agendar Cita",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              GestureDetector(
                onTap: () => _settingModalBottomSheetImage(context),
                child: Container(
                  width: 120.0,
                  height: 40.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppTheme.cyan,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    "Tomar Imagen",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _settingModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => GetBuilder<DetailController>(
        builder: (_) => Container(
          height: 400.0,
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 30.0,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Citas",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: AppTheme.blueDark,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 30.0),
              InputText(
                iconPrefix: Icons.date_range,
                iconColor: AppTheme.light,
                border: InputBorder.none,
                keyboardType: TextInputType.datetime,
                labelText: "Date",
                filled: false,
                enabledBorderColor: Colors.black26,
                focusedBorderColor: AppTheme.cyan,
                fontSize: 14.0,
                fontColor: Colors.black45,
                onChanged: _.onChangeDate,
              ),
              const SizedBox(height: 20.0),
              InputText(
                initialValue: "${_.historia.codigo}",
                iconPrefix: Icons.monetization_on,
                iconColor: AppTheme.light,
                border: InputBorder.none,
                keyboardType: TextInputType.number,
                labelText: "Codigo historia",
                filled: false,
                enabledBorderColor: Colors.black26,
                focusedBorderColor: AppTheme.cyan,
                readOnly: true,
                fontSize: 14.0,
                fontColor: Colors.black45,
              ),
              const SizedBox(height: 50.0),
              PrimaryButton(
                texto: "Save",
                onPressed: _.save,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _settingModalBottomSheetImage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => GetBuilder<DetailController>(
        builder: (_) => Container(
          height: 400.0,
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 30.0,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Imagenes",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: AppTheme.blueDark,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 30.0),
              InputText(
                iconPrefix: Icons.date_range,
                iconColor: AppTheme.light,
                border: InputBorder.none,
                keyboardType: TextInputType.datetime,
                labelText: "Date",
                filled: false,
                enabledBorderColor: Colors.black26,
                focusedBorderColor: AppTheme.cyan,
                fontSize: 14.0,
                fontColor: Colors.black45,
                onChanged: _.onChangeDate,
              ),
              const SizedBox(height: 20.0),
              PrimaryButton(
                texto: "Galeria",
                onPressed: _.save,
              ),
              const SizedBox(height: 50.0),
              PrimaryButton(
                texto: "Camara",
                onPressed: _.save,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

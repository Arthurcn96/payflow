import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_info/boleto_info_widget.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_widget.dart';

class MeusBoletosPage extends StatefulWidget {
  const MeusBoletosPage({Key? key}) : super(key: key);

  @override
  State<MeusBoletosPage> createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              AnimatedCard(
                direction: AnimatedCardDirection.top,
                child: Container(
                  color: AppColors.primary,
                  height: 55,
                  width: double.maxFinite,
                ),
              ),
              AnimatedCard(
                direction: AnimatedCardDirection.top,
                duration: Duration(seconds: 2),
                initOffset: Offset(0, -250),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ValueListenableBuilder<List<BoletoModel>>(
                    valueListenable: controller.boletosNotifier,
                    builder: (_, boletos, __) => AnimatedCard(
                      direction: AnimatedCardDirection.top,
                      child: BoletoInfoWidget(size: boletos.length),
                    ),
                  ),
                ),
              ),
            ],
          ),
          AnimatedCard(
            direction: AnimatedCardDirection.left,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 24.0, left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Meus Boletos",
                        style: TextStyles.titleBoldHeading,
                      ),
                      // Text(
                      //   "Tem ${(_, boletos, __) => boletos.length} boletos",
                      //   style: TextStyles.captionBody,
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Divider(
                    thickness: 1,
                    height: 1,
                    color: AppColors.stroke,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: BoletoListWidget(
                    controller: controller,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

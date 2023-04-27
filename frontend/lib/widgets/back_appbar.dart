import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idoru/widgets/pretendard_text.dart';

class BackAppbar extends StatelessWidget implements PreferredSizeWidget {
  const BackAppbar(
    this.title, {
    Key? key,
    this.textColor,
    this.backgroundColor,
    this.subtitle,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(110);
  final Color? textColor;
  final Color? backgroundColor;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          bottom: 10,
          left: 5,
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                right: 25,
                left: 15,
              ),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  "assets/images/back_sign.png",
                  width: 30,
                  height: 30,
                  color: textColor,
                ),
              ),
            ),
            PText(
              title,
              size: 40,
              color: textColor,
              weight: FontWeight.w600,
            ),
            subtitle != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: PText(
                      "$subtitle",
                      color: textColor,
                    ),
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}

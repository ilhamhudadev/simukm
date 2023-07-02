import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_color.dart';
import 'package:standard_project/core/style/app_size.dart';
import 'package:standard_project/core/style/app_typography.dart';
import 'package:standard_project/module/preview/controller/preview_controller.dart';

class Playcard extends StatelessWidget {
  const Playcard(
      {Key? key,
      this.title,
      this.index,
      this.previewUrl,
      this.duration,
      this.shortDescription})
      : super(key: key);

  final String? title;
  final String? previewUrl;
  final String? index;
  final String? shortDescription;
  final String? duration;

  @override
  Widget build(BuildContext context) {
    PreviewController controller = Get.find();
    AppSize().init(Get.context!);
    return Material(
        color: AppColors.placeholdertextfield,
        child: InkWell(
            onTap: () {
              controller.setSelectedItem(index);
              controller.setVideoURL(previewUrl);
            },
            child: Obx(() => Container(
                  padding: const EdgeInsets.all(10),
                  width: AppSize.screenWidth * 1,
                  decoration: BoxDecoration(
                      color: index == controller.getSelectedItem().toString()
                          ? AppColors.placeholdertextfield
                          : AppColors.white),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.all(10),
                                child: icoPlay()),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: AppSize.screenWidth * 0.6,
                                    child: Text(
                                      title ?? "",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: AppTypography.title(),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                    width: AppSize.screenWidth * 0.6,
                                    child: Text(
                                      shortDescription ?? "",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: AppTypography.caption(),
                                    ))
                              ],
                            ),
                          ],
                        ),
                        Text(
                          "$duration min",
                          style: AppTypography.caption(),
                        )
                      ]),
                ))));
  }

  Widget icoPlay() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.pumpkin, borderRadius: BorderRadius.circular(100)),
      child: const Icon(
        Icons.play_arrow,
        color: AppColors.white,
      ),
    );
  }
}

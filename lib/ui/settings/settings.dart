import 'package:spenum/app/index.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [ColorManager.red, ColorManager.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Consumer<SettingsViewmodel>(builder: (context, data, __) {
            value = data.rangeNumber.toInt();
            int level = data.getlevel(data);
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
                  Text(
                    "Set difficulty level: ${data.getSelectedvalue(data)}",
                    style: italicTextStyle(
                        fontSize: 20.sp,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "5",
                        style: italicTextStyle(
                            fontSize: 16.sp,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .8,
                        child: Slider.adaptive(
                            min: data.min,
                            max: data.max,
                            value: data.getlength(data).toDouble(),
                            onChanged: data.onRangeChanged),
                      ),
                      Text(
                        data.getlength(data).toString(),
                        style: italicTextStyle(
                            fontSize: 16.sp,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Progress: ",
                    style: italicTextStyle(
                        fontSize: 20.sp,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Level $level",
                          style: italicTextStyle(
                              fontSize: 16.sp,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                      Expanded(
                          flex: 4,
                          child: LinearProgressIndicator(
                            value: (data.getProgress(data) / data.progressMax)
                                .toDouble(),
                          )),
                      SizedBox(
                        width: 12.w,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Level ${level + 1}",
                          style: italicTextStyle(
                              fontSize: 16.sp,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Center(
                    child: CustomMaterialButton(
                      onPressed: () {
                        data.clearProgress();
                        showModalBottomSheet(
                            context: context,
                            builder: (builder) {
                              return Container(
                                color: Colors.black,
                                width: MediaQuery.of(context).size.width,
                                height: 30,
                                child: const Center(
                                  child: Text(
                                    "Progess successfully reset.",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              );
                            });
                      },
                      title: "Reset Progress",
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

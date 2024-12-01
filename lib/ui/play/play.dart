import 'dart:developer';
import 'package:spenum/app/index.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  late RandomNumberGeneratorViewmodel _randomNumberGeneratorViewmodel;
  late SettingsViewmodel _settingsViewmodel;
  bool isGenerationComplete = false;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController submit = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
    _settingsViewmodel = SettingsViewmodel();
    _randomNumberGeneratorViewmodel = RandomNumberGeneratorViewmodel();
    _randomNumberGeneratorViewmodel.length =
        (_settingsViewmodel.loadNumberLenth() == null)
            ? value
            : _settingsViewmodel.loadNumberLenth()!;
    _randomNumberGeneratorViewmodel.generationCompleteStream.listen((_) {
      setState(() {
        isGenerationComplete = true;
      });
    });
  }

  @override
  void dispose() {
    _randomNumberGeneratorViewmodel.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  _onFocusChange() {
    if (_focusNode.hasFocus) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300), curve: Curves.linear);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: ColorManager.blue,
        title: Consumer<SettingsViewmodel>(builder: (context, data, __) {
          int level = data.getlevel(data);
          return Row(
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
                    value:
                        (data.getProgress(data) / data.progressMax).toDouble(),
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
          );
        }),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            //physics: const NeverScrollableScrollPhysics(),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [ColorManager.blue, ColorManager.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    StreamBuilder<int>(
                        stream:
                            _randomNumberGeneratorViewmodel.randomNumberStream,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text("Error:  + ${snapshot.error}");
                          } else if (!snapshot.hasData) {
                            return const Text("No Data");
                          } else {
                            log("${snapshot.data}");
                            return Text(
                              "${snapshot.data}",
                              style: italicTextStyle(
                                fontSize: 40.sp,
                                color: ColorManager.white,
                                fontStyle: FontStyle.italic,
                              ),
                            );
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
          if (isGenerationComplete)
            Positioned(
              bottom: 0,
              child: StreamBuilder<String>(
                  stream:
                      _randomNumberGeneratorViewmodel.concatenatedStringStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text("Error:  + ${snapshot.error}");
                    } else if (!snapshot.hasData) {
                      return const Text("No Data");
                    } else {
                      print(snapshot.data);
                      return showBottomSheet(snapshot.data, _focusNode);
                    }
                  }),
            )
        ],
      ),
    );
  }

  Material showBottomSheet(String? answer, FocusNode focusNode) {
    print("object: $answer");
    return Material(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                key: key,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Enter the final string:',
                        style: italicTextStyle(
                            fontSize: 20.sp, fontStyle: FontStyle.italic)),
                    TextFormField(
                      controller: submit,
                      focusNode: focusNode,
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          Navigator.of(context).pop();
                          _showAlertDialog(answer == submit.text);
                          if (answer == submit.text) {
                            context
                                .read<SettingsViewmodel>()
                                .increaseProgress();
                          }
                        } else {
                          print("Empty String");
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ))),
      ),
    );
  }

  void _showAlertDialog(bool correct) {
    showDialog(
        context: context,
        builder: (context) => Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [ColorManager.blue, ColorManager.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: AlertDialog(
                title: Container(
                  color: Colors.white,
                  width: 200.w,
                  height: 200.w,
                  child: FittedBox(
                    child: SizedBox(
                      width: 30.w,
                      height: 30.w,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: correct ? Colors.green : Colors.red,
                            borderRadius: BorderRadius.circular(100.r)),
                        child: Center(
                          child: Icon(
                            correct
                                ? IcoFontIcons.tickMark
                                : Icons.cancel_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.only(
                    top: 20.h, bottom: 20.h, left: 10.h, right: 10.h),
                titlePadding:
                    EdgeInsets.only(left: 50.w, right: 50.w, top: 10.h),
                contentTextStyle: regularTextStyle(
                    fontSize: 20.sp,
                    color: ColorManager.black,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600),
                content: Text(
                  correct
                      ? "You got it right \n Would you like to play again?"
                      : "You got it wrong \n Would you like to play again?",
                  textAlign: TextAlign.center,
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      //Navigator.of(context).pop();
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteManager.play,
                          ModalRoute.withName(RouteManager.play));
                    },
                    child: const Text('Yes'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteManager.landing,
                          ModalRoute.withName(RouteManager.landing));
                    },
                    child: const Text('No'),
                  ),
                ],
                actionsAlignment: MainAxisAlignment.center,
              ),
            ));
  }
}

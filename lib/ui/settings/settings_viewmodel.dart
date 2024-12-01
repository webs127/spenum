import 'package:spenum/app/index.dart';


class SettingsViewmodel extends ChangeNotifier {
  String selectedValue = 'Beginner';
  double min = 5;
  double max = 100;
  int level = 1;
  double rangeNumber = 5;
  int progress = 0;
  int progressMax = 5;

  onChanged(String? value) {
    selectedValue = value!;
    notifyListeners();
  }

  void increaseProgress() {
    int latestProgress = (loadProgress() == null) ? progress : loadProgress()!;
    ++latestProgress;
    if (latestProgress == progressMax) {
      latestProgress = 0;
      int latestLevel = (loadLevel() == null) ? level : loadLevel()!;
      ++latestLevel;
      SharedPreferenceLocalStorage().setInt("levelValue", latestLevel);
    }
    SharedPreferenceLocalStorage().setInt("progressValue", latestProgress);
    notifyListeners();
  }

  void clearProgress() {
    level = 1;
    rangeNumber = 5;
    progress = 0;
    SharedPreferenceLocalStorage().clearStorage();
    notifyListeners();
  }

  void onRangeChanged(double start) {
    rangeNumber = start;
    if (rangeNumber == 5 && rangeNumber <= 20) {
      selectedValue = "Beginner";
    }
    if (rangeNumber >= 21 && rangeNumber <= 40) {
      selectedValue = "Intermediate";
    }
    if (rangeNumber >= 41 && rangeNumber <= 60) {
      selectedValue = "Advanced";
    }
    if (rangeNumber >= 61 && rangeNumber <= 80) {
      selectedValue = "Time-trial";
    }
    if (rangeNumber >= 81 && rangeNumber <= 100) {
      selectedValue = "Endurance";
    }
    SharedPreferenceLocalStorage().setInt("numberLangth", rangeNumber.toInt());
    SharedPreferenceLocalStorage().setString("selectedValue", selectedValue);
    notifyListeners();
  }

  int? loadNumberLenth() {
    int? numberLangth = SharedPreferenceLocalStorage().getInt("numberLangth");
    return numberLangth;
  }

  int? loadProgress() {
    int? progressValue = SharedPreferenceLocalStorage().getInt("progressValue");
    return progressValue;
  }

  int? loadLevel() {
    int? levelValue = SharedPreferenceLocalStorage().getInt("levelValue");
    return levelValue;
  }

  String? loadSelectedValue() {
    String? value = SharedPreferenceLocalStorage().getString("selectedValue");
    return value;
  }

  int getlength(SettingsViewmodel settingsViewmodel) {
    return (settingsViewmodel.loadNumberLenth() == null)
        ? rangeNumber.toInt()
        : settingsViewmodel.loadNumberLenth()!;
  }

  int getProgress(SettingsViewmodel settingsViewmodel) {
    return (settingsViewmodel.loadProgress() == null)
        ? progress
        : settingsViewmodel.loadProgress()!;
  }

  int getlevel(SettingsViewmodel settingsViewmodel) {
    return (settingsViewmodel.loadLevel() == null)
        ? level
        : settingsViewmodel.loadLevel()!;
  }

  String getSelectedvalue(SettingsViewmodel settingsViewmodel) {
    return (settingsViewmodel.loadSelectedValue() == null)
        ? settingsViewmodel.selectedValue
        : settingsViewmodel.loadSelectedValue()!;
  }

  set maxValue(double value) {
    max = value;
    notifyListeners();
  }
}
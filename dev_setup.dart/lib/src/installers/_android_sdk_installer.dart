part of 'installer.dart';

class _AndroidSdkInstaller extends _CaskInstaller implements Installer {
  _AndroidSdkInstaller():
        super("android-sdk", cmd: "android");
  @override
  String get bashProfile =>
      "export ANDROID_HOME=/usr/local/bin/android\n"
      "export PATH=\$PATH:\$ANDROID_HOME/tools\n"
      "export PATH=\$PATH:\$ANDROID_HOME/tools/bin\n"
      "export PATH=\$PATH/:\$ANDROID_HOME/platform-tools";
}
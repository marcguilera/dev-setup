import 'package:dev_setup/dev_setup.dart';

enum InstallationOption {
  basic,
  web,
  mobile,
  backend,
  all
}

class InstallationMenu {

  final InstallationHandler handler;

  InstallationMenu(this.handler);

  static Future show() async {
    final handler = InstallationHandler();
    final menu = InstallationMenu(handler);
    await menu.draw();
  }

  Future draw() async {
    writeLine("Dev Setup", bold: true);
    nextLine();
    final installation = _showMenu();
    await handler.install(installation);
  }

  InstallerCollection _showMenu() {
    final message = "Choose an option to install: ";
    String formatOption(InstallationOption option) =>
        option.toString().replaceAll("InstallationOption.", "");
    String formatChooser (InstallationOption option, int index) =>
        "[$index] ${formatOption(option)}";
    final chooser = Chooser(InstallationOption.values, formatter: formatChooser, message: message);
    final option = doChoose(chooser);
    final installation = _select(option);
    writeLine("You chose to install ${formatOption(option)}. Let's go!\n");
    return installation;
  }

  InstallerCollection _select(InstallationOption option) {
    InstallerCollection installation;

    switch (option) {
      case InstallationOption.basic: installation = InstallerCollection.basic(); break;
      case InstallationOption.web: installation = InstallerCollection.web(); break;
      case InstallationOption.mobile: installation = InstallerCollection.mobile(); break;
      case InstallationOption.backend: installation = InstallerCollection.backend(); break;
      case InstallationOption.all: installation = InstallerCollection.all(); break;
    }

    return installation;
  }
}
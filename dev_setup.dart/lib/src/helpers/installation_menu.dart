import 'package:dev_setup/dev_setup.dart';

class InstallationMenu {

  final InstallationHandler handler;
  final Iterable<InstallerCollection> collections;

  InstallationMenu(this.handler, this.collections);
  factory InstallationMenu.generic(Iterable<InstallerCollection> collections) {
    final handler = InstallationHandler();
    return InstallationMenu(handler, collections);
  }

  void draw() {
    writeLine("Dev Setup", bold: true);
    nextLine();
    final installation = _showMenu();
    handler.install(installation);
  }

  InstallerCollection _showMenu() {
    final message = "Choose an option to install: ";
    final options = collections
        .where((collection) => !collection.isHidden)
        .map(_format)
        .toList();
    final chooser = Chooser(options, message: message);
    final option = doChoose(chooser);
    final installation = collections
        .firstWhere((collection) => _format(collection) == option);
    writeLine("You chose to install $option. Let's go!\n");
    return installation;
  }
  
  String _format(InstallerCollection collection) {
    return "${collection.name} <${collection.installers.length}>";
  }

}
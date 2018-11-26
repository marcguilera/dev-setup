import 'package:dev_setup/indernal.dart';

class InstallationMenu {

  final InstallerCollections _collections;

  InstallationMenu(this._collections);

  InstallerCollection ask() {
    nextLine();
    writeLine("DEV SETUP CLI" , bold: true, color: Color.YELLOW);
    writeLine("Available collections: ${_collections.length}");
    writeLine("Available installations: ${_collections.installers.length}");
    nextLine();
    return _showMenu();
  }

  InstallerCollection _showMenu() {
    final message = "Choose an option to install: ";
    final options = _collections
        .map(_format)
        .toList()
        ..sort();
    final chooser = Chooser(options, message: message);
    final option = doChoose(chooser);
    final installation = _collections
        .firstWhere((collection) => _format(collection) == option);
    writeLine("You chose to install $option. Let's go!", color: Color.GOLD);
    nextLine();
    return installation;
  }
  
  String _format(InstallerCollection collection) {
    return "${collection.name} <${collection.length}>";
  }

}


import 'package:dev_setup/indernal.dart';

class InstallationMenu {

  final InstallationHandler _handler;
  final Iterable<InstallerCollection> _collections;

  InstallationMenu(this._handler, this._collections);
  factory InstallationMenu.generic(Iterable<InstallerCollection> collections) {
    final handler = InstallationHandler();
    return InstallationMenu(handler, collections);
  }

  void draw() {
    nextLine();
    writeLine("DEV SETUP CLI" , bold: true, color: Color.YELLOW);
    nextLine();
    final installation = _showMenu();
    final result = _handler.install(installation);
    nextLine();
    _showResult(result);
  }

  InstallerCollection _showMenu() {
    final message = "Choose an option to install: ";
    final options = _collections
        .where((collection) => !collection.isHidden)
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
    return "${collection.name} <${collection.installers.length}>";
  }

  void _showResult(InstallationResult result) {
    if (result.installed.isNotEmpty) {
      writeLine("Installed ${result.installed.length} packages: ${result.installed}", bold: true, color: Color.GOLD);
    }
    if (result.skipped.isNotEmpty) {
      writeLine("Skipped ${result.skipped.length} already installed packages", bold: true, color: Color.GOLD);
    }
    if (result.notInstalled.isNotEmpty) {
      writeLine("Skipped ${result.notInstalled.length} not installed packages: ${result.notInstalled}", bold: true, color: Color.DARK_RED);
    }
    nextLine();
    writeLine("Done! Elapsed: ${result.stopwatch.elapsed}", bold: true, color: Color.GREEN);
    nextLine();
    _showBash(result.bash);
  }

  void _showBash(List<String> bashProfiles) {
    if (bashProfiles.isEmpty) {
      return;
    }
    nextLine();
    writeLine("Add this to your bash_profile file:");
    writeLine("----------------------------------------------");
    bashProfiles.forEach((line) => writeLine(line, color: Color.GRAY));
    writeLine("----------------------------------------------");
    final prompter = Prompter(" > Do you want to open $BASH_PROFILE now? ");
    if (prompter.askSync()) {
      writeLine("Opening $BASH_PROFILE...");
      Process.runSync("atom", [BASH_PROFILE], runInShell: true);
    }
  }

}
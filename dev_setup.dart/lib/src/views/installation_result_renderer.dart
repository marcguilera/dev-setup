import 'package:dev_setup/indernal.dart';

class InstallationResultRenderer {

  final InstallationResult _result;

  InstallationResultRenderer(this._result);
  void render() {
    nextLine();
    if (_result.installed.isNotEmpty) {
      writeLine("Installed ${_result.installed.length} packages: ${_result.installed}", bold: true, color: Color.GOLD);
    }
    if (_result.skipped.isNotEmpty) {
      writeLine("Skipped ${_result.skipped.length} already installed packages", bold: true, color: Color.GOLD);
    }
    if (_result.notInstalled.isNotEmpty) {
      writeLine("Skipped ${_result.notInstalled.length} not installed packages: ${_result.notInstalled}", bold: true, color: Color.DARK_RED);
    }
    nextLine();
    writeLine("Done! Elapsed: ${_result.stopwatch.elapsed}", bold: true, color: Color.GREEN);
    nextLine();
    _showBash(_result.bash);
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
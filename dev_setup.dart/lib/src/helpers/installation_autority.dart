import 'package:dev_setup/indernal.dart';

const BASH_PROFILE = "~/.bash_profile";

class InstallerAuthority {

  final InstallerCollection _collection;

  InstallerAuthority(this._collection);

  InstallationResult install() {

    final installed = List<Installer>();
    final skipped = List<Installer>();
    final notInstalled = List<Installer>();
    final stopwatch = new Stopwatch();
    final bash = List<String>();

    stopwatch.start();
    final size = _collection.length;
    var i = 1;
    for (var installer in _collection) {
      final leading = "[${i++}/$size]";
      if (!installer.isInstalled) {
        final prompter = Prompter("  > Do you want to install '${installer.name}'? ");
        if (doPrompt(prompter)) {
          writeLine("$leading Installing '${installer.name}'...", bold: true, color: Color.CYAN);
          installer.install();
          installed.add(installer);
          bash.addAll(installer.bash);
          writeLine("  Done installing '${installer.name}'", color: Color.GREEN);
        } else {
          writeLine("$leading You skipped '${installer.name}' which is not installed in your computer", bold: true, color: Color.DARK_RED);
          notInstalled.add(installer);
        }
      } else {
        writeLine("$leading '${installer.name}' is already installed, skipping...", color: Color.GRAY);
        skipped.add(installer);
      }
    }

    stopwatch.stop();

    return InstallationResult._(
      installed: installed,
      skipped: skipped,
      notInstalled: notInstalled,
      stopwatch: stopwatch,
      bash: bash
    );
  }
}

class InstallationResult {
  final Iterable<Installer> installed;
  final Iterable<Installer> skipped;
  final Iterable<Installer> notInstalled;
  final Stopwatch stopwatch;
  final Iterable<String> bash;

  const InstallationResult._({
    @required this.installed,
    @required this.skipped,
    @required this.notInstalled,
    @required this.stopwatch,
    @required this.bash
  });
}
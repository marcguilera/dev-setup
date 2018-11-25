import 'package:dev_setup/dev_setup.dart';


class InstallationHandler {

  void install(InstallerCollection installation) {
    final stopwatch = Stopwatch()..start();
    final installed = List<String>();
    final skipped = List<String>();
    final notInstalled = List<String>();
    final bash = List<String>();
    for (var installer in installation.installers) {
      final isInstalled = installer.isInstalled;
      if (!isInstalled) {
        final prompter = Prompter(" > Do you want to install '${installer.name}'? ");
        if (doPrompt(prompter)) {
          writeLine ("Installing '${installer.name}'...");
          installer.install();
          installed.add(installer.name);
          bash.addAll(installer.bash);
          writeLine ("Done installing '${installer.name}'");
        } else {
          writeLine("You skipped '${installer.name}' which is not installed in your computer", bold: true);
          notInstalled.add(installer.name);
        }
      } else {
        writeLine ("'${installer.name}' is already installed, skipping...");
        skipped.add(installer.name);
      }
    }
    nextLine();
    writeLine("Installed ${installed.length} packages: $installed", bold: true);
    writeLine("Skipped ${notInstalled.length} packages: $notInstalled", bold: true);
    writeLine("Done! Elapsed: ${stopwatch.elapsed}", bold: true);
    stopwatch.stop();

    _bashProfile(bash);
  }

  void _bashProfile(List<String> bashProfiles) {
    if (bashProfiles.isNotEmpty) {
      nextLine();
      writeLine("Add this to your bash_profile file:");
      writeLine("----------------------------------------------");
      for(var line in bashProfiles) {
        writeLine(line);
      }
      writeLine("----------------------------------------------");
    }
  }
}
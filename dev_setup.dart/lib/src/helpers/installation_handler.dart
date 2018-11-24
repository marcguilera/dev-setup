import 'package:dev_setup/dev_setup.dart';


class InstallationHandler {

  Future install(InstallerCollection installation) async {
    final stopwatch = Stopwatch()..start();
    final installed = List<String>();
    final skipped = List<String>();
    final notInstalled = List<String>();
    final bashProfiles = List<String>();
    for (var installer in installation.installers) {
      final isInstalled = await installer.isInstalled;
      if (!isInstalled) {
        final prompter = Prompter(" > Do you want to install '${installer.name}'? ");
        if (doPrompt(prompter)) {
          writeLine ("Installing '${installer.name}'...");
          await installer.install();
          installed.add(installer.name);
          if (installer.bashProfile != null) {
            bashProfiles.add(installer.bashProfile);
          }
          writeLine ("Done installing '${installer.name}'");
        } else {
          writeLine("You skipped '${installer.name}' which is not installed in your computer", bold: true);
          notInstalled.add(installer.name);
        }
      } else {
        writeLine ("${installer.name} is already installed, skipping...");
        skipped.add(installer.name);
      }
    }
    nextLine();
    writeLine("Installed ${installed.length} packages: $installed", bold: true);
    writeLine("Skipped ${notInstalled.length} packages: $notInstalled", bold: true);
    writeLine("Done! Elapsed: ${stopwatch.elapsed}", bold: true);
    stopwatch.stop();

    _bashProfile(bashProfiles);
  }

  static void _bashProfile(List<String> bashProfiles) {
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
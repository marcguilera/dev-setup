library dev_setup;

import 'indernal.dart';

class DevSetup {
  DevSetup._();
  static void launch() {
    initConsole();
    final parser = InstallerCollectionParser.generic();
    final collections = parser.parse();
    final menu = InstallationMenu.generic(collections);
    menu.draw();
    resetConsole();
  }
}


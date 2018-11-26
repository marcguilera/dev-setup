library dev_setup;

import 'indernal.dart';

class DevSetup {
  DevSetup._();
  static void launch() {
    initConsole();
    final parser = InstallerCollectionParser.generic();
    final collections = parser.parse(); // Parses the YAML
    final menu = InstallationMenu(collections);
    final collection = menu.ask(); // Asks the user which collection
    final authority = InstallerAuthority(collection);
    final result = authority.install(); // Installs the collection
    final renderer = InstallationResultRenderer(result);
    renderer.render(); // Renders the result of the collection
    resetConsole();
  }
}


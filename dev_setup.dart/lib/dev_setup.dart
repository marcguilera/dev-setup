library dev_setup;

export 'src/collections/installer_collection.dart';
export 'src/installers/installer.dart';
export 'src/installers/command.dart';
export 'package:console/console.dart';
export 'src/common/console.dart';
export 'src/helpers/installation_handler.dart';
export 'src/helpers/installation_menu.dart';
export 'src/installers/installer_type.dart';
export 'src/reader/file_reader.dart';
export 'src/helpers/installation_menu.dart';
export 'src/reader/installer_collection_parser.dart';
import 'package:dev_setup/dev_setup.dart';

void setup(List<String> arguments) {
  final parser = InstallerCollectionParser.fromFile(CONFIG);
  final menu = InstallationMenu.generic(parser.parse());
  menu.draw();
  resetConsole();
}


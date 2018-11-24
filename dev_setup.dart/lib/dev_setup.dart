library dev_setup;

export 'src/collections/installer_collection.dart';
export 'src/installers/installer.dart';
export 'package:console/console.dart';
export 'src/common/console.dart';
import 'src/helpers/installation_menu.dart';
export 'src/helpers/installation_handler.dart';

Future setup(List<String> arguments) => InstallationMenu.show();


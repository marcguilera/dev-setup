library dev_setup;

import 'src/helpers/installation_menu.dart';

export 'src/collections/installer_collection.dart';
export 'src/installers/installer.dart';
export 'package:console/console.dart';
export 'src/common/console.dart';
export 'src/helpers/installation_handler.dart';
export 'src/helpers/installation_menu.dart';

Future setup(List<String> arguments) => InstallationMenu.show();


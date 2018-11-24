import 'package:dev_setup/dev_setup.dart';

part '_all_installer_collection.dart';
part '_backend_installer_collection.dart';
part '_basic_installer_collection.dart';
part '_extras_installer_collection.dart';
part '_frontend_installer_collection.dart';
part '_installer_collection_base.dart';
part '_mobile_installer_collection.dart';
part '_web_installer_collection.dart';

abstract class InstallerCollection {
  List<Installer> get installers;
  factory InstallerCollection.basic() => _BasicInstallerCollection();
  factory InstallerCollection.all() => _AllInstallerCollection();
  factory InstallerCollection.backend() => _BackendInstallerCollection();
  factory InstallerCollection.frontend() => _FrontendInstallerCollection();
  factory InstallerCollection.web() => _WebInstallerCollection();
  factory InstallerCollection.mobile() => _MobileInstallerCollection();
}
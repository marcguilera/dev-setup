import 'package:dev_setup/dev_setup.dart';

part '_backend_installer_collection.dart';
part '_basic_installer_collection.dart';
part '_extras_installer_collection.dart';
part '_installer_collection_base.dart';
part '_mobile_installer_collection.dart';
part '_web_installer_collection.dart';
part '_java_installer_collection.dart';

abstract class InstallerCollection {
  List<Installer> get installers;

  factory InstallerCollection.basic() => _BasicInstallerCollection();

  factory InstallerCollection.extras() => _cmb([
    InstallerCollection.basic(),
    _ExtrasInstallerCollection()
  ]);

  factory InstallerCollection.all() => _cmb([
    InstallerCollection.extras(),
    InstallerCollection.backend(),
    InstallerCollection.frontend()
  ]);

  factory InstallerCollection.backend() => _cmb([
    InstallerCollection.basic(),
    _JavaInstallerCollection(),
    _BackendInstallerCollection()
  ]);

  factory InstallerCollection.frontend() => _cmb([
    InstallerCollection.basic(),
    InstallerCollection.mobile(),
    InstallerCollection.web()
  ]);

  factory InstallerCollection.web() => _cmb([
    InstallerCollection.basic(),
    _WebInstallerCollection()
  ]);

  factory InstallerCollection.mobile() => _cmb([
    InstallerCollection.basic(),
    _MobileInstallerCollection()
  ]);

  factory InstallerCollection.fromOption(InstallationOption option) {
    switch (option) {
      case InstallationOption.basic: return InstallerCollection.basic();
      case InstallationOption.web: return InstallerCollection.web();
      case InstallationOption.mobile: return InstallerCollection.mobile();
      case InstallationOption.backend: return InstallerCollection.backend();
      case InstallationOption.all: return InstallerCollection.all();
      case InstallationOption.extras: return InstallerCollection.extras();
    }
    throw Exception("Wrong option");
  }

}

class _cmb extends _InstallerCollectionBase {
  _cmb(List<InstallerCollection> collections) {
    collections.forEach((collection) => collection.installers.forEach(_installer));
  }
}
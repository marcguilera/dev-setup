part of 'installer_collection.dart';

class _WebInstallerCollection extends _InstallerCollectionBase {
  _WebInstallerCollection(): super() {
    _dart("angular_cli", cmd: "ngdart");
  }
}
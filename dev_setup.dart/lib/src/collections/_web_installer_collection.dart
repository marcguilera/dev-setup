part of 'installer_collection.dart';

class _WebInstallerCollection extends _ExtrasInstallerCollection {
  _WebInstallerCollection(): super() {
    _addJava();
    _addWeb();
  }
}
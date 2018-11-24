part of 'installer_collection.dart';

class _FrontendInstallerCollection extends _ExtrasInstallerCollection {
  _FrontendInstallerCollection(): super() {
    _addJava();
    _addMobile();
    _addWeb();
  }
}
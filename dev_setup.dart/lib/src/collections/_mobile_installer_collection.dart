part of 'installer_collection.dart';

class _MobileInstallerCollection extends _ExtrasInstallerCollection {
  _MobileInstallerCollection(): super() {
    _addJava();
    _addMobile();
  }
}
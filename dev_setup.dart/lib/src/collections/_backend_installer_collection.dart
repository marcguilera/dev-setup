part of 'installer_collection.dart';

class _BackendInstallerCollection extends _ExtrasInstallerCollection {
  _BackendInstallerCollection(): super() {
    _addJava();
    _addBackend();
  }
}
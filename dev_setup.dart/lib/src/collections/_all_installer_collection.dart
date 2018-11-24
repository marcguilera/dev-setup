part of 'installer_collection.dart';

class _AllInstallerCollection extends _ExtrasInstallerCollection {
    _AllInstallerCollection(): super() {
        _addJava();
        _addMobile();
        _addWeb();
        _addBackend();
    }
}
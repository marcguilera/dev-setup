part of 'installer_collection.dart';

class _MobileInstallerCollection extends _InstallerCollectionBase {
  _MobileInstallerCollection(): super() {
    _android();
    _brew("ios-deploy");
    _brew("cocoapods", cmd: "pod");
  }
  void _android() =>
      _installer(Installer.android());
}
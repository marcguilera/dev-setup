part of 'installer_collection.dart';

class _ExtrasInstallerCollection extends _InstallerCollectionBase {
  _ExtrasInstallerCollection() : super() {
    _brew("git");
    _cask("docker-toolbox", cmd: "docker");
    _dart("stagehand");
    _npm("yo");
    _cask("atom");
  }
}
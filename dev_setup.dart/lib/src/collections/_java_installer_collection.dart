part of 'installer_collection.dart';

class _JavaInstallerCollection extends _InstallerCollectionBase {
  _JavaInstallerCollection() : super() {
    _cask("java");
    _brew("kotlin");
    _brew("ant");
    _brew("maven", cmd: "mvn");
    _brew("gradle");
    _cask("intellij-idea", cmd: "idea");
  }
}
part of 'installer_collection.dart';

class _InstallerCollectionBase implements InstallerCollection {

  Map<String, Installer> _installers = {};
  List<Installer> get installers => List.unmodifiable(_installers.values);

  void _addBasic() => this
    .._brew("npm");

  void _addJava() =>  this
    .._cask("java")
    .._brew("kotlin")
    .._brew("ant")
    .._brew("maven", cmd: "mvn")
    .._brew("gradle")
    .._cask("intellij-idea", cmd: "idea");

  void _addExtras() => this
    .._brew("git")
    .._cask("docker-toolbox", cmd: "docker")
    .._dart("stagehand")
    .._npm("yo")
    .._cask("atom");

  void _addBackend() => this
    .._dart("aqueduct");

  void _addWeb() => this
    .._dart("angular_cli", cmd: "ngdart");

  void _addMobile() => this
    .._android()
    .._brew("ios-deploy")
    .._brew("cocoapods", cmd: "pod");

  void _brew(String name, {String cmd}) =>
      _installer(Installer.brew(name, cmd: cmd));

  void _npm(String name, {String cmd}) =>
      _installer(Installer.npm(name, cmd: cmd));

  void _dart(String name, {String cmd}) =>
      _installer(Installer.dart(name, cmd: cmd));

  void _cask(String name, {String cmd}) =>
      _installer(Installer.cask(name, cmd: cmd));

  void _android() =>
      _installer(Installer.android());

  void _installer(Installer installer) =>
      _installers.putIfAbsent(installer.name, () => installer);
}
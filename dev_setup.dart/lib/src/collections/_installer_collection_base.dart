part of 'installer_collection.dart';

class _InstallerCollectionBase implements InstallerCollection {

  Map<String, Installer> _installers = {};
  List<Installer> get installers => List.unmodifiable(_installers.values);

  void _brew(String name, {String cmd}) =>
      _installer(Installer.brew(name, cmd: cmd));

  void _npm(String name, {String cmd}) =>
      _installer(Installer.npm(name, cmd: cmd));

  void _dart(String name, {String cmd}) =>
      _installer(Installer.dart(name, cmd: cmd));

  void _cask(String name, {String cmd}) =>
      _installer(Installer.cask(name, cmd: cmd));

  void _installer(Installer installer) =>
      _installers.putIfAbsent(installer.name, () => installer);
}
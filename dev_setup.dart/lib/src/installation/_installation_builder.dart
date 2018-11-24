part of 'installation.dart';

class _InstallationBuilder  {

  Map<String, Installer> _installers = {};

  void brew(String name, {String cmd}) =>
      _installer(Installer.brew(name, cmd: cmd));
  void cask(String name, {String cmd, String bashProfile}) =>
      _installer(Installer.cask(name, cmd: cmd));
  void npm(String name, {String cmd}) =>
      _installer(Installer.npm(name, cmd: cmd));
  void dart(String name, {String cmd}) =>
      _installer(Installer.dart(name, cmd: cmd));
  void android() =>
      _installer(Installer.android());
  void _installer(Installer installer) =>
      _installers.putIfAbsent(installer.name, () => installer);

  List<Installer> build() => List.unmodifiable(_installers.values);
}
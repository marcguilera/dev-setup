import 'dart:io';
part '_installer_base.dart';
part '_npm_installer.dart';
part '_cask_installer.dart';
part '_brew_installer.dart';
part '_dart_installer.dart';
part '_android_sdk_installer.dart';

abstract class Installer {
  String get name;
  String get cmd;
  String get bashProfile;
  Future<bool> get isInstalled;
  Future install();

  factory Installer.brew(String name, {String cmd}) =>
      _BrewInstaller(name, cmd: cmd);
  factory Installer.cask(String name, {String cmd}) =>
      _CaskInstaller(name, cmd: cmd);
  factory Installer.npm(String name, {String cmd}) =>
      _NpmInstaller(name, cmd: cmd);
  factory Installer.dart(String name, {String cmd}) =>
      _DartInstaller(name, cmd: cmd);
  factory Installer.android() =>
      _AndroidSdkInstaller();
}

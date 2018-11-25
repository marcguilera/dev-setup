import 'package:dev_setup/dev_setup.dart';

final CONFIG = "../config.yaml";

class InstallerCollectionParser {
  final Map yaml;
  Map get typesYaml => yaml["types"];
  Map get packagesYaml => yaml["packages"];
  Map get collectionsYaml => yaml["collections"];

  InstallerCollectionParser(this.yaml);
  factory InstallerCollectionParser.fromFile(String path) =>
      InstallerCollectionParser(FileReader.read(path));

  Iterable<InstallerCollection> parse() {
    final Map<String, InstallerCollection> collections = {};
    collectionsYaml?.forEach((key, value) {
      collections[key] = _parseCollection(key, value);
    });
    return collections.values;
  }

  InstallerCollection _parseCollection(String name, Map collectionYaml) {
    final isPrivate = collectionYaml["hidden"] ?? false;
    final Map<String, Installer> installers = {};

    // Nested collections
    collectionYaml["collections"]?.forEach((name) {
      final collection = _parseCollection(name, collectionsYaml[name]);
      collection.installers.forEach((installer) {
        installers.putIfAbsent(installer.name, () => installer);
      });
    });

    // Packages
    collectionYaml["packages"]?.forEach((name) {
      installers.putIfAbsent(name, () => _parsePackage(name, packagesYaml[name]));
    });

    return InstallerCollection(
      name: name,
      isPrivate: isPrivate,
      installers: installers.values
    );
  }

  Installer _parsePackage(String name, Map packageYaml) {
    final typeName = packageYaml["type"];
    final type = _parseType(typeName, typesYaml[typeName]);
    final cmd = packageYaml["cmd"];
    final bash = packageYaml["bash"];
    return Installer(
      name: name,
      type: type,
      cmd: cmd,
      bash: bash?.cast<String>()
    );
  }

  InstallerType _parseType(String name, Map typeYaml) {
    final cmd = typeYaml["cmd"];
    final args = typeYaml["args"];
    return InstallerType(
      name: name,
      cmd: cmd,
      args: args?.cast<String>()
    );
  }
}
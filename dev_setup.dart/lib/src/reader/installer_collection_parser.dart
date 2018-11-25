import 'package:dev_setup/dev_setup.dart';
import 'package:yaml/yaml.dart';

const CONFIG = "../config.yaml";

class InstallerCollectionParser {
  final Map yaml;
  YamlMap get typesYaml => yaml["types"];
  YamlMap get packagesYaml => yaml["packages"];
  YamlMap get collectionsYaml => yaml["collections"];
  YamlMap get commandsYaml => yaml["commands"];

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
    final Map<String, Installer> installers = {};

    // Nested collections
    collectionYaml["collections"]?.forEach((name) {
      final collection = _parseCollection(name, collectionsYaml[name]);
      final entries = collection.installers.map((i) => MapEntry(i.name, i));
      installers.addEntries(entries);
    });

    // Packages
    collectionYaml["packages"]?.forEach((name) {
      installers.putIfAbsent(name, () => _parsePackage(name, packagesYaml[name]));
    });

    return InstallerCollection(
      name: name,
      isPrivate: collectionYaml["hidden"] ?? false,
      installers: installers.values
    );
  }

  Installer _parsePackage(String name, YamlMap packageYaml) {
    final typeName = packageYaml["type"];
    return Installer(
      name: name,
      type: _parseType(typeName, typesYaml[typeName]),
      cmd: packageYaml["cmd"],
      bash: packageYaml["bash"]?.cast<String>()
    );
  }

  InstallerType _parseType(String name, YamlMap typeYaml) {
    YamlList installYaml = typeYaml["install"];
    YamlList isInstalledYaml = typeYaml["is_installed"];
    return InstallerType(
      install: installYaml.cast<String>().map(_parseCommand).expand((x) => x).toList(),
      isInstalled: isInstalledYaml.cast<String>().map(_parseCommand).expand((x) => x).toList()
    );
  }

  Iterable<Command> _parseCommand(String name) {
    YamlList commandsYaml = this.commandsYaml[name];
    return commandsYaml.map((commandYaml) => Command(
      exec: commandYaml["exec"],
      args: commandYaml["args"]?.cast<String>()
    ));

  }
}
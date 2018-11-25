import 'package:dev_setup/indernal.dart';

const CONFIG = "../config.yaml";

class InstallerCollectionParser {
  final Map _yaml;
  YamlMap get _typesYaml => _yaml["types"];
  YamlMap get _packagesYaml => _yaml["packages"];
  YamlMap get _collectionsYaml => _yaml["collections"];
  YamlMap get _commandsYaml => _yaml["commands"];

  InstallerCollectionParser(this._yaml);
  factory InstallerCollectionParser.fromFile(String path) =>
      InstallerCollectionParser(FileReader.read(path));
  factory InstallerCollectionParser.generic() =>
      InstallerCollectionParser.fromFile(CONFIG);

  Iterable<InstallerCollection> parse() {
    final Map<String, InstallerCollection> collections = {};
    _collectionsYaml?.forEach((key, value) {
      collections[key] = _parseCollection(key, value);
    });
    return collections.values;
  }

  InstallerCollection _parseCollection(String name, Map collectionYaml) {
    final Map<String, Installer> installers = {};

    // Nested collections
    collectionYaml["collections"]?.forEach((name) {
      final collection = _parseCollection(name, _collectionsYaml[name]);
      final entries = collection.installers.map((i) => MapEntry(i.name, i));
      installers.addEntries(entries);
    });

    // Packages
    collectionYaml["packages"]?.forEach((name) {
      installers.putIfAbsent(name, () => _parsePackage(name, _packagesYaml[name]));
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
      type: _parseType(typeName, _typesYaml[typeName]),
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
    YamlList commandsYaml = this._commandsYaml[name];
    return commandsYaml.map((commandYaml) => Command(
      exec: commandYaml["exec"],
      args: commandYaml["args"]?.cast<String>()
    ));

  }
}
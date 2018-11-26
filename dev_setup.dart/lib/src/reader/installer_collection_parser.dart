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
    final collections = List<_InstallerCollection>();
    _collectionsYaml?.forEach((key, value) {
      final collection = _parseCollection(key, value);
      collections.add(collection);
    });
    final notHidden = collections.where((i) => !i.isHidden);
    return InstallerCollections(notHidden);
  }

  _InstallerCollection _parseCollection(String name, Map collectionYaml) {
    final installers = Map<String, Installer>();

    // Nested collections
    collectionYaml["collections"]?.forEach((name) {
      final collection = _parseCollection(name, _collectionsYaml[name]);
      collection.forEach((i) => installers[i.name] = i);
    });

    // Packages
    collectionYaml["packages"]?.forEach((name) {
      installers.putIfAbsent(name, () => _parsePackage(name, _packagesYaml[name]));
    });

    return _InstallerCollection(
      name: name,
      isHidden: collectionYaml["hidden"],
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
    Iterable<Command> get(String name) {
      YamlList installYaml = typeYaml[name];
      return installYaml.cast<String>().map(_parseCommand).expand((x) => x);
    }
    return InstallerType(
      install: get("install"),
      isInstalled: get("is_installed")
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

class _InstallerCollection extends InstallerCollection {
  final bool isHidden;

  const _InstallerCollection({
    @required String name,
    bool isHidden,
    Iterable<Installer> installers
  }): this.isHidden = isHidden ?? false,
      super(name: name, installers: installers);
}
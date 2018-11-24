
import 'package:dev_setup/dev_setup.dart';
part '_installation_builder.dart';

class Installation {

  final _builder = _InstallationBuilder();
  List<Installer> get installers => _builder.build();

  Installation() {
    _addBasic();
  }

  factory Installation.all() => Installation()
    .._addJava()
    .._addMobile()
    .._addWeb()
    .._addBackend()
    .._addExtras();

  factory Installation.backend() => Installation()
    .._addJava()
    .._addExtras()
    .._addBackend();

  factory Installation.frontend() => Installation()
    .._addJava()
    .._addExtras()
    .._addMobile()
    .._addWeb();

  factory Installation.web() => Installation()
    .._addJava()
    .._addExtras()
    .._addWeb();

  factory Installation.mobile() => Installation()
    .._addJava()
    .._addExtras()
    .._addMobile();

  void _addBasic() => _builder
    ..brew("npm");

  void _addJava() =>  _builder
    ..cask("java")
    ..brew("kotlin")
    ..brew("ant")
    ..brew("maven", cmd: "mvn")
    ..brew("gradle")
    ..cask("intellij-idea", cmd: "idea");

  void _addExtras() => _builder
    ..brew("git")
    ..cask("docker-toolbox", cmd: "docker")
    ..dart("stagehand")
    ..npm("yo")
    ..cask("atom");

  void _addBackend() => _builder
    ..dart("aqueduct");

  void _addWeb() => _builder
    ..dart("angular_cli", cmd: "ngdart");

  void _addMobile() => _builder
    ..android()
    ..brew("ios-deploy")
    ..brew("cocoapods", cmd: "pod");
}
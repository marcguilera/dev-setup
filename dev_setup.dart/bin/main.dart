import 'package:dev_setup/dev_setup.dart';
import 'package:console/console.dart';

main(List<String> arguments) async {
  Console.init();
  await setup(arguments);
}

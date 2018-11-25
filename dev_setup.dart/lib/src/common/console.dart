import 'package:dev_setup/indernal.dart';

initConsole() {
  Console.init();
}

void nextLine() {
  print("");
}

void writeLine(String line, {bool bold = false, Color color}) {
  Console.setBold(bold);
  color?.makeCurrent();
  Console.adapter.writeln(line);
  Console.setBold(false);
  Console.resetTextColor();
}

bool doPrompt(Prompter prompter) {
  Color.BLUE.makeCurrent();
  Console.setBold(true);
  final value = prompter.askSync();
  Console.resetTextColor();
  Console.setBold(false);
  return value;
}

T doChoose<T>(Chooser<T> chooser) {
  Color.BLUE.makeCurrent();
  Console.setBold(true);
  final value = chooser.chooseSync();
  Console.resetTextColor();
  Console.setBold(false);
  return value;
}

void resetConsole() {
  Console.resetAll();
  Console.setBold(false);
}
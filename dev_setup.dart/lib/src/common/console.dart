import 'package:console/console.dart';

void nextLine() {
  print("");
}

void writeLine(String line, {bool bold = false}) {
  Console.setBold(bold);
  Console.write(line);
  nextLine();
  Console.setBold(false);
}

bool doPrompt(Prompter prompter) {
  Console.setBold(true);
  final value = prompter.askSync();
  Console.setBold(false);
  return value;
}

T doChoose<T>(Chooser<T> chooser) {
  Console.setBold(true);
  final value = chooser.chooseSync();
  Console.setBold(false);
  return value;
}
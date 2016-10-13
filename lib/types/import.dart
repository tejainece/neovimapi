library neovimapi.types;

import 'dart:math';

part 'buffer.dart';
part 'window.dart';
part 'tabpage.dart';

class Range {
  int startLine;

  int endLine;
}

void ui_attach(int aWidth, int aHeight, Map aOptions) {
  //TODO
}

void ui_detach() {
  //TODO
}

void ui_try_resize(int aWidth, int aHeight) {
  //TODO
}

void ui_set_option(String aName, dynamic aValue) {
  //TODO
}
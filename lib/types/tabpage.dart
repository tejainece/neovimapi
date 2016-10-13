part of neovimapi.types;

abstract class TabPage {
  int id;

  List<Window> get windows;

  dynamic getVar(String aName);

  void setVar(String aName, dynamic aValue);

  void deleteVar(String aName);

  Window get window;

  bool get isValid;
}
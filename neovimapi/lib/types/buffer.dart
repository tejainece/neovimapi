part of neovimapi.types;

/// A remote Nvim buffer
abstract class Buffer {
  int id;

  //TODO client

  /// Returns line count of the buffer
  /// name: nvim_buf_line_count
  /// parameters [Buffer, buffer]
  int get lineCount;

  /// Returns list of lines in the buffer from [aStart] to [aEnd]
  List<String> getLines(int aStart, int aEnd, bool aStrictIndexing);

  /// Replaces lines starting from [aStart] to [aEnd] with lines in the
  /// [aReplacement]
  void setLines(int aStart, int aEnd, bool aStrictIndexing, List<String> aReplacement);

  dynamic getVar(String aName);

  void setVar(String aName, dynamic aValue);

  void deleteVar(String aName);

  dynamic getOption(String aName);

  void setOption(String aName, dynamic aValue);

  int get number;

  String get name;

  set name(String aName);

  bool get valid;

  Point<int> getMark(String aName);

  int addHighlight(int aSrcID, String aHlGroup, int aLine, int aColStart, int aColEnd);

  int clearHighlight(int aSrcID, int aLineStart, int aLineEnd);
}
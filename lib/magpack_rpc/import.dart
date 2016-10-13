library msgpack_rpc;

import 'dart:io';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:msgpack/msgpack.dart';

const int kMsgTypeRequest = 0;
const int kMsgTypeReply = 1;
const int kMsgTypeNotification = 2;

class MsgpackClient {
  MsgpackClient(this._port, {String aHostname: "localhost"}): _hostname = aHostname;

  final String _hostname;

  final int _port;

  Socket _socket;

  int _msgId = 0;

  Future connect() async {
    _msgId = 5;
    _socket = await Socket.connect(_hostname, _port);

    print(_socket.port);

    _socket.encoding = convert.ASCII;

    _socket.listen(_readIncoming);

    _socket.done.then((_) {
      print("Done!");
    });
  }

  _readIncoming(final List<int> aIn) {
    print(intListToHexStr(aIn));
    print(unpack(aIn));
  }

  Future sendRequest(String funcName, List<dynamic> args) async {
    final int lCurMsgID = _msgId;
    _msgId++;

    //TODO auto coerce

    StatefulPacker lPacker = new StatefulPacker();

    lPacker.pack([kMsgTypeRequest, lCurMsgID, funcName, args]);

    final lMsg = lPacker.done().toList(growable: false);

    print(intListToStr(lMsg));

    print(intListToStr(lMsg).codeUnits);

    _socket.add(lMsg);

    //_socket.write("t");

    //TODO
  }

  String intListToHexStr(List<int> aList) {
    String lStr = "[";

    aList.forEach((int aVal) {
      lStr += "0x" + aVal.toRadixString(16) + ", ";
    });

    lStr += "]";

    return lStr;
  }

  String intListToStr(List<int> aList) {
    String lStr = "";

    aList.forEach((int aVal) {
      lStr += new String.fromCharCode(aVal);
    });

    return lStr;
  }
}
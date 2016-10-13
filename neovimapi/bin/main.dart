// Copyright (c) 2016, Ravi Teja Gudapati. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'package:neovimapi/neovimapi.dart' as neovimapi;

import 'package:neovimapi/magpack_rpc/import.dart';

MsgpackClient lClient = new MsgpackClient(1234);

main(List<String> arguments) async {
  await lClient.connect();

  await lClient.sendRequest("nvim_list_bufs", []);
  new Timer.periodic(new Duration(seconds: 5), (_) async {
    await lClient.sendRequest("nvim_list_bufs", []);
  });
}

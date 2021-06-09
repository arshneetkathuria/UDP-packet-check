//@dart=2.9
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:udp/udp.dart';
void main() async{
  var receiver = await UDP.bind(Endpoint.loopback(port: Port(5554)));
  print(" $receiver connected");
  // receiving\listening
  await receiver.listen((datagram) {
    print("listening");
    var str = String.fromCharCodes(datagram.data);
    print(str);
  }, timeout: Duration(seconds: 20));
  // var multicastEndpoint =
  // Endpoint.multicast(InternetAddress("239.1.2.3"), port: Port(54321));
  //
  // var receiver = await UDP.bind(multicastEndpoint);
  // print("receiver created");
  // receiver.listen((datagram) {
  //   print("listening");
  //   if (datagram != null) {
  //     var str = String.fromCharCodes(datagram?.data);
  //
  //     stdout.write(str);
  //   }
  // });
  receiver.close();
}


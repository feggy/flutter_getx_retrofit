import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/json_place_holder_controller.dart';

class JsonPlaceHolderView extends GetView<JsonPlaceHolderController> {
  @override
  Widget build(BuildContext context) {
    controller;

    return Scaffold(
      appBar: AppBar(
        title: Text('JsonPlaceHolderView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'JsonPlaceHolderView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

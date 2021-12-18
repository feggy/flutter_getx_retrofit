import 'package:flutter/material.dart';
import 'package:flutter_getx_retrofit_example/app/data/payload/responses/json_place_holder/res_post.dart';
import 'package:flutter_getx_retrofit_example/app/widgets/resource_widget.dart';

import 'package:get/get.dart';

import '../controllers/json_place_holder_controller.dart';

class JsonPlaceHolderView extends GetView<JsonPlaceHolderController> {
  @override
  Widget build(BuildContext context) {
    Widget content(List<ResPost> dataList) {
      Widget rowitem({
        required String title,
        required String desc,
      }) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue.withOpacity(0.1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                height: 5,
              ),
              Text(
                desc,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        );
      }

      return ListView.builder(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        itemBuilder: (context, index) {
          return rowitem(
            title: controller.dataList?[index].title ?? '',
            desc: controller.dataList?[index].body ?? '',
          );
        },
        itemCount: controller.dataList?.length,
      );
    }

    Widget loading = Center(
      child: CircularProgressIndicator(),
    );

    Widget error(String msg) {
      return Center(
        child: Text(msg),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('JsonPlaceHolderView'),
        centerTitle: true,
      ),
      body: ResourceWidget<List<ResPost>>(
        data: controller.resPosts.result,
        onSuccess: (response) => content(response!),
        onLoading: () => loading,
        onError: (message) => error(message),
      ),
    );
  }
}

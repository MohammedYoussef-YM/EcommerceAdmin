import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/linkurl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(AppRoute.categoryadd);
      },child: Icon(Icons.add),),
      body: GetBuilder<CategoriesController>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              child: SvgPicture.network(
                                  "${AppLink.imageCategories}/${controller.data[index].categoriesImage}",height:80),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: ListTile(
                              trailing: IconButton(icon: Icon(Icons.edit),onPressed:(){

                              },),
                              subtitle: Text(controller.data[index].categoriesDatetime!),
                              title: Text(controller.data[index].categoriesName!),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),),)),);
  }
}

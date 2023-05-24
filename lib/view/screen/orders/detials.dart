import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../controller/orders/details_controller.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DetailsController());
    return Scaffold(
      appBar: AppBar(
        title:const Text('Orders Details')
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: GetBuilder<DetailsController>(
          builder: ((controller) => HandlingDataView(
              statusRequest: controller.statusRequest, widget:
              ListView( children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Table(
                      children: [
                        TableRow(children: [
                          Text("Item",textAlign: TextAlign.center,style: defaultStyle,),
                          Text("QTY",textAlign: TextAlign.center,style: defaultStyle,),
                          Text("Price",textAlign: TextAlign.center,style: defaultStyle,),
                        ]),

                      ...List.generate(
                        controller.data.length,
                        (index) =>  TableRow(children: [
                          Text("${controller.data[index].itemsName}",textAlign: TextAlign.center,),
                          Text("${controller.data[index].countitems}",textAlign: TextAlign.center,),
                          Text("${controller.data[index].itemsprice}",textAlign: TextAlign.center,),
                        ]),)
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Text("Price: ${controller.orderModel.ordersTotalprice}\$",textAlign: TextAlign.center,style: defaultStyle,),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            if(controller.orderModel.ordersType == "0") Card(
              child: ListTile(
                title: Text("Shipping Address",style: defaultStyle,),
                subtitle: Text("${controller.orderModel.addressCity} ${controller.orderModel.addressStreet}"),
              ),
            ),
            if(controller.orderModel.ordersType == "0") Card(
              child: Container(
                height: 300,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: GoogleMap(
                  mapType: MapType.normal,
                  markers: controller.markers.toSet(),
                  padding: const EdgeInsets.fromLTRB(0.0,20.0,10, 0.0),// works
                  initialCameraPosition: controller.cameraPosition!,
                  onMapCreated: (GoogleMapController controllermap) {
                    controller.completerconttroller?.complete(controllermap);
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                ),
              ),
            )
          ],
          )
              )
          ),
        ),
      ),
    );
  }
}

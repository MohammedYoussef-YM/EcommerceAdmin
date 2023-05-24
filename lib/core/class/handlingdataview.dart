import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  StatusRequest statusRequest;
  Widget widget;

  HandlingDataView({Key? key,required this.statusRequest,required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading ?
    Center(child: Lottie.asset(AppImageAsset.loading,width: 250,height: 250),):
    statusRequest == StatusRequest.offlinefailure?
    Center(child: Lottie.asset(AppImageAsset.offline,width: 250,height: 250),) :
    statusRequest == StatusRequest.serverfailure ?
    Center(child: Lottie.asset(AppImageAsset.server,width: 250,height: 250),):
    statusRequest == StatusRequest.failure ?
    Center(child: Lottie.asset(AppImageAsset.noData,width: 250,height: 250)) : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  StatusRequest statusRequest;
  Widget widget;

  HandlingDataRequest({Key? key,required this.statusRequest,required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading ?
    Center(child: Lottie.asset(AppImageAsset.loading,width: 250,height: 250),):
    statusRequest == StatusRequest.offlinefailure?
    Center(child: Lottie.asset(AppImageAsset.offline,width: 250,height: 250),) :
    statusRequest == StatusRequest.serverfailure ?
    Center(child: Lottie.asset(AppImageAsset.server,width: 250,height: 250),): widget;
  }
}
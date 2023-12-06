import 'package:aadhaar_app/screen/home/modal/home_modal.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier{

  bool isOnline = false;

  List<ServiceModeal> services =[
    ServiceModeal(title: "Download Aadhaar", icon: Icons.download_for_offline),
    ServiceModeal(title: "Update Aadhaar", icon: Icons.update),
    ServiceModeal(title: "verify Email&Mobile", icon: Icons.verified),
    ServiceModeal(title: "PVC Card", icon: Icons.credit_card),
    ServiceModeal(title: "Check Aadhaar Validity", icon: Icons.check),
  ];

  void changeStatus(bool status){
    isOnline = status;
    notifyListeners();
  }
}
import 'package:aadhaar_app/screen/home/modal/home_modal.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier{

  bool isOnline = false;

  List<ServiceModeal> services =[
    ServiceModeal(title: "Download Aadhaar", icon: Icons.download_for_offline,link: "https://myaadhaar.uidai.gov.in/genricDownloadAadhaar"),
    ServiceModeal(title: "Update Aadhaar", icon: Icons.update,link: "https://myaadhaar.uidai.gov.in/du"),
    ServiceModeal(title: "verify Email&Mobile", icon: Icons.verified,link: "https://myaadhaar.uidai.gov.in/verify-email-mobile"),
    ServiceModeal(title: "PVC Card", icon: Icons.credit_card,link: "https://myaadhaar.uidai.gov.in/genricPVC"),
    ServiceModeal(title: "Check Aadhaar Validity", icon: Icons.check,link: "https://myaadhaar.uidai.gov.in/check-aadhaar-validity"),
    ServiceModeal(title: "Myntra", icon: Icons.shopping_bag, link: "https://www.myntra.com/shop/women")
  ];

  void changeStatus(bool status){
    isOnline = status;
    notifyListeners();
  }
}
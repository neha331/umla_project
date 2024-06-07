import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';


Future<bool> checkNetworkAvailability(BuildContext context) async {
  final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());

if (connectivityResult.contains(ConnectivityResult.mobile)) {
    return true;
}else if(connectivityResult.contains(ConnectivityResult.wifi)) {
  return true;  
}else{
   showNetworkDialog(context);
    return false;
  }
}

void showNetworkDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("No Network"),
        content: const Text("Please check your internet connection."),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
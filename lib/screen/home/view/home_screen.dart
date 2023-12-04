import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aadhaar_app/screen/home/provider/home_provider.dart';
import 'package:aadhaar_app/util/network.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NetworkConnection networkConnection = NetworkConnection();
  HomeProvider? providerr;
  HomeProvider? providerw;

  @override
  void initState() {
    super.initState();
    networkConnection.checkConnection(context);
  }

  @override
  Widget build(BuildContext context) {
    providerr = context.read<HomeProvider>();
    providerw = context.watch<HomeProvider>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "My Aadhaar",
          ),
        ),
        body: providerw!.isOnline
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Grid Item $index',
                        style: const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage("assets/image/wifi.png"),width: 100,height: 100,),
                    Text("no Network connection",style: (TextStyle(fontSize: 20)),)
                  ],
                ),
        ),
      ),
    );
  }
}

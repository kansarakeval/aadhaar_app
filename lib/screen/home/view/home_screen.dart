import 'package:aadhaar_app/screen/home/modal/home_modal.dart';
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
                itemCount: providerw!.services.length,
                itemBuilder: (BuildContext context, int index) {
                  ServiceModeal service = providerr!.services[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'link',arguments: service);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              service.icon,
                              size: 50,
                            ),
                            Text(
                              '${service.title}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("assets/image/wifi.png"),
                      width: 100,
                      height: 100,
                    ),
                    Text(
                      "no Network connection",
                      style: (TextStyle(fontSize: 20)),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

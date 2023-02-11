import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heka/images.dart';

void main() {
  runApp(const MyApp());
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildImage(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;
  final String imageName;

  HeadingItem(this.heading, this.imageName);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style:  TextStyle(
          fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.width * 0.035, color: Colors.black),
    );
  }

  @override
  Widget buildImage(BuildContext context) {
    return SvgPicture.asset(
      height: 65,
      fit: BoxFit.scaleDown,
      imageName,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<ListItem> items = [
    HeadingItem("SAFETY TRAINING", Images.svgSafety),
    HeadingItem("ELDERLY CARE", Images.svgElderly),
    HeadingItem("PREGNANCY CARE", Images.svgPregnancy),
    HeadingItem("OPERATIVE CARE", Images.svgOperative),
    HeadingItem("DOCTOR CONSULTATION", Images.svgDoctor),
    HeadingItem("LAB TEST", Images.svgLab),
    HeadingItem("PHARMACY", Images.svgPharmacy),
    HeadingItem("MEDICAL ASTROLOGY", Images.svgMedical),
    HeadingItem("OVERSEAS SERVICE", Images.svgOverseas),
    HeadingItem("GENERAL WELLNESS", Images.svgGeneral),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          minimum: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Images.svgLogoWithName,
                    width: 107.0,
                    height: 103.0,
                  ),
                  Stack(
                    children: [
                      SvgPicture.asset(
                        Images.svgHome,
                      ),
                      Positioned(
                        top: 10,
                        right: 0,
                        child: SvgPicture.asset(
                          Images.svgHam,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFFFFFFF),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                  prefixIcon: SvgPicture.asset(
                    height: 7,
                    width: 7,
                    fit: BoxFit.scaleDown,
                    Images.svgSearch,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ), 
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 2),
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = items[index];
                      return Column(
                        children: [
                          Container(
                              width: 180,
                              height: 89,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2.0,
                                    color: const Color.fromARGB(
                                        255, 157, 213, 163),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5))),
                              child: item.buildImage(context)),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: item.buildTitle(context),
                          )
                        ],
                      );
                    }),
              ), //
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom:10.0),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1.5, color: Colors.black),
            ),
          ),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {},
                icon: const Icon(
                  Icons.info_outline,
                  color: Colors.black,
                  size: 25,
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {},
                icon: const Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                  size: 25,
                ),
              ),
              
              IconButton(
                enableFeedback: false,
                onPressed: () {},
                icon: SvgPicture.asset(
                    height: 15,
                    width: 15,
                    fit: BoxFit.scaleDown,
                    Images.svgBack,
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:originalitygram/bloc/OriginalityBloc.dart';
import 'package:originalitygram/db/productsdb.dart';
import 'package:originalitygram/models/product.dart';
import 'package:originalitygram/router/constants.dart';
import 'package:originalitygram/screens/SearchProduct.dart';
import 'package:originalitygram/screens/UserManagement.dart';

class Home extends StatefulWidget {
  List<Product> products = [];
  Home({
    Key? key,
  }) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ProductsDatabase dbinstance = ProductsDatabase.instance;

  @override
  void initState() {
    super.initState();
    insertandPrintProducts();
  }

  @override
  void dispose() {
    closeDatabase();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Originalitygram"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        margin: const EdgeInsets.all(25.0),
                        width: 100,
                        height: 150,
                        // color: Colors.black54,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            // primary: Colors.black87,
                            textStyle: TextStyle(fontSize: 17),
                          ),
                          onPressed: () {
                            BlocProvider.of<OriginalityBloc>(context)
                                .state
                                .products = widget.products;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BlocProvider.value(
                                          value:
                                              BlocProvider.of<OriginalityBloc>(
                                                  context),
                                          child: SearchProduct(),
                                        )));
                          },
                          child: Text(
                            'Automated \nProduct \nSuggestions',
                            textAlign: TextAlign.center,
                          ),
                        ))),
                Expanded(
                    flex: 1,
                    child: Container(
                        margin: const EdgeInsets.all(25.0),
                        width: 100,
                        height: 150,
                        // color: Colors.black54,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            // primary: Colors.black87,
                            textStyle: TextStyle(fontSize: 17),
                          ),
                          onPressed: () {
                            BlocProvider.of<OriginalityBloc>(context)
                                .state
                                .products = widget.products;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BlocProvider.value(
                                          value:
                                              BlocProvider.of<OriginalityBloc>(
                                                  context),
                                          child: UserManagement(),
                                        )));
                          },
                          child: Text(
                            'User \nManagement',
                            textAlign: TextAlign.center,
                          ),
                        ))),
              ])
            ]));
  }

  Future insertandPrintProducts() async {
    Product p1 = new Product(
        Name:
            "Apple iPhone 13 Pro Max 128GB (Official Warranty Mercantile) (Both Sim PTA Approved)",
        Condition: "New",
        Weight: 200,
        Brand: "Apple",
        Color: "Black",
        Rating: "5",
        P_Category: "Mobiles",
        Img_Url:
            "https://static-01.daraz.pk/p/644661521f323edbde8b5fd7e1e30226.jpg",
        ProductLink:
            "https://www.daraz.pk/products/apple-iphone-13-pro-max-128gb-official-warranty-mercantile-both-sim-pta-approved-non-active-i250753231-s1468359899.html?spm=a2a0e.searchlistcategory.list.1.7726286cQQLqyi&search=1");

    Product p2 = new Product(
        Name: "Redmi 10 4GB RAM+128GB ROM - Helios Processor",
        Condition: "New",
        Weight: 200,
        Brand: "Redmi",
        Color: "Carbon Grey",
        Rating: "4.8",
        P_Category: "Mobiles",
        Img_Url:
            "https://static-01.daraz.pk/p/6ce0c25fe0c52cfe53893514532f4099.jpg",
        ProductLink:
            "https://www.daraz.pk/products/redmi-10-4gb-ram128gb-rom-helios-processor-i249489318-s1467433383.html?spm=a2a0e.searchlist.list.1.3a703930vXuHmt&search=1");

    Product p3 = new Product(
        Name:
            "Nokia 3.4 - 6.39 Full HD+ Display - 4GB RAM 64GB ROM - 4000 mah Battery",
        Condition: "New",
        Weight: 200,
        Brand: "Nokia",
        Color: "Gray",
        Rating: "4.7",
        P_Category: "Mobiles",
        Img_Url:
            "https://static-01.daraz.pk/p/1d754f68b53ebd78993ca3b21e771800.jpg",
        ProductLink:
            "https://www.daraz.pk/products/nokia-34-639-full-hd-display-4gb-ram-64gb-rom-4000-mah-battery-i221008835-s1435054525.html?spm=a2a0e.searchlist.list.1.529a541detXd2u&search=1");

    Product p4 = new Product(
        Name:
            "Nokia G20 Smartphone with Boosted 6.5 Screen, 48MP Quad Camera, Dual SIM, 4GB RAM,128GB ROM, OZO Audio, AI-Assisted 3-Day Battery - PTA Approved",
        Condition: "New",
        Weight: 200,
        Brand: "Nokia",
        Color: "Blue",
        Rating: "4.6",
        P_Category: "Mobiles",
        Img_Url:
            "https://static-01.daraz.pk/p/d426577f47c71c22fd2fbeed19a950e5.jpg",
        ProductLink:
            "https://www.daraz.pk/products/nokia-g20-smartphone-with-boosted-65-screen-48mp-quad-camera-dual-sim-4gb-ram128gb-rom-ozo-audio-ai-assisted-3-day-battery-pta-approved-i238041825-s1457293006.html?spm=a2a0e.searchlist.list.93.77511c64GKlRJh&search=1");

    Product p5 = new Product(
        Name:
            "Nokia 1.4 Smartphone with 6.51 HD+ screen, Camera Go, 2-day battery life, Qualcomm chipset, fingerprint sensor, Android 10 / Android 11 ready, Dual SIM, 3 GB RAM / 64 GB ROM - PTA Approved",
        Condition: "New",
        Weight: 200,
        Brand: "Nokia",
        Color: "Fjord",
        Rating: "4.4",
        P_Category: "Mobiles",
        Img_Url:
            "https://static-01.daraz.pk/p/d0bd4d6f3171140f5deb8bed4a7cffc8.jpg",
        ProductLink:
            "https://www.daraz.pk/products/nokia-14-smartphone-with-651-hd-screen-camera-go-2-day-battery-life-qualcomm-chipset-fingerprint-sensor-android-10-android-11-ready-dual-sim-3-gb-ram-64-gb-rom-pta-approved-i238042855-s1457284692.html?spm=a2a0e.searchlist.list.1.4b9bdd1aF4kn84&search=1");

    Product p6 = new Product(
        Name: "Realme 7 Pro - 6.4 Super AMOLED Display - 8GB RAM",
        Condition: "New",
        Weight: 200,
        Brand: "Redmi",
        Color: "Blue",
        Rating: "4.7",
        P_Category: "Mobiles",
        Img_Url:
            "https://static-01.daraz.pk/p/f2b8c99404f348b6f849197c827727d8.jpg",
        ProductLink:
            "https://www.daraz.pk/products/realme-7-pro-64-super-amoled-display-8gb-ram-i184688864-s1463276046.html?spm=a2a0e.searchlist.list.1.6c81a2f6E8YpNL&search=1");

    Product p7 = new Product(
        Name: "Tecno Spark 7T - 4GB - 64GB RAM - Helios G35 Processor",
        Condition: "New",
        Weight: 200,
        Brand: "Tecno Spark",
        Color: "Magnet Black",
        Rating: "4.9",
        P_Category: "Mobiles",
        Img_Url:
            "https://static-01.daraz.pk/p/bd0afadfcd4b04e8b6607806caf95b76.jpg",
        ProductLink:
            "https://www.daraz.pk/products/tecno-spark-7t-4gb-64gb-ram-helios-g35-processor-i249251240-s1467115404.html?spm=a2a0e.searchlist.list.1.4f3c285fF0bVdF&search=1");

    Product p8 = new Product(
        Name: "Tecno Camon 17 - 6GB RAM - 128GB ROM - Helio G85 Processor",
        Condition: "New",
        Weight: 200,
        Brand: "Tecno Camon",
        Color: "Tranquil Green",
        Rating: "4.8",
        P_Category: "Mobiles",
        Img_Url:
            "https://static-01.daraz.pk/p/c83ef27bac2ef16da10082de4734c761.jpg",
        ProductLink:
            "https://www.daraz.pk/products/camon-17-6gb-ram-128gb-rom-helio-g85-processor-i249233762-s1467109255.html?spm=a2a0e.searchlist.list.1.e8342d515SZ91P&search=1");

    Product p9 = new Product(
        Name:
            "Nokia G10 Smartphone Nordic design, Dual SIM, 4GB RAM / 64GB ROM",
        Condition: "New",
        Weight: 200,
        Brand: "Nokia",
        Color: "Night",
        Rating: "4.9",
        P_Category: "Mobiles",
        Img_Url:
            "https://static-01.daraz.pk/p/6ff462e157b74eb5de2b3c7ac969e14d.jpg",
        ProductLink:
            "https://www.daraz.pk/products/nokia-g10-smartphone-nordic-design-dual-sim-4gb-ram-64gb-rom-up-to-3-days-of-battery-life-boosted-65-screen-triple-camera-and-ai-modes-secure-access-regular-security-updates-android-11-pta-approved-i238040956-s1457291220.html?spm=a2a0e.searchlist.list.1.670872b4aW8DGA&search=1");

    Product p10 = new Product(
        Name: "Buy OPPO F19 And Get Bluetooth Speakers For Free",
        Condition: "New",
        Weight: 200,
        Brand: "OPPO",
        Color: "Prism Black",
        Rating: "4.5",
        P_Category: "Mobiles",
        Img_Url:
            "https://static-01.daraz.pk/p/bbbed1416a0f33e888e8c004ee24940e.jpg",
        ProductLink:
            "https://www.daraz.pk/products/buy-oppo-f19-and-get-bluetooth-speakers-for-free-i219515966-s1432083131.html?spm=a2a0e.searchlist.list.1.95ef74d9l2dtnm&search=1");
    Product p11 = new Product(
        Name:
            "Lenovo Ideapad 330 - Intel Celeron N4000 - 15.6 HD Laptop - 4GB RAM - 1TB HDD - DOS - 1 Year Lenovo Official Warranty",
        Condition: "New",
        Weight: 1500,
        Brand: "Lenovo",
        Color: "Black",
        Rating: "4.5",
        P_Category: "Laptops",
        Img_Url:
            "https://static-01.daraz.pk/p/8817566f430b4be2d12238bee7bca61d.jpg",
        ProductLink:
            "https://www.daraz.pk/products/lenovo-ideapad-330-intel-celeron-n4000-156-hd-laptop-4gb-ram-1tb-hdd-dos-1-year-lenovo-official-warranty-i17455720-s1355494987.html?spm=a2a0e.searchlist.list.1.240f6d7biPwLrB&search=1");

    Product p12 = new Product(
        Name:
            "VOSTRO 15 3500 11TH GEN I3-1115G4 INTEL UHD GRAPHICS 15 FHD (1920 X 1080) ANTI GLARE NON-TOUCH LED 4GB (1X4GB) 1TB (5,400 RPM) HDD BLACK PALMREST WITHOUT FPR BLACK",
        Condition: "New",
        Weight: 1500,
        Brand: "Dell",
        Color: "Gray",
        Rating: "5",
        P_Category: "Laptops",
        Img_Url:
            "https://static-01.daraz.pk/p/c64fc9a729da62c0934a5de65bfa3efb.jpg",
        ProductLink:
            "https://www.daraz.pk/products/vostro-15-3500-11th-gen-i3-1115g4-intel-uhd-graphics-15-fhd-1920-x-1080-anti-glare-non-touch-led-4gb-1x4gb-1tb-5400-rpm-hdd-black-palmrest-without-fpr-black-i249699539-s1467618893.html?spm=a2a0e.searchlist.list.1.6b643073kKY1Oo&search=1");
    Product p13 = new Product(
        Name:
            "Apple Macbook 13.3 Laptop (Intel Core 2 Duo,DDR3 HDD, 4GB RAM,250GB HDD - Dual Operating System Windows® 7 & IOS (Activated) Refurbished",
        Condition: "New",
        Weight: 1500,
        Brand: "Apple",
        Color: "Black",
        Rating: "4.6",
        P_Category: "Laptops",
        Img_Url:
            "https://static-01.daraz.pk/p/4f8b0129e007e8ea50b86233d8a81f7a.jpg",
        ProductLink:
            "https://www.daraz.pk/products/apple-macbook-133-laptop-intel-core-2-duoddr3-hdd-4gb-ram250gb-hdd-dual-operating-system-windows-7-ios-activated-refurbished-i130420329-s1291126682.html?spm=a2a0e.searchlist.list.1.2d691e87uo3FvZ&search=1");

    Product p14 = new Product(
        Name:
            "Asus VivoBook 15-i3-1115G4 4GB DDR4 on board 512GB M.2 NVMe™ PCIe® 3.0 SSD NO OPTICAL WIFI/BT WINDOW 10 HOME Intel® UHD Graphics 15.6 FHD (1920 x 1080),LED Backlit, 300 nitsFinger Print ReaderIndie Black",
        Condition: "New",
        Weight: 1500,
        Brand: "ASUS",
        Color: "Black",
        Rating: "5",
        P_Category: "Laptops",
        Img_Url:
            "https://static-01.daraz.pk/p/d615e8c5e83b36cf6d4c40d51a77c4f2.jpg",
        ProductLink:
            "https://www.daraz.pk/products/asus-vivobook-15-i3-1115g4-4gb-ddr4-on-board-512gb-m2-nvme-pcie-30-ssd-no-optical-wifibt-window-10-home-intel-uhd-graphics-156-fhd-1920-x-1080led-backlit-300-nitsfinger-print-readerindie-black-i249716432-s1467632723.html?spm=a2a0e.searchlist.list.1.18675690cYNXtS&search=1");

    Product p15 = new Product(
        Name:
            "HP ProBook 640 G1 - Core i5 4th Generation - 4GB RAM - 500GB HDD - 14inch Screen - Free Laptop Bag",
        Condition: "New",
        Weight: 1500,
        Brand: "HP",
        Color: "Black",
        Rating: "4.3",
        P_Category: "Laptops",
        Img_Url:
            "https://static-01.daraz.pk/p/b40d7222ec367fb97b96dc0d7b50aee4.jpg",
        ProductLink:
            "https://www.daraz.pk/products/hp-probook-640-g1-core-i5-4th-generation-4gb-ram-500gb-hdd-14inch-screen-free-laptop-bag-i235470591-s1454630550.html?spm=a2a0e.searchlist.list.1.18a16ab2yULw1r&search=1");

    Product p16 = new Product(
        Name:
            "Asus VivoBook 15-i5-1135G78GB (4GB DDR4 on board + 4GB DDR4 SO-DIMM) 512GB M.2 NVMe™ PCIe® 3.0 SSD WIFI/BT WINDOW 10 HOMENVIDIA® GeForce® MX330 2GB GDDR515.6 FHD (1920 x 1080),Finger Print Reader Indie Black",
        Condition: "New",
        Weight: 1500,
        Brand: "ASUS",
        Color: "Black",
        Rating: "5",
        P_Category: "Laptops",
        Img_Url:
            "https://static-01.daraz.pk/p/7aa4f34762fe2e8b547d8a0e229f0285.jpg",
        ProductLink:
            "https://www.daraz.pk/products/asus-vivobook-15-i5-1135g78gb-4gb-ddr4-on-board-4gb-ddr4-so-dimm-512gb-m2-nvme-pcie-30-ssd-wifibt-window-10-homenvidia-geforce-mx330-2gb-gddr5156-fhd-1920-x-1080finger-print-reader-indie-black-i249708572-s1467636569.html?spm=a2a0e.searchlist.list.1.64f67976jaJGFK&search=1");
    Product p17 = new Product(
        Name:
            "Asus X415-i3-1115G4 4GB DDR4 on board 128GB M.2 NVMe™ PCIe® 3.0 SSD + 1TB SATA 5400RPM 2.5 HDD WIFI/BT WINDOW 10 HOME Intel® UHD Graphics 14.0 FHD (1920 x 1080)Transparent Silver",
        Condition: "New",
        Weight: 1500,
        Brand: "ASUS",
        Color: "Black",
        Rating: "5",
        P_Category: "Laptops",
        Img_Url:
            "https://static-01.daraz.pk/p/b315629aa92db39339af518c9fc19493.jpg",
        ProductLink:
            "https://www.daraz.pk/products/asus-x415-i3-1115g4-4gb-ddr4-on-board-128gb-m2-nvme-pcie-30-ssd-1tb-sata-5400rpm-25-hdd-wifibt-window-10-home-intel-uhd-graphics-140-fhd-1920-x-1080transparent-silver-i249710520-s1467624828.html?spm=a2a0e.searchlist.list.1.1128664fqgcFvM&search=1");

    Product p18 = new Product(
        Name:
            "HP 15S-DU3542TU CI7-1165G7 8GB 512GB SSD 15.6 FHD WIN10 HOME NSV",
        Condition: "New",
        Weight: 1500,
        Brand: "HP",
        Color: "Black",
        Rating: "4",
        P_Category: "Laptops",
        Img_Url:
            "https://static-01.daraz.pk/p/5855b16817c07b93a3f6777454728919.jpg",
        ProductLink:
            "https://www.daraz.pk/products/hp-15s-du3542tu-ci7-1165g7-8gb-512gb-ssd-156fhd-win10-home-nsv-i188326481-s1447868501.html?spm=a2a0e.searchlist.list.1.7b3b420c4bD7RX&search=1");

    Product p19 = new Product(
        Name:
            "Hp Elitebook 820 G3 - Core i5 6th Generation - 8GB DDR4 RAM - 256GB SSD - 12.5inch Screen - FREE LAPTOP BAG",
        Condition: "New",
        Weight: 1500,
        Brand: "HP",
        Color: "",
        Rating: "3.9",
        P_Category: "Laptops",
        Img_Url:
            "https://static-01.daraz.pk/p/61d1e9847b49411b34526aa0cbad54ed.jpg",
        ProductLink:
            "https://www.daraz.pk/products/hp-elitebook-820-g3-core-i5-6th-generation-8gb-ddr4-ram-256gb-ssd-125inch-screen-free-laptop-bag-i234226789-s1453324292.html?spm=a2a0e.searchlist.list.1.2afb13feHopGDE&search=1");
    Product p20 = new Product(
        Name: "New Stylish Casual Jeans Shoes for Men Blue Color",
        Condition: "New",
        Weight: 450,
        Brand: "None",
        Color: "Red",
        Rating: "4.2",
        P_Category: "Shoes",
        Img_Url:
            "https://static-01.daraz.pk/p/20344e0f71fd33cc614274683e761d93.jpg",
        ProductLink:
            "https://www.daraz.pk/products/new-stylish-casual-jeans-shoes-for-men-blue-color-i137806702-s1297964316.html?spm=a2a0e.searchlist.list.1.67717ddaUSU9ou&search=1");
    Product p21 = new Product(
        Name: "(MK) Grey & Red - Synthetic Material Sneakers for Men HOCK004",
        Condition: "New",
        Weight: 450,
        Brand: "None",
        Color: "Red",
        Rating: "4.7",
        P_Category: "Shoes",
        Img_Url:
            "https://static-01.daraz.pk/p/0c874bdb1b4542a7341b638b977c94b8.jpg",
        ProductLink:
            "https://www.daraz.pk/products/mk-grey-red-synthetic-material-sneakers-for-men-hock004-i186190373-s1375762948.html?spm=a2a0e.searchlist.list.1.639327512DQX9T&search=1");
    Product p22 = new Product(
        Name: "Stylish Men Casual Shoes",
        Condition: "New",
        Weight: 450,
        Brand: "None",
        Color: "Matte Black",
        Rating: "3.9",
        P_Category: "Shoes",
        Img_Url:
            "https://static-01.daraz.pk/p/079e20ca16991ef18980615ad2cfc79e.jpg",
        ProductLink:
            "https://www.daraz.pk/products/peas-pedal-casual-canvas-shoes-for-men-i118776240-s1272108912.html?spm=a2a0e.searchlist.list.1.6f8c3c65XOEaPp&search=1");
    Product p23 = new Product(
        Name: "Casual Rubber Shoes For Men Joggers Jolly",
        Condition: "New",
        Weight: 450,
        Brand: "None",
        Color: "Black",
        Rating: "4.5",
        P_Category: "Shoes",
        Img_Url:
            "https://static-01.daraz.pk/p/ddb2c8f9d6e7b30ae2894a71bf1357ea.jpg",
        ProductLink:
            "https://www.daraz.pk/products/casual-rubber-shoes-for-men-joggers-jolly-i215441391-s1460154700.html?spm=a2a0e.searchlist.list.1.270927a2NcD8vl&search=1");
    Product p24 = new Product(
        Name: "Flow Black Fire",
        Condition: "New",
        Weight: 450,
        Brand: "None",
        Color: "Black",
        Rating: "4.3",
        P_Category: "Shoes",
        Img_Url:
            "https://static-01.daraz.pk/p/07754e1ae78b39fd01efa88029ff26ff.jpg",
        ProductLink:
            "https://www.daraz.pk/products/flow-black-fire-i241573577-s1461850504.html?spm=a2a0e.searchlist.list.1.485d39912r2Zye&search=1");
    Product p25 = new Product(
        Name: "Casual sneakers For Men",
        Condition: "New",
        Weight: 450,
        Brand: "None",
        Color: "Grey",
        Rating: "3.9",
        P_Category: "Shoes",
        Img_Url:
            "https://static-01.daraz.pk/p/ebf905d44239e6f449ea6de267ec993c.jpg",
        ProductLink:
            "https://www.daraz.pk/products/casual-sneakers-for-men-i205950100-s1410352819.html?spm=a2a0e.searchlist.list.67.77ee3c2e5zqLe1&search=1");
    Product p26 = new Product(
        Name:
            "High Export Quality Shoes For Men and Shoes for Boys Stylish Sports Shoes for Men Joggers Sneakers",
        Condition: "New",
        Weight: 450,
        Brand: "None",
        Color: "White",
        Rating: "4.5",
        P_Category: "Shoes",
        Img_Url:
            "https://static-01.daraz.pk/p/41f4648080735c4af060bf7ace8cecbc.jpg",
        ProductLink:
            "https://www.daraz.pk/products/high-export-quality-shoes-for-men-and-shoes-for-boys-stylish-sports-shoes-for-men-joggers-sneakers-i240440855-s1459628386.html?spm=a2a0e.searchlist.list.1.5aaf64del6Rx1d&search=1");
    Product p27 = new Product(
        Name: "Sneakers for men",
        Condition: "New",
        Weight: 450,
        Brand: "None",
        Color: "Grey",
        Rating: "4.1",
        P_Category: "Shoes",
        Img_Url:
            "https://static-01.daraz.pk/p/d0133665b79d3e0ee78ed7a4525bac02.jpg",
        ProductLink:
            "https://www.daraz.pk/products/sneakers-for-men-i174768099-s1347376561.html?spm=a2a0e.searchlist.list.89.2d8a7e273kPErM&search=1");

    await dbinstance.deleteAllProducts();
    //create database if not already exists
    var pList = await dbinstance.readAllProducts();
    print(pList);

    await dbinstance.createAndInsert(p1);
    await dbinstance.createAndInsert(p2);
    await dbinstance.createAndInsert(p3);
    await dbinstance.createAndInsert(p4);
    await dbinstance.createAndInsert(p5);
    await dbinstance.createAndInsert(p6);
    await dbinstance.createAndInsert(p7);
    await dbinstance.createAndInsert(p8);
    await dbinstance.createAndInsert(p9);
    await dbinstance.createAndInsert(p10);
    await dbinstance.createAndInsert(p11);
    await dbinstance.createAndInsert(p12);
    await dbinstance.createAndInsert(p13);
    await dbinstance.createAndInsert(p14);
    await dbinstance.createAndInsert(p15);
    await dbinstance.createAndInsert(p16);
    await dbinstance.createAndInsert(p17);
    await dbinstance.createAndInsert(p18);
    await dbinstance.createAndInsert(p19);
    await dbinstance.createAndInsert(p20);
    await dbinstance.createAndInsert(p21);
    await dbinstance.createAndInsert(p22);
    await dbinstance.createAndInsert(p23);
    await dbinstance.createAndInsert(p24);
    await dbinstance.createAndInsert(p25);
    await dbinstance.createAndInsert(p26);
    await dbinstance.createAndInsert(p27);

    widget.products = await dbinstance.readAllProducts();
    print('Products are now: ' + widget.products.toString());
  }

  readProducts() async {
    var allProducts = await dbinstance.readAllProducts();
    return allProducts;
  }

  closeDatabase() async {
    print("here");
    await dbinstance.deleteAllProducts();
    // await dbinstance.dropDatabase();
    dbinstance.close();
  }
}

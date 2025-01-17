import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workshop_arrk/features/home/ui/mobile/filter_widget.dart'; // Import FilterWidget
import 'package:workshop_arrk/features/home/ui/mobile/house_ad_widget.dart'; // Import HouseAdWidget
import 'package:workshop_arrk/models/house_model.dart'; // Import House model
import 'package:workshop_arrk/utils/common/constant.dart';

import '../../../../utils/widgets/custom_button.dart'; // Import Constants

class HomeDesktopPage extends StatefulWidget {
  const HomeDesktopPage({super.key});

  @override
  State<HomeDesktopPage> createState() => _HomeDesktopPageState();
}

class _HomeDesktopPageState extends State<HomeDesktopPage> {
  final filterList = ['<\$100.000', '1 bedroom', '2 bedrooms', '2 bathrooms'];
  String activeFilter = '';
  bool showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomButtonWidget(
                      icon: Icons.menu,
                      onBtnTap: () {
                        print("Pressed MENU");
                      },
                      iconColor: Colors.black,
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    const Center(
                      child: Text(
                        'Imobiliare',
                        style: TextStyle(
                          fontSize: 36,
                          color: ColorConstant.kBlackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomButtonWidget(
                      icon: Icons.refresh,
                      onBtnTap: () {
                        print("Pressed Refresh");
                        setState(() {
                          showOnlyFavorites = false;
                        });
                      },
                      iconColor: Colors.black,
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    CustomButtonWidget(
                      icon: Icons.favorite,
                      onBtnTap: () {
                        print("Pressed Filter Favorites");
                        setState(() {
                          showOnlyFavorites = !showOnlyFavorites;
                        });
                      },
                      iconColor: showOnlyFavorites ? Colors.red : Colors.black,
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10), // Add spacing here
          Center(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'City',
                style: TextStyle(
                  fontSize: 12,
                  color: ColorConstant.kGreyColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Cluj-Napoca',
                style: TextStyle(
                  fontSize: 36,
                  color: ColorConstant.kBlackColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const Divider(color: ColorConstant.kGreyColor, thickness: 0.2),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filterList.length,
              itemBuilder: (context, index) {
                return FilterWidget(
                  filterTxt: filterList[index],
                  isActive: activeFilter == filterList[index] ? true : false,
                  onBtnTap: () {
                    setState(() {
                      activeFilter = activeFilter == filterList[index] ? '' : filterList[index];
                    });
                  },
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: Constants.houseList.length,
              itemBuilder: (context, index) {
                House house = Constants.houseList[index];
                return isFiltered(house)
                    ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                  child: HouseAdWidget(
                    house: house,
                    imgPathIndex: index,
                  ),
                )
                    : const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }

  bool isFiltered(House house) {
    if (showOnlyFavorites && !house.isFavorite) return false;
    if (activeFilter.isEmpty) return true;
    if (activeFilter.contains('bedroom')) {
      if (activeFilter[0] == '1' && house.bedrooms == 1) {
        return true;
      } else if (activeFilter[0] == '2' && house.bedrooms == 2) {
        return true;
      }
    }
    if (activeFilter.contains('bath')) {
      if (activeFilter[0] == '1' && house.bathrooms == 1) {
        return true;
      } else if (activeFilter[0] == '2' && house.bathrooms == 2) {
        return true;
      }
    }
    if (activeFilter.contains('\$')) {
      if (house.price < 100000) {
        return true;
      }
    }
    return false;
  }
}

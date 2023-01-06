import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wiser/core/constant.dart';
import 'package:wiser/features/record/view/view_new_record.dart';

final isFoodAndDrinksExpandedStateProvider =
    StateProvider.autoDispose<bool>((ref) => false);

final isShoppingExpandedStateProvider =
    StateProvider.autoDispose<bool>((ref) => false);

final isHousingExpandedStateProvider =
    StateProvider.autoDispose<bool>((ref) => false);

final isTransportationExpandedStateProvider =
    StateProvider.autoDispose<bool>((ref) => false);

final isVehicleExpandedStateProvider =
    StateProvider.autoDispose<bool>((ref) => false);

final isLifeEntertainmentExpandedStateProvider =
    StateProvider.autoDispose<bool>((ref) => false);

final isComunicationPCExpandedStateProvider =
    StateProvider.autoDispose<bool>((ref) => false);

final isFinancialExpensesExpandedStateProvider =
    StateProvider.autoDispose<bool>((ref) => false);

final isInvesmentsExpandedStateProvider =
    StateProvider.autoDispose<bool>((ref) => false);

final isIncomeExpandedStateProvider =
    StateProvider.autoDispose<bool>((ref) => false);

final isOtherExpandedStateProvider =
    StateProvider.autoDispose<bool>((ref) => false);

class CategoryList extends ConsumerStatefulWidget {
  const CategoryList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryListState();
}

class _CategoryListState extends ConsumerState<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Iconsax.close_circle),
                  ),
                ),
                const Text(
                  'Category List',
                  textScaleFactor: 1.5,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                categoryCard(
                  ref: ref,
                  title: 'Food & Drinks',
                  iconData: FontAwesomeIcons.utensils,
                  iconBackgroundColor: Constant.foodAndDrinksCategoryColor,
                  stateProvider: isFoodAndDrinksExpandedStateProvider,
                  onTap: () => selectedCategory(
                    ref: ref,
                    context: context,
                    categoryTitle: 'Food & Drinks',
                    categoryIconData: FontAwesomeIcons.utensils,
                    categoryIconBackgroundColor:
                        Constant.foodAndDrinksCategoryColor,
                  ),
                  subCategoryList: [
                    subCategoryCard(
                      title: 'Bar, Cafe',
                      iconData: FontAwesomeIcons.wineGlass,
                      iconBackgroundColor: Constant.foodAndDrinksCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Bar, Cafe',
                        categoryIconData: FontAwesomeIcons.wineGlass,
                        categoryIconBackgroundColor:
                            Constant.foodAndDrinksCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Groceries',
                      iconData: FontAwesomeIcons.cartShopping,
                      iconBackgroundColor: Constant.foodAndDrinksCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Groceries',
                        categoryIconData: FontAwesomeIcons.cartShopping,
                        categoryIconBackgroundColor:
                            Constant.foodAndDrinksCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Restaurant, Fast-Food',
                      iconData: FontAwesomeIcons.burger,
                      iconBackgroundColor: Constant.foodAndDrinksCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Restaurant, Fast-Food',
                        categoryIconData: FontAwesomeIcons.burger,
                        categoryIconBackgroundColor:
                            Constant.foodAndDrinksCategoryColor,
                      ),
                    ),
                  ],
                ),
                categoryCard(
                  ref: ref,
                  title: 'Shopping',
                  iconData: FontAwesomeIcons.bagShopping,
                  iconBackgroundColor: Constant.shoppingCategoryColor,
                  stateProvider: isShoppingExpandedStateProvider,
                  onTap: () => selectedCategory(
                    ref: ref,
                    context: context,
                    categoryTitle: 'Shopping',
                    categoryIconData: FontAwesomeIcons.bagShopping,
                    categoryIconBackgroundColor: Constant.shoppingCategoryColor,
                  ),
                  subCategoryList: [
                    subCategoryCard(
                      title: 'Clothes & Shoes',
                      iconData: FontAwesomeIcons.shirt,
                      iconBackgroundColor: Constant.shoppingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Clothes & Shoes',
                        categoryIconData: FontAwesomeIcons.shirt,
                        categoryIconBackgroundColor:
                            Constant.shoppingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Drug-store, Chemist',
                      iconData: FontAwesomeIcons.capsules,
                      iconBackgroundColor: Constant.shoppingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Drug-store, Chemist',
                        categoryIconData: FontAwesomeIcons.capsules,
                        categoryIconBackgroundColor:
                            Constant.shoppingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Electronics, Accessories',
                      iconData: FontAwesomeIcons.computer,
                      iconBackgroundColor: Constant.shoppingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Electronics, Accessories',
                        categoryIconData: FontAwesomeIcons.computer,
                        categoryIconBackgroundColor:
                            Constant.shoppingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Free time',
                      iconData: FontAwesomeIcons.solidFaceSmile,
                      iconBackgroundColor: Constant.shoppingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Free time',
                        categoryIconData: FontAwesomeIcons.solidFaceSmile,
                        categoryIconBackgroundColor:
                            Constant.shoppingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Gifts, Joy',
                      iconData: FontAwesomeIcons.gift,
                      iconBackgroundColor: Constant.shoppingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Gifts, Joy',
                        categoryIconData: FontAwesomeIcons.gift,
                        categoryIconBackgroundColor:
                            Constant.shoppingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Health & beauty',
                      iconData: FontAwesomeIcons.kitMedical,
                      iconBackgroundColor: Constant.shoppingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Health & beauty',
                        categoryIconData: FontAwesomeIcons.kitMedical,
                        categoryIconBackgroundColor:
                            Constant.shoppingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Home, Garden',
                      iconData: FontAwesomeIcons.house,
                      iconBackgroundColor: Constant.shoppingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Home, Garden',
                        categoryIconData: FontAwesomeIcons.house,
                        categoryIconBackgroundColor:
                            Constant.shoppingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Jewels, Accessories',
                      iconData: FontAwesomeIcons.solidGem,
                      iconBackgroundColor: Constant.shoppingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Jewels, Accessories',
                        categoryIconData: FontAwesomeIcons.solidGem,
                        categoryIconBackgroundColor:
                            Constant.shoppingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Kids',
                      iconData: FontAwesomeIcons.babyCarriage,
                      iconBackgroundColor: Constant.shoppingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Kids',
                        categoryIconData: FontAwesomeIcons.babyCarriage,
                        categoryIconBackgroundColor:
                            Constant.shoppingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Pets, animals',
                      iconData: FontAwesomeIcons.paw,
                      iconBackgroundColor: Constant.shoppingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Pets, animals',
                        categoryIconData: FontAwesomeIcons.paw,
                        categoryIconBackgroundColor:
                            Constant.shoppingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Stationery, Tools',
                      iconData: FontAwesomeIcons.screwdriverWrench,
                      iconBackgroundColor: Constant.shoppingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Stationery, Tools',
                        categoryIconData: FontAwesomeIcons.screwdriverWrench,
                        categoryIconBackgroundColor:
                            Constant.shoppingCategoryColor,
                      ),
                    ),
                  ],
                ),
                categoryCard(
                  ref: ref,
                  title: 'Housing',
                  iconData: FontAwesomeIcons.house,
                  iconBackgroundColor: Constant.housingCategoryColor,
                  stateProvider: isHousingExpandedStateProvider,
                  onTap: () => selectedCategory(
                    ref: ref,
                    context: context,
                    categoryTitle: 'Housing',
                    categoryIconData: FontAwesomeIcons.house,
                    categoryIconBackgroundColor: Constant.housingCategoryColor,
                  ),
                  subCategoryList: [
                    subCategoryCard(
                      title: 'Energy, Utilities',
                      iconData: FontAwesomeIcons.solidLightbulb,
                      iconBackgroundColor: Constant.housingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Energy, Utilities',
                        categoryIconData: FontAwesomeIcons.solidLightbulb,
                        categoryIconBackgroundColor:
                            Constant.housingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Maintenance, Repairs',
                      iconData: FontAwesomeIcons.hammer,
                      iconBackgroundColor: Constant.housingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Maintenance, Repairs',
                        categoryIconData: FontAwesomeIcons.hammer,
                        categoryIconBackgroundColor:
                            Constant.housingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Mortgage',
                      iconData: FontAwesomeIcons.houseCircleCheck,
                      iconBackgroundColor: Constant.housingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Mortgage',
                        categoryIconData: FontAwesomeIcons.houseCircleCheck,
                        categoryIconBackgroundColor:
                            Constant.housingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Property Insurance',
                      iconData: FontAwesomeIcons.buildingShield,
                      iconBackgroundColor: Constant.housingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Property Insurance',
                        categoryIconData: FontAwesomeIcons.buildingShield,
                        categoryIconBackgroundColor:
                            Constant.housingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Rent',
                      iconData: FontAwesomeIcons.key,
                      iconBackgroundColor: Constant.housingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Rent',
                        categoryIconData: FontAwesomeIcons.key,
                        categoryIconBackgroundColor:
                            Constant.housingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Services',
                      iconData: FontAwesomeIcons.houseUser,
                      iconBackgroundColor: Constant.housingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Services',
                        categoryIconData: FontAwesomeIcons.houseUser,
                        categoryIconBackgroundColor:
                            Constant.housingCategoryColor,
                      ),
                    ),
                  ],
                ),
                categoryCard(
                  ref: ref,
                  title: 'Transportation',
                  iconData: FontAwesomeIcons.road,
                  iconBackgroundColor: Constant.transportationCategoryColor,
                  stateProvider: isTransportationExpandedStateProvider,
                  onTap: () => selectedCategory(
                    ref: ref,
                    context: context,
                    categoryTitle: 'Transportation',
                    categoryIconData: FontAwesomeIcons.road,
                    categoryIconBackgroundColor:
                        Constant.transportationCategoryColor,
                  ),
                  subCategoryList: [
                    subCategoryCard(
                      title: 'Business Trips',
                      iconData: FontAwesomeIcons.suitcase,
                      iconBackgroundColor: Constant.transportationCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Business Trips',
                        categoryIconData: FontAwesomeIcons.suitcase,
                        categoryIconBackgroundColor:
                            Constant.transportationCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Long Distance',
                      iconData: FontAwesomeIcons.planeDeparture,
                      iconBackgroundColor: Constant.transportationCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Long Distance',
                        categoryIconData: FontAwesomeIcons.planeDeparture,
                        categoryIconBackgroundColor:
                            Constant.transportationCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Public Transport',
                      iconData: FontAwesomeIcons.bus,
                      iconBackgroundColor: Constant.transportationCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Public Transport',
                        categoryIconData: FontAwesomeIcons.bus,
                        categoryIconBackgroundColor:
                            Constant.transportationCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Taxi',
                      iconData: FontAwesomeIcons.taxi,
                      iconBackgroundColor: Constant.transportationCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Taxi',
                        categoryIconData: FontAwesomeIcons.taxi,
                        categoryIconBackgroundColor:
                            Constant.transportationCategoryColor,
                      ),
                    ),
                  ],
                ),
                categoryCard(
                  ref: ref,
                  title: 'Vehicle',
                  iconData: FontAwesomeIcons.car,
                  iconBackgroundColor: Constant.vehicleCategoryColor,
                  stateProvider: isVehicleExpandedStateProvider,
                  onTap: () => selectedCategory(
                    ref: ref,
                    context: context,
                    categoryTitle: 'Vehicle',
                    categoryIconData: FontAwesomeIcons.car,
                    categoryIconBackgroundColor: Constant.vehicleCategoryColor,
                  ),
                  subCategoryList: [
                    subCategoryCard(
                      title: 'Fuel',
                      iconData: FontAwesomeIcons.gasPump,
                      iconBackgroundColor: Constant.vehicleCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Fuel',
                        categoryIconData: FontAwesomeIcons.gasPump,
                        categoryIconBackgroundColor:
                            Constant.vehicleCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Leasing',
                      iconData: FontAwesomeIcons.coins,
                      iconBackgroundColor: Constant.vehicleCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Leasing',
                        categoryIconData: FontAwesomeIcons.coins,
                        categoryIconBackgroundColor:
                            Constant.vehicleCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Parking',
                      iconData: FontAwesomeIcons.squareParking,
                      iconBackgroundColor: Constant.vehicleCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Parking',
                        categoryIconData: FontAwesomeIcons.squareParking,
                        categoryIconBackgroundColor:
                            Constant.vehicleCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Rentals',
                      iconData: FontAwesomeIcons.key,
                      iconBackgroundColor: Constant.vehicleCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Rentals',
                        categoryIconData: FontAwesomeIcons.key,
                        categoryIconBackgroundColor:
                            Constant.vehicleCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Vehicle Insurance',
                      iconData: FontAwesomeIcons.carBurst,
                      iconBackgroundColor: Constant.vehicleCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Vehicle Insurance',
                        categoryIconData: FontAwesomeIcons.carBurst,
                        categoryIconBackgroundColor:
                            Constant.vehicleCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Vehicle Maintenance',
                      iconData: FontAwesomeIcons.wrench,
                      iconBackgroundColor: Constant.vehicleCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Vehicle Maintenance',
                        categoryIconData: FontAwesomeIcons.wrench,
                        categoryIconBackgroundColor:
                            Constant.vehicleCategoryColor,
                      ),
                    ),
                  ],
                ),
                categoryCard(
                  ref: ref,
                  title: 'Life & Intertainment',
                  iconData: FontAwesomeIcons.person,
                  iconBackgroundColor:
                      Constant.lifeAndEntertainmentCategoryColor,
                  stateProvider: isLifeEntertainmentExpandedStateProvider,
                  onTap: () => selectedCategory(
                    ref: ref,
                    context: context,
                    categoryTitle: 'Life & Intertainment',
                    categoryIconData: FontAwesomeIcons.person,
                    categoryIconBackgroundColor:
                        Constant.lifeAndEntertainmentCategoryColor,
                  ),
                  subCategoryList: [
                    subCategoryCard(
                      title: 'Active Sport, Fitness',
                      iconData: FontAwesomeIcons.dumbbell,
                      iconBackgroundColor:
                          Constant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Active Sport, Fitness',
                        categoryIconData: FontAwesomeIcons.dumbbell,
                        categoryIconBackgroundColor:
                            Constant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Alcohol, Tobacco',
                      iconData: FontAwesomeIcons.wineBottle,
                      iconBackgroundColor:
                          Constant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Alcohol, Tobacco',
                        categoryIconData: FontAwesomeIcons.wineBottle,
                        categoryIconBackgroundColor:
                            Constant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Books, Audio, Subscriptions',
                      iconData: FontAwesomeIcons.book,
                      iconBackgroundColor:
                          Constant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Books, Audio, Subscriptions',
                        categoryIconData: FontAwesomeIcons.book,
                        categoryIconBackgroundColor:
                            Constant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Charity, Gifts',
                      iconData: FontAwesomeIcons.gift,
                      iconBackgroundColor:
                          Constant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Charity, Gifts',
                        categoryIconData: FontAwesomeIcons.gift,
                        categoryIconBackgroundColor:
                            Constant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Culture, Sport Events',
                      iconData: FontAwesomeIcons.handsClapping,
                      iconBackgroundColor:
                          Constant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Culture, Sport Events',
                        categoryIconData: FontAwesomeIcons.handsClapping,
                        categoryIconBackgroundColor:
                            Constant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Education, Development',
                      iconData: FontAwesomeIcons.userGraduate,
                      iconBackgroundColor:
                          Constant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Education, Development',
                        categoryIconData: FontAwesomeIcons.userGraduate,
                        categoryIconBackgroundColor:
                            Constant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Health Care, Doctor',
                      iconData: FontAwesomeIcons.userDoctor,
                      iconBackgroundColor:
                          Constant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Health Care, Doctor',
                        categoryIconData: FontAwesomeIcons.userDoctor,
                        categoryIconBackgroundColor:
                            Constant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Hobbies',
                      iconData: FontAwesomeIcons.heart,
                      iconBackgroundColor:
                          Constant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Hobbies',
                        categoryIconData: FontAwesomeIcons.heart,
                        categoryIconBackgroundColor:
                            Constant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Holiday, Trips, Hotels',
                      iconData: FontAwesomeIcons.umbrellaBeach,
                      iconBackgroundColor:
                          Constant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Holiday, Trips, Hotels',
                        categoryIconData: FontAwesomeIcons.umbrellaBeach,
                        categoryIconBackgroundColor:
                            Constant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Life Events',
                      iconData: FontAwesomeIcons.cakeCandles,
                      iconBackgroundColor:
                          Constant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Life Events',
                        categoryIconData: FontAwesomeIcons.cakeCandles,
                        categoryIconBackgroundColor:
                            Constant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Lottery, Gambling',
                      iconData: FontAwesomeIcons.dice,
                      iconBackgroundColor:
                          Constant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Lottery, Gambling',
                        categoryIconData: FontAwesomeIcons.dice,
                        categoryIconBackgroundColor:
                            Constant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'TV, Streaming',
                      iconData: FontAwesomeIcons.tv,
                      iconBackgroundColor:
                          Constant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'TV, Streaming',
                        categoryIconData: FontAwesomeIcons.tv,
                        categoryIconBackgroundColor:
                            Constant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Wellness, Beauty',
                      iconData: FontAwesomeIcons.spa,
                      iconBackgroundColor:
                          Constant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Wellness, Beauty',
                        categoryIconData: FontAwesomeIcons.spa,
                        categoryIconBackgroundColor:
                            Constant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                  ],
                ),
                categoryCard(
                  ref: ref,
                  title: 'Communication, PC',
                  iconData: FontAwesomeIcons.computer,
                  iconBackgroundColor: Constant.communicationPCCategoryColor,
                  stateProvider: isComunicationPCExpandedStateProvider,
                  onTap: () => selectedCategory(
                    ref: ref,
                    context: context,
                    categoryTitle: 'Communication, PC',
                    categoryIconData: FontAwesomeIcons.computer,
                    categoryIconBackgroundColor:
                        Constant.communicationPCCategoryColor,
                  ),
                  subCategoryList: [
                    subCategoryCard(
                      title: 'Internet',
                      iconData: FontAwesomeIcons.wifi,
                      iconBackgroundColor:
                          Constant.communicationPCCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Internet',
                        categoryIconData: FontAwesomeIcons.wifi,
                        categoryIconBackgroundColor:
                            Constant.communicationPCCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Phone, Cellphone',
                      iconData: FontAwesomeIcons.phone,
                      iconBackgroundColor:
                          Constant.communicationPCCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Phone, Cellphone',
                        categoryIconData: FontAwesomeIcons.phone,
                        categoryIconBackgroundColor:
                            Constant.communicationPCCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Postal services',
                      iconData: FontAwesomeIcons.envelopesBulk,
                      iconBackgroundColor:
                          Constant.communicationPCCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Postal services',
                        categoryIconData: FontAwesomeIcons.envelopesBulk,
                        categoryIconBackgroundColor:
                            Constant.communicationPCCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Software, Apps, Games',
                      iconData: FontAwesomeIcons.download,
                      iconBackgroundColor:
                          Constant.communicationPCCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Software, Apps, Games',
                        categoryIconData: FontAwesomeIcons.download,
                        categoryIconBackgroundColor:
                            Constant.communicationPCCategoryColor,
                      ),
                    ),
                  ],
                ),
                categoryCard(
                  ref: ref,
                  title: 'Financial Expenses',
                  iconData: FontAwesomeIcons.coins,
                  iconBackgroundColor: Constant.financialExpensesCategoryColor,
                  stateProvider: isFinancialExpensesExpandedStateProvider,
                  onTap: () => selectedCategory(
                    ref: ref,
                    context: context,
                    categoryTitle: 'Financial Expenses',
                    categoryIconData: FontAwesomeIcons.coins,
                    categoryIconBackgroundColor:
                        Constant.financialExpensesCategoryColor,
                  ),
                  subCategoryList: [
                    subCategoryCard(
                      title: 'Advisory',
                      iconData: FontAwesomeIcons.commentDollar,
                      iconBackgroundColor:
                          Constant.financialExpensesCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Advisory',
                        categoryIconData: FontAwesomeIcons.commentDollar,
                        categoryIconBackgroundColor:
                            Constant.financialExpensesCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Charges, Fees',
                      iconData: FontAwesomeIcons.receipt,
                      iconBackgroundColor:
                          Constant.financialExpensesCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Charges, Fees',
                        categoryIconData: FontAwesomeIcons.receipt,
                        categoryIconBackgroundColor:
                            Constant.financialExpensesCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Child Support',
                      iconData: FontAwesomeIcons.handsHoldingChild,
                      iconBackgroundColor:
                          Constant.financialExpensesCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Child Support',
                        categoryIconData: FontAwesomeIcons.handsHoldingChild,
                        categoryIconBackgroundColor:
                            Constant.financialExpensesCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Fines',
                      iconData: FontAwesomeIcons.handPointUp,
                      iconBackgroundColor:
                          Constant.financialExpensesCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Fines',
                        categoryIconData: FontAwesomeIcons.handPointUp,
                        categoryIconBackgroundColor:
                            Constant.financialExpensesCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Insurances',
                      iconData: FontAwesomeIcons.hospitalUser,
                      iconBackgroundColor:
                          Constant.financialExpensesCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Insurances',
                        categoryIconData: FontAwesomeIcons.hospitalUser,
                        categoryIconBackgroundColor:
                            Constant.financialExpensesCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Loan, Interest',
                      iconData: FontAwesomeIcons.landmark,
                      iconBackgroundColor:
                          Constant.financialExpensesCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Loan, Interest',
                        categoryIconData: FontAwesomeIcons.landmark,
                        categoryIconBackgroundColor:
                            Constant.financialExpensesCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Texes',
                      iconData: FontAwesomeIcons.moneyBill1Wave,
                      iconBackgroundColor:
                          Constant.financialExpensesCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Texes',
                        categoryIconData: FontAwesomeIcons.moneyBill1Wave,
                        categoryIconBackgroundColor:
                            Constant.financialExpensesCategoryColor,
                      ),
                    ),
                  ],
                ),
                categoryCard(
                  ref: ref,
                  title: 'Invesments',
                  iconData: FontAwesomeIcons.chartLine,
                  iconBackgroundColor: Constant.invesmentsCategoryColor,
                  stateProvider: isInvesmentsExpandedStateProvider,
                  onTap: () => selectedCategory(
                    ref: ref,
                    context: context,
                    categoryTitle: 'Invesments',
                    categoryIconData: FontAwesomeIcons.chartLine,
                    categoryIconBackgroundColor:
                        Constant.invesmentsCategoryColor,
                  ),
                  subCategoryList: [
                    subCategoryCard(
                      title: 'Collections',
                      iconData: FontAwesomeIcons.groupArrowsRotate,
                      iconBackgroundColor: Constant.invesmentsCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Collections',
                        categoryIconData: FontAwesomeIcons.groupArrowsRotate,
                        categoryIconBackgroundColor:
                            Constant.invesmentsCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Financial Investments',
                      iconData: FontAwesomeIcons.chartColumn,
                      iconBackgroundColor: Constant.invesmentsCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Financial Investments',
                        categoryIconData: FontAwesomeIcons.chartColumn,
                        categoryIconBackgroundColor:
                            Constant.invesmentsCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Realty',
                      iconData: FontAwesomeIcons.city,
                      iconBackgroundColor: Constant.invesmentsCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Realty',
                        categoryIconData: FontAwesomeIcons.city,
                        categoryIconBackgroundColor:
                            Constant.invesmentsCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Savings',
                      iconData: FontAwesomeIcons.piggyBank,
                      iconBackgroundColor: Constant.invesmentsCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Savings',
                        categoryIconData: FontAwesomeIcons.piggyBank,
                        categoryIconBackgroundColor:
                            Constant.invesmentsCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Vehicles, Chattels',
                      iconData: FontAwesomeIcons.carSide,
                      iconBackgroundColor: Constant.invesmentsCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Vehicles, Chattels',
                        categoryIconData: FontAwesomeIcons.carSide,
                        categoryIconBackgroundColor:
                            Constant.invesmentsCategoryColor,
                      ),
                    ),
                  ],
                ),
                categoryCard(
                  ref: ref,
                  title: 'Income',
                  iconData: FontAwesomeIcons.sackDollar,
                  iconBackgroundColor: Constant.incomeCategoryColor,
                  stateProvider: isIncomeExpandedStateProvider,
                  onTap: () => selectedCategory(
                    ref: ref,
                    context: context,
                    categoryTitle: 'Income',
                    categoryIconData: FontAwesomeIcons.sackDollar,
                    categoryIconBackgroundColor: Constant.incomeCategoryColor,
                  ),
                  subCategoryList: [
                    subCategoryCard(
                      title: 'Checks, Coupons',
                      iconData: FontAwesomeIcons.rug,
                      iconBackgroundColor: Constant.incomeCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Checks, Coupons',
                        categoryIconData: FontAwesomeIcons.rug,
                        categoryIconBackgroundColor:
                            Constant.incomeCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Child Support',
                      iconData: FontAwesomeIcons.handsHoldingChild,
                      iconBackgroundColor: Constant.incomeCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Child Support',
                        categoryIconData: FontAwesomeIcons.handsHoldingChild,
                        categoryIconBackgroundColor:
                            Constant.incomeCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Dues, Grants',
                      iconData: FontAwesomeIcons.circleCheck,
                      iconBackgroundColor: Constant.incomeCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Dues, Grants',
                        categoryIconData: FontAwesomeIcons.circleCheck,
                        categoryIconBackgroundColor:
                            Constant.incomeCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Gifts',
                      iconData: FontAwesomeIcons.gift,
                      iconBackgroundColor: Constant.incomeCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Gifts',
                        categoryIconData: FontAwesomeIcons.gift,
                        categoryIconBackgroundColor:
                            Constant.incomeCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Interest, Dividends',
                      iconData: FontAwesomeIcons.percent,
                      iconBackgroundColor: Constant.incomeCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Interest, Dividends',
                        categoryIconData: FontAwesomeIcons.percent,
                        categoryIconBackgroundColor:
                            Constant.incomeCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Lending, Renting',
                      iconData: FontAwesomeIcons.bookJournalWhills,
                      iconBackgroundColor: Constant.incomeCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Lending, Renting',
                        categoryIconData: FontAwesomeIcons.bookJournalWhills,
                        categoryIconBackgroundColor:
                            Constant.incomeCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Lottery, Gambling',
                      iconData: FontAwesomeIcons.dice,
                      iconBackgroundColor: Constant.incomeCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Lottery, Gambling',
                        categoryIconData: FontAwesomeIcons.dice,
                        categoryIconBackgroundColor:
                            Constant.incomeCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Refunds (Tax, Purchase)',
                      iconData: FontAwesomeIcons.arrowRotateLeft,
                      iconBackgroundColor: Constant.incomeCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Refunds (Tax, Purchase)',
                        categoryIconData: FontAwesomeIcons.arrowRotateLeft,
                        categoryIconBackgroundColor:
                            Constant.incomeCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Rental Income',
                      iconData: FontAwesomeIcons.houseChimneyUser,
                      iconBackgroundColor: Constant.incomeCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Rental Income',
                        categoryIconData: FontAwesomeIcons.houseChimneyUser,
                        categoryIconBackgroundColor:
                            Constant.incomeCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Sale',
                      iconData: FontAwesomeIcons.moneyBill,
                      iconBackgroundColor: Constant.incomeCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Sale',
                        categoryIconData: FontAwesomeIcons.moneyBill,
                        categoryIconBackgroundColor:
                            Constant.incomeCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Wage, Invoices',
                      iconData: FontAwesomeIcons.handHoldingDollar,
                      iconBackgroundColor: Constant.incomeCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Wage, Invoices',
                        categoryIconData: FontAwesomeIcons.handHoldingDollar,
                        categoryIconBackgroundColor:
                            Constant.incomeCategoryColor,
                      ),
                    ),
                  ],
                ),
                categoryCard(
                  ref: ref,
                  title: 'Others',
                  iconData: FontAwesomeIcons.bars,
                  iconBackgroundColor: Constant.othersCategoryColor,
                  stateProvider: isOtherExpandedStateProvider,
                  onTap: () => selectedCategory(
                    ref: ref,
                    context: context,
                    categoryTitle: 'Others',
                    categoryIconData: FontAwesomeIcons.bars,
                    categoryIconBackgroundColor: Constant.othersCategoryColor,
                  ),
                  subCategoryList: [
                    subCategoryCard(
                      title: 'Missing',
                      iconData: FontAwesomeIcons.question,
                      iconBackgroundColor: Constant.othersCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Missing',
                        categoryIconData: FontAwesomeIcons.question,
                        categoryIconBackgroundColor:
                            Constant.othersCategoryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Column categoryCard({
  required String title,
  required IconData iconData,
  required AutoDisposeStateProvider<bool> stateProvider,
  required WidgetRef ref,
  required List<Widget> subCategoryList,
  required Color iconBackgroundColor,
  required Function()? onTap,
}) {
  return Column(
    children: [
      cardButton(
        onTap: onTap,
        iconData: iconData,
        title: title,
        isHasPrefixIcon: true,
        iconBackgroundColor: iconBackgroundColor,
        isExpanded: ref.watch(stateProvider),
        expandIconOnPressed: () {
          ref.read(stateProvider.notifier).update(
                (state) => !ref.read(stateProvider),
              );
          log(ref.watch(stateProvider).toString());
        },
      ),
      const SizedBox(
        height: 5,
      ),
      Visibility(
        visible: ref.watch(stateProvider),
        child: Column(
          children: subCategoryList,
        ),
      ),
    ],
  );
}

Padding subCategoryCard({
  required Function()? onTap,
  required String title,
  required iconBackgroundColor,
  required IconData iconData,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    child: cardButton(
      onTap: onTap,
      iconData: iconData,
      title: title,
      iconBackgroundColor: iconBackgroundColor,
    ),
  );
}

selectedCategory({
  required WidgetRef ref,
  required BuildContext context,
  required String categoryTitle,
  required IconData categoryIconData,
  required Color categoryIconBackgroundColor,
}) {
  ref
      .read(selectedCategoryTitleStateProvider.notifier)
      .update((state) => categoryTitle);
  ref
      .read(selectedCategoryIconDataStateProvider.notifier)
      .update((state) => categoryIconData);
  ref
      .read(selectedCategoryColorStateProvider.notifier)
      .update((state) => categoryIconBackgroundColor);
  Navigator.pop(context);
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/features/record/view/new_record_view.dart';

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

class CategoryListView extends ConsumerStatefulWidget {
  const CategoryListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryListState();
}

class _CategoryListState extends ConsumerState<CategoryListView> {
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
                  iconBackgroundColor: CoreConstant.foodAndDrinksCategoryColor,
                  stateProvider: isFoodAndDrinksExpandedStateProvider,
                  onTap: () => selectedCategory(
                    ref: ref,
                    context: context,
                    categoryTitle: 'Food & Drinks',
                    categoryIconData: FontAwesomeIcons.utensils,
                    categoryIconBackgroundColor:
                        CoreConstant.foodAndDrinksCategoryColor,
                  ),
                  subCategoryList: [
                    subCategoryCard(
                      title: 'Bar, Cafe',
                      iconData: FontAwesomeIcons.wineGlass,
                      iconBackgroundColor:
                          CoreConstant.foodAndDrinksCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Bar, Cafe',
                        categoryIconData: FontAwesomeIcons.wineGlass,
                        categoryIconBackgroundColor:
                            CoreConstant.foodAndDrinksCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Groceries',
                      iconData: FontAwesomeIcons.cartShopping,
                      iconBackgroundColor:
                          CoreConstant.foodAndDrinksCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Groceries',
                        categoryIconData: FontAwesomeIcons.cartShopping,
                        categoryIconBackgroundColor:
                            CoreConstant.foodAndDrinksCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Restaurant, Fast-Food',
                      iconData: FontAwesomeIcons.burger,
                      iconBackgroundColor:
                          CoreConstant.foodAndDrinksCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Restaurant, Fast-Food',
                        categoryIconData: FontAwesomeIcons.burger,
                        categoryIconBackgroundColor:
                            CoreConstant.foodAndDrinksCategoryColor,
                      ),
                    ),
                  ],
                ),
                categoryCard(
                  ref: ref,
                  title: 'Shopping',
                  iconData: FontAwesomeIcons.bagShopping,
                  iconBackgroundColor: CoreConstant.shoppingCategoryColor,
                  stateProvider: isShoppingExpandedStateProvider,
                  onTap: () => selectedCategory(
                    ref: ref,
                    context: context,
                    categoryTitle: 'Shopping',
                    categoryIconData: FontAwesomeIcons.bagShopping,
                    categoryIconBackgroundColor:
                        CoreConstant.shoppingCategoryColor,
                  ),
                  subCategoryList: [
                    subCategoryCard(
                      title: 'Clothes & Shoes',
                      iconData: FontAwesomeIcons.shirt,
                      iconBackgroundColor: CoreConstant.shoppingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Clothes & Shoes',
                        categoryIconData: FontAwesomeIcons.shirt,
                        categoryIconBackgroundColor:
                            CoreConstant.shoppingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Drug-store, Chemist',
                      iconData: FontAwesomeIcons.capsules,
                      iconBackgroundColor: CoreConstant.shoppingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Drug-store, Chemist',
                        categoryIconData: FontAwesomeIcons.capsules,
                        categoryIconBackgroundColor:
                            CoreConstant.shoppingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Electronics, Accessories',
                      iconData: FontAwesomeIcons.computer,
                      iconBackgroundColor: CoreConstant.shoppingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Electronics, Accessories',
                        categoryIconData: FontAwesomeIcons.computer,
                        categoryIconBackgroundColor:
                            CoreConstant.shoppingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Free time',
                      iconData: FontAwesomeIcons.solidFaceSmile,
                      iconBackgroundColor: CoreConstant.shoppingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Free time',
                        categoryIconData: FontAwesomeIcons.solidFaceSmile,
                        categoryIconBackgroundColor:
                            CoreConstant.shoppingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Gifts, Joy',
                      iconData: FontAwesomeIcons.gift,
                      iconBackgroundColor: CoreConstant.shoppingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Gifts, Joy',
                        categoryIconData: FontAwesomeIcons.gift,
                        categoryIconBackgroundColor:
                            CoreConstant.shoppingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Health & beauty',
                      iconData: FontAwesomeIcons.kitMedical,
                      iconBackgroundColor: CoreConstant.shoppingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Health & beauty',
                        categoryIconData: FontAwesomeIcons.kitMedical,
                        categoryIconBackgroundColor:
                            CoreConstant.shoppingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Home, Garden',
                      iconData: FontAwesomeIcons.house,
                      iconBackgroundColor: CoreConstant.shoppingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Home, Garden',
                        categoryIconData: FontAwesomeIcons.house,
                        categoryIconBackgroundColor:
                            CoreConstant.shoppingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Jewels, Accessories',
                      iconData: FontAwesomeIcons.solidGem,
                      iconBackgroundColor: CoreConstant.shoppingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Jewels, Accessories',
                        categoryIconData: FontAwesomeIcons.solidGem,
                        categoryIconBackgroundColor:
                            CoreConstant.shoppingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Kids',
                      iconData: FontAwesomeIcons.babyCarriage,
                      iconBackgroundColor: CoreConstant.shoppingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Kids',
                        categoryIconData: FontAwesomeIcons.babyCarriage,
                        categoryIconBackgroundColor:
                            CoreConstant.shoppingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Pets, animals',
                      iconData: FontAwesomeIcons.paw,
                      iconBackgroundColor: CoreConstant.shoppingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Pets, animals',
                        categoryIconData: FontAwesomeIcons.paw,
                        categoryIconBackgroundColor:
                            CoreConstant.shoppingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Stationery, Tools',
                      iconData: FontAwesomeIcons.screwdriverWrench,
                      iconBackgroundColor: CoreConstant.shoppingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Stationery, Tools',
                        categoryIconData: FontAwesomeIcons.screwdriverWrench,
                        categoryIconBackgroundColor:
                            CoreConstant.shoppingCategoryColor,
                      ),
                    ),
                  ],
                ),
                categoryCard(
                  ref: ref,
                  title: 'Housing',
                  iconData: FontAwesomeIcons.house,
                  iconBackgroundColor: CoreConstant.housingCategoryColor,
                  stateProvider: isHousingExpandedStateProvider,
                  onTap: () => selectedCategory(
                    ref: ref,
                    context: context,
                    categoryTitle: 'Housing',
                    categoryIconData: FontAwesomeIcons.house,
                    categoryIconBackgroundColor:
                        CoreConstant.housingCategoryColor,
                  ),
                  subCategoryList: [
                    subCategoryCard(
                      title: 'Energy, Utilities',
                      iconData: FontAwesomeIcons.solidLightbulb,
                      iconBackgroundColor: CoreConstant.housingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Energy, Utilities',
                        categoryIconData: FontAwesomeIcons.solidLightbulb,
                        categoryIconBackgroundColor:
                            CoreConstant.housingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Maintenance, Repairs',
                      iconData: FontAwesomeIcons.hammer,
                      iconBackgroundColor: CoreConstant.housingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Maintenance, Repairs',
                        categoryIconData: FontAwesomeIcons.hammer,
                        categoryIconBackgroundColor:
                            CoreConstant.housingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Mortgage',
                      iconData: FontAwesomeIcons.houseCircleCheck,
                      iconBackgroundColor: CoreConstant.housingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Mortgage',
                        categoryIconData: FontAwesomeIcons.houseCircleCheck,
                        categoryIconBackgroundColor:
                            CoreConstant.housingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Property Insurance',
                      iconData: FontAwesomeIcons.buildingShield,
                      iconBackgroundColor: CoreConstant.housingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Property Insurance',
                        categoryIconData: FontAwesomeIcons.buildingShield,
                        categoryIconBackgroundColor:
                            CoreConstant.housingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Rent',
                      iconData: FontAwesomeIcons.key,
                      iconBackgroundColor: CoreConstant.housingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Rent',
                        categoryIconData: FontAwesomeIcons.key,
                        categoryIconBackgroundColor:
                            CoreConstant.housingCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Services',
                      iconData: FontAwesomeIcons.houseUser,
                      iconBackgroundColor: CoreConstant.housingCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Services',
                        categoryIconData: FontAwesomeIcons.houseUser,
                        categoryIconBackgroundColor:
                            CoreConstant.housingCategoryColor,
                      ),
                    ),
                  ],
                ),
                categoryCard(
                  ref: ref,
                  title: 'Transportation',
                  iconData: FontAwesomeIcons.road,
                  iconBackgroundColor: CoreConstant.transportationCategoryColor,
                  stateProvider: isTransportationExpandedStateProvider,
                  onTap: () => selectedCategory(
                    ref: ref,
                    context: context,
                    categoryTitle: 'Transportation',
                    categoryIconData: FontAwesomeIcons.road,
                    categoryIconBackgroundColor:
                        CoreConstant.transportationCategoryColor,
                  ),
                  subCategoryList: [
                    subCategoryCard(
                      title: 'Business Trips',
                      iconData: FontAwesomeIcons.suitcase,
                      iconBackgroundColor:
                          CoreConstant.transportationCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Business Trips',
                        categoryIconData: FontAwesomeIcons.suitcase,
                        categoryIconBackgroundColor:
                            CoreConstant.transportationCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Long Distance',
                      iconData: FontAwesomeIcons.planeDeparture,
                      iconBackgroundColor:
                          CoreConstant.transportationCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Long Distance',
                        categoryIconData: FontAwesomeIcons.planeDeparture,
                        categoryIconBackgroundColor:
                            CoreConstant.transportationCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Public Transport',
                      iconData: FontAwesomeIcons.bus,
                      iconBackgroundColor:
                          CoreConstant.transportationCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Public Transport',
                        categoryIconData: FontAwesomeIcons.bus,
                        categoryIconBackgroundColor:
                            CoreConstant.transportationCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Taxi',
                      iconData: FontAwesomeIcons.taxi,
                      iconBackgroundColor:
                          CoreConstant.transportationCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Taxi',
                        categoryIconData: FontAwesomeIcons.taxi,
                        categoryIconBackgroundColor:
                            CoreConstant.transportationCategoryColor,
                      ),
                    ),
                  ],
                ),
                categoryCard(
                  ref: ref,
                  title: 'Vehicle',
                  iconData: FontAwesomeIcons.car,
                  iconBackgroundColor: CoreConstant.vehicleCategoryColor,
                  stateProvider: isVehicleExpandedStateProvider,
                  onTap: () => selectedCategory(
                    ref: ref,
                    context: context,
                    categoryTitle: 'Vehicle',
                    categoryIconData: FontAwesomeIcons.car,
                    categoryIconBackgroundColor:
                        CoreConstant.vehicleCategoryColor,
                  ),
                  subCategoryList: [
                    subCategoryCard(
                      title: 'Fuel',
                      iconData: FontAwesomeIcons.gasPump,
                      iconBackgroundColor: CoreConstant.vehicleCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Fuel',
                        categoryIconData: FontAwesomeIcons.gasPump,
                        categoryIconBackgroundColor:
                            CoreConstant.vehicleCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Leasing',
                      iconData: FontAwesomeIcons.coins,
                      iconBackgroundColor: CoreConstant.vehicleCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Leasing',
                        categoryIconData: FontAwesomeIcons.coins,
                        categoryIconBackgroundColor:
                            CoreConstant.vehicleCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Parking',
                      iconData: FontAwesomeIcons.squareParking,
                      iconBackgroundColor: CoreConstant.vehicleCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Parking',
                        categoryIconData: FontAwesomeIcons.squareParking,
                        categoryIconBackgroundColor:
                            CoreConstant.vehicleCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Rentals',
                      iconData: FontAwesomeIcons.key,
                      iconBackgroundColor: CoreConstant.vehicleCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Rentals',
                        categoryIconData: FontAwesomeIcons.key,
                        categoryIconBackgroundColor:
                            CoreConstant.vehicleCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Vehicle Insurance',
                      iconData: FontAwesomeIcons.carBurst,
                      iconBackgroundColor: CoreConstant.vehicleCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Vehicle Insurance',
                        categoryIconData: FontAwesomeIcons.carBurst,
                        categoryIconBackgroundColor:
                            CoreConstant.vehicleCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Vehicle Maintenance',
                      iconData: FontAwesomeIcons.wrench,
                      iconBackgroundColor: CoreConstant.vehicleCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Vehicle Maintenance',
                        categoryIconData: FontAwesomeIcons.wrench,
                        categoryIconBackgroundColor:
                            CoreConstant.vehicleCategoryColor,
                      ),
                    ),
                  ],
                ),
                categoryCard(
                  ref: ref,
                  title: 'Life & Intertainment',
                  iconData: FontAwesomeIcons.person,
                  iconBackgroundColor:
                      CoreConstant.lifeAndEntertainmentCategoryColor,
                  stateProvider: isLifeEntertainmentExpandedStateProvider,
                  onTap: () => selectedCategory(
                    ref: ref,
                    context: context,
                    categoryTitle: 'Life & Intertainment',
                    categoryIconData: FontAwesomeIcons.person,
                    categoryIconBackgroundColor:
                        CoreConstant.lifeAndEntertainmentCategoryColor,
                  ),
                  subCategoryList: [
                    subCategoryCard(
                      title: 'Active Sport, Fitness',
                      iconData: FontAwesomeIcons.dumbbell,
                      iconBackgroundColor:
                          CoreConstant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Active Sport, Fitness',
                        categoryIconData: FontAwesomeIcons.dumbbell,
                        categoryIconBackgroundColor:
                            CoreConstant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Alcohol, Tobacco',
                      iconData: FontAwesomeIcons.wineBottle,
                      iconBackgroundColor:
                          CoreConstant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Alcohol, Tobacco',
                        categoryIconData: FontAwesomeIcons.wineBottle,
                        categoryIconBackgroundColor:
                            CoreConstant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Books, Audio, Subscriptions',
                      iconData: FontAwesomeIcons.book,
                      iconBackgroundColor:
                          CoreConstant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Books, Audio, Subscriptions',
                        categoryIconData: FontAwesomeIcons.book,
                        categoryIconBackgroundColor:
                            CoreConstant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Charity, Gifts',
                      iconData: FontAwesomeIcons.gift,
                      iconBackgroundColor:
                          CoreConstant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Charity, Gifts',
                        categoryIconData: FontAwesomeIcons.gift,
                        categoryIconBackgroundColor:
                            CoreConstant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Culture, Sport Events',
                      iconData: FontAwesomeIcons.handsClapping,
                      iconBackgroundColor:
                          CoreConstant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Culture, Sport Events',
                        categoryIconData: FontAwesomeIcons.handsClapping,
                        categoryIconBackgroundColor:
                            CoreConstant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Education, Development',
                      iconData: FontAwesomeIcons.userGraduate,
                      iconBackgroundColor:
                          CoreConstant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Education, Development',
                        categoryIconData: FontAwesomeIcons.userGraduate,
                        categoryIconBackgroundColor:
                            CoreConstant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Health Care, Doctor',
                      iconData: FontAwesomeIcons.userDoctor,
                      iconBackgroundColor:
                          CoreConstant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Health Care, Doctor',
                        categoryIconData: FontAwesomeIcons.userDoctor,
                        categoryIconBackgroundColor:
                            CoreConstant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Hobbies',
                      iconData: FontAwesomeIcons.heart,
                      iconBackgroundColor:
                          CoreConstant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Hobbies',
                        categoryIconData: FontAwesomeIcons.heart,
                        categoryIconBackgroundColor:
                            CoreConstant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Holiday, Trips, Hotels',
                      iconData: FontAwesomeIcons.umbrellaBeach,
                      iconBackgroundColor:
                          CoreConstant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Holiday, Trips, Hotels',
                        categoryIconData: FontAwesomeIcons.umbrellaBeach,
                        categoryIconBackgroundColor:
                            CoreConstant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Life Events',
                      iconData: FontAwesomeIcons.cakeCandles,
                      iconBackgroundColor:
                          CoreConstant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Life Events',
                        categoryIconData: FontAwesomeIcons.cakeCandles,
                        categoryIconBackgroundColor:
                            CoreConstant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Lottery, Gambling',
                      iconData: FontAwesomeIcons.dice,
                      iconBackgroundColor:
                          CoreConstant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Lottery, Gambling',
                        categoryIconData: FontAwesomeIcons.dice,
                        categoryIconBackgroundColor:
                            CoreConstant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'TV, Streaming',
                      iconData: FontAwesomeIcons.tv,
                      iconBackgroundColor:
                          CoreConstant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'TV, Streaming',
                        categoryIconData: FontAwesomeIcons.tv,
                        categoryIconBackgroundColor:
                            CoreConstant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Wellness, Beauty',
                      iconData: FontAwesomeIcons.spa,
                      iconBackgroundColor:
                          CoreConstant.lifeAndEntertainmentCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Wellness, Beauty',
                        categoryIconData: FontAwesomeIcons.spa,
                        categoryIconBackgroundColor:
                            CoreConstant.lifeAndEntertainmentCategoryColor,
                      ),
                    ),
                  ],
                ),
                categoryCard(
                  ref: ref,
                  title: 'Communication, PC',
                  iconData: FontAwesomeIcons.computer,
                  iconBackgroundColor:
                      CoreConstant.communicationPCCategoryColor,
                  stateProvider: isComunicationPCExpandedStateProvider,
                  onTap: () => selectedCategory(
                    ref: ref,
                    context: context,
                    categoryTitle: 'Communication, PC',
                    categoryIconData: FontAwesomeIcons.computer,
                    categoryIconBackgroundColor:
                        CoreConstant.communicationPCCategoryColor,
                  ),
                  subCategoryList: [
                    subCategoryCard(
                      title: 'Internet',
                      iconData: FontAwesomeIcons.wifi,
                      iconBackgroundColor:
                          CoreConstant.communicationPCCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Internet',
                        categoryIconData: FontAwesomeIcons.wifi,
                        categoryIconBackgroundColor:
                            CoreConstant.communicationPCCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Phone, Cellphone',
                      iconData: FontAwesomeIcons.phone,
                      iconBackgroundColor:
                          CoreConstant.communicationPCCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Phone, Cellphone',
                        categoryIconData: FontAwesomeIcons.phone,
                        categoryIconBackgroundColor:
                            CoreConstant.communicationPCCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Postal services',
                      iconData: FontAwesomeIcons.envelopesBulk,
                      iconBackgroundColor:
                          CoreConstant.communicationPCCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Postal services',
                        categoryIconData: FontAwesomeIcons.envelopesBulk,
                        categoryIconBackgroundColor:
                            CoreConstant.communicationPCCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Software, Apps, Games',
                      iconData: FontAwesomeIcons.download,
                      iconBackgroundColor:
                          CoreConstant.communicationPCCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Software, Apps, Games',
                        categoryIconData: FontAwesomeIcons.download,
                        categoryIconBackgroundColor:
                            CoreConstant.communicationPCCategoryColor,
                      ),
                    ),
                  ],
                ),
                categoryCard(
                  ref: ref,
                  title: 'Financial Expenses',
                  iconData: FontAwesomeIcons.coins,
                  iconBackgroundColor:
                      CoreConstant.financialExpensesCategoryColor,
                  stateProvider: isFinancialExpensesExpandedStateProvider,
                  onTap: () => selectedCategory(
                    ref: ref,
                    context: context,
                    categoryTitle: 'Financial Expenses',
                    categoryIconData: FontAwesomeIcons.coins,
                    categoryIconBackgroundColor:
                        CoreConstant.financialExpensesCategoryColor,
                  ),
                  subCategoryList: [
                    subCategoryCard(
                      title: 'Advisory',
                      iconData: FontAwesomeIcons.commentDollar,
                      iconBackgroundColor:
                          CoreConstant.financialExpensesCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Advisory',
                        categoryIconData: FontAwesomeIcons.commentDollar,
                        categoryIconBackgroundColor:
                            CoreConstant.financialExpensesCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Charges, Fees',
                      iconData: FontAwesomeIcons.receipt,
                      iconBackgroundColor:
                          CoreConstant.financialExpensesCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Charges, Fees',
                        categoryIconData: FontAwesomeIcons.receipt,
                        categoryIconBackgroundColor:
                            CoreConstant.financialExpensesCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Child Support',
                      iconData: FontAwesomeIcons.handsHoldingChild,
                      iconBackgroundColor:
                          CoreConstant.financialExpensesCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Child Support',
                        categoryIconData: FontAwesomeIcons.handsHoldingChild,
                        categoryIconBackgroundColor:
                            CoreConstant.financialExpensesCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Fines',
                      iconData: FontAwesomeIcons.handPointUp,
                      iconBackgroundColor:
                          CoreConstant.financialExpensesCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Fines',
                        categoryIconData: FontAwesomeIcons.handPointUp,
                        categoryIconBackgroundColor:
                            CoreConstant.financialExpensesCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Insurances',
                      iconData: FontAwesomeIcons.hospitalUser,
                      iconBackgroundColor:
                          CoreConstant.financialExpensesCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Insurances',
                        categoryIconData: FontAwesomeIcons.hospitalUser,
                        categoryIconBackgroundColor:
                            CoreConstant.financialExpensesCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Loan, Interest',
                      iconData: FontAwesomeIcons.landmark,
                      iconBackgroundColor:
                          CoreConstant.financialExpensesCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Loan, Interest',
                        categoryIconData: FontAwesomeIcons.landmark,
                        categoryIconBackgroundColor:
                            CoreConstant.financialExpensesCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Texes',
                      iconData: FontAwesomeIcons.moneyBill1Wave,
                      iconBackgroundColor:
                          CoreConstant.financialExpensesCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Texes',
                        categoryIconData: FontAwesomeIcons.moneyBill1Wave,
                        categoryIconBackgroundColor:
                            CoreConstant.financialExpensesCategoryColor,
                      ),
                    ),
                  ],
                ),
                categoryCard(
                  ref: ref,
                  title: 'Invesments',
                  iconData: FontAwesomeIcons.chartLine,
                  iconBackgroundColor: CoreConstant.invesmentsCategoryColor,
                  stateProvider: isInvesmentsExpandedStateProvider,
                  onTap: () => selectedCategory(
                    ref: ref,
                    context: context,
                    categoryTitle: 'Invesments',
                    categoryIconData: FontAwesomeIcons.chartLine,
                    categoryIconBackgroundColor:
                        CoreConstant.invesmentsCategoryColor,
                  ),
                  subCategoryList: [
                    subCategoryCard(
                      title: 'Collections',
                      iconData: FontAwesomeIcons.groupArrowsRotate,
                      iconBackgroundColor: CoreConstant.invesmentsCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Collections',
                        categoryIconData: FontAwesomeIcons.groupArrowsRotate,
                        categoryIconBackgroundColor:
                            CoreConstant.invesmentsCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Financial Investments',
                      iconData: FontAwesomeIcons.chartColumn,
                      iconBackgroundColor: CoreConstant.invesmentsCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Financial Investments',
                        categoryIconData: FontAwesomeIcons.chartColumn,
                        categoryIconBackgroundColor:
                            CoreConstant.invesmentsCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Realty',
                      iconData: FontAwesomeIcons.city,
                      iconBackgroundColor: CoreConstant.invesmentsCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Realty',
                        categoryIconData: FontAwesomeIcons.city,
                        categoryIconBackgroundColor:
                            CoreConstant.invesmentsCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Savings',
                      iconData: FontAwesomeIcons.piggyBank,
                      iconBackgroundColor: CoreConstant.invesmentsCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Savings',
                        categoryIconData: FontAwesomeIcons.piggyBank,
                        categoryIconBackgroundColor:
                            CoreConstant.invesmentsCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Vehicles, Chattels',
                      iconData: FontAwesomeIcons.carSide,
                      iconBackgroundColor: CoreConstant.invesmentsCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Vehicles, Chattels',
                        categoryIconData: FontAwesomeIcons.carSide,
                        categoryIconBackgroundColor:
                            CoreConstant.invesmentsCategoryColor,
                      ),
                    ),
                  ],
                ),
                categoryCard(
                  ref: ref,
                  title: 'Income',
                  iconData: FontAwesomeIcons.sackDollar,
                  iconBackgroundColor: CoreConstant.incomeCategoryColor,
                  stateProvider: isIncomeExpandedStateProvider,
                  onTap: () => selectedCategory(
                    ref: ref,
                    context: context,
                    categoryTitle: 'Income',
                    categoryIconData: FontAwesomeIcons.sackDollar,
                    categoryIconBackgroundColor:
                        CoreConstant.incomeCategoryColor,
                  ),
                  subCategoryList: [
                    subCategoryCard(
                      title: 'Checks, Coupons',
                      iconData: FontAwesomeIcons.rug,
                      iconBackgroundColor: CoreConstant.incomeCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Checks, Coupons',
                        categoryIconData: FontAwesomeIcons.rug,
                        categoryIconBackgroundColor:
                            CoreConstant.incomeCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Child Support',
                      iconData: FontAwesomeIcons.handsHoldingChild,
                      iconBackgroundColor: CoreConstant.incomeCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Child Support',
                        categoryIconData: FontAwesomeIcons.handsHoldingChild,
                        categoryIconBackgroundColor:
                            CoreConstant.incomeCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Dues, Grants',
                      iconData: FontAwesomeIcons.circleCheck,
                      iconBackgroundColor: CoreConstant.incomeCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Dues, Grants',
                        categoryIconData: FontAwesomeIcons.circleCheck,
                        categoryIconBackgroundColor:
                            CoreConstant.incomeCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Gifts',
                      iconData: FontAwesomeIcons.gift,
                      iconBackgroundColor: CoreConstant.incomeCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Gifts',
                        categoryIconData: FontAwesomeIcons.gift,
                        categoryIconBackgroundColor:
                            CoreConstant.incomeCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Interest, Dividends',
                      iconData: FontAwesomeIcons.percent,
                      iconBackgroundColor: CoreConstant.incomeCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Interest, Dividends',
                        categoryIconData: FontAwesomeIcons.percent,
                        categoryIconBackgroundColor:
                            CoreConstant.incomeCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Lending, Renting',
                      iconData: FontAwesomeIcons.bookJournalWhills,
                      iconBackgroundColor: CoreConstant.incomeCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Lending, Renting',
                        categoryIconData: FontAwesomeIcons.bookJournalWhills,
                        categoryIconBackgroundColor:
                            CoreConstant.incomeCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Lottery, Gambling',
                      iconData: FontAwesomeIcons.dice,
                      iconBackgroundColor: CoreConstant.incomeCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Lottery, Gambling',
                        categoryIconData: FontAwesomeIcons.dice,
                        categoryIconBackgroundColor:
                            CoreConstant.incomeCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Refunds (Tax, Purchase)',
                      iconData: FontAwesomeIcons.arrowRotateLeft,
                      iconBackgroundColor: CoreConstant.incomeCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Refunds (Tax, Purchase)',
                        categoryIconData: FontAwesomeIcons.arrowRotateLeft,
                        categoryIconBackgroundColor:
                            CoreConstant.incomeCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Rental Income',
                      iconData: FontAwesomeIcons.houseChimneyUser,
                      iconBackgroundColor: CoreConstant.incomeCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Rental Income',
                        categoryIconData: FontAwesomeIcons.houseChimneyUser,
                        categoryIconBackgroundColor:
                            CoreConstant.incomeCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Sale',
                      iconData: FontAwesomeIcons.moneyBill,
                      iconBackgroundColor: CoreConstant.incomeCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Sale',
                        categoryIconData: FontAwesomeIcons.moneyBill,
                        categoryIconBackgroundColor:
                            CoreConstant.incomeCategoryColor,
                      ),
                    ),
                    subCategoryCard(
                      title: 'Wage, Invoices',
                      iconData: FontAwesomeIcons.handHoldingDollar,
                      iconBackgroundColor: CoreConstant.incomeCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Wage, Invoices',
                        categoryIconData: FontAwesomeIcons.handHoldingDollar,
                        categoryIconBackgroundColor:
                            CoreConstant.incomeCategoryColor,
                      ),
                    ),
                  ],
                ),
                categoryCard(
                  ref: ref,
                  title: 'Others',
                  iconData: FontAwesomeIcons.bars,
                  iconBackgroundColor: CoreConstant.othersCategoryColor,
                  stateProvider: isOtherExpandedStateProvider,
                  onTap: () => selectedCategory(
                    ref: ref,
                    context: context,
                    categoryTitle: 'Others',
                    categoryIconData: FontAwesomeIcons.bars,
                    categoryIconBackgroundColor:
                        CoreConstant.othersCategoryColor,
                  ),
                  subCategoryList: [
                    subCategoryCard(
                      title: 'Missing',
                      iconData: FontAwesomeIcons.question,
                      iconBackgroundColor: CoreConstant.othersCategoryColor,
                      onTap: () => selectedCategory(
                        ref: ref,
                        context: context,
                        categoryTitle: 'Missing',
                        categoryIconData: FontAwesomeIcons.question,
                        categoryIconBackgroundColor:
                            CoreConstant.othersCategoryColor,
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

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lest/features/home/models/category_model.dart';
import 'package:lest/features/home/models/product_model.dart';
import 'package:lest/product/constants/navigation_types.dart';

class HomeViewModel extends ChangeNotifier {
  final List<Category> _categories = <Category>[
    Category.fruit(),
    Category.vegetable()
  ];

  final List<Product> _products = <Product>[
    Product(
      price: 2.99,
      name: 'Apple',
      imageUrl:
          'https://cdn.britannica.com/22/187222-050-07B17FB6/apples-on-a-tree-branch.jpg',
      rating: 3.3,
      description:
          'The apple is a popular fruit known for its crisp texture and sweet flavor. It is often enjoyed fresh as a healthy snack or used in various culinary creations. Apples are rich in antioxidants, dietary fiber, and vitamin C. They come in a variety of colors and flavors, offering options such as red, green, or yellow apples.',
      category: Category.fruit(),
      lat: 39.925533 + Random().nextDouble(),
      lon: 32.866287 + Random().nextDouble(),
      producer: 'Red Apple Farms',
    ),
    Product(
      price: 1.99,
      name: 'Orange',
      imageUrl:
          'https://www.heythattastesgood.com/wp-content/uploads/2022/06/oranges-are-citrus-fruits.jpg',
      rating: 3.8,
      description:
          'Oranges are juicy citrus fruits with a bright and refreshing flavor. They are known for their high vitamin C content and are often consumed as a source of immune-boosting nutrients. Oranges can be peeled and eaten fresh, used in juices or smoothies, or incorporated into various dishes and desserts.',
      category: Category.fruit(),
      lat: 39.925533 + Random().nextDouble(),
      lon: 32.866287 + Random().nextDouble(),
      producer: 'Sunshine Grove',
    ),
    Product(
      price: 0.99,
      name: 'Banana',
      imageUrl:
          'https://foodandnutrition.org/wp-content/uploads/SavorBananas.jpg',
      rating: 4.1,
      description:
          'Bananas are a popular fruit enjoyed for their sweet taste and creamy texture. They are a great source of potassium, vitamin C, and dietary fiber. Bananas can be eaten as a quick and nutritious snack, added to smoothies or desserts, or used in baking for moist and flavorful treats.',
      category: Category.fruit(),
      lat: 39.925533 + Random().nextDouble(),
      lon: 32.866287 + Random().nextDouble(),
      producer: 'Tropical Delights',
    ),
    Product(
      price: 3.49,
      name: 'Strawberry',
      imageUrl:
          'https://a-z-animals.com/media/2022/08/iStock-600992808-1024x714.jpg',
      rating: 4.8,
      description:
          'Strawberries are delicious and vibrant berries loved for their sweet and tangy flavor. They are rich in antioxidants and vitamin C, making them a nutritious choice. Strawberries can be enjoyed fresh, added to salads, used in desserts, or blended into refreshing beverages.',
      category: Category.fruit(),
      lat: 39.925533 + Random().nextDouble(),
      lon: 32.866287 + Random().nextDouble(),
      producer: 'Berry Delights',
    ),
    Product(
      price: 2.79,
      name: 'Grapes',
      imageUrl:
          'https://images.unsplash.com/photo-1599819177626-b50f9dd21c9b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGdyYXBlc3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
      rating: 4.3,
      description:
          'Grapes are small, juicy fruits that come in a variety of colors, including green, red, and purple. They are packed with antioxidants and are a good source of hydration. Grapes can be enjoyed fresh as a snack, used in salads or fruit platters, or even pressed into wine.',
      category: Category.fruit(),
      lat: 39.925533 + Random().nextDouble(),
      lon: 32.866287 + Random().nextDouble(),
      producer: 'Vineyard Bliss',
    ),
    Product(
      price: 4.99,
      name: 'Watermelon',
      imageUrl: 'https://a-z-animals.com/media/2022/08/iStock-1214372574.jpg',
      rating: 4.5,
      description:
          'Watermelon is a refreshing and hydrating fruit with a high water content. It has a sweet and juicy flesh that is perfect for hot summer days. Watermelon is packed with vitamins A and C and is a delicious addition to fruit salads, smoothies, or enjoyed on its own as a thirst-quenching snack.',
      category: Category.fruit(),
      lat: 39.925533 + Random().nextDouble(),
      lon: 32.866287 + Random().nextDouble(),
      producer: 'Juicy Delights',
    ),
    Product(
      price: 1.49,
      name: 'Carrot',
      imageUrl:
          'https://a-z-animals.com/media/2022/09/shutterstock_440493100-e1666516567945.jpg',
      rating: 3.7,
      description:
          'Carrots are root vegetables known for their vibrant orange color and crunchy texture. They are rich in beta-carotene, a precursor to vitamin A, and provide various other vitamins and minerals. Carrots can be eaten raw as a snack, used in salads, or cooked in a variety of dishes such as soups, stews, and stir-fries.',
      category: Category.vegetable(),
      lat: 39.925533 + Random().nextDouble(),
      lon: 32.866287 + Random().nextDouble(),
      producer: 'Fresh Harvest Farms',
    ),
    Product(
      price: 2.99,
      name: 'Broccoli',
      imageUrl:
          'https://localfarmbox.co.uk/images/P/Broccoli-in-a-pile-593310638_3020x2000.jpeg',
      rating: 3,
      description:
          'Broccoli is a nutritious and versatile vegetable that belongs to the cabbage family. It is known for its dense green florets and crunchy stalks. Broccoli is packed with vitamins A, C, and K, as well as fiber and antioxidants. It can be enjoyed steamed, roasted, stir-fried, or added to salads and soups.',
      category: Category.vegetable(),
      lat: 39.925533 + Random().nextDouble(),
      lon: 32.866287 + Random().nextDouble(),
      producer: 'Green Harvest Farms',
    ),
    Product(
      price: 1.99,
      name: 'Tomato',
      imageUrl:
          'https://www.finedininglovers.com/sites/g/files/xknfdk626/files/2022-05/tomatoes-fruits%C2%A9iStock.jpg',
      rating: 4.2,
      description:
          'Tomatoes are vibrant and juicy fruits that are commonly used as vegetables in culinary preparations. They come in various shapes, sizes, and colors, including red, yellow, and green. Tomatoes are an excellent source of vitamin C and lycopene, an antioxidant associated with several health benefits. They can be enjoyed raw in salads, used in sauces, or incorporated into countless savory dishes.',
      category: Category.vegetable(),
      lat: 39.925533 + Random().nextDouble(),
      lon: 32.866287 + Random().nextDouble(),
      producer: 'Sunshine Farms',
    ),
    Product(
      price: 0.99,
      name: 'Cucumber',
      imageUrl:
          'https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/is-cucumber-a-fruit-1296x728-feature.jpg?w=1155&h=1528',
      rating: 3.3,
      description:
          'Cucumbers are cool and refreshing vegetables with a high water content. They have a mild flavor and a crisp texture. Cucumbers are low in calories and a good source of hydration. They can be sliced and added to salads, pickled, or used as a healthy snack.',
      category: Category.vegetable(),
      lat: 39.925533 + Random().nextDouble(),
      lon: 32.866287 + Random().nextDouble(),
      producer: 'Fresh Garden Produce',
    ),
    Product(
      price: 2.49,
      name: 'Spinach',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/8/83/%28Basella_alba%29_Malabar_spinach_fruit_at_Bandlaguda_01.JPG',
      rating: 3.2,
      description:
          'Spinach is a leafy green vegetable known for its nutritional benefits. It is rich in iron, calcium, vitamins A and C, and various antioxidants. Spinach has a mild and versatile taste, making it a great addition to salads, smoothies, pasta dishes, and sautéed vegetables.',
      category: Category.vegetable(),
      lat: 39.925533 + Random().nextDouble(),
      lon: 32.866287 + Random().nextDouble(),
      producer: 'Green Leaf Farms',
    ),
    Product(
      price: 3.49,
      name: 'Mango',
      imageUrl:
          'https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2022/01/mangoes_what_to_know_1296x728_header-1024x575.jpg?w=1155&h=1528',
      rating: 4.4,
      description:
          'Mangoes are tropical fruits known for their sweet and juicy flesh. They are packed with vitamins A and C, as well as dietary fiber. Mangoes come in various varieties, each with its unique flavor and texture. They can be enjoyed fresh, blended into smoothies, used in salads, or incorporated into desserts and sauces.',
      category: Category.fruit(),
      lat: 39.925533 + Random().nextDouble(),
      lon: 32.866287 + Random().nextDouble(),
      producer: 'Tropical Delights Farm',
    ),
    Product(
      price: 1.79,
      name: 'Bell Pepper',
      imageUrl:
          'https://www.almanac.com/sites/default/files/styles/or/public/image_nodes/bell_peppers_dleonis_gettyimages.jpg?itok=CQCGWkcY',
      rating: 2.7,
      description:
          'Bell peppers are colorful and crunchy vegetables that come in various hues, including green, red, yellow, and orange. They are a great source of vitamins A and C and provide a range of flavors from sweet to mildly spicy. Bell peppers can be eaten raw in salads, stuffed, roasted, or added to stir-fries and other savory dishes.',
      category: Category.vegetable(),
      lat: 39.925533 + Random().nextDouble(),
      lon: 32.866287 + Random().nextDouble(),
      producer: 'Rainbow Farms',
    ),
    Product(
      price: 2.79,
      name: 'Pineapple',
      imageUrl:
          'https://www.thespruceeats.com/thmb/2Pdkzy-BBOBG74eziXqSj3hwDeI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/SES-history-of-the-pineapple-1807645-343418eb3b4c41b1b956d3c702550a07.jpg',
      rating: 4.6,
      description:
          'Pineapple is a tropical fruit with a sweet and tangy taste. It is known for its juicy flesh and distinctive spiky exterior. Pineapples are rich in vitamin C, manganese, and bromelain, an enzyme that aids digestion. They can be enjoyed fresh, grilled, added to fruit salads, or used in tropical-inspired dishes and beverages.',
      category: Category.fruit(),
      lat: 39.925533 + Random().nextDouble(),
      lon: 32.866287 + Random().nextDouble(),
      producer: 'Tropical Island Farms',
    ),
  ];

  List<Product> get products => _products;
  List<Category> get categories => _categories;

  void onSearch(String value) {}

  int _bottomIndex = 0;
  int get bottomIndex => _bottomIndex;

  void onBottomItemTapped(BuildContext context, int newIndex) {
    if (newIndex == _bottomIndex) return;
    _bottomIndex = newIndex;
    NavigationHelpers.type(_bottomIndex).go(context);
    notifyListeners();
  }
}

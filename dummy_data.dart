import '../models/product.dart';

final List<Product> dummyProducts = [
  Product(
    id: '1',
    name: 'Farm Fresh Broccoli',
    imageUrl: 'assets/images/broccoli.png',
    price: 40.0,
    discount: 10.0,
    rating: 4.5,
    deliveryTime: '30 mins',
    description:
        'Enjoy farm-fresh broccoli, handpicked and packed with nutrients. Perfect for stir-fries, salads, or steaming for a healthy side dish. Loaded with fiber, vitamins C and K, and antioxidants.',
  ),
  Product(
    id: '2',
    name: 'Organic Carrots',
    imageUrl: 'assets/images/carrots.png',
    price: 50.0,
    discount: 5.0,
    rating: 4.0,
    deliveryTime: '25 mins',
    description:
        'These sweet and crisp organic carrots are perfect for snacking, juicing, or adding to soups. Grown without pesticides and full of natural flavor and color.',
  ),
  Product(
    id: '3',
    name: 'Whole Grain Bread',
    imageUrl: 'assets/images/bread.png',
    price: 60.0,
    discount: 15.0,
    rating: 4.8,
    deliveryTime: '20 mins',
    description:
        'Our freshly baked whole grain bread is made with 100% whole wheat flour. Soft, delicious, and rich in fiber — ideal for sandwiches or toasting.',
  ),
];

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(GroceryApp());
}

class GroceryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App UI',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> categories = [
    "Meats",
    "Fresh",
    "Bakery",
    "Grains",
    "Organic"
  ];
  final List<String> categoryIcons = [
    'assets/images/meat.png',
    'assets/images/fresh.png',
    'assets/images/bakery.png',
    'assets/images/grain.png',
    'assets/images/organic.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Wishlist"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              // Top Row: Location + Search + Notification Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Location + Search icon row
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: Colors.green),
                      SizedBox(width: 4),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Delivery location",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                          Text("Green Valley Point",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.search, color: Colors.grey),
                    ],
                  ),

                  // Notification Icon
                  Icon(Icons.notifications_none, color: Colors.grey, size: 28),
                  MaterialApp(
                    debugShowCheckedModeBanner: false,
                    // other properties
                  ),
                ],
              ),

              SizedBox(height: 16),

              // Delivery / Pickup toggle
              Row(
                children: [
                  ChoiceChip(label: Text("Delivery"), selected: true),
                  SizedBox(width: 15),
                  ChoiceChip(label: Text("Pickup"), selected: false),
                ],
              ),

              SizedBox(height: 16),

              // Categories with icons below Delivery/Pickup toggle
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                categoryIcons[i],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(categories[i], style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 20),

              Text("Popular items",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

              SizedBox(height: 12),

              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ProductDetail()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 6)
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.asset("assets/images/produce.jpg")),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Farm Fresh Produce",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("\$10.00 • Discount 5%",
                                style: TextStyle(color: Colors.green)),
                            Row(
                              children: [
                                Icon(Icons.delivery_dining, size: 16),
                                SizedBox(width: 4),
                                Text("Delivered"),
                                SizedBox(width: 16),
                                Icon(Icons.timer, size: 16),
                                SizedBox(width: 4),
                                Text("10 min"),
                                SizedBox(width: 16),
                                RatingBarIndicator(
                                  rating: 3.5,
                                  itemCount: 5,
                                  itemSize: 16,
                                  itemBuilder: (_, __) =>
                                      Icon(Icons.star, color: Colors.amber),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Product Details", style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset("assets/images/produce.jpg"),
            ),
            SizedBox(height: 16),
            Text("Farm Fresh Produce",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("\$10.00 • Discount 5%",
                style: TextStyle(color: Colors.green)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.delivery_dining, size: 16),
                SizedBox(width: 4),
                Text("Delivered"),
                SizedBox(width: 16),
                Icon(Icons.timer, size: 16),
                SizedBox(width: 4),
                Text("10 min"),
                SizedBox(width: 16),
                RatingBarIndicator(
                  rating: 3.5,
                  itemCount: 5,
                  itemSize: 16,
                  itemBuilder: (_, __) => Icon(Icons.star, color: Colors.amber),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "Enjoy farm-fresh produce, handpicked for quality, packed with nutrition, and delivered with care.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (quantity > 1) setState(() => quantity--);
                  },
                  icon: Icon(Icons.remove_circle_outline),
                ),
                Text(quantity.toString(), style: TextStyle(fontSize: 18)),
                IconButton(
                  onPressed: () => setState(() => quantity++),
                  icon: Icon(Icons.add_circle_outline),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart_outlined),
              label: Text("Add to Cart"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
              ),
            )
          ],
        ),
      ),
    );
  }
}

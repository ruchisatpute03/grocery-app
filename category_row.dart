import 'package:flutter/material.dart';

class CategoryRow extends StatefulWidget {
  final List<String> categories;
  const CategoryRow({required this.categories, super.key});

  @override
  State<CategoryRow> createState() => _CategoryRowState();
}

class _CategoryRowState extends State<CategoryRow> {
  int selectedIndex = 0;

  IconData _getIcon(String name) {
    switch (name.toLowerCase()) {
      case 'meats':
        return Icons.set_meal;
      case 'fresh':
        return Icons.eco;
      case 'bakery':
        return Icons.cake;
      case 'grains':
        return Icons.rice_bowl;
      case 'organic':
        return Icons.spa;
      default:
        return Icons.local_offer;
    }
  }

  Color _getIconColor(String name) {
    switch (name.toLowerCase()) {
      case 'meats':
        return Colors.red.shade400;
      case 'fresh':
        return Colors.green.shade700;
      case 'bakery':
        return Colors.orange.shade700;
      case 'grains':
        return Colors.brown.shade500;
      case 'organic':
        return Colors.teal.shade700;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          final name = widget.categories[index];
          final bool isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.green.shade100 : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? Colors.green : Colors.grey.shade300,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    _getIcon(name),
                    size: 20,
                    color: _getIconColor(name),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.green.shade800 : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_app/app_router.dart';
import 'package:responsive_app/data/product_data.dart';
import 'package:responsive_app/model/product_model.dart';
import 'package:responsive_app/widgets/product_card.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int _selectedCategoryIndex = 0;

  final List<String> _categories = const [
    'All',
    'Audio',
    'Accessories',
    'Peripherals',
  ];

  

  List<ProductModel> get _filteredProducts {
    if (_selectedCategoryIndex == 0) {
      return ProductData.products;
    }
    final String selected = _categories[_selectedCategoryIndex];
    return ProductData.products
        .where((product) => product.description == selected)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool isNarrow = constraints.maxWidth <= 430;
            final int columns = isNarrow ? 2 : 3;
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isNarrow ? 12 : 24,
                vertical: 14,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Explore',
                    style: TextStyle(
                      color: Color(0xFF818181),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'All Products',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 42,
                            fontWeight: FontWeight.w800,
                            height: 1.05,
                          ),
                        ),
                      ),
                      Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2D2D2D),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.tune,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search products...',
                      hintStyle: const TextStyle(color: Color(0xFF8B8B8B)),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xFF8B8B8B),
                      ),
                      filled: true,
                      fillColor: const Color(0xFF2D2D2D),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF3B3B3B)),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF5A5A5A)),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 48,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final bool isSelected = _selectedCategoryIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedCategoryIndex = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(horizontal: 22),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF4565C6)
                                  : const Color(0xFF2F2F2F),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Center(
                              child: Text(
                                _categories[index],
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : const Color(0xFFA3A3A3),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemCount: _categories.length,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: GridView.builder(
                      itemCount: _filteredProducts.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        crossAxisSpacing: isNarrow ? 10 : 12,
                        mainAxisSpacing: isNarrow ? 10 : 12,
                        childAspectRatio: isNarrow ? 0.64 : 0.68,
                      ),
                      itemBuilder: (context, index) {
                        final ProductModel product = _filteredProducts[index];
                        return GestureDetector(
                          onTap: () {
                            print('Tapped on product: ${product.name}');
                            context.push(
                              '/details/${product.id}',
                            );
                          },
                          child: ProductCard(
                            product: product ,                       
                            ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

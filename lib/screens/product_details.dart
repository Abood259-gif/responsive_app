import 'package:flutter/material.dart';
import 'package:responsive_app/model/product_model.dart';
import 'package:responsive_app/widgets/custem_pageview.dart';
import 'package:responsive_app/widgets/size_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsPage extends StatefulWidget {
  ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final ProductModel product = ProductModel(
    name: 'Yello Headphone',
    description:
        'This is a high-quality headphone with excellent sound clarity and comfort. It features noise-cancellation technology, long battery life, and a sleek design.',
    price: 99.99,
    image: 'assets/images/headphone.jpg',
    numreviews: 100,
    rating: 5,
  );

  final ProductModel product2 = ProductModel(
    name: 'Red Headphone',
    description:
        'This is a high-quality headphone with excellent sound clarity and comfort. It features noise-cancellation technology, long battery life, and a sleek design.',
    price: 200,
    image: 'assets/images/red_headphone.avif',
    numreviews: 120,
    rating: 4,
  );

  final ProductModel product3 = ProductModel(
    name: 'Blue Headphone',
    description:
        'This is a high-quality headphone with excellent sound clarity and comfort. It features noise-cancellation technology, long battery life, and a sleek design.',
    price: 50.99,
    image: 'assets/images/blue_headphone.jpg',
    numreviews: 200,
    rating: 3,
  );

  final PageController _pageController = PageController();
  int page_indx = 0;
  int current_indx = 0 ;
   late List<ProductModel> products = [product, product2, product3];
   late List<String> product_images = products.map((e) => e.image).toList();
   late List<String> sizes = ['S', 'M', 'L', 'XL'];
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 18, 25),
      appBar: AppBar(
        backgroundColor: Color(0xFF0F1015),
        title: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            const Icon(Icons.arrow_back, color: Colors.white),
            const Text(
              'Product Details',
              style: TextStyle(color: Colors.white, fontWeight: .bold),
            ),
            const Icon(Icons.favorite_border_outlined, color: Colors.white),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * 0.4,
                        child: CustemPageview(
                        onPageChanged_: (index) {
                            setState(() {
                              page_indx = index;
                            });
                          },
                          pageController: _pageController,
                          productImages: product_images,
                          constraints: constraints,
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.02),
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: product_images.length,
                        effect: WormEffect(
                          dotColor: const Color.fromARGB(255, 135, 135, 135),
                          activeDotColor: Colors.green,
                        ),
                      )
                    ]
                        ),
                          SizedBox(height: constraints.maxHeight * 0.02),
                          Padding(
                            padding:  EdgeInsets.all(constraints.maxHeight * 0.02),
                            child: Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Text( 
                                  products[page_indx].name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  padding:  EdgeInsets.all(constraints.maxHeight * 0.01  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF152B20),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        ' \$${products[page_indx].price}',
                                        style: const TextStyle(
                                          color: Color(0xFF1DE872),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    
                                    ],
                                  )
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.all(constraints.maxHeight * 0.02),
                            child: Row(
                              children: [
                                Row(
                                  children: List.generate(
                                    products[page_indx].rating,
                                    (index) =>  Icon( 
                                      Icons.star_rounded,
                                      color: const Color.fromARGB(255, 255, 159, 50),
                                      size: constraints.maxHeight * 0.03,
                                    ),
                                  ),
                                ),
                                Text( 
                                  ' ${products[page_indx].rating}',
                                  style: const TextStyle(
                                    color: Color(0xffd4a017),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text( 
                                  ' . ${products[page_indx].numreviews} reviews',
                                  style: const TextStyle(
                                    color: Color(0xFF6E6E77),
                                    fontSize: 17,
                                   fontWeight: .w700
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.02),
                          Padding(
                            padding:  EdgeInsets.all(constraints.maxHeight * 0.02),
                            child: Text(
                              products[page_indx].description,
                              style: const TextStyle(
                                color: Color(0xFF9E9EA8),
                                fontSize: 20,
                              
                              ),
                            ),
                          ),
                         
                          Divider(
                          endIndent: constraints.maxWidth * 0.05,
                          indent: constraints.maxWidth * 0.05,
                            color: const Color.fromARGB(255, 59, 59, 59),
                            thickness: 1,
                          ),
                           SizedBox(height: constraints.maxHeight * 0.02),
                          Padding(
                            padding:  EdgeInsets.all(constraints.maxHeight * 0.02),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('HEADBAND SIZE' , style: TextStyle(
                                color: Color(0xFF8E8E98),
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),),
                            ),
                          ) , 
                          SizedBox(height: constraints.maxHeight * 0.02),
                          Row(
                           
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              sizes.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current_indx = index;
                                  });
                                },
                                child: SizeWidget(
                                  padding: constraints.maxHeight * 0.02,
                                  text: sizes[index],
                                  current_indx: current_indx,
                                  indx: index,
                                ),
                              ),
                            ),
                          ) , 
                          SizedBox(height: constraints.maxHeight * 0.02),
                           Divider(
                            color: const Color.fromARGB(255, 59, 59, 59),
                            thickness: 1,
                          ),
                          SizedBox(height: constraints.maxHeight * 0.02),
                          ElevatedButton(
                            onPressed: () {
                              // Handle "Add to Cart" button press
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF23C563),
                              padding: EdgeInsets.symmetric(
                                horizontal: constraints.maxWidth * 0.3,
                                vertical: constraints.maxHeight * 0.02,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: SizedBox(
                              width: constraints.maxWidth * 0.3,
                              child: Row(
                                children: [
                                  Icon(Icons.shopping_cart, color: Colors.white, size: constraints.maxHeight * 0.03),
                                  
                                  const Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
              ),
            ),
          );
        },
      ),
    );
  }
}

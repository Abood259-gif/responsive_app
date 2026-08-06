import 'package:go_router/go_router.dart';
import 'package:responsive_app/screens/login_screen.dart';
import 'package:responsive_app/screens/product_details.dart';
import 'package:responsive_app/screens/products_screen.dart';
import 'package:responsive_app/screens/not_found_screen.dart';
import 'package:responsive_app/screens/profile_screen.dart';
import 'package:responsive_app/widgets/homeshell.dart';

class AppRouter {
  static String loginRoute = '/login';
  static String profileRoute = '/home/profile';
  static String productsRoute = '/home/products';
  static String productDetailsRoute = '/details/:id';
  static String notFoundRoute = '/notfound';
}

bool isLoggedIn = true;
final router = GoRouter(
  redirect: (context, state) {
    final is_logged_in = state.uri.path == AppRouter.loginRoute;
    if (!is_logged_in && !isLoggedIn) {
      return AppRouter.notFoundRoute;
    }
    return null; // Allow access to the login route
  },
  initialLocation: AppRouter.loginRoute,
  errorBuilder: (context, state) {
    return NotFoundScreen(location: state.uri.toString());
  },
  routes: [
    GoRoute(
      path: AppRouter.loginRoute,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRouter.productDetailsRoute,
      builder: (context, state) {
        final String? id = state.pathParameters['id'];
        return ProductDetailsPage(id: int.parse(id!));
      },
    ),
    ShellRoute(
      builder: (context, state, child) {
        return Homeshell(child: child);
      },
      routes: [
        GoRoute(
          path: AppRouter.productsRoute,
          builder: (context, state) => const ProductsScreen(),
        ),
        GoRoute(
          path: AppRouter.profileRoute,
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);

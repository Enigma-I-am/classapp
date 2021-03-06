import 'package:classapp/constants/route_names.dart';
import 'package:classapp/core/services/auth_service.dart';
import 'package:classapp/core/services/navigation_service.dart';
import 'package:classapp/core/services/notification_service.dart';
import 'package:classapp/core/viewmodels/baseviewmodel.dart';
import 'package:classapp/ui/locator.dart';

class StartUpViewmodel extends BaseViewmodel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final NotificationService _notify = locator<NotificationService>();

  Future handleStartUplogic() async {
    await _notify.init();
    var hasUserLoggedIn = await _authenticationService.isUserLoggedIn();

    if (hasUserLoggedIn) {
      _navigationService.navigateReplacmentTo(HomeViewRoute);
    } else {
      _navigationService.navigateReplacmentTo(LoginViewRoute);
    }
  }
}

import 'package:flutter_application_1/viewmodels/login_vm.dart';
import 'package:flutter_application_1/viewmodels/register_vm.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider<RegisterVm>(create: (_) => RegisterVm()),
  ChangeNotifierProvider<LoginVm>(create: (_) => LoginVm()),
];

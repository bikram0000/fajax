import 'package:fajax/model/fajax_model.dart';
import 'package:fajax/model/fajax_result.dart';

import 'fajax_platform_interface.dart';

class Fajax {
  static Fajax? _singleton;

  factory Fajax() {
    _singleton ??= Fajax._();
    return _singleton!;
  }

  Fajax._();

  Future<void> makeRequest({
    required FajaxModel fajaxModel,
    Function(FajaxResult)? onSuccess,
    Function(Map<dynamic, dynamic>)? onError,
  }) async{
    return await FajaxPlatform.instance.makeRequest(fajaxModel, onSuccess, onError);
  }
}

import 'package:flutter_getx_retrofit_example/app/data/core/resource.dart';
import 'package:flutter_getx_retrofit_example/app/data/core/resource_manager.dart';

extension ResourceManagerObserve on ResourceManager {
  void addObserver(
      {required ResourceManager? resource, bool clearResource = false}) {
    if (resource is InitializeResource) {
      result.listen((p0) {
        resource?.result.value = p0;
        if (clearResource) {
          if (p0.status == Status.success || p0.status == Status.error) {
            resource = null;
          }
        }
      });
      call();
    }
  }
}

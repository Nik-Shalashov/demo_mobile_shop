import 'package:demo_mobile_shop/data/core/dio/dio_error_unwrapper.dart';
import 'package:demo_mobile_shop/data/datasources/models/create_cart_request_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'checkout_remote_datasource.g.dart';

@RestApi()
abstract class CheckoutRemoteDataSource {
  @POST('/carts')
  Future<void> submitOrder(@Body() CreateCartRequestModel body);
}

class CheckoutRemoteDataSourceImpl
    with DioUnwrapper
    implements CheckoutRemoteDataSource {
  final _CheckoutRemoteDataSource _service;

  CheckoutRemoteDataSourceImpl(Dio dio) : _service = _CheckoutRemoteDataSource(dio);

  @override
  Future<void> submitOrder(CreateCartRequestModel body) =>
      _service.submitOrder(body).onError(unwrapDioException);
}
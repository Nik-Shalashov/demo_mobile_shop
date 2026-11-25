import 'package:demo_mobile_shop/data/core/dio/dio_error_unwrapper.dart';
import 'package:demo_mobile_shop/data/datasources/models/product_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'product_remote_data_source.g.dart';

@RestApi()
abstract class ProductRemoteDataSource {
  @GET('/products')
  Future<List<ProductModel>> getProducts();

  @GET('/products/{id}')
  Future<ProductModel> getProduct(@Path('id') int id);
}

class ProductRemoteDataSourceImpl with DioUnwrapper implements ProductRemoteDataSource {
  final _ProductRemoteDataSource _service;

  ProductRemoteDataSourceImpl(Dio dio) : _service = _ProductRemoteDataSource(dio);

  @override
  Future<List<ProductModel>> getProducts() =>
      _service.getProducts().onError(unwrapDioException);

  @override
  Future<ProductModel> getProduct(int id) =>
      _service.getProduct(id).onError(unwrapDioException);
}
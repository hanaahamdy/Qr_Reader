import 'package:dio/dio.dart';

class ApiHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        headers: {
          "Accept": "application/json",
          "Authorization":
              "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMDc5ODIyN2U3NmQ4NTQyYmFlYTQ0M2E2NmM3MDNlZTVjOGI5N2Y5NTFjYjFjNzFjZGRjMzJjMmQ5OTY3NTE1Y2RlNWE3N2VkNTFmNTc3ZjQiLCJpYXQiOjE2NzIwNDk2MzYsIm5iZiI6MTY3MjA0OTYzNiwiZXhwIjoxNzAzNTg1NjM2LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.XWI18e-K3jKwt45P7WQZjKpX-rS-6cla4tvvIGzw9z7Vq-48-242U6GlosBc0wsXcsQBjpbxfokI9po1PQfA5psPRm5ZGyDRB53HjgfWx5RYt2bkVOdiLX9xLG8T2B4wyUaV60Q_23IP9zXziaYBM1SMOgN0Z_B4lLbMAR-CFXp0Uj9H33ad7Tl3AggRO4c3Xksj0G8QUZwtS6IyGesotqfzVg9VMQgL2lNuF1usUPXAo0u8FPWq1Wd-9j-E-PcUbqtGoSHe8HAIkpw8OO1hAXAeibO1_WKlflF0HHVFsF0AcrJBcC7KV_pcHS_-XT3d0aMtV8hV6SnawFLK326A2b4KgcXjOUZsSxgApfVl7VmOs4fCBlPMgkzcofosFx420cn7ASvZN_Yt_GemlBekFURmenihB469QUzURE3CAftjNdQ5RqI1-6So2hl12wvZ_W6CI63-LUEfC4jj4DB4ZMNr-XAXikpTRsvs6PZxR9dOCFuRwIJ1blyzRexhgvTg9PZX2VPE-9CkyliC2nfLryZnw9KdCctz-UokyjD_ZDzsS-PqfvTbA-Yrz8z3P0tlizVmLY5uq8HqcKXNAF9QRT2h2n1u2jK4ozUQT1SKz2nS8E-2EBtfzzhGV_omO7p50jnS2OIxrAp5egsG2qIwM-EyZHaM13NOLKCFUJcAwDU"
        },
        baseUrl: "https://fourthpyramidagcy.net/company/api/v1/",
        receiveDataWhenStatusError: true));
  }

  static Future postData(
      {required String url, required Map<String, dynamic> data}) async {
    return await dio.post(url, data: data);
  }

  static Future getData({
    String? token,
    required String url,
  }) async {
    return await dio.get(
      url,
    );
  }
}

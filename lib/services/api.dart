import 'package:hotel_test/models/booking.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../models/hotel.dart';
import '../models/hotel_rooms.dart';
import 'api_urls.dart';

part 'api.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @GET(ApiUrls.hotelUrl)
  Future<Hotel> getHotel();

  @GET(ApiUrls.roomsUrl)
  Future<HotelRooms> getRoomsMap();

  @GET(ApiUrls.reservationUrl)
  Future<Booking> getBooking();
}

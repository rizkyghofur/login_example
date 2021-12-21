import 'package:dio/dio.dart';
import 'package:login_example/constants/Constants.dart';
import 'package:login_example/constants/UrlConstants.dart';
import 'package:login_example/model/request/LoginRequest.dart';
import 'package:login_example/model/response/LoginResponse.dart';
import 'package:login_example/utils/Injector.dart';

class LoginRepository {
  final Dio dio = locator<Dio>();

  Future<LoginResponse> getLogin(String username, String password) async {
    try {
      LoginRequest request = new LoginRequest();
      request.username = username;
      request.password = password;

      dio.options.contentType = "application/x-www-form-urlencoded";
      Response response = await dio.post(UrlConstants.link,
          data: request.toJson());

      var map = Map<String, dynamic>.from(response.data);
      var fetchedResponse = LoginResponse.fromJson(map);

      return fetchedResponse;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  // Future<LoginResponse> getLogin(String username, String password) async {
  //   try {
  //     LoginRequest request = new LoginRequest();
  //     request.username = username;
  //     request.password = password;
  //
  //     dio.options.contentType = "application/x-www-form-urlencoded";
  //     Response response =
  //     await dio.post(UrlConstants.linkLogin, data: request.toJson());
  //
  //     List<MenuResponse> menuData = (response.data as List)
  //         .map((promoData) => MenuResponse.fromJson(promoData))
  //         .toList();
  //
  //     for (MenuResponse r in menuData) {
  //       await Menu()
  //           .select()
  //           .menuCode
  //           .equals(r.menuCode)
  //           .toSingle()
  //           .then((Menu menuData) {
  //         if (menuData == null) {
  //           Menu newMenu = new Menu();
  //           newMenu.menuCode = r.menuCode;
  //           newMenu.menuName = r.menuName;
  //           newMenu.image = r.image;
  //           newMenu.branchCode = r.branchCode;
  //           newMenu.price = r.price;
  //           newMenu.category = r.category;
  //           newMenu.recommended = r.recommended;
  //           newMenu.warehouse = r.warehouse;
  //           newMenu.createDate = r.createDate;
  //           newMenu.info = r.info;
  //           newMenu.point = r.point;
  //           newMenu.itemOrder = r.order;
  //           newMenu.publishToMarketPlace = r.publishToMarketPlace;
  //           newMenu.weight = r.weight;
  //           newMenu.variant = r.variant;
  //           newMenu.aliasCode = r.aliasCode;
  //           newMenu.aliasCodeDetail = r.aliasCodeDetail;
  //           newMenu.sizes = r.sizes;
  //           newMenu.entryDate = r.entryDate;
  //           newMenu.outOfOrder = r.outOfOrder;
  //           newMenu.number = int.parse(r.number);
  //           newMenu.video = r.video;
  //           newMenu.isVideoDownloaded = false;
  //           newMenu.GroupModifier = r.groupModifier;
  //           newMenu.otherName = r.otherName;
  //           newMenu.hexColor = r.hexColor;
  //           if (r.processTime == ".0" || r.processTime == "0.0") {
  //             newMenu.processTime = "0";
  //           } else {
  //             newMenu.processTime = r.processTime;
  //           }
  //           newMenu.reference = r.isParent == null ? "0" : r.isParent;
  //           newMenu.isParent = r.isParent == "0" ? false : true;
  //
  //           newMenu.save();
  //           if (newMenu.publishToMarketPlace == "1") {
  //             menus.add(newMenu);
  //           }
  //         } else {
  //           menuData.menuCode = r.menuCode;
  //           menuData.menuName = r.menuName;
  //           menuData.image = r.image;
  //           menuData.branchCode = r.branchCode;
  //           menuData.price = r.price;
  //           menuData.category = r.category;
  //           menuData.recommended = r.recommended;
  //           menuData.warehouse = r.warehouse;
  //           menuData.createDate = r.createDate;
  //           menuData.info = r.info;
  //           menuData.point = r.point;
  //           menuData.itemOrder = r.order;
  //           menuData.publishToMarketPlace = r.publishToMarketPlace;
  //           menuData.weight = r.weight;
  //           menuData.variant = r.variant;
  //           menuData.aliasCode = r.aliasCode;
  //           menuData.aliasCodeDetail = r.aliasCodeDetail;
  //           menuData.sizes = r.sizes;
  //           menuData.entryDate = r.entryDate;
  //           menuData.outOfOrder = r.outOfOrder;
  //           menuData.number = int.parse(r.number);
  //           menuData.video = r.video;
  //           menuData.isVideoDownloaded = false;
  //           menuData.GroupModifier = r.groupModifier;
  //           menuData.otherName = r.otherName;
  //           menuData.hexColor = r.hexColor;
  //           if (r.processTime == ".0" || r.processTime == "0.0") {
  //             menuData.processTime = "0";
  //           } else {
  //             menuData.processTime = r.processTime;
  //           }
  //           menuData.reference = r.isParent == null ? "0" : r.isParent;
  //           menuData.isParent = r.isParent == "0" ? false : true;
  //
  //           menuData.save();
  //           if (menuData.publishToMarketPlace == "1") {
  //             menus.add(menuData);
  //           }
  //         }
  //       });
  //     }
  //
  //     return response;
  //   } catch (error, stacktrace) {
  //     throw Exception("Exception occured: $error stackTrace: $stacktrace");
  //   }
  // }

  // Future<BaseResponse<LoginResponse>> login(String phone) async {
  //   try {
  //     LoginRequest request = new LoginRequest();
  //     request.token = Constants.appToken;
  //     request.email = phone;
  //     request.branch = Constants.appBranch + "/01";
  //
  //     dio.options.contentType = "application/json";
  //     Response response =
  //     await dio.post(UrlConstants.LOGIN_URL, data: request.toJson());
  //
  //     return LoginResponse.fromJson(
  //         response.data != null ? response.data : null, LoginResponse.fromJson);
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return BaseResponse<LoginResponse>.withError("$error");
  //   }
  // }
  //
  // Future<OngkirResponse> getOngkir(String latitude, String longitude) async {
  //   try {
  //     OngkirRequest request = new OngkirRequest();
  //     request.token = Constants.appToken;
  //     request.cabang = Constants.appBranch + "/01";
  //     request.latitude = latitude;
  //     request.longitude = longitude;
  //
  //     dio.options.contentType = "application/x-www-form-urlencoded";
  //     Response response = await dio.post(UrlConstants.GET_ONGKIR,
  //         data: request.toJson());
  //
  //     var map = Map<String, dynamic>.from(response.data);
  //     var fetchedResponse = OngkirResponse.fromJson(map);
  //
  //     return fetchedResponse;
  //   } catch (error, stacktrace) {
  //     throw Exception("Exception occured: $error stackTrace: $stacktrace");
  //   }
  // }
  //
  // Future<Account> getAccountData() async {
  //   try {
  //     return await Account().select().toSingle();
  //   } catch (e, s) {
  //     throw Exception("Exception occured: $e stackTrace: $s");
  //   }
  // }
}

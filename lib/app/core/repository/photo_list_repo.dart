import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../resource/urls.dart';
import '../utils/api_client.dart';
import '../utils/app_error.dart';
import '../../model/photo_list_model.dart';

class PhotoListRepository {
  Future<Either<AppError, List<PhotoListModel>>> fetchPhotoListData(
      {int pageIndex = 1}) async {
    var url = "${Urls.imageListUrl}?page=$pageIndex&limit=20";
    debugPrint(url);
    var response = await ApiClient().getRequest(url);
    debugPrint("photo list data ${response.body}");
    if (response.statusCode == 200) {
      List<PhotoListModel> data = photoListModelFromJson(response.body);
      return Right(data);
    } else {
      BotToast.closeAllLoading();
      return const Left(AppError.serverError);
    }
  }
}

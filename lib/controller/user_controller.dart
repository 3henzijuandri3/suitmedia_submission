import 'package:get/get.dart';
import 'package:suitmedia_submission/model/user_model.dart';
import 'package:suitmedia_submission/service/UserService.dart';

class UserController extends GetxController{
  var isLoading = false.obs;
  var hasMore = true.obs;
  final int limit = 8;
  int page = 1;

  final _listUser = <UserModel?>[].obs;
  List<UserModel?> get listUser => _listUser;

  final _selectedUserName = Rxn<String?>();
  String? get selectedUserName => _selectedUserName.value;

  Future<void> fetchListUser() async {

    isLoading(true);

    try{
      var getListUser = await UserService().getListUser(page, limit);

      if(getListUser.length < limit){
        hasMore(false);
      }

      _listUser.addAll(getListUser);

      page++;
    } catch(e) {
      isLoading(false);
      rethrow;

    } finally {
      isLoading(false);
    }
  }

  void selectUser(UserModel user){
    _selectedUserName.value = '${user.firstName} ${user.lastName}';
  }

  Future refreshUser() async {
    page = 1;
    hasMore(true);
    _listUser.value = [];

    await fetchListUser();
  }
}
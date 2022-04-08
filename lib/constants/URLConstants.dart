class UrlConstants {
  String endpoint = "https://e178-61-5-57-88.ngrok.io/";
  
  static const login = endpoint + "api/login";
  static const register = endpoint + "api/register";
  static const get_data = endpoint + "api/list-produk";
  static const get_data_by_id = endpoint + "api/show-produk/";
  static const add_data = endpoint + "api/create-produk/";
  static const update_data = endpoint + "api/update-produk/";
  static const delete_data = endpoint + "api/delete-produk/";
  static const getBiodata = endpoint + "api/getbiodata";
}

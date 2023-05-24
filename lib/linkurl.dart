
class AppLink {

  static const String server = "https://ecommerce77422.000webhostapp.com/admin";

  // ==============     Image       =================
  static const String imagestatic = "https://ecommerce77422.000webhostapp.com/upload";
  // ==============     Image       =================
  static const String imageCategories = "$imagestatic/categories";

  static const String imageItems = "$imagestatic/items";

  static const String test = "$server/test.php";

  //  ================== Notification ===================== //
  static const String notification = "$server/notification.php";

  //  ================== Auth ===================== //
  static const String login = "$server/auth/login.php";
  static const String verifyCodeSignUp = "$server/auth/verfiycode.php";
  static const String resend = "$server/auth/resend.php";

//  ================== forget Password ===================== //
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword = "$server/forgetpassword/resetpassword.php";
  static const String verifyCodeForgerPassword = "$server/forgetpassword/verifycode.php";

  //  ====================== Home  ===================== //
  static const String homepage = "$server/home.php"  ;

  //  ================  order  =================================== //
  static const String acceptedOrder = "$server/order/accepted.php" ;
  static const String doneOrder = "$server/order/done.php" ;
  static const String pendingOrdrs = "$server/order/pending.php" ;
  static const String archiveOrder = "$server/order/archive.php" ;
  static const String approveOrder = "$server/order/approve.php" ;
  static const String ordersdetail = "$server/order/details.php" ;

  //  ================  Category  =================================== //
  static const String viewcategory = "$server/categories/view.php" ;
  static const String addcategory = "$server/categories/add.php" ;
  static const String editcategory = "$server/categories/edit.php" ;
  static const String deletecategory = "$server/categories/delete.php" ;

  //  ====================== item  ===================== //
  static const String viewitems = "$server/items/view.php" ;
  static const String additems = "$server/items/add.php" ;
  static const String edititems = "$server/items/edit.php" ;
  static const String deleteitems = "$server/items/delete.php" ;

}
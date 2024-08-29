class AppValidator{
  static String? validateText(String? text){
    if(text!.isEmpty){
      return 'Please Enter your password';
    }
    return null;

    }
}
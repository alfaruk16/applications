import 'package:applications/core/error/text_field_info.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test("empty user name returns false", (){
    var result = TextFieldInfo().checkTextField("");
    expect(result, false);
  });

  test("non empty user name returns true", (){
    var result = TextFieldInfo().checkTextField("mob_user");
    expect(result, true);
  });
}
import 'dart:convert';

Map cleanJson(String json,
    {List<String> invalidValues = const ["-", "N/A", ""]}) {

  //decode json string as map to iterate each property
  final jsonObj = jsonDecode(json) as Map;

  //iterate each json property to remove where an invalid value exists 
  jsonObj.removeWhere((key, value) {

    //use try to iterate between List<dynamic> and Map where needed
    //this try allow validate the invalid value when it is not a List or Map type
    try {

      //verify the runtime type of the currect property to 
      //determinate witch process will remove the invalid value
      if (value.runtimeType.toString().toLowerCase().contains('list')) {

        //decode value to iterate each property/value to remove invalid values
        final objValue = value as List;
        objValue.removeWhere((e) => invalidValues.contains(e));

        //asssig the value to the main object after clean invalid values
        jsonObj[key] = objValue;

        //return false because the main key is not a string and we removed the invalid values parsing to another type
        return false;
      } else {
        //decode value to iterate each property/value to remove invalid values
        final objValue = value as Map;
        objValue.removeWhere((k, v) => invalidValues.contains(v));

        //asssig the value to the main object after clean invalid values
        jsonObj[key] = objValue;

        //return false because the main key is not a string and we removed the invalid values parsing to another type
        return false;
      }
    } catch (e) {
      //validate the invalid values to remove it directly in case of the value is not an List/Array/Map
      return invalidValues.contains(value);
    }
  });
  return jsonObj;
}

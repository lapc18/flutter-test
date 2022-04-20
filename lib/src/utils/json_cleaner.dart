import 'dart:convert';

Map cleanJson(String json,
    {List<String> invalidValues = const ["-", "N/A", ""]}) {
  final jsonObj = jsonDecode(json) as Map;
  jsonObj.removeWhere((key, value) {
    try {
      if (value.runtimeType.toString().toLowerCase().contains('list')) {
        final objValue = value as List;
        objValue.removeWhere((e) => invalidValues.contains(e));
        jsonObj[key] = objValue;
        return false;
      } else {
        final objValue = value as Map;
        objValue.removeWhere((k, v) => invalidValues.contains(v));
        jsonObj[key] = objValue;
        return false;
      }
    } catch (e) {
      return invalidValues.contains(value);
    }
  });
  return jsonObj;
}

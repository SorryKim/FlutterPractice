class Property {
  final String sec_len, up_min, down_min, start_z, end_z, cat_nam, mntn_nm;

  Property.fromJson(Map<String, dynamic> json)
      : mntn_nm = json['mntn_nm'],
        sec_len = json['sec_len'],
        up_min = json['up_min'],
        down_min = json['down_min'],
        start_z = json['start_z'],
        end_z = json['end_z'],
        cat_nam = json['cat_nam'];
}

class RouteModel {
  final int id;
  final List<Property> properties;

  RouteModel.fromJson(Map<String, dynamic> json) : id = json['id']
}

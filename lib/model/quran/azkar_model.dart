
class Azkar{
  List<Zekr> zekr = [];
  List<String>azkarCategory = [];
  Azkar.fromJson(Map<String,dynamic>json){
    json['azkar'].forEach((element){
      zekr.add(Zekr.fromJson(element));
      azkarCategory.add(element['category']);
    });
  }
}

class Zekr{
 String? category;
 String? count;
 String? description;
 String? reference;
 String? zekr;
 Zekr.fromJson(Map<String,dynamic>json){
   category=json['category'];
   count=json['count'];
   description=json['description'];
   reference=json['reference'];
   zekr=json['zekr'];
 }
}
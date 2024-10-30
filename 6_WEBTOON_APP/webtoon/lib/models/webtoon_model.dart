class WebtoonModel {
  final String title, thumb, id;

  // named constructor (이름이 있는 클래스 생성자)
  // json으로 부터 WebtoonModel 인스턴스를 생성할 때 사용
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}

class PlayerModel {
  String name;
  String peace;
  int points;

  PlayerModel({
    this.name,
    this.peace,
    this.points = 0,
  });

  win() => this.points++;
}

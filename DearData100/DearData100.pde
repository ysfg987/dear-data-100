Table sessions;

void setup() {
  size(800, 600);
  sessions = loadTable("data.csv", "header");
}

void draw() {
  background(255);
  noStroke();
  for (int i = 0; i < sessions.getRowCount(); i++) {
    TableRow row = sessions.getRow(i);
    float x = 60 + (i % 10) * 75;
    float y = 60 + (i / 10) * 75;
    fill(colourFor(row.getString("project")));
    circle(x, y, sizeFor(row.getInt("minutes")));
  }
}

float sizeFor(int minutes) {
  return map(minutes, 0, 300, 10, 70);
}

color colourFor(String project) {
  if (project.equals("METEOR")) return color(255, 120, 0);
  if (project.equals("CITY")) return color(60, 120, 255);
  if (project.equals("DINO")) return color(40, 180, 90);
  return color(150);
}

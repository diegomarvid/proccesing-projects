//Genetic algorithm by Diego Marvid, insipred by Daniel Shiffman
//02/11/17
//Optimal angle for longer distance projectile 


Population population;

float d = 70; //Height of the grass

PVector target; //Choose a target further away and evaluate which one came closer (maximum distance)

int lifeCounter; //Counter for reaching lifetime

int lifetime; //Maximun time of each rocket

float mutationRate;

ArrayList<Float> averageOptimalAngles;
float averageAngle;
float currentOptimalAngle;


void setup() {
  size(640, 360);
  target = new PVector(width, height - d);

  lifetime = height;
  lifeCounter = 0;

  mutationRate = 0.01;
  population = new Population(mutationRate, 100);
  
  //Display angles
  averageOptimalAngles = new ArrayList<Float>();
  averageAngle = 0;
  currentOptimalAngle = 0;
  
}

void draw() {

  background(255);
  noStroke();
  fill(0, 119, 51);
  rect(0, height - d, 640, d);

  stroke(0);
  line(40, height-d, 40, 5);

  if (lifeCounter < lifetime) {
    population.live();
    lifeCounter++;
  } else { //If their reached their lifetime, generate a new generation of improved rockets
    if(currentOptimalAngle != 0){
    averageOptimalAngles.add(currentOptimalAngle);
    } 
    lifeCounter = 0;
    population.fitness();
    population.selection();
    population.reproduction();
  }

  calculateBestAngle();
  displayInfo();
}

float calculateBestAngle() {
  
  currentOptimalAngle = -population.maxAngle;
  float total = 0;
  for(float angle: averageOptimalAngles){
    total += angle;   
  }
  
  return total / averageOptimalAngles.size();
  
}

void displayInfo() {
  //Info
  fill(0);
  text("Generation #: " + population.generations, 50, 18);
  text("Mutation Rate: " + (mutationRate * 100) + " %", 50, 36);
  text("Population: " + (population.population.length), 50, 54);
  text("Average optimal angle: " + (calculateBestAngle()*180)/PI, 50, 72);
  text("Curren optimal angle: " + (currentOptimalAngle*180)/PI, 50, 90);
  //text("Cycles left: " + (lifetime - lifeCounter), 50, 90);
}
class Population{
  
  float mutationRate; //How much variety there is
  
  Rocket[] population; //The number of rockets
  
  ArrayList<Rocket> matingPool; //Pool in which we pick the parents for reproduction and natural selection
  
  int generations; //Counter for generations
  
  float maxAngle = 0; //Optimal angle for displaying in the canvas
  
  PVector gravity; //Force
  
  Population(float m, int num){
    mutationRate = m;
    population = new Rocket[num];
    matingPool = new ArrayList<Rocket>();
    generations = 0;
    
    for(int i = 0; i < population.length; i++){
      PVector location = new PVector(40,290); //Every rocket is thrown from the same spot
      population[i] = new Rocket(location, new DNA(),1.5);  //The magnitude of the initial velocity remains constant for all rockets at 1.5
    }
    
    gravity = new PVector(0,0.01); //Setting gravity
    
  }
  
  void live(){
    for(int i = 0; i < population.length; i++){
      population[i].run(gravity);  
    }
  
    
  }
  
  void fitness(){
    for(int i = 0; i < population.length; i++){
      population[i].fitness();
    }
  }
  
  void selection(){
    
    matingPool.clear();
    
    float maxFitness = getMaxFitness();
    for(int i = 0; i < population.length; i++){
      float fitnessNormal = map(population[i].fitness,0,maxFitness,0,1);
      int n = (int) (fitnessNormal*100); //A way of correlating its probability of being picked with its fitness
      for(int j = 0; j < n; j++){
        matingPool.add(population[i]);
        
      }
    }
    
  }
  
  void reproduction(){
    
    for(int i = 0; i < population.length; i++){
      int m = int(random(matingPool.size()));
      int d = int(random(matingPool.size()));
      
      Rocket mom = matingPool.get(m);
      Rocket dad = matingPool.get(d);
      
      DNA momgenes = mom.dna;
      DNA dadgenes = dad.dna;
      
      DNA child = momgenes.crossover(dadgenes);
      child.mutate(mutationRate);
      PVector location = new PVector(40, 290);
      population[i] = new Rocket(location,child,1.5); //Create another rocket with the angle of the crossover but with the same initial location and velocity
      
    }
    generations++; //Each time their reproduce, add one to generations
    
    
  }
  
  //Calculating the maxFitness for displaying and mapping the fitness for selection
  float getMaxFitness(){
    float record = 0;
    int index = 0;
    for(int i = 0; i < population.length;i++){
      if(population[i].fitness > record){
        record = population[i].fitness;
        index = i;
        
      }
    }
    maxAngle = population[index].dna.angle; // Getting the angle for maximum fitness
    return record;
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
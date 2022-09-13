import wollok.game.*

object concursoBaile {
	
	const participantes = []
	
	method iniciar() {
		game.title("Concurso de Baile")
		game.boardGround("fondo.jpg")
		game.height(10)
		game.width(18)	
		
		game.addVisual(profe)
		participantes.add(profe)
		
		keyboard.space().onPressDo({self.presentarse()})
		keyboard.enter().onPressDo({self.detenerse()})
		
		
	}
	
	method presentarse() {
		participantes.forEach{p=> p.bailar()}
	}
	
	method detenerse() {
		participantes.forEach{p=> p.detener()}
	}
	
}

object profe{
	
	var image = "dino.png"
	
	method position() = game.at(1,3)
	
	method bailar(){
		game.onTick(1500,"cambiar",{self.cambiarImagen()})
	}
	
	method detener() {
		game.removeTickEvent("cambiar")
	}

	method cambiarImagen(){
		image = "cactus.png"
		game.schedule(1000, {image = "dino.png"})
	}


	method image() = image
	
} 

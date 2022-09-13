import wollok.game.*
import martina.*
import pareja.*


object concursoBaile {
	
	const participantes = [arcoIris,fanDeTitanic,martina,irina,pareja,robot,dragonBall]
	
	method iniciar() {
		game.title("Concurso de Baile")
		game.boardGround("fondo.jpg")
		game.height(10)
		game.width(18)	
		
		
		game.addVisualCharacter(profe)
		participantes.forEach{p=>game.addVisual(p)}
		
		keyboard.space().onPressDo({self.presentarse()})
		keyboard.enter().onPressDo({self.detenerse()})
		
		game.onCollideDo(profe,{quien=>game.say(profe,quien.toString())})
		
		
		
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
	
	var property position = game.center()
	
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

object arcoIris {

	const colores = ["Amarillo","Azul","Naranja","Rojo","Violeta","Verde"]
	var pos = 1
	
	method position() = game.at(3,3)
	
	method bailar(){
		game.onTick(100,"cambiar",{pos = (pos+1)%colores.size() })
	}
	
	method detener() {
		game.removeTickEvent("cambiar")
	}

	method image() = "juego" + colores.get(pos) + ".png"
//	method image() = "juego" + colores.anyOne() + ".png"
	
}


object fanDeTitanic {
	
	var personajeExtra = jack
	var edad = ".png"
	method position() = game.at(5,3)
	
	method bailar(){
		personajeExtra = rose
		game.schedule(2000,{edad = "Mayor.jpg"})
	}
	
	method detener() {
		personajeExtra = jack
	}

	method image() = personajeExtra.imagen() + edad
	
}

object rose{
	method imagen() = "rose"
}

object jack{
	method imagen() = "jack"
}

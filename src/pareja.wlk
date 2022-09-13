import wollok.game.*

object pareja {
   var image = "pareja.png"

   method position() = game.at(11,3)

       method bailar(){
        game.onTick(1000,"cambiar",{self.cambiarImagen()})
        game.onTick(750,"cambiar2",{self.cambiarImagen2()})
    }

    method detener() {
        game.removeTickEvent("cambiar")
        game.removeTickEvent("cambiar2")
    }

    method cambiarImagen(){
        image = "bailan.png"
        game.schedule(1000, {image = "pareja.png"})
    }

    method cambiarImagen2() {
    image = "bailan2.png"
    game.schedule(1000, {image = "pareja.png"})
    }
    
    method image() = image
}


object dragonBall{

    var image = "vegetta.jpg"
    var posicion = game.at(7,3)

    method position() = posicion

    method bailar(){
        game.onTick(1000,"cambiar",{self.cambiarImagen()})
        posicion = posicion.up(1)
    }

    method detener() {
        game.removeTickEvent("cambiar")
        posicion = posicion.down(1) 
    }

    method cambiarImagen(){
        image = "superSashashin.jpg"
        game.schedule(2500, {image = "vegetta.jpg"})
    }

    method image() = image

}

object robot{

	var property position = game.at(13,3) 

    method bailar(){
        game.onTick(1000, "moverse", {self.moverse()})
    }

    method moverse(){
        position = game.at(13,7)
        game.schedule(200, {position = game.at(13,3)})
    }

    method detener(){
        game.removeTickEvent("moverse")
    }

    method image() = "robot.png" 
}
import wollok.game.*

object martina{
    var image = "persona1.png"

    method position() = game.at(9,3)

    method bailar(){
        game.onTick(2000, "bailar", {self.moverse()})
    }

    method moverse(){
        image = "persona1.png"
        game.schedule(2000, {image = "persona2.png"})
    }

    method detener(){
        game.removeTickEvent("bailar")
    }

    method image() = image

}

object irina{

    var image = "peluca.png"

    method position() = game.at(1,3)

    method bailar(){
        game.onTick(2000,"cambiar",{self.cambiarImagen()})
    }

    method detener() {
        game.removeTickEvent("cambiar")
    }

    method cambiarImagen(){
        image = "peluca2.png"
        game.schedule(400, {image = "peluca3.png"})
        game.schedule(800, {image = "peluca.png"})
        game.schedule(1200, {image = "peluca3.png"})
    }


    method image() = image

}

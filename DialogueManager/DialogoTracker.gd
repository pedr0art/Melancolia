extends Node

var primeiraparte = "Psicóloga: Olá, Tábata! Quanto tempo!\n\nTábata: Olá... Senti falta de vir aqui. Estava com muito trabalho acumulado e não tinha tempo para mais nada.\n\nPsicóloga: Não teve tempo mesmo?"

var primeiraescolha = ""

var segundaescolha = ""

var terceiraescolha = ""

var quartaescolha = ""
var segundaparte = "Psicóloga: Já que você começou falando do seu trabalho, tem algo mais que gostaria de compartilhar?\n\nTábata: Sério que nunca havia falado antes?\n\nPsicóloga: Nunca como um problema."
var quintaescolha = ""
var sextaescolha = ""
var setimaescolha = ""
var oitavaescolha = ""
var terceiraparte = "Psicóloga: Essa não é a primeira vez que você fala que se sente sem energia.\n\nTábata: É, sempre sinto isso.\n\nPsicóloga: Quer falar mais sobre?"
var nonaescolha = ""
var decimaescolha = ""
var decimaprimeiraescolha = ""
var decimasegundaescolha = ""
var quartaparte = "Psicóloga: Acho que exploramos bastante hoje. Como você se sente em relação ao que conversamos?"
var decimaterceiraescolha = ""


var quintaparte = "Psicóloga: Foi uma sessão significativa. Agradeço sua abertura, saiba que estou aqui. Até a próxima consulta."

var textofinal = ""

var juntetextos = false

var prim_1 = false

var prim_2 = false

var prim_3 = false

var seg_1 = false

var seg_2 = false

var seg_3 = false

var tri_1 = false

var tri_2 = false

var tri_3 = false

func _process(delta: float) -> void:
	if juntetextos:
		textofinal = (primeiraparte + "\n" + primeiraescolha + "\n\n" + segundaescolha + "\n\n" + terceiraescolha + "\n\n" + quartaescolha + "\n\n" + 
				 segundaparte + "\n" + quintaescolha + "\n\n" + sextaescolha + "\n\n" + setimaescolha + "\n\n" + oitavaescolha + "\n\n" +
				 terceiraparte + "\n" + nonaescolha + "\n\n" + decimaescolha + "\n\n" + decimaprimeiraescolha + "\n\n" + decimasegundaescolha + "\n\n" +
				 quartaparte + "\n" + decimaterceiraescolha + "\n\n" +
				 quintaparte).replace("\\n", "\n")

func get_textofinal_formatado() -> String:
	return textofinal.replace("\\n", "\n")

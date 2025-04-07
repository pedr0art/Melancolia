extends Node

var primeiraparte = "Psicóloga: Olá, Tábata! Quanto tempo!\n\nTábata: Olá... Senti falta de vir aqui. Estava com muito trabalho acumulado e não tinha tempo para mais nada.\n\nPsicóloga: Não teve tempo mesmo?"

var primeiraescolha = ""

var segundaparte = "Psicóloga: Já que você começou falando do seu trabalho, tem algo mais que gostaria de compartilhar?\n\nTábata: Sério que nunca havia falado antes?\n\nPsicóloga: Nunca como um problema."

var segundaescolha = ""

var terceiraparte = "Psicóloga: Essa não é a primeira vez que você fala que se sente sem energia.\n\nTábata: É, sempre sinto isso.\n\nPsicóloga: Quer falar mais sobre?"

var terceiraescolha = ""

var quartaparte = "Psicóloga: Acho que exploramos bastante hoje. Como você se sente em relação ao que conversamos?"

var quartaescolha = ""

var quintaparte = "Psicóloga: Foi uma sessão significativa. Agradeço sua abertura, saiba que estou aqui. Até a próxima consulta."

var textofinal = ""

var juntetextos = false

func _process(delta: float) -> void:
	if juntetextos:
		textofinal = (primeiraparte + "\n" + primeiraescolha + "\n\n" +
				 segundaparte + "\n" + segundaescolha + "\n\n" +
				 terceiraparte + "\n" + terceiraescolha + "\n\n" +
				 quartaparte + "\n" + quartaescolha + "\n\n" +
				 quintaparte).replace("\\n", "\n")

func get_textofinal_formatado() -> String:
	return textofinal.replace("\\n", "\n")

function getQuestion() {
    $.get("get_quizdata_live.php", function(data) {
        let result = data.split(";");
        $("#frage").text(result[0] || "Frage N.A.");
        $("#antwort1").text(result[1] || "Antwort 1 N.A.");
        $("#antwort2").text(result[2] || "Antwort 2 N.A.");
        $("#antwort3").text(result[3] || "Antwort 3 N.A.");
        $("#antwort4").text(result[4] || "Antwort 4 N.A.");


        //Richtige antwort grün färben...
        if (result[6] == "true") {
            document.querySelector(".antwortcontainer.a" + result[5]).classList.add("richtig");
        }
        else {
            //Klasse wieder entfernen wenn neue Frage aktiv wird...
            document.querySelector(".antwortcontainer.a1").classList.remove("richtig");
            document.querySelector(".antwortcontainer.a2").classList.remove("richtig");
            document.querySelector(".antwortcontainer.a3").classList.remove("richtig");
            document.querySelector(".antwortcontainer.a4").classList.remove("richtig");
        }





        //Geloggte Antwort gelb färben
        if (result[7] >= 1 && result[7] <= 4) {
            document.querySelector(".antwortcontainer.a1").classList.remove("logged");
            document.querySelector(".antwortcontainer.a2").classList.remove("logged");
            document.querySelector(".antwortcontainer.a3").classList.remove("logged");
            document.querySelector(".antwortcontainer.a4").classList.remove("logged");
            document.querySelector(".antwortcontainer.a" + result[7]).classList.add("logged");
        }
        else {
            //Klasse wieder entfernen wenn neue Frage aktiv wird...
            document.querySelector(".antwortcontainer.a1").classList.remove("logged");
            document.querySelector(".antwortcontainer.a2").classList.remove("logged");
            document.querySelector(".antwortcontainer.a3").classList.remove("logged");
            document.querySelector(".antwortcontainer.a4").classList.remove("logged");
        }
    });
}



//alle 2 sekunden prüfen
setInterval(getQuestion, 2000);
//zum start abfragen
getQuestion();
var questionArr = [
    "Is the unit effectively staffed?",
    "Are enough support staff (HCA) available for the shift?",
    "What is the patient load on the unit?",
    "Is the acuity level appropriate?",
    "Are all necessary resources available for the shift?",
    "Are full break times observed?",
    "Was scheduling collaborative?",
    "Are you well compensated for the work you do?",
    "Are PTO and vacation time approvals fair?",
    "Are there safety concerns that need to be addressed?",
    "What recommendations do you have to improve patient care during your shift? Please provide specific details and examples."
];


function createAnswerList(questionID) {
    var select = document.getElementById(questionID);
    var multAnsArr = [
        "",
        "Always",
        "Most of the time",
        "Neutral",
        "Sometimes",
        "Never"
    ];

    if (questionID == "answer3-select") {
        var multAnsArr = [
            "",
            "Very Low",
            "Low",
            "Medium",
            "High",
            "Very High"
        ];
    }

    for (var i=0; i<multAnsArr.length; i++) {
        var answer = document.createElement("option");
        answer.text = multAnsArr[i];
        select.add(answer);
    }
}



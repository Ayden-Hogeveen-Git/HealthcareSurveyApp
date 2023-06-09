//
//  ContentView.swift
//  HealthcareSurveyApp
//
//  Created by Ayden Hogeveen on 2023-03-24.
//
// TODO: back button
// TODO: Database management
// TODO: Background
//
//.background(LinearGradient(gradient: (Gradient(colors: [Color.blue, Color.red])), startPoint: .top, endPoint: .bottom))
//

import SwiftUI
import UIKit


struct ContentView: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    // Question and answer arrays
    var questionArr = ["Is the unit effectively staffed?", "Are enough support staff (HCA) available for the shift?", "What is the patient load on the unit?", "Is the acuity level appropriate?", "Are all necessary resources available for the shift?", "Are full break times observed?", "Was scheduling collaborative?", "Are you well compensated for the work you do?", "Are PTO and vacation time approvals fair?", "Are there safety concerns that need to be addressed?", "What recommendations do you have to improve patient care during your shift? Please provide specific details and examples."]
    
    let multAns = ["N/a", "Yes", "Most of the time", "Neutral", "Sometimes", "Never"]
        
    // Button vars
    @State private var questionNum: Int = -1
    @State private var answerArr = Array<String>(repeating:"", count: 11)
    
    
    var body: some View {
        VStack {
            switch (self.questionNum) {
            case -1:
                VStack {
                    Text("HEART")
                        .font(.largeTitle)
                        .padding()
                    Text("Healthcare Empowerment Assistance and Resilience Tool")
                        .font(.title2)
                        .padding()
                    
                    
                    Button(action: {
                        self.questionNum = 0
                    }, label: {
                        Text("Start Survey")
                    })
                    .font(.title2)
                    .offset(y: screenHeight / 3)
                    .padding()
                }
                .padding()
            case 0...9:
                // Display question and answer fields for questions
                VStack {
                    Text(questionArr[self.questionNum])
                        .font(.largeTitle)
                        .foregroundColor(Color.gray)
                        .position(x: screenWidth / 2.5, y: 50)
                        .padding()
                    
                    Picker("Please enter your answer: ", selection: $answerArr[self.questionNum]) {
                        ForEach(multAns, id: \.self) { answer in
                            Text(answer)
                        }
                    }

//                    Button(action: {
//                        self.questionNum -= 1
//                    }, label: {
//                        Text("Back")
//                    })
//                    .position(x: 10, y: screenHeight / 1.9)
//                    .padding()
                    
                    Button(action: {
                        self.questionNum += 1
                    }, label: {
                        Text("Next Question")
                    })
//                    .position(x: 110, y: screenHeight / 1.9)
                    .padding()
                    
                    Text("Your answer was \(answerArr[self.questionNum])")
                    .padding()
                }
                .padding()
            case 10:
                // Display question and answer field for last question
                VStack {
                    Text(questionArr[self.questionNum])
                        .font(.title)
                        .foregroundColor(Color.gray)
                        .position(x: screenWidth / 2, y: 100)
                        .padding()
                    
                    TextField("Feedback...", text: $answerArr[self.questionNum])
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.leading)
                        .offset(y: -screenHeight / 2.75)
                        .padding()
                        
                    
                    Button(action: {
                        self.questionNum += 1
                    }, label: {
                        Text("Submit")
                    })
                    .padding()
                }
            case 11:
                VStack {
                    ForEach(answerArr, id: \.self) { answer in
                        Text(answer)
                    }
                    
                    // Save and Log answers to Database (database not yet implemented)
                    Button(action: {
                        self.questionNum = -1
                        answerArr = Array<String>(repeating:"", count: 11)
                    }, label: {
                        Text("Save and Submit Answers")
                    })
                    
                    
                }
                .padding()
            default:
//                 Display error message if question number is out of expected range
                VStack {
                    Text("Page Error Occurred")
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

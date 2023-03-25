//
//  ContentView.swift
//  HealthcareSurveyApp
//
//  Created by Ayden Hogeveen on 2023-03-24.
//
// TODO: fix questionNum overflow error
// TODO: add picker options

import SwiftUI
import UIKit


struct ContentView: View {
    let screenWidth = UIScreen.main.bounds.width
//    let leftOffset = UIScreen.main.bounds.width / 10
    
    // Question and answer arrays
    var questionArr = ["Unit is effectively staffed", "Support staff available", "Patient LOAD on unit", "Appropriate acuity level", "Resources avaiable for the shift", "Break times were observed", "Scheduling was collaborative", "I am heard", "PTO vacation approval", "Safety concerns"]
    
    let multAns = ["Yes", "Most of the time", "Neutral", "Sometimes", "Never", "N/A"]
        
    // Button vars
    @State private var questionNum: Int = 0
    @State private var answerArr =  Array<String>(repeating:"", count: 10)
    
    var body: some View {
        VStack {
            
            switch (self.questionNum) {
            case 0:
                VStack {
                    Button(action: {
                        self.questionNum = 1
                    }, label: {
                        Text("Question 1")
                    })
                    .padding()
                }
                .padding()
            case 1...10:
                // Display question and answer fields for questions
                VStack {
                    Text(questionArr[self.questionNum])
                        .font(.largeTitle)
                        .foregroundColor(Color.gray)
                        .position(x: screenWidth / 4, y: 50)
                        .padding()
                    TextField("Enter your answer: ", text: $answerArr[self.questionNum])

                    Button(action: {
                        self.questionNum += 1
//                        answerArr[self.questionNum] = ""
                    }, label: {
                        Text("Submit")
                    })
                    .padding()
                    Text("Your answer was \(answerArr[self.questionNum])")
                        .padding()
                }
                .padding()
            
            case 11:
                VStack {
                    Text("/(answerArr[0...9])")
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
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

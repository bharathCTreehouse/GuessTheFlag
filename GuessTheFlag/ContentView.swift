//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Bharath Chandrashekar on 09/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /*ZStack {
            Color.red
            //Color.blue.offset(x: 20, y: 20)
            //Text("Hello, world!").background(.yellow)
            //Rectangle().fill(.yellow).frame(width: 200, height: 200).border(Color.black, width: 2)
            //Rectangle().fill(.blue).frame(width: 200, height: 200).offset(x:20.0, y:20.0)
        }
        .ignoresSafeArea()//.background(.green)*/
        ZStack {
            VStack(spacing: 0.0) {
                Color.red
                Color.blue
                LinearGradient(gradient: .init(colors: [.green, .yellow]), startPoint: .top, endPoint: .bottom)
                Text("Jeebu").frame(height: 100).background(.white.gradient).foregroundStyle(.purple.gradient)
            }
            Text("India is great").foregroundStyle(.secondary).padding(50).background(.ultraThinMaterial)
        }.ignoresSafeArea()
    }
}

struct GuessFlagContentView: View {
    @State private var countries: [String] = ["Estonia", "France", "Germany", "Ireland",
                                       "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer: Int = Int.random(in: 0 ... 2)
    @State private var showingScore: Bool = false
    @State private var scoreTitle: String = ""
    @State private var rightAnswerInstruction: String = ""
    @State private var userScore: Int = 0
    @State private var questionCount: Int = 1
    @State private var showGameOverAlert: Bool = false
    private let totalQuestCount: Int = 10
    private let tapFlagText: Text = Text("Tap the flag of").foregroundStyle(.white).font(.subheadline.weight(.heavy))
    private let guessFlagText: Text =               Text("Guess the Flag").font(.largeTitle.bold()).foregroundStyle(.white)

    
    var body: some View {
        return (ZStack {
            LinearGradient(gradient: .init(colors: [.red,.blue]), startPoint: .top, endPoint: .bottom)
            VStack {
                Spacer()
                guessFlagText
                VStack(spacing: 15.0) {
                    VStack {
                        tapFlagText
                        Text(countries[correctAnswer]).foregroundStyle(.white).font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { flagNumber in
                        Button {
                            flagTapped(flagNumber)
                        } label: {
                            //Image(countries[flagNumber]).clipShape(.capsule).shadow(radius: 5)
                            FlagImageView(flagImageName: countries[flagNumber])
                        }.alert(scoreTitle, isPresented: $showingScore) {
                            Button("OK") {
                                askQuestion()
                            }
                        } message: {
                            Text("Your score is \(userScore). \(rightAnswerInstruction)")
                        }.alert("Game over!\n Restarting now.", isPresented: $showGameOverAlert) {
                        }
                    }
                }.vertStackFlagFrame//.modifier(VerticalStackFlagFrameModifier())//.frame(maxWidth: .infinity).padding(.vertical, 20.0).background(.ultraThinMaterial).clipShape(.rect(cornerRadius: 20.0))
                Spacer()
                Spacer()
                Text("Score: \(userScore)/\(totalQuestCount)").foregroundStyle(.white).font(.title.bold())
                Spacer()
                Text("Question: \(questionCount) of \(totalQuestCount)").foregroundStyle(.white).font(.title.bold())
                Spacer()
            }.padding()
        }.ignoresSafeArea())
    }
    
    private func flagTapped(_ flagNumberTapped: Int) {
        scoreTitle = (flagNumberTapped == correctAnswer) ? "Correct!" : "Wrong!"
        if (flagNumberTapped == correctAnswer) {
            //The right answer has been selected.
            userScore = userScore + 1
            rightAnswerInstruction = ""
        }
        else {
            //The incorrect answer.
            rightAnswerInstruction = "\nThats the flag of \(countries[flagNumberTapped])."
        }
        showingScore = true
    }
    
    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0 ... 2)
        questionCount = questionCount + 1
        if (questionCount > totalQuestCount) {
            showGameOverAlert = true
            questionCount = 1
            userScore = 0
        }
    }
}


#Preview {
    GuessFlagContentView()
}

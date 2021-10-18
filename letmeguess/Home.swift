//
//  Home.swift
//  letmeguess
//
//  Created by Maksims Matulenko on 18/10/2021.
//

import SwiftUI
import Foundation

struct Home: View {
    
    @State private var answer = "Click me!"
    @State private var magics: Magics?
    @State var answers = []
    
    var body: some View {
        
        ZStack{
            ShakableViewRepresentable()
                .allowsHitTesting(false)
            Image("back")
                .resizable(resizingMode: .stretch)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("8 Ball")
                    .font(.system(size: 60, weight: .light))
                    .fontWeight(.bold)
                    .bold()
                Text("Shake and answer will appear!")
                    .fontWeight(.medium)
                Spacer()
                
                ZStack {
                    Image(/*@START_MENU_TOKEN@*/"8ball"/*@END_MENU_TOKEN@*/)
                        .frame(width: 350.0, height: 350.0)
                        .clipShape(Circle())
                    Button(action: {
                        // Generate random answer
                        //UserDefaults.standard.set(GlobalAnswers.shared.answers, forKey: "Ans")
                        self.getAnswer()
                    }, label: {
                        Text(answer)
                            .font(.system(size: 30, weight: .light, design: .serif))
                                .italic()
                            .foregroundColor(Color.white)
                            .lineLimit(nil)
                            .frame(width: 200, height: 100)
                    })
                        
                }
                Spacer()
                Spacer()
            }
            .onReceive(messagePublisher) { _ in self.getAnswer()
                
            }
        }
    }
    
    func getAnswer() {
        getJsonAnswer()
        //answers = UserDefaults.standard.array(forKey: "Ans")
        answers=GlobalAnswers.shared.answers
        let randomAnswer = Int.random(in: 0..<answers.count)
        answer=magics?.magic.answer ?? answers[randomAnswer] as! String
    }
    
    private func getJsonAnswer() {
        guard let url = URL(string: "https://8ball.delegator.com/magic/JSON/%3Cstring%3E") else {return}
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data else {return}
            if let decodedData = try? JSONDecoder().decode(Magics.self, from: data) {
                DispatchQueue.main.async {
                    self.magics = decodedData
                }
            }
        } .resume()
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

//
//  ContentView.swift
//  letmeguess
//
//  Created by Maksims Matulenko on 16/10/2021.
//

import SwiftUI
import Foundation

class GlobalAnswers {
    static let shared = GlobalAnswers()
    var answers = [
    "Yes",
    "No",
]
    private init(){}
    
    func addAnswer(newanswer: String){
        answers.append(newanswer)
    }
    
    func getArray() -> [String]{
            return answers
    }
}



struct ContentView: View {
    
    var body: some View {
        TabView {
            Home().tabItem({
                Image(systemName: "house")
                    .font(.title)
                Text("Home")
            })
            
            Settings().tabItem({
                Image(systemName: "gear")
                    .font(.title)
                Text("Settings")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

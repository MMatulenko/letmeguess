//
//  Settings.swift
//  letmeguess
//
//  Created by Maksim on 18/10/2021.
//

import SwiftUI
import Foundation

struct Settings: View {
    
    @State var name = ""
    var body: some View {
        ZStack{
            Image("back")
                .resizable(resizingMode: .stretch)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Type new answer below: ")
                    .bold()
                    .font(.title)
                TextField("input here", text: $name)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: 300.0, height: 80.0)
                    .border(Color(UIColor.separator))
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                Spacer()
                Button(action: {
                    GlobalAnswers.shared.addAnswer(newanswer: name)
                    //UserDefaults.standard.set(GlobalAnswers.shared.answers, forKey: "Ans")
                    print(GlobalAnswers.shared.getArray())
                    name=""
                }) {
                    Image(systemName: "paperplane.fill")
                        .resizable(resizingMode: .tile)
                        .foregroundColor(Color.black)
                        .font(.title)
                        .frame(width:100, height: 100)
                }
                Spacer()
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}

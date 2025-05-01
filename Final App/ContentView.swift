//
//  ContentView.swift
//  Final App
//
//  Created by Aidan J. Neff on 4/21/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var termOrDef: TermOrDef
    @State var arrayTest:[RealTerms] = []
    @State var otherArray: [String] = ["Test Term", "Test Def"]
    @State var newTerm: String = ""
    @State var newDefinition: String = ""
    @EnvironmentObject var removeFlashCard: RemoveFlashCard
    var body: some View {
        VStack {
            Section{
                List(arrayTest, id: \.self) {term in
                    Section {
                        Term(term: term)
                            .frame(height: 200)
                    }
                }
                Button("Switch Term To Definition Or Vise versa"){
                    termOrDef.tOrD.toggle()
                }
            }
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now()){
                removeFlashCard.maxFlashCard = arrayTest.count
            }
        })
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .frame(width: 370, height: 45)
            
            
            
            
            TextField("Enter A New Term", text: $newTerm)
                .multilineTextAlignment(.center)
                .autocapitalization(.none)
                .autocorrectionDisabled(true)
                .textFieldStyle(.roundedBorder)
                .frame(width: 350,height: 35)
            
        }
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .frame(width: 370, height: 45)
            
            
            
            
            TextField("Enter A New Definition", text: $newDefinition)
                .multilineTextAlignment(.center)
                .autocapitalization(.none)
                .autocorrectionDisabled(true)
                .textFieldStyle(.roundedBorder)
                .frame(width: 350,height: 35)
        }
        Button("Add Term/Definition"){
            arrayTest.append(RealTerms(term: "\(newTerm)", definition: "\(newDefinition)"))
        }
        
    }
}





struct RealTerms: Hashable{
    var term:String
    var definition:String
}
struct Term: View{
    @EnvironmentObject var termOrDef: TermOrDef
    var term:RealTerms
    var body: some View{
        if termOrDef.tOrD == true{
            Text(term.term)
        } else if termOrDef.tOrD == false{
            Text(term.definition)
        }
    }
}

class TermOrDef: ObservableObject{
    @Published var tOrD: Bool = true
}

class RemoveFlashCard: ObservableObject{
    @Published var flashCardToRemove: Int = 0
    @Published var maxFlashCard: Int = 0
}





#Preview {
    @StateObject var termOrDef = TermOrDef()
    @StateObject var removeFlashCard = RemoveFlashCard()
    ContentView()
        .environmentObject(termOrDef)
        .environmentObject(removeFlashCard)
}


struct EditArray: View{
    @State var removalNum: [Int] = []
    @EnvironmentObject var removeFlashCard: RemoveFlashCard
    var body: some View{
        Text("")
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now()){
                    for Int in 0...removeFlashCard.maxFlashCard{
                        var num = 0
                        removalNum.append(num)
                        num += 1
                    }
                }
            })
        Picker("Pick A Flashcard To Delete!", selection: removalNum){
            
        }
    }
}
//CShea16

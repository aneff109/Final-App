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
    @State var removeCard:Int = 0
    @State var termToRemove: String = ""
    @State var definitionToRemove: String = ""
    @State var testRemoveIt: Int = 0
    
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
        Stepper("Remove card: \(removeCard)", value: $removeCard, in: 0...arrayTest.count)
        Button("Remove Term/Definition"){
            if arrayTest.isEmpty != true{
                removeCard -= 1
                if removeCard >= 0 {
                    arrayTest.remove(at: removeCard)
                } else if removeCard < 0 {
                    removeCard = 0
                    arrayTest.remove(at: removeCard)
                }
            }
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





#Preview {
   @StateObject var termOrDef = TermOrDef()
   
   ContentView()
       .environmentObject(termOrDef)
}



//CShea16

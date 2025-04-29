//
//  ContentView.swift
//  Final App
//
//  Created by Aidan J. Neff on 4/21/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var termOrDef: TermOrDef
    @State var arrayTest:[RealTerms] = [RealTerms(term: "Term", definition: "Definition"), RealTerms(term: "Term2", definition: "Definition2")]
    @State var otherArray: [String] = ["Test Term", "Test Def"]
    @State var inputTerm = "Enter A Term"
    @State var inputDef = "Enter A Definition"
    
    var body: some View {
        VStack {
           
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

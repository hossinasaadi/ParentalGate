//
//  SwiftUIView.swift
//  
//
//  Created by HossinAsaadi on 1/24/24.
//

import SwiftUI

struct MathView: View, GateProtocol {
    
    @State var adultsItem: [NumberItem] = []
    @State var erroMessage: String = ""
    @State private var userNumber: String = ""

    var solved: ()->Void
    var dismiss: ()->Void

    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                ZStack(alignment: .center) {
                    VStack{
                       
                        Text("For adults only!")
                            .foregroundColor(Color.black)
                            .padding(.top, 32)
                        
                        Text("Enter the answer, please:")
//                            .foregroundColor(Color.appGray01)
                            .multilineTextAlignment(.center)
                            .padding(.top, 10)
                            .padding(.horizontal)
                        HStack{
                            if self.adultsItem.count == 2 {
                                Text("\(self.adultsItem[0].string) + \(self.adultsItem[1].string) =")
                                    .foregroundColor(Color.black)
                                    .padding(.top, 32)
                            }
                            
                            TextField("", text: $userNumber)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 90,height: 40)
                                .padding(.top, 32)
                        }
                        if self.erroMessage != "" {
                            Text("\(self.erroMessage)")
                                .font(.system(size: 19))
                                .foregroundColor(Color.red)
                        }
                        
                        VStack {
                            
                            Button {
                                if Int(self.userNumber) == self.adultsItem[0].number + self.adultsItem[1].number {
                                    self.erroMessage = ""
                                    self.solved()

                                    
                                }else {
                                    self.erroMessage = "your asnwer is wrong"
                                }
                                print("\(self.userNumber) - ")
                            } label: {
                                Text("Continue")
                                    .font(.system(size: 19))
                                    .foregroundColor(Color.black)
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 42)
                                    .background(Color.gray.opacity(0.6))
                                    .cornerRadius(20)
                                    .opacity((userNumber == "") ? 0.6 : 1)
                            }
                            .padding(.top, 16)
                            
                            Button {
                                self.dismiss()
                            } label: {
                                Text("Cancel")
                                    .font(.system(size: 19))
                                    .foregroundColor(Color.black)
                                    .padding(.horizontal, 42)
                                    
                            }
                            .padding(.top, 16)
                        }
                        .padding(.top, 16)
                        .padding(.bottom, 24)
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(20)
            }
            .padding(.horizontal, 16)
        }
        .frame(maxWidth: 330)
        .onAppear {
            self.adultsItem.removeAll()
            self.adultsItem.append(AdultItems[Int.random(in: 0...AdultItems.count - 1)])
            self.adultsItem.append(AdultItems[Int.random(in: 0...AdultItems.count - 1)])
        }
        
    }
}
struct NumberItem {
    let number: Int
    let string: String
}

let AdultItems = [
    NumberItem(number: 1, string: "1"),
    NumberItem(number: 2, string: "2"),
    NumberItem(number: 3, string: "3"),
    NumberItem(number: 4, string: "4"),
    NumberItem(number: 5, string: "5"),
]


#Preview {
    MathView(solved: {}, dismiss: {})
}

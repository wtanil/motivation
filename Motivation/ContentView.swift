//
//  ContentView.swift
//  Motivation
//
//  Created by William Suryadi Tanil on 16/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Are you closer to your goal?")
            }
            Spacer()
            HStack {
                Spacer()
                Button {
                    // do something
                } label: {
                    Text("Yes")
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color.black)
                        .background(Color.green)
                        .clipShape(Circle())
                }
                
                Spacer()
                Button {
                    // do something
                } label: {
                    Text("No")
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color.black)
                        .background(Color.green)
                        .clipShape(Circle())
                }
                
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Motivation
//
//  Created by William Suryadi Tanil on 16/05/24.
//

import SwiftUI

struct ContentView: View {
    
    private enum Mode {
        case home, setting
    }
    
    @State private var mode: Mode = .home
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Button {
                    self.mode = self.mode == .home ? .setting : .home
                } label: {
                    if self.mode == .home {
                        Image(systemName: "gear")
                            .imageScale(.large)
                    } else {
                        Image(systemName: "house")
                            .imageScale(.large)
                    }
                }
            }
            .padding()
            
            if mode == .home {
                HomeView()
            } else {
                SettingView()
            }
        }

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

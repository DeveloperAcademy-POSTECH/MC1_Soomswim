//
//  ContentView.swift
//  SoomshimUI
//
//  Created by 이지수 on 2022/04/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Header()
                .frame(width: nil, height: nil, alignment: .top)
            
            ScrollView() {
                Feed()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

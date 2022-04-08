//
//  ContentView.swift
//  soomswimProject
//
//  Created by Eddy on 2022/04/05.
//

import SwiftUI
import UIKit
import Combine



struct ContentView: View {
    
    var body: some View {

        BeforePostInputView()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        postInputView()
        nextPage()
        
    }
}

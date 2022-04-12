//
//  BackButton.swift
//  Soomswim
//
//  Created by 이지수 on 2022/04/12.
//

import SwiftUI

struct BackButton : View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.gray)
        }
    }
}

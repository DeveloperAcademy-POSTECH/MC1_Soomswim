//  ContentView.swift
//  soomswimProject
//
//  Created by 지준용 on 2022/04/05.
//

import SwiftUI
import UIKit
import Combine

//키보드 오르내리는 기능.
class KeyboardManager: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0
    @Published var isVisible = false
    
    var keyboardCancellable: Cancellable?
    
    init() {
        keyboardCancellable = NotificationCenter.default
            .publisher(for: UIWindow.keyboardWillShowNotification)
            .sink { [weak self] notification in
                guard let self = self else { return }
                
                guard let userInfo = notification.userInfo else { return }
                guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
                
                self.isVisible = keyboardFrame.minY < UIScreen.main.bounds.height
                self.keyboardHeight = self.isVisible ? keyboardFrame.height : 0
            }
    }
}



//게시글입력 전 페이지(임시)
struct ContentView: View {
    var body: some View {
        NavigationView(){
                NavigationLink(destination: postInputView()){
                Text("게시글 작성페이지로.")
                }
        }
    }
}




// TextView (게시글이 입력되는 페이지)

struct TextView: UIViewRepresentable {

    @Binding var text: String
    @Binding var font: UIFont
    

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
   
        return textView
  }
  
    func updateUIView(_ uiView: UITextView, context: Context) {

  }
    func makeCoordinator() -> Coordinator {
      Coordinator($text)
    }
    class Coordinator: NSObject {
      var text: Binding<String>
      
      init(_ text: Binding<String>) {
        self.text = text
      }
    }
  }

  extension TextView.Coordinator: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
      self.text.wrappedValue = textView.text
    }

}



//게시글 입력 페이지
struct postInputView: View {
    
    @ObservedObject var keyboardManager = KeyboardManager()
    @State var postInput = ""
    @State private var text: String = ""
    @State private var font: UIFont = UIFont()
    
    
    var body: some View {
        TextView(text: $text, font: $font)
            .padding()
            .edgesIgnoringSafeArea(keyboardManager.isVisible ? .bottom : [])

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


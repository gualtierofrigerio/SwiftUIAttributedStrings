//
//  ContentView.swift
//  SwiftUIAttributedStrings
//
//  Created by Gualtiero Frigerio on 20/08/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    @State private var inputText = ""
    
    var body: some View {
        VStack {
            TextField("Search text", text: $inputText)
            if #available(iOS 15, *) {
                Text(viewModel.getAttributedString(highlightText: inputText))
            } else {
                TextWithAttributedString(attributedString: viewModel.highlightText(matching: inputText))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}

//
//  ContentView.swift
//  iOSFonts
//
//  Created by Eric Ziegler on 11/18/22.
//

import SwiftUI

struct FontsView: View {
    
    @ObservedObject private var viewModel = FontsViewModel()
    
    var body: some View {
         NavigationStack {
            VStack {
                HStack {
                    Text("Font Weight:")
                    Spacer()
                    Picker("Font Weight", selection: $viewModel.selectedWeight) {
                        ForEach(viewModel.fontWeights, id: \.self) {
                            Text($0.displayText)
                        }
                    }
                    .pickerStyle(.menu)
                }
                .padding(.horizontal)
                TextField("Enter sample text", text: $viewModel.sampleText)
                    .padding(.leading)
                    .frame(height: 55)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                    .padding(.horizontal, 16)
                    .padding(.bottom, 12)
                List {
                    ForEach(viewModel.fonts, id: \.self) { font in
                        Text(viewModel.sampleText == "" ? font : viewModel.sampleText)
                            .font(Font.custom(font, size: 21))
                            .fontWeight(viewModel.selectedWeight)
                            .onTapGesture {
                                Task {
                                    viewModel.selectedFont = font
                                    viewModel.showSelectedFont = true
                                }
                            }
                    }
                }
            }
            .navigationTitle("iOS Fonts")
            .alert(isPresented: $viewModel.showSelectedFont) {
                Alert(title: Text("Font Details"), message: Text("\(viewModel.selectedFont) - \(viewModel.selectedWeight.displayText)"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct FontsView_Previews: PreviewProvider {
    static var previews: some View {
        FontsView()
    }
}

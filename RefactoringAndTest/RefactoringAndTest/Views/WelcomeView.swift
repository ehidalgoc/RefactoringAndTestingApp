//
//  WelcomeView.swift
//  RefactoringAndTest
//
//  Created by BPIMA_ALW1090 on 12/9/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                // Welcome Title
                Text("Welcome to MyApp!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.top, 50)
                
                // Welcome Subtitle
                Text("We're glad to have you here. Let's get started!")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(.bottom, 30)
                
                Spacer()
                
                // Button to login
                NavigationLink(destination: LoginView()) {
                    Text("Get Started")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                }
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
            }
            .padding()
            .navigationTitle("Welcome")
        }
    }
}

#Preview {
    WelcomeView()
}

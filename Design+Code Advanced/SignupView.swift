//
//  ContentView.swift
//  Design+Code Advanced
//
//  Created by Justin747 on 11/5/21.
//

import SwiftUI
import AudioToolbox
import FirebaseAuth

struct SignupView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var editingEmailText: Bool = false
    @State private var editingPasswordText: Bool = false
    @State private var emailIconBounce: Bool = false
    @State private var passwordIconBounce: Bool = false
    @State private var showProfileView: Bool = false
    
    private let generator = UISelectionFeedbackGenerator()
    
    
    var body: some View {
        
        ZStack {
            
            Image("background-3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Sign Up")
                        .font(Font.largeTitle.bold())
                        .foregroundColor(Color.white)
                    
                    Text("Access to 120+ hours of courses, tutorials, and livestreams")
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                        .opacity(0.7)
                    
                    HStack(spacing: 12.0) {
                        
                        TextFieldIcon(iconName: "envelope.open.fill", currentlyEditing: $editingEmailText)
                            .scaleEffect(emailIconBounce ? 1.2 : 1.0)
                        TextField("Email", text: $email)
                            .onTapGesture {
                                editingPasswordText = false
                                editingEmailText = true
                                generator.selectionChanged()
                                
                                if editingEmailText {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                                        emailIconBounce.toggle()
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now()+0.25) {
                                        withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                                            emailIconBounce.toggle()
                                        }
                                    }
                                }
                            }
                            .colorScheme(.dark)
                            .foregroundColor(Color.white.opacity(0.7))
                            .autocapitalization(.none)
                            .textContentType(.emailAddress)
                            .disableAutocorrection(true)
                    }
                    .frame(height: 52)
                    .overlay(
                        
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white, lineWidth: 1.0)
                            .blendMode(.overlay))
                    .background(Color("secondaryBackground").cornerRadius(16.0).opacity(0.8))
                    
                    HStack(spacing: 12.0) {
                        
                        TextFieldIcon(iconName: "key.fill", currentlyEditing: $editingPasswordText)
                            .scaleEffect(passwordIconBounce ? 1.2 : 1.0)
                        SecureField("Password", text: $password)
                            .onTapGesture {
                                generator.selectionChanged()
                                editingPasswordText = true
                                editingEmailText = false
                                if editingPasswordText {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                                        passwordIconBounce.toggle()
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now()+0.25) {
                                        withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                                            passwordIconBounce.toggle()
                                        }
                                    }
                                }
                            }
                            .colorScheme(.dark)
                            .foregroundColor(Color.white.opacity(0.7))
                            .autocapitalization(.none)
                            .textContentType(.password)
                        
                    }
                    .frame(height: 52)
                    
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white, lineWidth: 1.0)
                            .blendMode(.overlay))
                    .background(Color("secondaryBackground").cornerRadius(16.0).opacity(0.8))
                    
                    
                    
                    GradientButton(buttonTitle: "Create Account") {
                        generator.selectionChanged()
                        signup()
                    }
                    .onAppear {
                        Auth.auth().addStateDidChangeListener { auth, user in
                            if user != nil {
                                showProfileView.toggle()
                            }
                        }
                    }
                    
                    Text("By clicking on 'Sign Up', you agree to our Terms Of Services and Privacy Policy")
                        .font(.footnote)
                        .foregroundColor(Color.white.opacity(0.7))
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.white.opacity(0.1))
                    
                    VStack(alignment: .leading, spacing: 16, content: {
                        Button(action: {
                            print("Switch to Sign Up")
                        }, label: {
                            HStack(spacing: 4) {
                                Text("Already have an account?")
                                    .font(.footnote)
                                    .foregroundColor(Color.white.opacity(0.7))
                                GradientText(text: "Sign In")
                                    .font(Font.footnote.bold())
                                
                            }
                        })
                    })
                }
                .padding(20)
            }
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.white.opacity(0.2))
                    .background(Color("secondaryBackground").opacity(0.5))
                    .background(VisualEffectBlur(blurStyle: .systemThinMaterialDark))
                    .shadow(color: Color("shadowColor").opacity(0.5), radius: 60, x: 0, y: 30)
                
            )
            .cornerRadius(30)
            .padding(.horizontal)
            
        }
//        .fullScreenCover(isPresented: $showProfileView) {
//            ProfileView()
//        }
    }
    
    func signup() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            print("User signed up")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}



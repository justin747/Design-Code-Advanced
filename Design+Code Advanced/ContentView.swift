//
//  ContentView.swift
//  Design+Code Advanced
//
//  Created by Justin747 on 11/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
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
                        
                        Image(systemName: "envelope.open.fill")
                            .foregroundColor(Color.white)
                        TextField("Email", text: $email)
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
                        
                        Image(systemName: "key.fill")
                            .foregroundColor(Color.white)
                        SecureField("Password", text: $password)
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
                    
                    GradientButton()
                    
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
                .shadow(color: Color("shadowCOlor").opacity(0.5), radius: 60, x: 0, y: 30)
                
            )
            .cornerRadius(30)
            .padding(.horizontal)
        }
    }
}
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }


extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
    }
}

struct GradientText: View {
    
    var text: String = "Text here"
    var body: some View {
        Text(text)
            .gradientForeground(colors: [Color("pink-gradient-1"), Color("pink-gradient-2")])
    }
}

struct GradientButton: View {
    
    var gradient1: [Color] = [
        Color.init(red: 101/255, green: 134/255, blue: 1),
        Color.init(red: 1, green: 64/255, blue: 80/255),
        Color.init(red: 109/255, green: 1, blue: 185/255),
        Color.init(red: 39/255, green: 232/255, blue: 1)
    ]
    
    var body: some View {
        Button(action: {
            print("Sign Up")
        }, label: {
            GeometryReader() { geometry in
                
                ZStack {
                    AngularGradient(gradient: Gradient(colors: gradient1), center: .center, angle: .degrees(0))
                        .blendMode(.overlay)
                        .blur(radius: 8.0)
                        .mask(
                            RoundedRectangle(cornerRadius: 16.0)
                                .frame(height: 50)
                                .frame(maxWidth: geometry.size.width - 16)
                                .blur(radius: 8.0)
                        )
                    
                    GradientText(text: "Sign Up")
                        .font(.headline)
                        .frame(width: geometry.size.width - 16)
                        .frame(height: 50)
                        .background(Color("tertiaryBackground").opacity(0.9))
                        .overlay(RoundedRectangle(cornerRadius: 16.0)
                                    .stroke(Color.white, lineWidth: 1.9)
                                    .blendMode(.normal)
                                    .opacity(0.7))
                        .cornerRadius(16.0)
                }
            }
            .frame(height: 50)
        })
    }
}

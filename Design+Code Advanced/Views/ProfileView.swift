//
//  ProfileView.swift
//  Design+Code Advanced
//
//  Created by Justin747 on 11/10/21.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showAlertView: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var showSettingsView: Bool = false
    
    var body: some View {
        ZStack {
            Image("background-2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    HStack(spacing: 16) {
                        //                        ZStack {
                        //                            Circle()
                        //                                .foregroundColor(Color("pink-gradient-1"))
                        //                                .frame(width: 66, height: 66, alignment: .center)
                        //
                        //                            Image(systemName: "person.fill")
                        //                                .foregroundColor(Color.white)
                        //                                .font(.system(size: 24, weight: .medium, design: .rounded))
                        //                        }
                        //                        .frame(width: 66, height: 66, alignment: .center)
                        
                        GradientProfilePictureView(profilePicture: UIImage(named: "Profile")!)
                            .frame(width: 66, height: 66)
                        
                        VStack(alignment: .leading) {
                            Text("CM Punk")
                                .foregroundColor(Color.white)
                                .font(.title2)
                                .bold()
                            
                            Text("View Profile")
                                .foregroundColor(Color.white.opacity(0.7))
                                .font(.footnote)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showSettingsView.toggle()
                        }, label: {
                            TextFieldIcon(iconName: "gearshape.fill", currentlyEditing: .constant(true))
                        })
                    }
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.white.opacity(0.1))
                    
                    Text("Best In The World")
                        .foregroundColor(Color.white)
                        .font(.title2.bold())
                    
                    Label("Former WWE Champ. Future AEW Champ", systemImage: "calendar")
                        .foregroundColor(Color.white.opacity(0.7))
                        .font(.footnote)
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.white.opacity(0.1))
                    
                    HStack(spacing: 16) {
                        Image("Twitter")
                            .resizable()
                            .foregroundColor(Color.white.opacity(0.7))
                            .frame(width: 24, height: 24)
                        
                        Image(systemName: "link")
                            .foregroundColor(Color.white.opacity(0.7))
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                        
                        Text("designcode.io")
                            .foregroundColor(Color.white.opacity(0.7))
                            .font(.footnote)
                    }
                }
                .padding(16)
                
                GradientButton(buttonTitle: "Purchase AEW Premium") {
                    print("IAP")
                }
                .padding(.horizontal, 16)
                
                Button(action: {
                    print("Restore")
                }, label: {
                    GradientText(text: "Restore Purchases")
                        .font(.footnote.bold())
                })
                    .padding(.bottom)
            }
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.white.opacity(0.2))
                    .background(Color("secondaryBackground").opacity(0.5))
                    .background(VisualEffectBlur(blurStyle: .dark))
                    .shadow(color: Color("shadowColor").opacity(0.5), radius: 60, x: 0, y: 30)
            )
            .cornerRadius(30)
            .padding(.horizontal)
            
            VStack {
                Spacer()
                Button(action: {
                    signout()
                }, label: {
                    Image(systemName: "arrow.turn.up.forward.iphone.fill")
                        .foregroundColor(Color.white)
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .rotation3DEffect(Angle(degrees: 180), axis: (x: 0.0, y: 0.0, z: 1.0))
                        .background(Circle()
                                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                        .frame(width: 42, height: 42, alignment: .center)
                                        .overlay(VisualEffectBlur(blurStyle: .dark).cornerRadius(21)
                                                    .frame(width: 42, height: 42, alignment: .center)))
                })
            }
            .padding(.bottom, 64)
            
        }
        .colorScheme(.dark)
        .alert(isPresented: $showAlertView) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
        }
        .sheet(isPresented: $showSettingsView, content: {
            SettingsView()
        })
    }
    
    func signout() {
        do {
            try Auth.auth().signOut()
            presentationMode.wrappedValue.dismiss()
        } catch let error {
            alertTitle = "Uh oh"
            alertMessage = error.localizedDescription
            showAlertView.toggle()
        }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

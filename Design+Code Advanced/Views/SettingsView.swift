//
//  SettingsView.swift
//  Design+Code Advanced
//
//  Created by Justin747 on 11/16/21.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var editingNameField = false
    @State private var editingTwitterField = false
    @State private var editingSiteField = false
    @State private var editingBioField = false
    
    @State private var nameIconBounce = false
    @State private var twitterIconBounce = false
    @State private var siteIconBounce = false
    @State private var bioIconBounce = false
    
    @State private var name = ""
    @State private var twitter = ""
    @State private var site = ""
    @State private var bio = ""
    
    @State private var showImagePicker = false
    @State private var inputImage: UIImage?

    
    private let generator = UISelectionFeedbackGenerator()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Settings")
                    .foregroundColor(Color.white)
                    .font(.largeTitle.bold())
                    .padding(.top)
                Text("Manage your AEW Premium account")
                    .foregroundColor(Color.white.opacity(0.7))
                    .font(.callout)
                
                //MARK: - Choose Photo Button
                
                Button {
                    self.showImagePicker = true
                } label: {
                    HStack(spacing: 12) {
                        TextFieldIcon(iconName: "person.crop.circle", currentlyEditing: .constant(false), passedImage: $inputImage)
                        
                        GradientText(text: "Choose Photo")
                        
                        Spacer()
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white.opacity(0.1), lineWidth: 1)
                    )
                    .background(Color.init(red: 26/255, green: 20/255, blue: 51/255).cornerRadius(16))
                }
                
                //MARK: - Name Text Field
                
                GradientTextField(editingTextField: $editingNameField, textFieldString: $name, iconBounce: $nameIconBounce, textfieldPlaceholder: "Name", textfieldIconString: "textformat.alt")
                    .autocapitalization(.words)
                    .textContentType(.name)
                    .disableAutocorrection(true)
                
                
                
                //MARK: - Twitter Text Field
                
                GradientTextField(editingTextField: $editingTwitterField, textFieldString: $twitter, iconBounce: $twitterIconBounce, textfieldPlaceholder: "Twitter Handle", textfieldIconString: "at")
                    .autocapitalization(.words)
                    .textContentType(.name)
                    .disableAutocorrection(true)
                
                
                
                //MARK: - Site Text Field
                
                GradientTextField(editingTextField: $editingSiteField, textFieldString: $site, iconBounce: $siteIconBounce, textfieldPlaceholder: "Website", textfieldIconString: "link")
                    .autocapitalization(.none)
                    .keyboardType(.webSearch)
                    .disableAutocorrection(true)
                
                
                //MARK: - Bio Text Field
                
                
                GradientTextField(editingTextField: $editingBioField, textFieldString: $bio, iconBounce: $bioIconBounce, textfieldPlaceholder: "Bio", textfieldIconString: "text.justifyleft")
                    .autocapitalization(.sentences)
                    .keyboardType(.default)
                
                //MARK: - Save Settings to Core Data
                
                GradientButton(buttonTitle: "Save Settings") {
                    generator.selectionChanged()
                }
                
                Spacer()
            }
            
            .padding()
            
            Spacer()
        }
        .background(Color("settingsBackground").edgesIgnoringSafeArea(.all))
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$inputImage)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

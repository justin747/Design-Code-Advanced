//
//  GradientTextField.swift
//  Design+Code Advanced
//
//  Created by Justin747 on 11/17/21.
//

import SwiftUI

struct GradientTextField: View {
    
    @Binding var editingTextField: Bool
    @Binding var textFieldString: String
    @Binding var iconBounce: Bool
    
    var textfieldPlaceholder: String
    var textfieldIconString: String
    
    private let generator = UISelectionFeedbackGenerator()
    
    var body: some View {
        
        HStack(spacing: 12.0) {
            
            TextFieldIcon(iconName: textfieldIconString, currentlyEditing: $editingTextField)
                .scaleEffect(iconBounce ? 1.2 : 1.0)
            TextField(textfieldPlaceholder, text: $textFieldString) { isEditing in
                
                    editingTextField = isEditing
                    generator.selectionChanged()
                    
                    if isEditing {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                            iconBounce.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now()+0.25) {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                                iconBounce.toggle()
                            }
                        }
                    }
                }
                .colorScheme(.dark)
                .foregroundColor(Color.white.opacity(0.7))
                .disableAutocorrection(true)
        }
        .overlay(
            
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.white, lineWidth: 1.0)
                .blendMode(.overlay))
        .background(Color(red: 26/255, green: 20/255, blue: 51/255).cornerRadius(16.0))
    }
}

struct GradientTextField_Previews: PreviewProvider {
    static var previews: some View {
        GradientTextField(editingTextField: .constant(true), textFieldString: .constant("Random String"), iconBounce: .constant(false), textfieldPlaceholder: "Test Text", textfieldIconString: "textformat.alt")
    }
}

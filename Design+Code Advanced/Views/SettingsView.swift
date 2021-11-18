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
    
    private let generator = UISelectionFeedbackGenerator()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

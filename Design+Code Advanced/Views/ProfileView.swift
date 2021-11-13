//
//  ProfileView.swift
//  Design+Code Advanced
//
//  Created by Justin747 on 11/10/21.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Image("background-2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    HStack(spacing: 16) {
                        ZStack {
                            Circle()
                                .foregroundColor(Color("pink-gradient-1"))
                                .frame(width: 66, height: 66, alignment: .center)
                            
                            Image(systemName: "person.fill")
                                .foregroundColor(Color.white)
                                .font(.system(size: 24, weight: .medium, design: .rounded))
                        }
                        .frame(width: 66, height: 66, alignment: .center)
                        
                        VStack(alignment: .leading) {
                            Text("CM Punk")
                                .foregroundColor(Color.white)
                                .font(.title2)
                                .bold()
                            
                            Text("View Profile")
                                .foregroundColor(Color.white.opacity(0.7))
                                .font(.footnote)
                            
                        }
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

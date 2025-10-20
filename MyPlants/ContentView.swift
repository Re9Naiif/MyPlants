//
//  ContentView.swift
//  MyPlants
//
//  Created by reham naif  on 26/04/1447 AH.
//

import SwiftUI

extension Color {
static let appBackground = Color.black
static let titleText     = Color.white
static let bodyText      = Color.white.opacity(0.7)
static let dividerTint   = Color.white.opacity(0.2)
static let buttonText    = Color.white
static let greenStart    = Color(red: 0.19, green: 0.80, blue: 0.55)
static let greenEnd      = Color(red: 0.09, green: 0.65, blue: 0.43)
}

struct GlossyCapsule: ViewModifier {
func body(content: Content) -> some View {
content
.overlay(
LinearGradient(
colors: [Color.white.opacity(0.25), Color.white.opacity(0.06), .clear],
startPoint: .top, endPoint: .center
                )
.blendMode(.screen)
.clipShape(Capsule())
            )
.overlay(
Capsule().stroke(Color.white.opacity(0.12), lineWidth: 0.8)
            )
.shadow(color: .black.opacity(0.25), radius: 8, x: 0, y: 4)
    }
}
extension View {

func glossyCapsule() -> some View { modifier(GlossyCapsule()) }
}

struct ContentView: View {
var body: some View {
MyPlantsIntroView()
.preferredColorScheme(.dark)
    }
}

struct MyPlantsIntroView: View {
var body: some View {
ZStack {
    Color.appBackground.ignoresSafeArea()

VStack(alignment: .leading, spacing: 0) {
Spacer().frame(height: 8)

Text("My Plants 🌱")
.font(.system(size: 34, weight: .bold))
.foregroundColor(.titleText)
.padding(.horizontal, 24)
.padding(.top, 8)

Rectangle()
.fill(Color.dividerTint)
.frame(height: 1)
.padding(.top, 8)
.padding(.horizontal, 24)

ScrollView {
                    
VStack(spacing: 16) {
Image("زرعه")
.resizable()
.scaledToFit()
.frame(width: 220, height: 220)
.accessibilityLabel("Cute plant in a pot")
.padding(.top, 24)

Text("Start your plant journey!")
.font(.system(size: 22, weight: .semibold))
.foregroundColor(.titleText)
.multilineTextAlignment(.center)
.padding(.top, 10)

Text("Now all your plants will be in one place and we will help you take care of them :) 🪴")
.font(.system(size: 15))
.foregroundColor(.bodyText)
.multilineTextAlignment(.center)
.padding(.horizontal, 28)
.lineSpacing(2)

Spacer(minLength: 70)

Button(action: {
                            
                        }) {
Text("Set Plant Reminder")
.font(.system(size: 17, weight: .semibold))
.foregroundColor(.buttonText)
.frame(maxWidth: .infinity)
.padding(.vertical, 18)
.contentShape(Rectangle())
                        }
.background(
LinearGradient(
colors: [.greenStart, .greenEnd],
startPoint: .topLeading,
endPoint: .bottomTrailing
                            )
                        )
.clipShape(Capsule())
.glossyCapsule()
.padding(.horizontal, 24)
.padding(.top, 12)
.padding(.bottom, 100)
.accessibilityLabel("Set plant reminder")
                    }
.frame(maxWidth: .infinity)
.padding(.top, 50)
                }
            }
        }
    }
}

struct MyPlantsIntroView_Previews: PreviewProvider {
static var previews: some View {
Group {
ContentView().previewDisplayName("Default")
MyPlantsIntroView().previewDisplayName("MyPlants Screen")
        }
.preferredColorScheme(.dark)
    }
}

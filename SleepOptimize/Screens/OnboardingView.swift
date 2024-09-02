//
//  OnboardingView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 24/08/2024.
//

import SwiftUI


 struct SleepItem: Hashable {
    let icon: String
    let text: String
}


struct OnboardingView: View {
    
    @State private var onboardStep: FormStep = .one
    @State private var progress: Double = 0.25

    var body: some View {
        NavigationStack {
            ZStack {
                Color.darkPurple
                VStack(alignment: .leading, spacing: 30) {
                    if onboardStep != .one {
                        HStack(alignment: .center, spacing: 50) {
                            LinearProgressDemoView(progress: progress)
                            
                            Text("Skip")
                                .foregroundStyle(Color.lightPurple)
                                .fontWeight(.medium)
                        }
                    }
                    switch onboardStep {
                    case .one:
                        StepOneOnboarding(onboardStep: $onboardStep)
                    case .two:
                        StepTwoOnboarding()
                    case .three:
                        StepThreeOnboarding()
                    case .four:
                        StepFourOnboarding()
                     
                    }
                    Spacer()
                    if onboardStep != .one {
                        HStack {
                            Spacer()
                            if let nextStep = onboardStep.next() {
                                Button(action: {
                                    withAnimation {
                                        progress += 0.25
                                        onboardStep = nextStep
                                    }
                                }, label: {
                                    Text("Next")
                                        .padding()
                                        .padding(.horizontal, 20)
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.black)
                                })
                                .background {
                                    RoundedRectangle(cornerRadius: 12).fill(Color.lightPurple)
                                }

                            } else {
                                NavigationLink(destination: ConfirmationView(), label: {
                                    HStack {
                                        Text("Finish")
                                            .padding()
                                            .padding(.horizontal, 20)
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.black)
                                    }
                                    .background {
                                        RoundedRectangle(cornerRadius: 12).fill(Color.lightPurple)
                                    }
                                })
}

                        }
                    }
                }.padding()
            }
            .toolbar {
                
            }.background(Color.darkPurple)
        }
    }
}

struct StepOneOnboarding : View {
    @Binding var onboardStep: FormStep
    var body: some View {
        VStack(spacing: 50) {
            Spacer()
            Image("sleep_bed")
                .resizable()
                .scaledToFit()
            
            VStack {
                Text("Wellness")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                
                Text("Healthy sleep is the basis for a healthy life")
                    .font(.headline)
                
            }
            Spacer()
            VStack {
                Button(action: {
                    withAnimation {
                        onboardStep = .two
                    }
                }, label: {
                    Text("Get Started")
                        .padding()
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                })
                .background {
                    RoundedRectangle(cornerRadius: 12).fill(Color.lightPurple)
                }
                
               
                Button(action: {}, label: {
                    Text("Log in")
                        .padding()
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.lightPurple)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                }).background{
                    RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(Color.lightPurple, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                }
                
            }
            
        }.foregroundStyle(.white)
            
    }
}

struct StepTwoOnboarding : View {
    @State private var name: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 50) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Let's tailor your journey to better sleep")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                Text("The Sleep coach will use your answers to personalize your sleep and give better recommendations and tips")
                    .font(.subheadline)
            }

   
            
            VStack(alignment: .leading, spacing: 20) {
                Text("What is your name?")
                TextField("My name is", text: $name)
                    .frame(height: 49)
                    .padding(.horizontal)
                    .background {
                        RoundedRectangle(cornerRadius: 8).fill(Color.cardPurple)
                    }
                
            }
        }.foregroundStyle(.white)
    }
}


struct StepThreeOnboarding : View {
    @State private var gender: String = ""

    
    var body: some View {
        VStack(alignment: .leading, spacing: 50) {
            Text("While healthy sleep principles remain the same, recommendations differ by gender and age due to biological anf physiological differences")
                .font(.headline)
                .fontWeight(.medium)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Please, choose your gender")
                    .font(.title3)
                    .fontWeight(.medium)
                
                HStack(spacing: 20) {
                    HStack {
                        Text("Male")
                        Spacer()
                        Image(systemName: "checkmark")
                            .font(.subheadline)
                            .opacity(gender == "Male" ? 1 : 0)
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(gender == "Male" ? Color.lightPurple : .gray,  lineWidth: 2)
                    }
                    .onTapGesture {
                        withAnimation {
                            gender = "Male"
                        }

                    }
                    
                    HStack {
                        Text("Female")
                        Spacer()
                        Image(systemName: "checkmark")
                            .font(.subheadline)
                            .opacity(gender == "Female" ? 1 : 0)

                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(gender == "Female" ? Color.lightPurple : .gray,  lineWidth: 2)
                    }
                    .onTapGesture {
                        withAnimation {
                            gender = "Female"

                        }
                    }
                }
                Text("How old are you?")
                    .font(.title3)
                    .fontWeight(.medium)
                    .padding(.top, 40)
                NumberCarouselView()
                    .frame(height: 100)
            }
        }.foregroundStyle(.white)
    }
}

struct StepFourOnboarding : View {
    let sleepItems: [SleepItem] = [
           SleepItem(icon: "moon.zzz", text: "Deep Sleep"),
           SleepItem(icon: "bed.double", text: "Bedtime"),
           SleepItem(icon: "alarm", text: "Wake Up"),
           SleepItem(icon: "waveform.path.ecg", text: "Heart Rate"),
           SleepItem(icon: "thermometer", text: "Temperature"),
           SleepItem(icon: "moon.stars", text: "Sleep Quality")
       ]
    
    @State private var selectedItems: Set<SleepItem> = []

    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("What do you want to achieve?")
                .font(.title2)
                .fontWeight(.medium)
            
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(sleepItems, id: \.self) { sleep in
                        HStack {
                            Label(sleep.text, systemImage: sleep.icon)
                            Spacer()
                            Image(systemName: "checkmark")
                                .font(.subheadline)
                                .opacity(selectedItems.contains(sleep) ? 1 : 0)
                        }
                        .padding(20)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background{
                            RoundedRectangle(cornerRadius: 10).stroke( selectedItems.contains(sleep) ? Color.lightPurple : Color.customGray, lineWidth: selectedItems.contains(sleep) ? 3 : 1)
                        }
                        .onTapGesture {
                            withAnimation {
                                if selectedItems.contains(sleep) {
                                    selectedItems.remove(sleep)
                                } else {
                                    selectedItems.insert(sleep)
                                }
                            }
                        }
                    }
                }
            
            
            

        }.foregroundStyle(.white)
    }
}


#Preview {
    OnboardingView()
}

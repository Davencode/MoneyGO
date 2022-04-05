//
//  GoalsView.swift
//  MoneyGo
//
//  Created by Lorenzo Lins Mazzarotto on 16/11/21.
//

import SwiftUI

struct GoalsView: View {
    @Binding var goals: [Goals]
    @State private var isPresented = false
    @State private var newGoalData = Goals.Data()
    @ObservedObject var theme = ThemeSettings.shared
    var themes: [Themes] = themeData
    
    var body: some View {
        NavigationView {
            VStack {
                if goals.count != 0 {
                    List {
                        ForEach(goals) { goal in
                            NavigationLink(destination: DetailView(goal: binding(for: goal))) {
                                GoalCardView(goal: goal)
                            }
                            .contextMenu {
                                Button {} label: {
                                    Label("Edit", systemImage: "pencil")
                                }
                                Button {} label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                        .onDelete(perform: delete)
                    }
                } else {
                    Text("A fresh list, let’s get started!").font(.title3).bold()
                        .foregroundColor(themes[self.theme.themeSettings].color)
                }
            }
            .navigationTitle("Goals")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action: {
                    newGoalData = Goals.Data()
                    isPresented = true
                }) {
                    Image(systemName: "plus")
                }
            )
            
            .sheet(isPresented: $isPresented) {
                NavigationView {
                    EditView(goalData: $newGoalData)
                        .navigationBarItems(
                            leading: Button("Dismiss") {
                            isPresented = false
                        }, trailing: Button("Add") {
                            let newGoal = Goals(title: newGoalData.title, value: Int(newGoalData.value), date: newGoalData.date, priority: newGoalData.priority, color: newGoalData.color)
                            goals.append(newGoal)
                            isPresented = false
                        })
                        .navigationTitle("Create new goal")
                        .navigationBarTitleDisplayMode(.inline)
                        .accentColor(themes[self.theme.themeSettings].color)
                }
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        goals.remove(atOffsets: offsets)
    }
    
    private func binding(for goal: Goals) -> Binding<Goals> {
        guard let goalIndex = goals.firstIndex(where: { $0.id == goal.id }) else {
            fatalError("Can't find goal in array")
        }
        return $goals[goalIndex]
    }
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView(goals: .constant(Goals.data))
    }
}

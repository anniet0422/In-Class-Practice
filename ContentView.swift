//
//  ContentView.swift
//  NavTest2
//
//  Created by Annie Tran on 3/18/24.
//

import SwiftUI

var courses:[Courses] =
[.init(name: "Math", color: .red, imageName: "divide.circle.fill"), .init(name: "Science", color: .green, imageName: "atom"), .init(name: "History", color: .yellow, imageName: "book")]

var meetings:[Meetings] =
[.init(name: "Dinner", color: .red, location: "Velvet Taco", imageName: "takeoutbag.and.cup.and.straw"), .init(name: "Midnight Snack", color: .green, location: "Burger Mojo", imageName: "takeoutbag.and.cup.and.straw")]


struct ContentView: View {
    var body: some View {
        NavigationStack{
            List{
                Section("My Courses"){
                    ForEach(courses, id:\.name){
                        course in
                        
                        NavigationLink(value: course){
                            Label(course.name, systemImage: course.imageName).foregroundColor(course.color)
                        }
                    }
                    
                }
                Section("My Meetings"){
                    ForEach(meetings, id:\.name){
                        meeting in
                        
                        NavigationLink(value: meeting){
                            Label(meeting.name, systemImage: meeting.imageName).foregroundColor(meeting.color)
                        }
                    }
                }
            }
            .navigationTitle("My Schedule")
            .navigationDestination(for: Courses.self) { course in
                ZStack{
                    course.color.ignoresSafeArea()
                    Label(course.name, systemImage: course.imageName).font(.largeTitle).bold()
                }
                        }
            .navigationTitle("My Meetings")
            .navigationDestination(for: Meetings.self) { meeting in
                ZStack{
                    meeting.color.ignoresSafeArea()
                    VStack{
                        Label(meeting.name, systemImage: meeting.imageName).font(.largeTitle).bold()
                        Text(meeting.location).font(.subheadline)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct Courses: Hashable{
    let name: String
    let color: Color
    let imageName: String
}

struct Meetings: Hashable{
    let name: String
    let color: Color
    let location: String
    let imageName: String
}

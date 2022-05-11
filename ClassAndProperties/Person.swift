//
//  Person.swift
//  ClassAndProperties
//
//  Created by Mark Wong on 2022-05-10.
//

import Foundation

class Person {
  // property(instance variable + getter/setter)
  private(set) var name: String
  private(set) var age: Int
  
  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
  
  func printPersonInfo() {
    print("Name: \(name), Age: \(age)")
  }
}

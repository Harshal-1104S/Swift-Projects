//
//  ContentView.swift
//  SimpleCalculator2
//
//  Created by Mehta, Harshal on 2025-07-07.
//

import SwiftUI

struct ContentView: View {
    @State private var num1: Int = 0
    @State private var num2: Int = 0
    @State private var result: Double = 0.0
    @State private var operation: String = ""

    func calculateSum() {
        result = Double(num1 + num2)
        operation = "+"
    }

    func calculateDifference() {
        result = Double(num1 - num2)
        operation = "-"
    }

    func calculateProduct() {
        result = Double(num1 * num2)
        operation = "×"
    }

    func calculateQuotient() {
        if num2 != 0 {
            result = Double(num1) / Double(num2)
            operation = "÷"
        } else {
            operation = "÷"
            result = Double.nan
        }
    }

    func clearAll() {
        num1 = 0
        num2 = 0
        result = 0.0
        operation = ""
    }

    var body: some View {
        // Prepare display values with full if-statements
        let displayedOperation: String
        if operation.isEmpty {
            displayedOperation = "-"
        } else {
            displayedOperation = operation
        }

        let displayedResult: String
        if result.isNaN {
            displayedResult = "Error"
        } else {
            displayedResult = String(format: "%.2f", result)
        }

        return VStack(spacing: 20) {
            TextField("Enter first number", value: $num1, format: .number)
                .textFieldStyle(.roundedBorder)
                .padding()

            TextField("Enter second number", value: $num2, format: .number)
                .textFieldStyle(.roundedBorder)
                .padding()

            HStack(spacing: 15) {
                Button(action: calculateSum) {
                    Text("+")
                        .font(.title)
                        .frame(width: 60, height: 60)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }

                Button(action: calculateDifference) {
                    Text("-")
                        .font(.title)
                        .frame(width: 60, height: 60)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }

                Button(action: calculateProduct) {
                    Text("×")
                        .font(.title)
                        .frame(width: 60, height: 60)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }

                Button(action: calculateQuotient) {
                    Text("÷")
                        .font(.title)
                        .frame(width: 60, height: 60)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
            }

            Text("Result: \(displayedOperation) = \(displayedResult)")
                .font(.title2)
                .padding()

            Button(action: clearAll) {
                Text("Reset")
                    .font(.title3)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

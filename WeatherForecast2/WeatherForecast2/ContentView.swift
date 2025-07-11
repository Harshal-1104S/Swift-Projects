import SwiftUI

struct ContentView: View {
    let forecasts: [ForecastData] = {
        let weekDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
        var data: [ForecastData] = []

        for i in 0..<14 {
            let day = weekDays[i % 7]
            let isRain = Bool.random()
            let high = Int.random(in: 60...95)
            let low = Int.random(in: 30...59)
            data.append(ForecastData(day: day, isRain: isRain, high: high, low: low))
        }

        return data
    }()

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ChatBubble(text: "Forecast", color: .blue)

            WeekForecast(forecasts: forecasts)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(forecasts, id: \.self) { forecast in
                        DayForecast(
                            day: forecast.day,
                            isRain: forecast.isRain,
                            high: forecast.high,
                            low: forecast.low
                        )
                        .frame(width: 120) // helps with consistent card size
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    ContentView()
}

// MARK: - Forecast Model

struct ForecastData: Hashable {
    let day: String
    let isRain: Bool
    let high: Int
    let low: Int
}

// MARK: - Day Forecast View

struct DayForecast: View {
    let day: String
    let isRain: Bool
    let high: Int
    let low: Int

    var iconName: String {
        isRain ? "cloud.rain.fill" : "sun.max.fill"
    }

    var iconColor: Color {
        isRain ? .blue : (high > 80 ? .red : .yellow)
    }

    var textColor: Color {
        high > 80 ? .red : .primary
    }

    var body: some View {
        VStack {
            Text(day)
                .font(.callout)
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(.largeTitle)
                .padding(5)
            Text("High: \(high)º")
                .fontWeight(.semibold)
                .foregroundStyle(textColor)
            Text("Low: \(low)º")
                .fontWeight(.medium)
                .foregroundStyle(textColor)
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(12)
    }
}

// MARK: - Weekly Summary View

struct WeekForecast: View {
    let forecasts: [ForecastData]
    
    var avgHigh: Int {
        forecasts.map(\.high).reduce(0, +) / forecasts.count
    }
    
    var avgLow: Int {
        forecasts.map(\.low).reduce(0, +) / forecasts.count
    }
    
    var sunDays: Int {
        forecasts.filter { !$0.isRain }.count
    }
    
    var rainDays: Int {
        forecasts.filter { $0.isRain }.count
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Weekly Summary")
                .font(.title2)
                .bold()
            Text("14-Day Forecast")
            Text("Avg High: \(avgHigh)º | Avg Low: \(avgLow)º")
            Text("Sunny: \(sunDays) | Rainy: \(rainDays)")
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal)
    }
}

// MARK: - Chat Bubble View

struct ChatBubble: View {
    let text: String
    let color: Color

    var body: some View {
        Text(text)
            .padding()
            .background(color.opacity(0.15))
            .foregroundStyle(color)
            .cornerRadius(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
    }
}

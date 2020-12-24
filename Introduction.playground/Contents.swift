//Optionals

func getHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}


var status: String?
status = getHaterStatus(weather: "rain")

func takeHaterAction(status: String?){
    if status == "Hate" {
        print("Hating")
    }
}

takeHaterAction(status: <#T##String#>)

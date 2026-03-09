class NitroEventPipe: HybridNitroEventPipeSpec {
  var initialized: Bool = false
  var listeners: [(AccommodationMap) -> Void] = []
  
  static let HOTELS: [Accommodation] = [
    Accommodation("Breidenbacher Hof", 51.2248, 6.7785, "10293"),
    Accommodation("The Wellem", 51.2274, 6.7751, "44821"),
    Accommodation("Hyatt Regency Düsseldorf", 51.2163, 6.7538, "88302"),
    Accommodation("Steigenberger Icon Parkhotel", 51.2270, 6.7788, "31055"),
    Accommodation("25hours Hotel Das Tour", 51.2298, 6.7942, "55619"),
    Accommodation("Hotel Indigo Victoriaplatz", 51.2341, 6.7749, "22941"),
    Accommodation("Ruby Leni Hotel", 51.2198, 6.7761, "67432"),
    Accommodation("Living Hotel De Medici", 51.2272, 6.7744, "19033"),
    Accommodation("ME And All Hotel", 51.2245, 6.7865, "41120"),
    Accommodation("Meliá Düsseldorf", 51.2312, 6.7772, "77391")
  ]
  
  
  func onAccommodationMapChange(onAccomodationMapChanged: @escaping (AccommodationMap) -> Void) throws {
    listeners.append(onAccomodationMapChanged)
  }
  
  func requestAccommodationMap() throws -> Bool {
    if !initialized {
      initialized = true
      var hotels = Array<Accommodation>()
      hotels.append(contentsOf: Self.HOTELS.prefix(5))
      
      for listener in listeners {
        listener(AccommodationMap(results: hotels))
      }
      
      return true
    }
    
    return false
  }
  
  func selectAccommodation(hotelId: String) throws {
    DispatchQueue.main.async {
      let alertController = UIAlertController(title: "Accommodation selected", message: "Selected ID: \(hotelId)", preferredStyle: .alert)
      
      alertController.addAction(UIAlertAction(title: "OK", style: .default))

      UIApplication.shared.delegate?.window??.rootViewController?.present(alertController, animated: true)
    }
  }
  
  func refresh() throws {
    if initialized {
      for listener in listeners {
        listener(AccommodationMap(results: Self.HOTELS))
      }
    } else {
      let alertController = UIAlertController(title: "Caution", message: "Refresh impossible!", preferredStyle: .alert)
     
      UIApplication.shared.delegate?.window??.rootViewController?.present(alertController, animated: true)
    }
  }
}

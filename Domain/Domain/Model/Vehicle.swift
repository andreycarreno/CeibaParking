//
//  Vehicle.swift
//  Domain
//
//  Created by Jeison Andrey Carreño Sánchez - Ceiba Software on 26/08/21.
//
import Foundation

public class Vehicle {
    
    private var licencePlate: String
    private var admitionDate: Date
    private var typeVehicle: String
    
    public init(licencePlate: String, admitionDate: Date, typeVehicle: String) throws{
        self.licencePlate = licencePlate
        self.admitionDate = admitionDate
        self.typeVehicle = typeVehicle
        
        try validateLettrByDay(licencePlate: licencePlate, admitionDate: admitionDate)
    }
    
    public func getLicencePlate() -> String{
        return self.licencePlate
    }
    
    public func getAdmitionDate() -> Date{
        return self.admitionDate
    }
    
    public func getTypeVehicle() -> String{
        return self.typeVehicle
    }
    
    private func validateLettrByDay(licencePlate: String, admitionDate: Date) throws{
        let firstLetterPlate = "a"
        let numberDay = getNumberDay(date: admitionDate)
        
        if numberDay == 1 && licencePlate.first?.lowercased() == firstLetterPlate{
            throw BusinessError.dayInvalidPlate()
        }
    }
    
    private func getNumberDay(date: Date) -> Int{
        let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "D"
        let index = Calendar.current.component(.weekday, from: date) - 1// this returns an Int
        return index
    }
    
    private func calculateItervalBetwenAdmisionDateToFinalizationDate() -> DateComponents {
        return Calendar.current.dateComponents([.hour, .day], from: admitionDate, to: Date())
    }
    
    func calculateTotal(pricePerDays: Int,pricePerHours: Int ) -> Int {
        let diferenceBetwenDates = calculateItervalBetwenAdmisionDateToFinalizationDate()
        let payPerDays = diferenceBetwenDates.day ?? 0 * pricePerDays
        var payPerHours = 0
      
        if (diferenceBetwenDates.hour ?? 0 > 9){
            payPerHours = pricePerDays
        }else{
            payPerHours = diferenceBetwenDates.hour! * pricePerHours
        }
        
        return payPerDays + payPerHours
        
    }
    
}

### Parental Gate For iOS

Applications made for kids very often contain screens that are designed for adults, e.g. in app purchases, feedback forms, etc. Apple requires those screens to be protected by Parental Gate.

From AppStore review guidelines:

> 24.3 Apps in the Kids Category must get parental permission or use a parental gate before allowing the user to link out of the app or engage in commerce

### Screenshots:

| Math  | Slide | Custom |
| ------------- | ------------- | ------------- |
| ![Screen Recording 2024-01-25 at 2 20 20 AM](https://github.com/hossinasaadi/ParentalGate/assets/16622377/178e1e39-3e65-430a-a643-3d02e3db6443) | ![Screen Recording 2024-01-25 at 2 22 20 AM](https://github.com/hossinasaadi/ParentalGate/assets/16622377/ee89ae5a-73a3-4f6c-b528-aad5e107c27f) | ![Screen Recording 2024-01-25 at 2 21 41 AM](https://github.com/hossinasaadi/ParentalGate/assets/16622377/bae55dd6-5ed2-43e7-8b08-4950f7a3f9c3)  |

### Integration
Swift Package Manager:
You can use [The Swift Package Manager](https://swift.org/package-manager) to install ParentalGate by adding the proper description to your Package.swift file:
```swift
// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    dependencies: [
        .package(url: "https://github.com/hossinasaadi/ParentalGate"),
    ]
)

```


Usage :

types : `.math`,`.slide`,`.custom`
```swift
ParentalGate(isPresent: .constant(true), style: .math) {
         // Solved
    } dismiss: {
        // Canceled
    
    }

```
custom usage : 
```swift

        ParentalGate(isPresent: $isPresent, style: .custom) {
            isPresent = false
            text = "Solved!"
        } dismiss: {
            isPresent = false
            text = "Canceled,Click Here again!"

        
        }.customGate { ParentalGate in
            CustomGate(solved: ParentalGate.solved, dismiss:ParentalGate.dismiss)
        }
       // CustomGate should use GateProtocol as well
```


feel free to contribute ❤️ 





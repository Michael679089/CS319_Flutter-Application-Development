import 'dart:io';

String pincode = "";
int money = 0;
bool loggedIn = false;

class Bill {
    String name;
    int debt;
    Bill(this.name, this.debt); // constructor
}

List<List<dynamic>> BillsToPay = [
    ["Electricity", 100],
    ["Water", 50],
    ["Internet", 75],
];


void main() {
    print("******************** Hello, Welcome to Our Bank ********************");
    
    if (pincode == "" && loggedIn == false) {
        print("Pincode is empty. Create your first pincode:");
        
        setPincode();

        if (!pincode.isEmpty) {        
            main(); // go back to main menu and go to the 3 attempts phase.
        } 
    } else {
        int attempts = 0; // 3 strikes.
        
        print("Pincode already exists. $loggedIn");
        
        while (attempts < 3 && !loggedIn) {
            stdout.write("Please enter your pincode (or 'E' to exit): ");
            String? userInput = stdin.readLineSync(); // Read user input
            userInput = userInput?.toUpperCase(); // Convert input to uppercase
            if (userInput == pincode) {
                loggedIn = true;
                Bank_UI();
            } else if (userInput == "E") {
                print("Exiting...");
                exit(0);
            } else if (userInput != pincode) {
                print("Incorrect pincode. Please try again.");
                attempts++;
            } else {
                print("ERROR: Invalid input. Please try again.");
            }
        }
        print("Too many attempts. Please try again later.");
        exit(0);
    }
}

void setPincode() {
    // user should confirm their passcode
    // don't allow users to set a pincode that's empty

    pincode = "1";

    print("pincode has been set to: $pincode");
}

void Bank_UI() {
    String? userInput;

    // I don't like repeating the print statement:
    print("""******************** Bank GUI ********************
    Please select an option

    B - Balance Inquiry
    W - Withdraw
    T - Transfer
    D - Deposit
    C - Change Pincode
    P - Pay Bills
    L - Logout
    """);

    while (userInput != "L") {
        stdout.write("Please select an option: ");
        userInput = stdin.readLineSync(); // Read user input
        userInput = userInput?.toUpperCase(); // Convert input to uppercase

        switch (userInput) {
            case "B":
                print("Your current balance is: $money");
                break;
            case "T":
                stdout.write("Transfer amount: ");
                String? transferInput = stdin.readLineSync();
                int transferAmount = int.parse(transferInput!);
                // if does weird things when it's not a number
                break;  
            case "W":
                stdout.write("Withdrawal amount: ");
                String? withdrawInput = stdin.readLineSync();
                int withdrawAmount = int.parse(withdrawInput!);
                // if does weird things when it's not a number
                 
                break;
            case "D":
                stdout.write("Deposit amount: ");
                String? depositInput = stdin.readLineSync();
                int depositAmount = int.parse(depositInput!);
                // if does weird things when it's not a number
                money += depositAmount;
                print("Deposit successful. New balance: $money");
                break;
            case "C":
                setPincode();
                break;
            case "P":
                payingBills();
                break;
            case "L":
                print("Logging out...");
                loggedIn = false;
                break;
            default:
                print("Invalid option. Please try again.");
                break;
        }
    }

    main();
}

void payingBills() {    
    print("Which Bills to pay?");
    print("E - Electricity");
    print("W - Water");
    print("I - Internet");
    stdout.write("Bills option: ");
    String? billOption = stdin.readLineSync();
    billOption = billOption?.toUpperCase(); // Convert input to uppercase

    switch (billOption) {
        case "E": // Paying Electiricty Bill
            stdout.write("Pay Electricity Amount: ");
            String? electricityInput = stdin.readLineSync();
            int electricityAmount = int.parse(electricityInput!);
            if (electricityAmount > money) {
                print("Insufficient funds.");
            } else {
                money -= electricityAmount;
                BillsToPay[0][1] -= electricityAmount;
                print(BillsToPay[0][1].toString() + " Left" + "New balance: $money");
            }
            break;
        default:
            print("Invalid option. Please try again.");
            break;
    }

    print("Exiting paying bills...");
}
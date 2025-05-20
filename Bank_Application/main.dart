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
      stdout.write("Please enter your pincode (or 'Q' to exit): ");
      String? userInput = stdin.readLineSync(); // Read user input
      userInput = userInput?.toUpperCase(); // Convert input to uppercase
      if (userInput == pincode) {
        loggedIn = true;
        Bank_UI();
      } else if (userInput == "Q") {
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
    stdout.write("(BANK GUI) Please select an option: ");
    userInput = stdin.readLineSync(); // Read user input
    userInput = userInput?.toUpperCase(); // Convert input to uppercase

    switch (userInput) {
      case "B":
        print("Your current balance is: $money");
        break;
      case "T":
        stdout.write("Transfer amount: ");
        String? transferInput = stdin.readLineSync();
        int? transferAmount = int.tryParse(transferInput ?? '');
        if (transferAmount != null) {
          if (transferAmount < money) {
            money -= transferAmount;
            print("Transfer successful. New balance: $money");
          } else {
            print("Insufficient funds.");
          }
        } else {
          print("Invalid input. Please enter a valid number.");
        }
        break;
      case "W":
        stdout.write("Withdrawal amount: ");
        String? withdrawInput = stdin.readLineSync();
        int? withdrawalAmount = int.tryParse(withdrawInput ?? '');
        if (withdrawalAmount != null) {
          if (withdrawalAmount < money) {
            money -= withdrawalAmount;
            print("Withdrawal successful. New balance: $money");
          } else {
            print("Insufficient funds.");
          }
        } else {
          print("Invalid input. Please enter a valid number.");
        }
        break;
      case "D":
        stdout.write("Deposit amount: ");
        String? depositInput = stdin.readLineSync();
        int? depositAmount = int.tryParse(depositInput ?? '');
        if (depositAmount != null) {
          money += depositAmount;
          print("Deposit successful. New balance: $money");
        } else {
          print("Invalid input. Please enter a valid number.");
        }
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

  // go back to login menu
  main();
}

void payingBills() {
  print("Which Bills to pay?");
  print("E - Electricity (" + BillsToPay[0][1].toString() + " Left)");
  print("W - Water (" + BillsToPay[1][1].toString() + " Left)");
  print("I - Internet (" + BillsToPay[2][1].toString() + " Left)");
  stdout.write("(Bills) option (Q to leave): ");
  String? billOption = stdin.readLineSync();
  billOption = billOption?.toUpperCase(); // Convert input to uppercase

  void payBill(String billType) {
    stdout.write("Pay $billType Amount: ");
    String? billInput = stdin.readLineSync();
    int? paymentInput = int.tryParse(billInput ?? '');

    if (paymentInput != null) {
      int paymentAmount = paymentInput;
      if (paymentAmount <= money) {
        int billNum = 0;
        switch (billType) {
          case "Electricity":
            billNum = 0;
            break;
          case "Water":
            billNum = 1;
            break;
          case "Internet":
            billNum = 2;
            break;
        }
        if (paymentAmount > BillsToPay[billNum][1]) {
          paymentAmount = BillsToPay[billNum][1];
        }
        money -= paymentAmount;
        BillsToPay[billNum][1] -= paymentAmount;

        print(
          "(Bill) $billType Payment successful. Bill $billType left (" +
              BillsToPay[billNum][1].toString() +
              "). Money Left $money",
        );
      } else {
        print("ERROR: Insufficient funds.");
      }
    } else {
      print("ERROR: Invalid Input");
    }
  }

  switch (billOption) {
    case "E": // Paying Electiricty Bill
      payBill("Electricity");
      payingBills();
      break;
    case "W": // Paying Water Bill
      payBill("Water");
      payingBills();
      break;
    case "I": // Paying Internet Bill
      payBill("Internet");
      payingBills();
      break;
    case "Q": // Quit Baying Bills GUI Page.
      print("Exiting paying bills...");
      break;
    default:
      print("Invalid option. Please try again.");
      payingBills();
      break;
  }
}

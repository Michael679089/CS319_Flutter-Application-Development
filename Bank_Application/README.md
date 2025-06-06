 ¤# Video of the Demo Project

Video Demo Project Link: https://drive.google.com/file/d/1Fo8-S-TlLfa9qsTyOWsQh4VjTN7Byihy/view?usp=sharing

# Presentation
A simple ATM bank simulation in dart that only holds one account.

## Flowchart:
1. [x] Enter Pincode
	1. Code:
		- ![[Bank_Application/README#Main Menu (code)]]
	2. Photo Output:
		- ![[Bank_Application/README#Main Menu (photo)]]
2. [x] Exit the program if 3 times failed upon entering the PIN is entered incorrectly three times.
	1. Code:
		- ![[Bank_Application/README#3 Attempts only (code)]]
	2. Photo Output:
		- ![[Bank_Application/README#3 Attempts only (photo)|README]]
3. [x] Features:
	1. [x] Balance Inquiry  [completion:: 2025-05-20]
		1. Asking how much balance you have
		2. Code:
			1. ![[Bank_Application/README#Balance Inquiry (code)]]
		3. Photo:
			1. ![[Bank_Application/README#Balance Inquiry (photo)]]
	2. [x] Withdraw Cash  [completion:: 2025-05-20]
		1. Cash--
		2. Code:
			1. ![[Bank_Application/README#Withdraw (code)]]
		3. Photo:
			1. ![[Bank_Application/README#Withdraw (photo)]]
	3. [x] Transfer Money  [completion:: 2025-05-20]
		1. Transferring the money to another user.
			1. In this instance, transferring money to a fake user = Cash--
	4. [x] Change Pin
		1. Codes:
			1. ![[Bank_Application/README#Change Pin (code)]]
		2. Photo:
			1. ![[Bank_Application/README#Change Pin (photo)]]
	5. [x] Pay Bills
		1. [x] Options:
			1. [x] Pay Electricity Bill = Cash--
			2. [x] Pay Wifi Bill = Cash--
			3. [x] Pay Water Bill = Cash--
		2. Code:
			1. ![[Bank_Application/README#Pay Bills (code/s)]]
		3. Photo:
			1. ![[Bank_Application/README#Withdraw (photo)]]
	6. Deposit Money
		1. Cash++
		2. Code:
			1. ![[Bank_Application/README#Deposit (code)]]
		3. Photo:
			1. ![[Bank_Application/README#Deposit (photo)]]
4. [x] Log Out Feature.
	1. Logs the user out and asks for pin code again.
	2. Code:
		1. ![[Bank_Application/README#Log Out (code)]]
	3. Photo:
		1. ![[Bank_Application/README#Log Out (photo)]]
5. [x] Quit App
	1. User can quit the app by pressing “Q”
	2. Code:
		1. ![[Bank_Application/README#Quit App (code)]]
	3. Photo:
		1. ![[Bank_Application/README#Quit App (photo)]]
- [x] Requirements for Submission:  
	- [x] Dart Codes
	- [x] Video Demo presentation  
	- [x] Presentation screenshot of codes and result.

Assignee:
1. Chesca Solomon
	1. [x] Pincode Feature (first time user opens main.dart)
	2. [x] Exit the program if 3 times failed upon entering the PIN is entered incorrectly three times.
2. Jacob Delos Santos
	1. [x] Balance Inquiry
	2. [x] Withdraw Cash
	3. [x] Deposit Money
	4. [x] Quit App
	5. [x] Pay Bills
3. Paolo San Gabriel
	1. [x] Change Pin Function
4. Preys Dasun
	1. [x] Transfer Money
	2. [x] Log Out Feature
5. Rj Castellano
	1. [x] Video Demo

# List of Codes + Photos:
## Main Menu (code):
```dart
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
```
## Main Menu (photo):
![[Pasted image 20250520145857.png]]

## 3 Attempts only (code):
```dart
if (pincode == "" && loggedIn == false) {
    print("Pincode is empty. Create your first pincode:");

    setPincode();

    if (!pincode.isEmpty) {
      main(); // go back to main menu and go to the 3 attempts phase.
    }
  } else {
    int attempts = 0; // This counter is used to count logins. 3 times only.

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
```
## 3 Attempts only (photo):
![[Pasted image 20250520151745.png]]

## Balance Inquiry (code):
```dart
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
```
## Balance Inquiry (photo):
![[Pasted image 20250520152229.png]]
## Withdraw (code):
```dart
case "W":
        stdout.write("Withdrawal amount: ");
        String? withdrawInput = stdin.readLineSync();
        int? withdrawalAmount = int.tryParse(withdrawInput ?? '');
        if (withdrawalAmount != null) {
          if (withdrawalAmount < money) {
            if (withdrawalAmount > 0) {
              money -= withdrawalAmount;
              print("Withdrawal successful. New balance: $money");
            } else {
              print("ERROR: Withdrawal amount cannot be negative. or zero.");
            }
          } else {
            print("Insufficient funds.");
          }
        } else {
          print("Invalid input. Please enter a valid number.");
        }
        break;
```
## Withdraw (photo):
![[Pasted image 20250520152436.png]]

## Pay Bills (code/s):
```dart
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
```
## Pay Bills (photo):
![[Pasted image 20250520153956.png]]
## Deposit (code):
```dart
case "D":
        stdout.write("Deposit amount: ");
        String? depositInput = stdin.readLineSync();
        int? depositAmount = int.tryParse(depositInput ?? '');
        if (depositAmount != null) {
          if (depositAmount > 0) {
            money += depositAmount;
            print("Deposit successful. New balance: $money");
          } else {
            print("ERROR: Withdrawal amount cannot be negative. or zero.");
          }
        } else {
          print("Invalid input. Please enter a valid number.");
        }
        break;
```
## Deposit (photo):
![[Pasted image 20250520154836.png]]

## Log Out (code):
```dart
while (userInput != "L") {
    stdout.write("(BANK GUI) Please select an option: ");
    userInput = stdin.readLineSync(); // Read user input
    userInput = userInput?.toUpperCase(); // Convert input to uppercase

    switch (userInput) {
		case "L":
			print("Logging out...");
			loggedIn = false;
			break;
	}
}
```
## Log Out (photo):
![[Pasted image 20250520154926.png]]
## Quit App (code):
```dart
while (attempts < 3 && !loggedIn) {
      stdout.write("Please enter your pincode (or 'Q' to exit): ");
      String? userInput = stdin.readLineSync(); // Read user input
      userInput = userInput?.toUpperCase(); // Convert input to uppercase
      if (userInput == pincode) {
        loggedIn = true;
        Bank_UI();
      } else if (userInput == "Q") {
        // >>>>>> This quits the app.
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
```
## Quit App (photo):
![[Pasted image 20250520160130.png]]

## Change Pin (code):
```dart
void setPincode() {
  String? firstEntry;
  String? secondEntry;

  while (true) {
    stdout.write("Enter your new pincode: ");
    firstEntry = stdin.readLineSync();

    if (firstEntry == null || firstEntry.trim().isEmpty) {
      print("Pincode cannot be empty. Please try again.");
      continue;
    }

    stdout.write("Confirm your new pincode: ");
    secondEntry = stdin.readLineSync();

    if (firstEntry == secondEntry) {
      pincode = firstEntry;
      print("Pincode has been set successfully.");
      break;
    } else {
      print("Pincode does not match. Please try again.");
    }
  }
}
```
## Change Pin (photo):
![[Pasted image 20250524004822.png]]

import 'dart:io';

abstract class Transaction {
  int transactionId;
  Transaction(this.transactionId);
  double execute(Account account);
}

class Withdraw extends Transaction {
  double amount;
  Withdraw(int transactionId, this.amount) : super(transactionId);

  @override
  double execute(Account account) {
    if (account.balance >= amount) {
      account.balance -= amount;
      return account.balance;
    } else {
      print("Insufficient balance!");
      return account.balance;
    }
  }
}

class Deposit extends Transaction {
  double amount;
  Deposit(int transactionId, this.amount) : super(transactionId);

  @override
  double execute(Account account) {
    account.balance += amount;
    return account.balance;
  }
}

class BalanceInquiry extends Transaction {
  String currencyType;
  BalanceInquiry(int transactionId, this.currencyType) : super(transactionId);

  @override
  double execute(Account account) {
    if (currencyType == 'U') {
      return account.balance;
    } else if (currencyType == 'E') {
      return account.balance * 0.92;
    } else {
      print("Invalid currency type!");
      return account.balance;
    }
  }
}

abstract class Rollback {
  double cancelTransaction(Account account);
}

class Account {
  int accountNumber;
  String ownerName;
  double balance;
  Transaction? lastTransaction;

  Account(this.accountNumber, this.ownerName, this.balance);
}

void main() {
  Account? account;
  while (true) {
    print("1. Enter account details");
    print("2. Deposit");
    print("3. Withdraw");
    print("4. Show balance");
    print("5. Cancel last transaction");
    print("6. Exit");

    stdout.write("Choose an option: ");
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        stdout.write("Enter Account Number: ");
        int accNum = int.parse(stdin.readLineSync()!);
        stdout.write("Enter Owner Name: ");
        String owner = stdin.readLineSync()!;
        stdout.write("Enter Initial Balance: ");
        double balance = double.parse(stdin.readLineSync()!);
        account = Account(accNum, owner, balance);
        print("Account created successfully!");
        break;
      case 2:
        if (account == null) {
          print("No account found!");
          break;
        }
        stdout.write("Enter deposit amount: ");
        double amount = double.parse(stdin.readLineSync()!);
        account.lastTransaction = Deposit(1, amount);
        print("New Balance: ${account.lastTransaction!.execute(account)}");
        break;
      case 3:
        if (account == null) {
          print("No account found!");
          break;
        }
        stdout.write("Enter withdrawal amount: ");
        double amount = double.parse(stdin.readLineSync()!);
        account.lastTransaction = Withdraw(2, amount);
        print("New Balance: ${account.lastTransaction!.execute(account)}");
        break;
      case 4:
        if (account == null) {
          print("No account found!");
          break;
        }
        stdout.write("Enter currency type (U for USD, E for EUR): ");
        String currencyType = stdin.readLineSync()!;
        BalanceInquiry balanceInquiry = BalanceInquiry(3, currencyType);
        print("Current Balance: ${balanceInquiry.execute(account)}");
        break;
      case 5:
        if (account == null || account.lastTransaction == null) {
          print("No transaction to cancel!");
          break;
        }
        if (account.lastTransaction is Deposit) {
          account.balance -= (account.lastTransaction as Deposit).amount;
        } else if (account.lastTransaction is Withdraw) {
          account.balance += (account.lastTransaction as Withdraw).amount;
        }
        account.lastTransaction = null;
        print("Transaction cancelled! New Balance: ${account.balance}");
        break;
      case 6:
        print("Exiting");
        return;
      default:
        print("Invalid choice, try again.");
    }
  }
}

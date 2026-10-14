# Smart Utility System
# Run in an interactive R/RStudio console: source("main.R")

read_number <- function(prompt) {
  value <- suppressWarnings(as.numeric(readline(prompt)))
  while (length(value) != 1 || is.na(value)) {
    cat("Please enter a valid number.\n")
    value <- suppressWarnings(as.numeric(readline(prompt)))
  }
  value
}

repeat {
  cat("\n===== SMART UTILITY SYSTEM =====\n")
  cat("1. Celsius to Fahrenheit\n2. Fahrenheit to Celsius\n")
  cat("3. Basic arithmetic\n4. Factorial\n5. Simple interest\n0. Exit\n")
  choice <- trimws(readline("Choose an option: "))

  if (choice == "0") {
    cat("Thank you for using Smart Utility System!\n")
    break
  } else if (choice == "1") {
    c <- read_number("Enter Celsius: ")
    cat("Fahrenheit:", round(c * 9 / 5 + 32, 2), "\n")
  } else if (choice == "2") {
    f <- read_number("Enter Fahrenheit: ")
    cat("Celsius:", round((f - 32) * 5 / 9, 2), "\n")
  } else if (choice == "3") {
    a <- read_number("First number: ")
    b <- read_number("Second number: ")
    op <- trimws(readline("Operator (+, -, *, /): "))
    if (op == "+") cat("Result:", a + b, "\n")
    else if (op == "-") cat("Result:", a - b, "\n")
    else if (op == "*") cat("Result:", a * b, "\n")
    else if (op == "/" && b != 0) cat("Result:", a / b, "\n")
    else if (op == "/" && b == 0) cat("Cannot divide by zero.\n")
    else cat("Unknown operator.\n")
  } else if (choice == "4") {
    n <- read_number("Enter a whole number from 0 to 20: ")
    if (n < 0 || n > 20 || n != floor(n)) {
      cat("Invalid input. Enter a whole number from 0 to 20.\n")
    } else {
      result <- 1
      if (n >= 2) for (i in 2:n) result <- result * i
      cat(n, "! =", result, "\n")
    }
  } else if (choice == "5") {
    p <- read_number("Principal amount: ")
    r <- read_number("Annual interest rate (%): ")
    t <- read_number("Time in years: ")
    cat("Simple interest:", round(p * r * t / 100, 2), "\n")
  } else {
    cat("Invalid choice. Choose an option from 0 to 5.\n")
  }
}

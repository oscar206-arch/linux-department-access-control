# Testing

## Test Case 1

User: john

Action:
Access /company/IT

Expected Result:
Access granted

Actual Result:
Access granted

Status:
PASS

---

## Test Case 2

User: john

Action:
Access /company/HR

Expected Result:
Permission denied

Actual Result:
Permission denied

Status:
PASS

---

## Test Case 3

User: susan

Action:
Access /company/HR

Expected Result:
Access granted

Actual Result:
Access granted

Status:
PASS

---

## Test Case 4

User: peter

Action:
Access /company/Finance

Expected Result:
Access granted

Actual Result:
Access granted

Status:
PASS

---

## Test Case 5

User: peter

Action:
Create file in Finance directory

Expected Result:
File inherits Finance group ownership

Actual Result:
File inherited Finance group ownership

Status:
PASS

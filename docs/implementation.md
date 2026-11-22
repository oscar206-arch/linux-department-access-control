# Implementation

## Overview

This document outlines the steps followed to implement department-based access control on a Linux system.

---

## Step 1: Create Department Groups

Created Linux groups for each department:

- IT
- HR
- Finance
- Management

Example command:

```bash
sudo groupadd IT
```

Verification:

```bash
getent group IT
```

---

## Step 2: Create Employee Accounts

Created user accounts for employees in each department.

Example command:

```bash
sudo useradd -m john
```

Verification:

```bash
id john
```

---

## Step 3: Assign Users to Department Groups

Users were assigned to their respective department groups using the usermod command.

Department assignments:

IT:
- john
- mary
- alex

HR:
- susan
- linda

Finance:
- peter
- jane

Management:
- ceo
- manager1

Verification was performed using the groups command.

---

## Step 4: Create Department Directories

Created a central company directory and dedicated departmental folders.

Directory structure:

/company
├── IT
├── HR
├── Finance
└── Management

These directories will serve as shared storage locations for their respective departments.

---

## Step 5: Configure Ownership

Assigned departmental directories to their respective groups using the chown command.

Ownership configuration:

- /company/IT → root:IT
- /company/HR → root:HR
- /company/Finance → root:Finance
- /company/Management → root:Management

This allows access control to be managed through group membership.

---

## Step 6: Configure Permissions

Applied 770 permissions to all departmental directories.

This allows:

- Full access for the owner
- Full access for department members
- No access for other users

SGID was enabled to ensure new files inherit the department group automatically.

Example:

```bash
chmod 770 /company/IT
chmod g+s /company/IT

---

## Step 8: Verify Access Controls

Performed tests to confirm:

- Authorized users can access their department directories.
- Unauthorized users are denied access.
- New files inherit the correct group ownership.

Example command:

```bash
su - john
```

Create file:

```bash
touch /company/IT/project.txt
```

Attempt unauthorized access:

```bash
cd /company/HR
```

Expected result:

```text
Permission denied
```

---

## Outcome

The system successfully enforces department-based access control using Linux users, groups, ownership, and permissions.

Authorized users can collaborate within their departments while access to other departments remains restricted.

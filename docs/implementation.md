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

Created shared directories for each department.

Directory structure:

```text
/company
├── IT
├── HR
├── Finance
└── Management
```

Example command:

```bash
sudo mkdir -p /company/IT
```

Verification:

```bash
ls -l /company
```

---

## Step 5: Configure Ownership

Assigned group ownership to departmental directories.

Example command:

```bash
sudo chown root:IT /company/IT
```

Verification:

```bash
ls -ld /company/*
```

---

## Step 6: Configure Permissions

Applied secure directory permissions.

Example command:

```bash
sudo chmod 770 /company/IT
```

Permission meaning:

```text
Owner  : Full Access
Group  : Full Access
Others : No Access
```

Verification:

```bash
ls -ld /company/*
```

---

## Step 7: Enable Group Collaboration

Enabled SGID on departmental directories.

Example command:

```bash
sudo chmod g+s /company/IT
```

Purpose:

- New files automatically inherit the department group.
- Simplifies collaboration among department members.

Verification:

```bash
ls -ld /company/*
```

Expected:

```text
drwxrws---
```

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

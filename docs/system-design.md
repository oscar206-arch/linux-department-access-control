# System Design

## Overview

This project implements Role-Based Access Control (RBAC) on a Linux system for a company with four departments:

- IT
- HR
- Finance
- Management

Access to departmental resources is controlled through Linux groups and file permissions.

---

## Architecture

Each department is assigned:

- A Linux group
- A shared directory
- Department-specific users

Users receive access through group membership.

---

## User-Group Mapping

| Department | Group |
|------------|---------|
| IT | IT |
| HR | HR |
| Finance | Finance |
| Management | Management |

---

## Directory Structure

```text
/company
├── IT
├── HR
├── Finance
└── Management
```

---

## Access Model

```text
User
  ↓
Group Membership
  ↓
Department Directory
  ↓
Linux Permissions
```

Users can:

- Read files in their department
- Create files in their department
- Modify files in their department

Users cannot:

- Access other department directories
- Modify files in other departments

---

## Permission Design

| Directory | Owner | Group | Permission |
|------------|---------|---------|------------|
| IT | root | IT | 770 |
| HR | root | HR | 770 |
| Finance | root | Finance | 770 |
| Management | root | Management | 770 |

Permission Breakdown:

```text
7 = Read + Write + Execute
7 = Group Read + Write + Execute
0 = No Access for Others
```

---

## SGID Configuration

The SGID bit will be enabled on all departmental directories.

Purpose:

- New files inherit the department group automatically.
- Simplifies collaboration within departments.

---

## Administrator Access

The system administrator (root) retains full access to:

- Users
- Groups
- Directories
- Files

This ensures centralized management and troubleshooting capability.

---

## Design Diagram

Refer to:

- diagrams/architecture.png
- diagrams/permission-flow.png

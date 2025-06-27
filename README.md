# 🎓 Task D – Open Elective Subject Allocation System

This repository implements a **Subject Allocation System** using SQL Server. The system allocates subjects to students based on their GPA and preferences using a **stored procedure**. The allocation is done fairly, considering seat limitations and student ranking.

---

## 📁 Files Included

| File Name                 | Description                                                                 |
|--------------------------|-----------------------------------------------------------------------------|
| `table_creation.sql`     | 🏗️ Creates tables and inserts sample data for students, subjects, and preferences. |
| `stored_procedure.sql`   | ⚙️ Contains the stored procedure logic to allocate subjects based on GPA and preference. |
| `procedure_execution.sql`| ▶️ Executes the stored procedure and displays allotment & remaining seats.     |

---

## 🧠 Problem Statement

Each student submits **5 subject choices** in order of preference. Subjects have **limited seats**. The allocation logic:

1. Students are sorted in **descending order of GPA**.
2. The system tries to allot the **highest-ranked available preference**.
3. If none of the 5 preferences are available, the student is **marked unallotted**.
4. Seat counts are updated after each successful allotment.

---

## 📊 Sample Output

### ✅ Allotted Students

| Subject ID | Student ID   |
|------------|--------------|
| PO1493     | 159103041    |
| PO1491     | 159103036    |
| PO1492     | 159103039    |
| PO1493     | 159103038    |
| PO1491     | 159103040    |
| PO1492     | 159103037    |

### ❌ Unallotted Students

_None in this dataset._

### 📉 Updated Subject Seat Availability

| Subject ID | Remaining Seats |
|------------|-----------------|
| PO1491     | 0               |
| PO1492     | 117             |
| PO1493     | 88              |
| PO1494     | 50              |
| PO1495     | 60              |

---

## 🚀 How to Run

> 💡 **Prerequisite:** SQL Server Management Studio (SSMS)

1. **Run `table_creation.sql`**  
   ⤷ Creates all necessary tables and inserts sample data.

2. **Run `stored_procedure.sql`**  
   ⤷ Defines the allocation logic using a stored procedure.

3. **Run `procedure_execution.sql`**  
   ⤷ Calls the procedure and automatically displays:
   - Allotments
   - Unallotted students
   - Updated subject seat counts

---

## 🛠️ Tech Stack

- SQL Server
- T-SQL (Transact-SQL)
- Stored Procedures
- Cursors
- Foreign Key Constraints

---

## ✍️ Author

**Daraspreet Singh**  
📘 GitHub: [@DPS-2912](https://github.com/DPS-2912)  
🎯 Passionate about database systems, backend automation & logic-driven workflows.

---

## ⭐ Like this repo?

If this helped you, give it a ⭐ and share it with your peers!


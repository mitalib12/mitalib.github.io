# Urban Eats Café — SQL Database Project

Designed and developed as part of BUSA8090 at Macquarie University, this project involved building a fully functional relational database for a fictional multi-outlet café chain operating across three Sydney locations — Pyrmont, Darling Harbour, and Chippendale.

The database was designed from the ground up. No existing dataset, no starting point. Every entity was identified, every relationship defined, and all constraints were set before a single query was written.

## Files
- `Urban_eats.sql` — complete database schema, dummy data, and business queries
- `ERD_drawio.png` — entity relationship diagram mapping all 11 tables and their connections

## Database Design
Eleven tables were designed to model the full café operation across outlets, staff, shifts, customers, reservations, orders, products, and payments. Each table includes appropriate primary keys, foreign keys, and integrity constraints to ensure the data holds together under real-world conditions.

## Business Problems Analysed

**1. Digital Adoption** — High rates of offline transactions were identified across all three outlets, pointing to a clear opportunity to drive contactless and online payment adoption.

**2. Menu Performance** — Beef Burger was the top selling item chain-wide. Iced Latte and Chicken Wings consistently underperformed, making a case for menu rationalisation and category expansion.

**3. Sales by Outlet** — Urban Eats Hub led with $514 in total sales while Urban Eats Alley trailed at $383. Analysis pointed to a footfall and location issue rather than a product one.

**4. Staffing Compliance** — Three employees had no employment status on record, a small data gap with real consequences for HR compliance and payroll accuracy.

**5. Customer Footfall** — Urban Eats Alley recorded the lowest customer traffic despite carrying a diverse menu, suggesting the need for location-specific marketing and targeted promotions.

## Takeaway

Building this from scratch taught me that the most important decisions happen before a single query is written. How you structure data determines what stories it can tell, and what it hides.

The most interesting findings were not in the obvious numbers. A three-employee data gap pointed to a compliance risk nobody had flagged. A location, not a menu, was quietly killing one outlet's revenue. That is the kind of insight that only surfaces when you ask better questions, not just more queries.

## Tools
SQL · MySQL · Draw.io

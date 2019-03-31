# DB Application
### Code Written by: Jie Wen Lim

## Tables Used
1. An `Agents` table that stores the first name, last name, mobile, and emails of each agent.
2. A `Offices` table that stores the unique ID and name of a property office.
3. A `Workers` table that connects each agent to their respective office.
4. A `UnitTypes` table that stores the Unit ID and description associated to each property unit.
5. A `Listings` table that summarizes each units selling price, listing agent, date posted, zip code, and status.
6. A `Commission` table that notes down which agent has earned what commission for which property unit sold.
7. A `Sold` table that summarizes the Buyer details (first and last name), which agent and office sold it, and the date it was sold.

---

## Running the assignment
Simply boot up your Terminal or windows equivalent and key in:
`sqlite3`

Followed by:
`.read create_db.sql`
`.read insert_db.sql`
`.read query_data.sql`

---

## Use of concepts learned from class

1. **Data Normalization**
To ensure ease of future insertions, I have done my level best to incorporate 3NF into all my tables. For starters, my tables respect the first normal form as most (except the `Workers` table) includes a primary key, has only one value per column, and is constrained to one data type per column. Further, they respect the second normal form because all forms of entries are strictly dependent only on its primary keys. It also follows the 3NF as it has no transitive dependencies - knowing any one column will not help us predict the value in another.

2. **Transactions**
Transactions were implemented when we were required to modify a specific part of our table. As can be seen in the `query_data.sql` file, I implemented 2 different transactions to encapsulate the 2 major changes that would be made to my original database. Transactions are beneficial in this case as it helps make sure that my code would not simply execute some but not all the required updates. This helps me ensure the consistency and coherence of my dataset.

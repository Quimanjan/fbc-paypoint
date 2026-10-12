# FBC PayPoint (prototype)

Kiosk-based student fee assessment and payment system with promissory note management for Fellowship Baptist College, Kabankalan City. Capstone title proposal prototype, BSIT 2.

Three users on one live database:

- **Student kiosk**: tap ID card or log in with ID number + PIN (demo PIN `1234`), view amount due, pay cash or cashless (simulated), request a promissory note, print receipt and exam permit.
- **Cashier**: search a student to see the exact amount to pay, post cash or cashless payments, view all transactions.
- **VP for Finance**: approve or reject promissory requests one at a time, first come first served. Approved amounts are deducted automatically, and students must pay at least the remaining amount due.

## Stack

- Static site: `index.html` + `config.js` (no build step), hosted on Vercel
- Database and realtime: Supabase (table `docs`, see `supabase/schema.sql`)

## Setup

1. **Supabase**: create a free project. Open **SQL Editor**, paste `supabase/schema.sql`, and click **Run**.
2. In Supabase, open **Project Settings → API** and copy the **Project URL** and the **anon public** key into `config.js`.
3. **Vercel**: import this GitHub repository as a new project. Framework preset: **Other**. No build command. Deploy.
4. Open the site and click **Load sample data** to add the six sample students.

If `config.js` is not filled in, the site runs in offline demo mode (data stays in that browser only).

## Note

This prototype uses sample data and open database rules so anyone with the link can try it. Do not enter real student or payment data.

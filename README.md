# opencart

Two raw SQL scripts I used to move data from one opencart database version to another. They only insert rows that are not already in the destination database, so you can run them more than once. Not having referential integrity is generally a bad idea, but it makes using this sort of script easy because no particular order is needed for the inserts.

You need to replace [opencartx_db] with the names of your source and destination databases. BE CAREFUL, make a data backup script, test on a copy of databases before using this in production! This has been tested in CPanel phpMyAdmin, but because it uses "insert () select from ...", you cannot execute and roll back (phpMyAdmin is not very smart about pre-parsing queries).

The script does not include all tables, but covers all important tables like customer, order, order_history, product, category, etc. It does not include tables for any extensions. It does not copy product_image.

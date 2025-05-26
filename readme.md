# 📝 Wellcome to my postgreSQL essential blog.

## 1. What is PostgreSQL?
PostgreSQL হচ্ছে একটি শক্তিশালী, ওপেন সোর্স Relational Database Management System.(RDBMS) যা SQL  (Structured Query Language) এবং object-oriented features both supported.

এটি বড় ও জটিল ডেটা নিরাপদ ভাবে বিশ্লেষণে ব্যাবহার হয় ।


## 2. Explain the Primary Key and Foreign Key concepts in PostgreSQL.


🔑 Primary Key :

Primary key হলো টেবিলের এমন একটি কলাম যা প্রতিটি Record কে অন্য Record থেকে আলাদা করে ।

📌 বিশেষ্য
- প্রতিটা মান unique হতে হবে ।
- কখনই NULL হতে পারবে না।

```
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

```

🔑 Foreign Key :

Foreign Key হল এমন একটি কলাম যা অন্য একটি টেবিলের সাথে সংযুক্ত থাকে।

📌 বিশেষ্য
-এটি ডাটার Entity বজায় রাখে ।
- কখনই NULL হতে পারবে না।

```
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id int REFERENCE users(user_id)
);

```
এখানে orders.user_id হল Foreign Key যা users.user_id এর সাথে সংযুক্ত ।


## 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.


VARCHAR : পরিবর্তনশীল দৈর্ঘ্যের টেক্সট, যোতটুকু দরকার ততটুকু জাইগা নেই ।

CHAR : নির্দিষ্ট দৈর্ঘ্যের টেক্সট, কম হলেও স্পেস দিয়ে পুরন করে ।

## 4. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

### Where clause এর কাজ হল ।
👍 ডেটাবেজ থেকে শুদু নির্দিষ্ট শর্ত অনুযায়ী ডেটা বের করা।

✅ উদাহরণ ঃ 

```
SELECT * FROM users WHERE location = 'Bangladesh'
```

মানে শুধু যেসব users এর location 'Bangladesh' তাদের ডাটা দেখাও।

✅ সারাংশ:
WHERE দিয়ে আমরা নির্দিষ্ট ফিল্টার করে ডেটা বের করি।


## 5. How can you modify data using UPDATE statements?

UPDATE statement ব্যবহার করে PostgreSQL টেবিল এ ডেটা পরিবর্তন বা সংশোধন করা হই।

✅ উদাহরণ ঃ 

```
UPDATE table_name
set column = value
WHERE condition;

```


✅ উদাহরণ ঃ 

```
UPDATE table_name
set column = value
WHERE condition;

```
✅ উদাহরণ ঃ 
- UPDATE দিয়ে ডেটা modify করা হই।
- set দিয়ে কোন কলাম এর মান পরিবর্তন হবে, তা বলা হয়।
- WHERE দিয়ে বলা হই, কোন
রেকর্ডে পরিবর্তন হবে।

👉 যদি WHERE না দাও, তাহলে সব রেকর্ডে পরিবর্তন হবে — এটা বিপদজনক হতে পারে!

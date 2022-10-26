![ERD](ERD_2.PNG)

Q1) AB Test : GMV per Customer (related tables : `AB_Test`, `Sales`)  

Please calculate each AB Test group's average of GMV per Customer.  

1. `AB_Test` table have user allocation to test & group information.  
2. `Sales` table is historical user sales table.    
3. `user_id` is unique for each ab-test group. 
4. Each customers' GMV should be calculated *after* test exposure case only.  
5. There are customers *who buy nothing.* Let their GMV as 0.      
   
`AB_Test`
| test_id | group_id | user_id | test_exposed_datetime         |  
|---------|----------|---------|-------------------------------|
| ab_1    | a        | user_1  | 2022-10-25T09:42:22.615+09:00 |  
| ab_1    | a        | user_2  | 2022-10-25T09:42:27.121+09:00 |  
| ab_1    | b        | user_3  | 2022-10-25T09:42:27.124+09:00 |  

`Sales`     
| user_id | item_id | gmv  | order_datetime                |   
|---------|---------|------|-------------------------------|
| user_1  | item_1  | 500  | 2022-10-25T09:52:12.615+09:00 | 
| user_1  | item_2  | 1500 | 2022-10-25T10:22:17.121+09:00 |  
| user_2  | item_3  | 300  | 2022-10-25T13:12:07.124+09:00 | 

`Example output format`     
| test_id | group_id | avg_gmv_per_customer |
|---------|----------|----------------------|
| ab_1    | a        | 103                  |  
| ab_1    | b        | 150                  |  
| ab_2    | a        | 1070                 | 

---

Q2) Funnel Key (related tables : `Page`, `Session`)  

Please make a `funnel_id` <integer> column with below conditions :  

1. `Page` table is meta table for page information. 
2. `Session` table is historical user action log table.  
3. If customer visit `page_name` = 'Thankyou' then funnel is over.  
4. Funnel is partition (non overlapped subsequence) of session : If session is over then funnel also over.   
5. `funnel_id` starts with index 1, 2, 3 ... for each session.   

`Page`
| page_id | page_name | 
|---------|-----------|
| 1       | GW        |
| 2       | SRP       | 
| 3       | SDP       |
| 4       | Thankyou  |

`Session`     
| session_id | page_id | visit_datetime                |   
|------------|---------|-------------------------------|
| se_1       | 1       | 2022-10-25T09:52:12.615+09:00 | 
| se_1       | 2       | 2022-10-25T10:01:17.121+09:00 |  
| se_1       | 3       | 2022-10-25T10:12:07.124+09:00 | 
| se_1       | 4       | 2022-10-25T10:14:10.124+09:00 | 
| se_1       | 1       | 2022-10-25T10:14:30.124+09:00 | 

`Example output format`     
| session_id | page_id | visit_datetime                | funnel_id |   
|------------|---------|-------------------------------|-----------|
| se_1       | 1       | 2022-10-25T09:52:12.615+09:00 | 1         |
| se_1       | 2       | 2022-10-25T10:01:17.121+09:00 | 1         |
| se_1       | 3       | 2022-10-25T10:12:07.124+09:00 | 1         |
| se_1       | 4       | 2022-10-25T10:14:10.124+09:00 | 1         |
| se_1       | 1       | 2022-10-25T10:14:30.124+09:00 | 2         |
  
---

Q3) Daily Promotion Item Count (related tables : `Promotion`, `Promotion_Item`, `Calendar`)  

Please calculate daily promotion item count.  

1. `Promotion` table is meta table with promotion start ~ end information.  
2. `Promotion_Item` is mapping table for promotion <-> item.  
3. `Calendar` table has every single days as a row.  
4. Each columns of `Calendar` have date format strings as their value.  

`Promotion`
| promotion_id | from                          | to                            | 
|--------------|-------------------------------|-------------------------------|
| promo_1      | 2022-10-23T19:52:12.615+09:00 | 2022-10-26T09:52:12.615+09:00 |  
| promo_2      | 2022-10-15T10:22:17.121+09:00 | 2022-10-29T10:22:17.121+09:00 | 
| promo_3      | 2022-10-20T13:12:07.124+09:00 | 2022-10-26T13:12:07.124+09:00 |

`Promotion_Item`     
| promotion_id | item_id |
|--------------|---------|
| promo_1      | item_1  |
| promo_1      | item_2  |
| promo_2      | item_1  |

`Calendar`     
| yyyy | MM | dd | yyyyMMdd |
|------|----|----|----------|
| 2022 | 10 | 25 | 20221025 |
| 2022 | 10 | 26 | 20221026 | 
| 2022 | 10 | 27 | 20221027 | 
  
`Example output format`     
| dt         | unique_item_count |
|------------|-------------------|
| 2022-10-25 | 102               |
| 2022-10-26 | 708               | 
| 2022-10-27 | 805               | 
  

![ERD](ERD_2.PNG)


Q1) AB Test : GMV per Customer (related tables : `AB_Test`, `Sales`)  

Please calculate each AB Test group's average of GMV per Customer.  

1. `AB_Test` table have user allocation to test & group information.  
2. `Sales` table is historical user sales table.    
3. `user_id` is unique for each ab-test group. 
4. Each customers' GMV should be calculated *after* test exposure case only.  
5. There are customers *who buy nothing.* Let their GMV as 0.      

expected output
[output_2_1](output_2_1.PNG)

table example
`AB_Test`
[example_2_abtest](example_2_abtest.PNG)

`Sales`
[example_2_sales](example_2_sales.PNG)

---

Q2) Funnel Key (related tables : `Page`, `Session`)  

Please make a `funnel_id` <integer> column with below conditions :  

1. `Page` table is meta table for page information. 
2. `Session` table is historical user action log table.  
3. If customer visit `page_name` = 'Thankyou' then funnel is over.  
4. Funnel is partition (non overlapped subsequence) of session : If session is over then funnel also over.   
5. `funnel_id` starts with index 1, 2, 3 ... for each session.   


expected output
[output_2_2](output_2_2.PNG)

table example
`AB_Test`
[example_2_page](example_2_page.PNG)

`Sales`
[example_2_session](example_2_session.PNG)
---

Q3) Daily Promotion Item Count (related tables : `Promotion`, `Promotion_Item`, `Calendar`)  

Please calculate daily promotion item count.  

1. `Promotion` table is meta table with promotion start ~ end information.  
2. `Promotion_Item` is mapping table for promotion <-> item.  
3. `Calendar` table has every single days as a row.  
4. Each columns of `Calendar` have date format strings as their value.  

  
expected output
[output_2_3](output_2_3.PNG)

table example
`Promotion`
[example_2_promotion](example_2_promotion.PNG)

`Promotion_Item`
[example_2_promotion_item](example_2_promotion_item.PNG)
  
`Calendar`
[example_2_calendar](example_2_calendar.PNG)
  

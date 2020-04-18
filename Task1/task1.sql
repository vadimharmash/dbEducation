-- 1. 
/*Вывести 
алфавитный список фамилий и инициалов жильцов
с номерами лицевых счетов, 
отсортированный по проценту скидки.
*/

select lastname, name, personalAccount, preference from Dweller
order by preference;

---- 2.
/*второе задание
вывести значения максимального
                 минимального
				 среднего платежа
				 общую сумму всех платежей
				 */

select min (paid) as [min] from peyment;
select max (paid) as [max] from peyment;
select avg (paid) as [avg] from peyment;
select sum (paid) as [sum] from peyment;


-- 3. вывести общую сумму платежей, внесенную жильцами за Т-й месяц
select sum (paid) from peyment
	where  MONTH(datePay) = 02


-- 4. вывести номера тех платежей, суммарная оплата за которые в N-ом месце составила более М гривен.

select paymentNo from peyment
where sum (paid) > 200 and MONTH(datePay) = 02

select paymentNo paid from peyment
where MONTH(datePay) = 02
group by paymentNo
having sum (paid) >30


-- 5. Для лицевого счета N и номера платежа M вывести последнюю сумму оплаты.

select top (1) paid, datePay from peyment
where personalAccount = 102 and MONTH (datePay) = 3
order by datePay desc
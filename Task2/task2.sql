------ task 2

use PaymentBill

--1.Вывести общую сумму заданного по названию платежа, внесенную жильцами за последний квартал


select sum (paid) as [total sum] from peyment
join PaymentType
on PaymentType.paymentNo = peyment.paymentNo
where Month (datePay) between 1 and 4
group by PaymentType.paymentName
having PaymentType.paymentName = 'electricity'

-- 2. для жильца с лицевым счетом N вывести:
-- названия             (peymentType
-- даты платежей        (peyment
-- номера квитанций     (peyment
-- которые были им сделаны за последний месяц

select PaymentType.paymentName, peyment.datePay, peyment.paymentNo from peyment
join PaymentType 
on peyment.paymentNo = PaymentType.paymentNo
where month (peyment.datePay) = 03

-- 3. вывести 
--названия платежей
-- сумарная оплата за которые в N-ом месяце составила >M грн

select PaymentType.paymentName from PaymentType 
join peyment
on peyment.paymentNo = PaymentType.paymentNo
where month (peyment.datePay) = 03
group by  PaymentType.paymentName
having sum (paid) > 500

-- 4. для каждого жильца вывести
-- число платежей 
-- которые были сделаны за последний месяц
-- если платежей нет - вывести ноль

-- выводит только заполненные значения
select PaymentType.paymentNo, Dweller.lastname, Dweller.name, peyment.paid from PaymentType
join peyment
on PaymentType.paymentNo = peyment.paymentNo
left join Dweller
on Dweller.personalAccount = peyment.personalAccount
where month (peyment.datePay) = 03
order by Dweller.personalAccount

select 
	PaymentType.paymentNo, Dweller.lastname, Dweller.name, sum (case when sum (peyment.paid) > 0 then 1 else 0 end)  from PaymentType
join peyment
on PaymentType.paymentNo = peyment.paymentNo
left join Dweller
on Dweller.personalAccount = peyment.personalAccount
where month (peyment.datePay) = 03
group by peyment.paid
order by Dweller.personalAccount

-- Брата
SELECT PersId, count(DataPaid) Количество_платежей
FROM Dwellers
LEFT JOIN Payments ON Payments.Dweller = Dwellers.PersId
WHERE Payments.DataPaid  Between '20180301' AND '20180331'
or Paid is null
group by PersId

select dweller.personalAccount, count (peyment.paid) from Dweller
left join peyment on Dweller.personalAccount = peyment.personalAccount
where peyment.datePay Between '20180301' AND '20180331' or paid is null
group by dweller.personalAccount



-- 5. вывести
-- для каждого жильца
-- вид последнего платежа
-- и его сумму

select top (5) Dweller.lastname, Dweller.name, PaymentType.paymentName, peyment.paid from peyment
join PaymentType
	on peyment.paymentNo = PaymentType.paymentNo
join Dweller
	on peyment.personalAccount = Dweller.personalAccount
order by LAST_VALUE (peyment.datepay) over (partition by month (peyment.datepay) order by day (peyment.datepay))
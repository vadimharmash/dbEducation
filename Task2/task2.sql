------ task 2

use PaymentBill

--1.������� ����� ����� ��������� �� �������� �������, ��������� �������� �� ��������� �������


select sum (paid) as [total sum] from peyment
join PaymentType
on PaymentType.paymentNo = peyment.paymentNo
where Month (datePay) between 1 and 4
group by PaymentType.paymentName
having PaymentType.paymentName = 'electricity'

-- 2. ��� ������ � ������� ������ N �������:
-- ��������             (peymentType
-- ���� ��������        (peyment
-- ������ ���������     (peyment
-- ������� ���� �� ������� �� ��������� �����

select PaymentType.paymentName, peyment.datePay, peyment.paymentNo from peyment
join PaymentType 
on peyment.paymentNo = PaymentType.paymentNo
where month (peyment.datePay) = 03

-- 3. ������� 
--�������� ��������
-- �������� ������ �� ������� � N-�� ������ ��������� >M ���

select PaymentType.paymentName from PaymentType 
join peyment
on peyment.paymentNo = PaymentType.paymentNo
where month (peyment.datePay) = 03
group by  PaymentType.paymentName
having sum (paid) > 500

-- 4. ��� ������� ������ �������
-- ����� �������� 
-- ������� ���� ������� �� ��������� �����
-- ���� �������� ��� - ������� ����

-- ������� ������ ����������� ��������
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

-- �����
SELECT PersId, count(DataPaid) ����������_��������
FROM Dwellers
LEFT JOIN Payments ON Payments.Dweller = Dwellers.PersId
WHERE Payments.DataPaid  Between '20180301' AND '20180331'
or Paid is null
group by PersId

select dweller.personalAccount, count (peyment.paid) from Dweller
left join peyment on Dweller.personalAccount = peyment.personalAccount
where peyment.datePay Between '20180301' AND '20180331' or paid is null
group by dweller.personalAccount



-- 5. �������
-- ��� ������� ������
-- ��� ���������� �������
-- � ��� �����

select top (5) Dweller.lastname, Dweller.name, PaymentType.paymentName, peyment.paid from peyment
join PaymentType
	on peyment.paymentNo = PaymentType.paymentNo
join Dweller
	on peyment.personalAccount = Dweller.personalAccount
order by LAST_VALUE (peyment.datepay) over (partition by month (peyment.datepay) order by day (peyment.datepay))
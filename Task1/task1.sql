-- 1. 
/*������� 
���������� ������ ������� � ��������� �������
� �������� ������� ������, 
��������������� �� �������� ������.
*/

select lastname, name, personalAccount, preference from Dweller
order by preference;

---- 2.
/*������ �������
������� �������� �������������
                 ������������
				 �������� �������
				 ����� ����� ���� ��������
				 */

select min (paid) as [min] from peyment;
select max (paid) as [max] from peyment;
select avg (paid) as [avg] from peyment;
select sum (paid) as [sum] from peyment;


-- 3. ������� ����� ����� ��������, ��������� �������� �� �-� �����
select sum (paid) from peyment
	where  MONTH(datePay) = 02


-- 4. ������� ������ ��� ��������, ��������� ������ �� ������� � N-�� ����� ��������� ����� � ������.

select paymentNo from peyment
where sum (paid) > 200 and MONTH(datePay) = 02

select paymentNo paid from peyment
where MONTH(datePay) = 02
group by paymentNo
having sum (paid) >30


-- 5. ��� �������� ����� N � ������ ������� M ������� ��������� ����� ������.

select top (1) paid, datePay from peyment
where personalAccount = 102 and MONTH (datePay) = 3
order by datePay desc
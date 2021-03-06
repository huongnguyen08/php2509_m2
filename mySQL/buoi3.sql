--1
SELECT * FROM foods

--1.1
SELECT name,price,image FROM foods

--3
SELECT name, gender, address, phone FROM customers
ORDER BY name ASC --DESC

--4
SELECT name,price,image FROM foods
ORDER BY price DESC

--5


SELECT name,price,image FROM foods
WHERE   name LIKE '%gà%'
    OR  detail LIKE '%gà%'
    OR  summary LIKE '%gà%'
--result : 18

SELECT name,price,image FROM foods
WHERE name LIKE '%gà%'
    OR  detail LIKE '%gà%'
--result: 17

SELECT name,price,image FROM foods
WHERE   name LIKE '%gà%'
--result :11


--6
SELECT name,price,image FROM foods
WHERE name LIKE '%súp%'
    AND price > 16000
--result: 4 datas


--7
--c1
SELECT name,price,image FROM foods
WHERE price>=50000
AND price<=100000
--r:27s

SELECT name,price,image FROM foods
WHERE price BETWEEN 50000 AND 100000 
--r:27s


--11
--page=1
    SELECT name,price,image FROM foods
    ORDER BY price DESC
    LIMIT 0,10 --0:vị trí bắt đầu lấy datas, 10:số phần tử select

--page=2
    SELECT name,price,image FROM foods
    ORDER BY price DESC
    LIMIT 10,10 

--page=3
    SELECT name,price,image FROM foods
    ORDER BY price DESC
    LIMIT 20,10 

-- 1:0
-- 2:10
-- 3:20
-- 4:30
-- 5:40

-- (page-1)*10

--15
SELECT name,price,image FROM foods
    ORDER BY price DESC, name ASC --khi trùng price ->sx name


--22
SELECT avg(price) as DGTB FROM foods
--r: 171629.03225806452

SELECT sum(price)/count(id) as DGTB FROM foods
--r: 171629.03225806452

--tổng đơn giá
SELECT sum(price) as tongDG FROM foods

--đếm xem cửa hàng kinh doang bao nhiêu sp
SELECT count(price) as soSP FROM foods
SELECT count(id) as soSP FROM foods
SELECT count(name) as soSP FROM foods --min/max

--2
SELECT t.name, f.name, price
FROM foods f
INNER JOIN food_type t
ON f.id_type = t.id

--r:10s

--2.2
    --1
    SELECT t.name as TenLoai, count(f.id) as TongSP
    FROM foods f
    INNER JOIN food_type t
    ON f.id_type = t.id
    GROUP BY t.name
    --ORDER BY TongSP ASC
    ORDER BY count(f.id) ASC


    --2
    SELECT t.name as TenLoai, avg(f.price) as GiaTB
    FROM foods f
    INNER JOIN food_type t
    ON f.id_type = t.id
    GROUP BY t.name
    ORDER BY GiaTB ASC

    --3 min/max (2)

    --4
    SELECT t.name as TenLoai, sum(f.price) as TongTien, 
            count(f.id) as SoSP
    FROM foods f
    INNER JOIN food_type t
    ON f.id_type = t.id
    WHERE price BETWEEN 50000 AND 100000
    GROUP BY t.name

    --5
    --số hóa đơn, ngày đặt, tổng số sản phẩm, tổng thành tiền.
    SELECT b.id as SoHD, date_order as NgayDat, 
            count(bd.id_bill) as TongSP,
            total as TongTien
    FROM bills b 
    INNER JOIN bill_detail bd 
        ON b.id = bd.id_bill
    GROUP BY b.id


    --6
    --SELECT sum(f.price)/count(f.price) as TB
    
    SELECT avg(f.price) as TB
    FROM foods f
    INNER JOIN food_type t
    ON f.id_type = t.id
    WHERE t.name like 'Bún, mì, miến, phở'






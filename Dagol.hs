-- First Assignment 
-- Reimplement Haskell function
-- DON'T USE GOOGLE
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
module Template where

import Data.List
import Data.Char (intToDigit)
import Distribution.Simple.Setup (falseArg)
import System.Win32 (xBUTTON1)



-- memberukan value berupaa boolean true jika list kosong dan sebaliknya

null' [] = True
null' (x:xs) = False

-- take 3 dari 1..10
-- langkah 1 : take n tapi list kosong = []
-- langkah 2 : take' 3 (1:2,3,4,5) =

take' n [] = []
take' 0 _ = []
take' n (x:xs) = x : take' (n-1) xs

--fungsi drop' int -> [a] -> [a]
-- if n >= [a] = [] (Habis)
-- if n <= [a] = [a]

drop' _ [] = []
drop' 0 xs = xs
drop' n (x:xs) = drop' (n-1) xs

-- drop' 3 dari List
-- jika drop' 3 dari [1,2,3,4,5] = [4,5]
-- maka drop' 3 ([1,2,3]:[4,5]) = drop' (3-1) dari [1,2,3] + [4,5] => [3,4,5]
-- drop' 2  dari [1,2,3,4,5] = drop' (2-1) dari [1,2] + [3,4,5] => [2,3,4,5]
-- drop' 1  dari [1,2,3,4,5] = drop' (1-1) dari [1]+[2,3,4,5] = [1,2,3,4,5]
-- seterusnya, drop' 0 dari [1,2,3,4,5] maka [1,2,3,4,5]

tin' m = m + 1

-- fst :: (a,b) -> a
-- mengembalikan item pertama dari tuples, cuman bisa 2 trenyata

fst' (a,b) = a

--mengembalikan item kedua dari tuples, sama juga cuman bisa dua ternyata

snd' :: (a, b) -> b
snd' (a,b) = b

map' :: (a -> b) -> [a] -> [b]

-- mamasukan fungsi ke dalam list yang ditentukan
-- fungsi bisa dilakukan sebagai lambda
-- atau fungsi yang pernah dibuat sebelumnya

add' x = x + 2 -- ini buat map aja biar asique




-- filter :: (a -> Bool) -> [a] -> [a]
-- filter memasukan fungsi boolean kepada list untuk mengambil
-- list dan dikembalikan menjadi list

-- Filter' :: (a -> Bool) -> [a] -> [a]
-- filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' m (x:xs)
  | m x = x : filter' m xs -- jika m itu True makan akan memasukan x ke output?!
  | otherwise = filter' m xs -- otherwisem skip x dan cari ke sisa list

-- filter' :: (a -> Bool) -> [a] -> [a]


--delete :: Eq a => a -> [a] -> [a]
-- delete akan menghasilkan list yang telah dikurangi oleh "a"
-- syarat nya "n" harus berada di dalam list, jika tidak maaka akan mengembalikan
-- list tana ada perubahan

--delete' :: Eq t => t -> [t] -> [t]
delete' :: Eq t => t -> [t] -> [t]
delete' _ [] = [] --delete' masukan apapun kalau list kosong ya kosong
delete' n (x:xs) -- masukan n kepada [list] maka akan menegembalikan sisa list kalau ->
  | n == x = xs -- kalau n bearada di dalam list maka kembalikan sisa list
  | otherwise = x : delete' n xs -- kalau tidak equal maka kembalikan list

--deleteAll :: Eq a => a -> [a] -> [a]
--deletAll' masukan apapun kalau list kosong maka kosing
-- deletall' masukan "n" ke dalam list yang harus ada  "n" maka
-- | n == x = deleteAll' n xs --yang artinya n harus sama dengan elemen yang ada di List
-- jika ya maka akan secara recursive dipanggil ke sisa list (xs)
-- jika tidak match maka n akan dipanggil ke sisa list (lagi)
-- perbedaan denga delete fungsi ini mengambil semua yang equal dengan "n"
-- sementara delete' hanya mengambil di list pertama yang equal dgn  "n"

deleteAll' :: Eq a => a -> [a] -> [a]
deleteAll' _ [] = [] --masukan apapun kalau list kosong maka kosong
deleteAll' n (x:xs) -- maskin "n" ke dalem list biar bisa patern matching
  | n == x = deleteAll' n xs -- di sini kalau pala dari list sama dengan "n" berarti si "n" akan ilang dari situ
  | otherwise = x : deleteAll' n xs -- diluar dari itu rekursi trerus sampe di list ga ada (n == x)

--foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b

foldl' x = x

--foldl1 :: Foldable t => (a -> a -> a) -> t a -> a (ini apa anjir)

foldl1' x = x

--zip :: [a] -> [b] -> [(a, b)], menggabungkan 2 list atau lebih ke dalam satu list


zip' :: [a] -> [b] -> [(a, b)]
zip' [] _ = []  -- Jika first list kosong ya kosong
zip' _ [] = []  -- Jika second list kosong, ya kosong juga hasil
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys --Gabungin pala si list ke dalem tuple (x dan y), pasangkan jadi (x, y),
--terus bikin rekursive ga sie sisa buntut list nya
-- buat para visual learner -> 
-- zip' [1,2,3] ['a','b']
-- = (1,'a') : zip' [2,3] ['b']
-- = (1,'a') : ((2,'b') : zip' [3] [])
-- = (1,'a') : ((2,'b') : [])
-- = [(1,'a'), (2,'b')]
--pembatas

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c] -- fungsi yang makan dua nilai dan hasilin satu
zipWith' _ [] _ = [] --berarti kalau list kosong, ya udah berhenti 
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys -- artinya panggil fungsi f ke dua elemen, terus rekursi sampai sisa list abis
-- anuan

--pembatas

nth' :: p -> p
nth' x = x

--pembatas

scanl' x = x

--pembatas

scanl1' x = x

--pembatas

elem' :: (Eq a) => a -> [a] -> Bool
elem' _ [] = False
elem' n (x:xs)
 | n == x  = True
 | otherwise = elem' n xs

--Gak mungkin ketemu apa-apa di list kosong, jadi kasih False. _ []
--Kalau elemen pertama (x) sama dengan yang dicari (n) 
--Cek lagi ke sisa listnya (xs) pake cara yang sama.

notElem' :: (Eq a) => a -> [a] -> Bool
notElem' _ [] = True
notElem' n (x:xs)
 | n == x = False
 | otherwise = notElem' n xs

--Gak mungkin ketemu apa-apa di list kosong, jadi kasih True. _ []
--Kalau elemen pertama (x) sama dengan yang dicari (n) 
--Cek lagi ke sisa listnya (xs) pake cara yang sama.


-- mengemalikan kepala dari sebuah list head' :: => [a] -> a

head' (x:_) = x

-- cicing sia
--pembatas

-- length :: [a] -> int
length' :: [a] -> Int
length' [] = 0
length' (_:xs) = 1 + length' xs

-- cara mikir =
-- length' :: [list] jadi -> Int
-- length' [] = 0 <- Basis dasar
-- length' [1,2,3]/(1:2,3) 
-- = 1 + length' [2,3]
-- = 1 + (1 + length' [3])
-- = 1 + (1 + (1 + length' []))
-- = 1 + (1 + (1 + 0))
-- = 3 <-

--reverse' :: [a] -> [a]

reverse' [] = [] -- kalau list kosong = kosong
reverse' (x:xs) = reverse' xs ++ [x]

-- reverse' ([1:2,3]) = reverse' [2,3] ++ [1] = [2,3,1]
-- reverse' ([2:3]) = reverse' [3] ++ [2,1]= [3,2,1]
-- reverse' ([3]) = reverse' [] ++ [3,2,1] = [3,2,1]
-- inti nya melakukan recursion kepada xs (tail) sampai habis dan ditambahkan ke (head) x
-- maka hasil akan terlihat list yang terbalik


--last' :: [a] -> a

last' [x] = x
last' (_:xs) = last' xs

--tail' :: [a] -> [a]
-- masukin list keluar list tapi buntut nya aja (xs)

tail' [] = []
tail' (_:xs) = xs

--ngambil semua elemen kecuali yang terakhir dari list.

init' :: [a] -> [a] -- masukin list keluar lis
init' [] = error "kosong bray" --  kalao kosong eror
init' [_] = [] -- list-nya cuma 1 item , ya return-nya list kosong karena elemen ujung dibuang init
init' (x:xs) = x : init' xs -- init list sama dengan pala : (hasil dibuang) dan sisa (xs)

-- init' [1,2,3] berarti init (1:hasil buangan palign ujung [3] , list sisa (2))
-- jadi init' [1,2,3] = [1,2]


--pembatas
-- maximum :: Ord a => t a -> a "<- menjebak anjir binungn aing" 
-- intinya -- Ambil input: (t a atau foldable a) list [a] (karena pas dicoba bisanya list doang), 
-- Balikin output: elemen terbesar dari list itu (mirip max excel)
-- Dengan sarat a harus bisa dibandingin (Ord)
max' :: Ord a => [a] -> a 
max' [] = error "list kosong boss"
max' [x] = x 
max' (x:xs) 
 | x > max' xs = x
 | otherwise = max' xs

--pembatas

min' :: Ord a => [a] -> a
min' [] = error "list kosong brader"
min' [x] = x
min' (x:xs)
 | x < min' xs = x
 | otherwise = min' xs



--concat :: Foldable t => t [a] -> [a] 
--masukin dua list biar jadi satu -- foldable t itu list yang bisa dijelajahi, ribet jr kudu [[1],[3]]
concat' :: [[a]] -> [a]
concat' [] = []
concat' (x:xs) = x ++ concat' xs


--pembatas

intersperse' x = x

--pembatas

intercalate' x = x

--pembatas

and' x = x

--pembatas

or' x = x

--pembatas

zip3' x = x

--pembatas

sum' x = x

--pembatas

product' x = x

--pembatas

words' x = x

--pembatas

lines' x = x

--pembatas

unlines' x = x

--pembatas

unwords' x = x

--pembatas

takeWhile' x = x

--pembatas

dropWhile' x = x

--pembatas

concatMap' x = x

--pembatas

all' x = x

--pembatas

any' x = x

--pembatas

insert' x = x

--pembatas

zipWith3' x = x

--pembatas

-- 1.b

nub' x = x

--pembatas

sort' x = x

--pembatas

minimum' x = x

--pembatas

maximum' x = x

--pembatas

inits' x = x

--pembatas

tails' x = x

--pembatas

union' x = x

--pembatas

intersect' x = x

--pembatas

group' x = x

--pembatas

splitAt' x = x

--pembatas

partition' x = x

--pembatas
replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' n x = x : replicate' (n - 1) x 

-- replicate' ulangi anuan = anuan : replicate' (ulangi - 1) 
-- anuan nya harus list

--pembatas
-- First Assignment
-- Reimplement Haskell function
-- DON'T USE GOOGLE

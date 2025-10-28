Haskell Low-Level Logic & Reimplementations

Proyek ini adalah dokumentasi perjalanan belajar dalam memahami struktur dan logika pemrograman fungsional, khususnya Haskell, dengan tujuan untuk mere-implementasi fungsi-fungsi bawaan (Prelude) dari sudut pandang *low-level logic* (rekursi, pattern matching, dan kasus basis).

A. **Goals Utama:**
  1. Memahami bagaimana abstraksi fungsional (seperti `map`, `filter`, `zipWith`, `foldr`) dibangun dari prinsip dasar rekursi.
  2.  Mampu menjelaskan alur eksekusi setiap fungsi langkah demi langkah, sama seperti mendefinisikan kasus basis dan rekursif aslinya.
  3.  Mempelajari konsep *Higher-Order Functions* (HOF) seperti `foldr` sebagai mesin pembangkit fungsi lainnya.


B. Struktur Project

Semua implementasi dan latihan terdapat dalam satu modul utama:

*   **`Dagol.hs`**: Berisi reimplementasi fungsi-fungsi Prelude (dengan penamaan `functionName'`).

C Cara Menjalankan

Anda dapat menjalankan dan menguji fungsi-fungsi ini menggunakan lingkungan interaktif Haskell (GHCI).

1.  Pastikan Anda telah menginstal Haskell Platform (GHC).
2.  Buka terminal di direktori project.
3.  Load file `Dagol.hs` ke GHCI:

    ```bash
    ghci Template.hs
    ```

4.  Anda sekarang bisa memanggil fungsi-fungsi yang telah diimplementasikan (misalnya: `zipWith' (+)` atau `map' (*2)`).

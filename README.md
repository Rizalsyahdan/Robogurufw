# 🤖 Automation Testing with Robot Framework
**Tugas Mata Kuliah Pola Arsitektur Perangkat Lunak**

Repositori ini berisi implementasi skrip *Automation Testing* secara *End-to-End* (E2E) menggunakan **Robot Framework** dan **SeleniumLibrary**. Pengujian dilakukan pada website *dummy* e-commerce [SauceDemo](https://www.saucedemo.com/).

---

## 👥 Anggota Kelompok 
1. Ammra Musharra Akbharieq - [230504080]
2. Unedo Hesekiel Clinton Sirait - [230504076]
3. Muhammad Rizal Syahrul Ramadhan - [230504075]

---

## 🎯 Skenario Pengujian (End-to-End)
Skrip `test_saucedemo.robot` akan secara otomatis melakukan simulasi pengguna asli dengan alur sebagai berikut:
1. Membuka browser Chrome dan menuju *login page* SauceDemo.
2. Melakukan proses **Login** menggunakan kredensial standar.
3. Mencari produk dan memasukkan "Sauce Labs Backpack" ke **Keranjang Belanja**.
4. Melakukan proses **Checkout** dengan mengisi data diri (First Name, Last Name, Zip Code).
5. Menyelesaikan pesanan hingga muncul notifikasi keberhasilan (*Thank you for your order!*).
6. Kembali ke halaman utama dan melakukan **Logout**.

*(Catatan: Kecepatan eksekusi telah diatur menggunakan `Set Selenium Speed 0.5 seconds` untuk memfasilitasi kebutuhan presentasi dan demonstrasi visual yang stabil).*

---

## 🛠️ Persyaratan Sistem (Prerequisites)
Pastikan komputer Anda memiliki perangkat lunak berikut sebelum menjalankan pengujian:
- **Python** (Versi 3.11.9)
- **Pip** (Python Package Installer)
pip install robotframework
pip install robotframework-seleniumlibrary
- **Google Chrome** (Browser utama untuk pengujian)


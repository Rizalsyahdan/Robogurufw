*** Settings ***
Documentation     Script Pengujian E2E (Login, Add to Cart, Checkout, Logout)
Library           SeleniumLibrary

*** Variables ***
${URL}            https://www.saucedemo.com/
${BROWSER}        chrome
${USERNAME}       standard_user
${PASSWORD}       secret_sauce
${FIRST_NAME}     Ammra
${LAST_NAME}      Musharra
${POSTAL_CODE}    123

*** Test Cases ***
Skenario: Alur Lengkap Belanja E-Commerce SauceDemo
    [Documentation]    Menguji alur penuh dari login, belanja, checkout, hingga logout.
    Buka Browser Ke Halaman Login
    Masukkan Kredensial
    Klik Tombol Login
    Tambahkan Produk Ke Keranjang
    Lakukan Checkout Barang
    Selesaikan Pesanan Dan Kembali Ke Beranda
    Lakukan Logout
    Tutup Browser

*** Keywords ***
Buka Browser Ke Halaman Login
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    
    # MAGIC TRICK: Memperlambat kecepatan untuk keperluan Video Demo
    Set Selenium Speed    0.5 seconds
    Wait Until Element Is Visible    id=user-name

Masukkan Kredensial
    Input Text      id=user-name    ${USERNAME}
    Input Text      id=password     ${PASSWORD}

Klik Tombol Login
    Click Button    id=login-button
    Wait Until Element Is Visible    class=title
    Element Text Should Be           class=title    Products

Tambahkan Produk Ke Keranjang
    # Masukkan produk ke keranjang
    Click Button    id=add-to-cart-sauce-labs-backpack
    
    # Pastikan ikon keranjang berubah angka menjadi 1
    Wait Until Element Is Visible    class=shopping_cart_badge
    Element Text Should Be           class=shopping_cart_badge    1

Lakukan Checkout Barang
    # Klik ikon keranjang di pojok kanan atas
    Click Link      class=shopping_cart_link
    Wait Until Element Is Visible    id=checkout
    
    # Klik tombol Checkout di dalam keranjang
    Click Button    id=checkout
    Wait Until Element Is Visible    id=first-name
    
    # Mengisi formulir data diri (Ammra Musharra, 123)
    Input Text      id=first-name    ${FIRST_NAME}
    Input Text      id=last-name     ${LAST_NAME}
    Input Text      id=postal-code   ${POSTAL_CODE}
    
    # Lanjut ke halaman Overview
    Click Button    id=continue
    Wait Until Element Is Visible    id=finish

Selesaikan Pesanan Dan Kembali Ke Beranda
    # Klik Finish pada halaman Checkout: Overview
    Click Button    id=finish
    Wait Until Element Is Visible    class=complete-header
    
    # Verifikasi tulisan "Thank you for your order!" muncul
    Element Text Should Be           class=complete-header    Thank you for your order!
    
    # Klik Back Home untuk kembali ke halaman utama
    Click Button    id=back-to-products
    Wait Until Element Is Visible    class=title

Lakukan Logout
    # Buka menu sidebar
    Wait Until Element Is Visible    id=react-burger-menu-btn
    Click Button                     id=react-burger-menu-btn
    
    # Klik tombol logout
    Wait Until Element Is Visible    id=logout_sidebar_link
    Click Link                       id=logout_sidebar_link
    
    # Pastikan kembali ke halaman login
    Wait Until Element Is Visible    id=login-button

Tutup Browser
    Close Browser

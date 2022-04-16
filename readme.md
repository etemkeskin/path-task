## PATH TASK RESTFUL UYGULAMASI

1. Uygulama Authentication olarak JWT kullanılmıştır.
2. Kullanıcı şifreleri **123456** olarak belirlenmiştir.
3. Uygulamayıkurmak için ekteki sql dosyası veritabanına import edilmesi gerekiyor.

### APILER

#### /api/login_check    methods={"GET"}

{"username":"etemkeskin@yahoo.com", "password":"123456"}

___

#### /api/orders    methods={"GET"}

---
#### /api/orders/{id}    methods={"GET"}

Get order details.

---
#### /api/orders    methods={"POST"}

{
    "orderCode": "sdfkokcs5158",
    "address":"DieSachbearbeiter Choriner Straße 4910435 BerlinE-Mail: moinsen2@blindtextgenerator.com",
    "shippingDate":"2025-12-21T09:34:47",
    "items": [
        {
            "productId" :"2",
            "quantity" : 1
        },
        {
            "productId" :"1",
            "quantity" : 2
        }
        ]
}

---

#### /api/orders    methods={"PUT"}

{
    "orderCode": "sdfkokcs5158",
    "address":"DieSachbearbeiter Choriner Straße 4910435 BerlinE-Mail: moinsen2@blindtextgenerator.com",
    "shippingDate":"2025-12-21T09:34:47",
    "items": [
        {
            "productId" :"2",
            "quantity" : 1
        },
        {
            "productId" :"1",
            "quantity" : 2
        }
        ]
}


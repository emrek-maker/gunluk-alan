# Gunluk Alan

Takvim ve gunluk notlari birlestiren sade, mobil uyumlu bir web uygulamasi.

## Ozellikler

- Takvimden gun secme
- Gune ozel not yazma
- Kucuk yapilacaklar ekleme
- Gorevleri tamamlandi olarak isaretleme
- Secili gunu kopyalama
- Verileri tarayicida saklama
- Google ile giris ve kullaniciya ozel bulut kaydi

## Canli Site

https://gunluk-alan-vercel.vercel.app

## Google Girisi Kurulumu

1. Firebase Console'da bir proje olustur.
2. Authentication bolumunde Google provider'ini etkinlestir.
3. Authentication > Settings > Authorized domains alanina `gunluk-alan-vercel.vercel.app` ekle.
4. Firestore Database olustur.
5. Project settings > Web app config degerlerini `firebase-config.js` dosyasina yaz.

Firestore Rules:

```txt
rules_version = '2';

service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId}/days/{dayId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
  }
}
```

# Gunluk Alan

Takvim ve gunluk notlari birlestiren sade, mobil uyumlu bir web uygulamasi.

## Ozellikler

- Takvimden gun secme
- Gune ozel not yazma
- Kucuk yapilacaklar ekleme
- Gorevleri tamamlandi olarak isaretleme
- Secili gunu kopyalama
- Verileri tarayicida saklama
- Supabase ile Google girisi ve kullaniciya ozel bulut kaydi

## Canli Site

https://gunluk-alan.vercel.app

## Supabase Kurulumu

1. Supabase'de yeni proje olustur.
2. SQL Editor'da `supabase-schema.sql` dosyasindaki SQL'i calistir.
3. Authentication > Providers alaninda Google provider'ini etkinlestir.
4. Authentication > URL Configuration alaninda Site URL olarak `https://gunluk-alan.vercel.app` gir.
5. Redirect URLs alanina `https://gunluk-alan.vercel.app` ekle.
6. Project Settings > API alanindaki Project URL ve anon publishable key degerlerini `supabase-config.js` dosyasina yaz.

`supabase-config.js`:

```js
window.GUNLUK_ALAN_SUPABASE_CONFIG = {
  url: "https://PROJECT_ID.supabase.co",
  anonKey: "..."
};
```

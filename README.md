# tcpdump-powershell

Linux işletim sisteminde kullanılan tcp uygulamasının özelliklerini Windows platformunun powershell konsolunda taklit eder.

**Parametreler**

    TraceFilePath
        Programın üreteceği .etl uzantılı dosyanın kaydedileceği dizin.

    FileExtension
        Üretilecek dosyayı verilen ve uygun olan uzantılara dönüştürür(cap, pcap)
        Cap uzantılı dosya isteniyorsa MMA(Microsoft Message Analyzer) çalıştırılan makinede bulunmalıdır.

    level
        Üretilen kayıtların seviyesini ifade eder. 0-5 arasındadır.

        5. Verbose | 4. Informational | 3. Warning | 2. Error | 1. Critical | 0. LogAlways

    ListenTime
        Programın paket dinlemeyi ne kadar süre gerçekleştireceğini ifade eder. Saniye cinsindedir.

    ipv4_address
        Verilen IP adresine yönelik trafiği analiz eder. Opsiyoneldir, standart değer tüm ip aralığı.

    
**Çıktı**

    Aksi belirtilmezse etl uzantılı bir analiz dosyası üretir.

**Kurulum ve Çalıştırma**

    Kuruluma ihtiyaç yoktur. ps1 uzantılı dosyanın powershell bulunan bir Windows makinede çalıştırılabilir.
    İçeriği nedeniyle yüksek yetkiye ihtiyaç duyar.

    Program önceden imzalanmıştır fakat bazı makinelerin çalıştırma politikaları sebebiyle sorun çıkarabilir.
    Bu sorunu çözmek için powershell üzerinden;

    'Set-ExecutionPolicy <seviye>'

    şeklinde bir komut girilmelidir. 
    
    *Seviye*
    Unrestricted | RemoteSigned | AllSigned | Restricted | Default | Bypass | Undefined
    olabilir. Programı çalıştırabilmek için RemoteSigned veya Unrestricted olmalıdır.

    Powershell bu programın çalıştırılmasına karşı çıkabilir fakat bu çalıştırma politikası düzgün ayarlandıysa
    sadece uyarı şeklinde olacaktır, sadece izin verin.

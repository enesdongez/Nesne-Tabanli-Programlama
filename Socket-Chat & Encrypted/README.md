# Soket Nedir

Soketler, süreçler arası iletişim için kullanılır. Süreçler arası haberleşme (Interprocess) iletişimi istemci-sunucu modeline dayanır. İstemci ile sunucu birbiriyle etkileşime giren uygulamalardır. İstemci ve sunucu arasındaki etkileşim için bir bağlantı gereklidir. Soket programlaması, etkileşime girecek uygulamalar arasındaki bağlantıyı kurmaktan sorumludur. Kısacası ağ iletişimini temin eden bir uygulamadır.

# Chat Uygulaması

Soket Programlama ile Chat Uygulaması, birden fazla client olabilen bir server-client chat uygulamasıdır. Açılan client’larla server’ın bağlantı kurabilmesi için IP adresi ve açılan TCP port bilgileri gerekmektedir. Bu bilgiler sayesinde iki soket birbirine bağlanıp iletişim sağlayacaktır. Uygulamada içerisinde IP “127.0.0.1” , dinlenen port ise “8888”.

# Server ve Client Yapısı

Uygulama içerisinde tanımlamış olduğumuz IP ve port bilgileri ile server tarafında bir ServerSocket oluşturulur, gelen istemci bağlantılarını dinlemeyi ve kabul etmeyi sağlar. Client tarafında ise bağlantı için Socket sınıfı altında server için kullanılan IP ve port bilgisi ile nesne oluşturuldu. Oluşturulan socket, istemci programdan sunucu programa bağlantı oluşturmayı sağlar. Server başlatıldıktan sonra client’lar için bağlantı sağlanır ve her iki tarafta socket nesneleri yardımıyla birbirleriyle veri alışverişi yapabilirler. Client olarak açılan sayfaların server’ın bağlantılı olduğu ağa bağlı olmaları gerekir. Uygulamayı çok kullanıcı bir hale getirmek için Client sınıfı Thread sınıfından implement edilmiştir. Bu sayede ara yüzde herhangi bir takılma olmadan veri iletişim işlemleri eş zamanlı olarak yapılmaktadır. Her bağlantı için bir thread başlatılır ve diğer client’ların istekleri de dinlenmeye başlar.

# Chat Uygulamasının Çalışması

Client ile server arasında 2 farklı mesajlaşma tekniği kullanıldı. Polybius ve Vigenere şifreleme tekniği kullanılmıştır. Kullanıcı açmış olduğu mesajlaşma ekranında mesajlaşma sırasında ekranın sağ alt tarafında bulunan checkbox lar ile tanımlı iki seçenekten birini seçmesi halinde mesajlar bu iki şifreleme tekniğinden biri ile gerçekleşecektir. Server tarafına alınan şifreli mesajlar, bütün kullanıcılar tarafından görülmesi için tekrar client tarafına getirilirken şifre çözücü ile çözülüp yazılmaktadır.

# Polybius Şifreleme

Antik yunanda, Polybius ismindeki kişi tarafından bulunan iki boyutlu bir tahtaya dayalı şifreleme sistemidir. Bu sistemin özelliği, alfabedeki harflerin, iki boyutlu bir tabloya yerleştirilmesi ve ardından bu tablodaki satır ve sütun numaralarına göre okunmasıdır.

# Vigenere Şifreleme

Buradaki yöntem, anahtar kelimedeki harfin alfabede kaçıncı sırada olduğuna bakmak üzerine kurulu. Anahtar kelimedeki harf alfabede kaçıncı sıradaysa, alfabeyi o kadar ileri kaydırıyoruz. Örneğin şifrelenecek harf olarak, J harfini kullanalım. Anahtar kelimemizdeki harf ise E harfi olsun. E harfi alfabede 4. sırada bulunuyor (A‘nın alfabedeki sırasını 0 olarak varsayıyorum ve türkçe karakterleri hesaba katmıyorum). Bu durumda J harfinden 4 sonraki N harfi, şifrelenmiş harfimiz oluyor.
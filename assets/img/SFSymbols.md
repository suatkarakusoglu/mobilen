# Sembol Dünyasının Büyüsü: SF Symbols ile Tanışın

Merhaba Mobilen okurları, bu yazımda sizlere SF Symbols'ün büyüleyici dünyasına adım atarken nelerin beklediğini elimden geldiğince anlatmaya calışacağım.



## SF Symbols Nedir?

SF Symbols, Apple'ın geliştiricilere sunmuş olduğu güçlü bir sembol kitaplığıdır. Kitaplığın sunmus oldugu bu semboller, iOS, macOS veya ipadOS platformları için geliştirilen uygulamaların kullanıcı arayüzünü zenginleştirmek ve daha etkileyici hale getirmek için harika bir imkan sunmaktadir.

![Image](https://github.com/suatkarakusoglu/mobilen/assets/sf-symbols-og-twitter.jpg)

## SF Symbols ile Neler Yapabiliriz?

SF Symbols kitaplığının yetkinliklerini uyumluluk, olusturma modlari (rendering modes), degisken renk (multicolor), boyutlar ve agirlik (weight and scales), tasarim cesitleri (designt variants) ve animasyonlar (animations) konu başlıkları uzerinde durarak anlatmaya calışacağım. 

### Uyumluluk
SF Symbols, San Francisco sistem yazı tipiyle sorunsuz bir şekilde bütünleşen, tüm ağırlık ve boyutlardaki metinlerle otomatik olarak hizalanan binlerce tutarlı ve yüksek düzeyde yapılandırılabilir sembol sağlar.


<p style="display: flex; flex-direction: row; justify-content: space-evenly;">
<img src="https://github.com/suatkarakusoglu/mobilen/assets/SF_Pro_-_Preview.svg" height="150" aspectRatio="1" />
<img src="https://github.com/suatkarakusoglu/mobilen/assets/Animated-mass-spring-faster.gif" height="150" aspectRatio="1" />
<img src="https://github.com/suatkarakusoglu/mobilen/assets/foundations-sf-symbols-intro@2x.png" height="150" aspectRatio="1"  />
</p>

### Olusturma Modlari (Rendering Modes)
SF Symbols 3 ve sonrası, sembollerin görünüm yönetimi için oluşturma modları (Rendering Modes) adı verilen bir dizi, tek renkli (monochrome), hiyerarşik (hierarchical), palet (palette) ve çok renkli (multicolor), seçenek sunar. Bu seçeneklerin bize saglamis oldugu ceşitliliği aşağıda yazmış olduğum kod blogu ile örnekleyerek açıklayacağım.

```
import SwiftUI

struct ContentView: View {
  var symbols: [String] =
    [
      "square.and.arrow.up",
      "folder.badge.plus",
      "trash.slash",
      "calendar.day.timeline.right",
      "list.number",
      "textformat.abc.dottedunderline",
      "iphone.gen3.radiowaves.left.and.right",
      "pc",
    ]

  var body: some View {
    HStack {
      ForEach(symbols, id: \.self) { symbol in
        Image(systemName: symbol)
      }
    }
  }
}

```

Yukarıdaki kod bloğunda SF Symbols kütüphanesindeki isimlere göre oluşturulmuş sekiz adet sembol ekrana çizdirilmektedir.


**Tek Renkli (Monochrome):** Sembolün oluşturulma modunu monochrome (tek renkli) olarak ayarlamamız sonucunda sembolün tüm katmanlarına istediğimiz renk  uygulanarak oluşturulmaktadır.

``` 

ForEach(symbols, id: \.self) { symbol in
  Image(systemName: symbol)
    .symbolRenderingMode(.monochrome)
    .foregroundStyle(.blue)
}

```

![Image](https://github.com/suatkarakusoglu/mobilen/assets/sf-monochrome@2x.png)

**Hiyerarşik (Hierarchical):** Semboldeki tüm katmanlara verilen renk uygulanmakta ve katmanlardaki rengin opaklığı katmanların hiyerarşi düzeyine göre otomatik olarak ayarlanarak oluşturulmaktadır.

``` 

ForEach(symbols, id: \.self) { symbol in
  Image(systemName: symbol)
    .symbolRenderingMode(.hierarchical)
    .foregroundStyle(.blue)
}

```

![Image](https://github.com/suatkarakusoglu/mobilen/assets/sf-hierarchical@2x.png)

**Palet (Palette):** Hiyerarşideki her katman icin bir belirtilen renk kullanılarak sembolün iki veya daha fazla renkten oluşmasını sağlamaktadır.

```

ForEach(symbols, id: \.self) { symbol in
  Image(systemName: symbol)
    .symbolRenderingMode(.palette)
    .foregroundStyle(.blue, .gray)
}

```


![Image](https://github.com/suatkarakusoglu/mobilen/assets/sf-palette@2x.png)

```

NOTE: Üç hiyerarsik katmani bulunan sembollerde için yalnızca iki renk belirtildiğinde, üçüncü katman belirtilen ikinci katman rengini kullanır.

```

**Cok Renkli (Multicolor):** Sembolun taban (base) katmanındaki rengi belirtilir ve diger katmanlarindaki renkler sistem tarafindan konfigüre edilir.

```
ForEach(symbols, id: \.self) { symbol in
  Image(systemName: symbol)
    .symbolRenderingMode(.multicolor)
    .foregroundStyle(.blue)
}

```

![Image](https://github.com/suatkarakusoglu/mobilen/assets/sf-multicolor@2x.png)


**BONUS:**
```
Yukarıda açıkladığım oluşturma modlarında belirttiğimiz renkler yerine linear gradient kullanılarak semboller kullanıcılar için daha ilgi çekici bir hale getirilebilmektedir.

Image(systemName: "person.3.sequence.fill")
      .symbolRenderingMode(.palette)
      .foregroundStyle(
        .linearGradient(colors: [.red, .black], startPoint: .top, endPoint: .bottomTrailing),
        .linearGradient(colors: [.green, .black], startPoint: .top, endPoint: .bottomTrailing),
        .linearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottomTrailing)
      )

```

![Image](https://github.com/suatkarakusoglu/mobilen/assets/how-to-get-custom-colors-and-transparency-with-sf-symbols-5@2x.png)

    
### Degisken Renk (Variable color)

SF Symbols 4 ile birlikte gelen değişken renk özelliği sayesinde uygulama içerisindeki sembollerin oluşturma modundan bağımsız olarak kapasite veya güç gibi zaman içerisinde değişkenlik gösterebilen özellikleri temsil edilebilir oldu. Sembole verilen yüzde değer ile sembolün katmanlarının opaklığı ayarlanarak kullanıcıya sunulmaktadır.

```

import SwiftUI

struct ContentView: View {
    @State var progress: Double = 0
    
    var formattedProgress : String {
        String(format: "%.0f", progress/0.33)
    }
    
    var symbols: [String] =
    [
        "speaker.wave.3.fill",
        "wifi",
        "chart.bar.fill",
        "touchid",
    ]
    
    var body: some View {
        VStack {
            HStack {
                ForEach(symbols, id: \.self) { symbol in
                    Image(systemName: symbol, variableValue: progress)
                        .imageScale(.large)
                        .foregroundStyle(.red)
                }
            }
            .padding()
            
            Text("Current Progress: \(formattedProgress)")
                .font(.system(size: 25, weight: .bold, design: .rounded))
            
            Slider(value: $progress, in: 0...1, step: 0.33){
            } minimumValueLabel: {
                Text("0").font(.title).fontWeight(.bold)
            } maximumValueLabel: {
                Text("3").font(.title).fontWeight(.bold)
            }
            .padding()
            
        }
        .foregroundStyle(.blue)
        .font(.system(size: 100))
    }
}


```

![Image](https://github.com/suatkarakusoglu/mobilen/assets/variable_color.gif)

![Image](https://github.com/suatkarakusoglu/mobilen/assets/sf-variable-color@2x.png)

###  Boyutlar ve Agirlik (Weights and scales)

SF Symbols, barındırdığı semboller için sağladığı üç adet boyut (small, medium (the default), large) ve dokuz adet ağırlık (ultralight, thin, light, regular, medium, semibold, bold, heavy, black) çeşitliliği ile uyarlanabilir (adaptable) tasarımlar oluşturmaya yardımcı olmaktadir.

ImageScale ve fontWeight view modifierları aracılığı ile sembolün boyut ve yazı tipi ağırlığı ayarlanabilmektedir.

![Image](https://github.com/suatkarakusoglu/mobilen/assets/Scales.png)
![Image](https://github.com/suatkarakusoglu/mobilen/assets/Weights.png)

```
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Image(systemName: "folder.badge.plus")
            .foregroundStyle(.blue)
            .imageScale(.large)
            .fontWeight(.bold)
        
    }
}


```

Aşağıda bulunan sınıflandırma görseli Apple'in resmi sitesinden alıntılanmış olup kullanımların sembole etkisini detaylıca gostermektedir.

![Image](https://github.com/suatkarakusoglu/mobilen/assets/sf-scales-weights@2x.png)

```
Note: Boyutlar San Francisco sistem yazi tipinin  başlık yüksekliğine (yazi tipindeki büyük harfin satır taban çizgisi üzerindeki yüksekliği) göre tanımlanmaktadır.

```




<p style="display: flex; flex-direction: row; justify-content: space-evenly;">
<img src="https://github.com/suatkarakusoglu/mobilen/assets/sf-symbol-scale-small@2x.png" width="30%" aspectRatio="1" />
<img src="https://github.com/suatkarakusoglu/mobilen/assets/sf-symbol-scale-medium@2x.png" width="30%" aspectRatio="1" />
<img src="https://github.com/suatkarakusoglu/mobilen/assets/sf-symbol-scale-large@2x.png" width="30%"aspectRatio="1"  />
</p>
<p style="display: flex; flex-direction: row; justify-content: space-evenly;">
<text> Small</text>
<text> Medium</text>
<text> Large</text>
</p>

### Tasarım çeşitleri (Design variants)
SF Symbols iOS15 ile birlikte gelen symbolVariant view modifierı sayesinde barındırdığı sembollerin anlamını çeşitlendirebimektedir. Bu çeşitler daire (circle), kare (square), dörtgen (rectangle), doldurma (fill) ve çizgidir (slash).

![Image](https://github.com/suatkarakusoglu/mobilen/assets/DesignVariants/symbolVariant.png)

![Image](https://github.com/suatkarakusoglu/mobilen/assets/sf-variants@2x.png)


```
Note: Örnekte kullanmış olduğum symbolVariant view modifierları birbiri ardindan kullanılarak cumulatif bir sonuc elde edilebilmektedir.


import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Image(systemName: "heart")
            .imageScale(.large)
            .symbolVariant(.circle)
            .symbolVariant(.slash)
        
    }
}


```

![Image](https://github.com/suatkarakusoglu/mobilen/assets/DesignVariants/heartFillCircle.png)


### Animasyonlar (Animations)

SF Symbols, barındırdığı sembolleri mecazen canlandırmak icin kullanılabilecek ve konfigüre edilerek kişiselleştirilebilecek animasyon dizisi sunmaktadir. SF Symbols 5 ve sonrasinda, başlıca appear (görünme), disappear (kaybolma), bounce (zıplama), scale (büyüyüp küçülme), pulse (nabız), variable color (değiken renk) ve replace (yer değiştirme) animasyonlarını sunmaktadır. 

SymbolEffect view modifierı aracılığı animasyon efekti ayarlanabilmektedir.

![Image](https://github.com/suatkarakusoglu/mobilen/assets/AnimationAssets/symbolEffect.png)

```

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
          Image(systemName: "folder.badge.plus")
            .symbolEffect(.appear)
              .frame(width:  100, height: 100)
        }
        .padding()
    }
}

```


**Gorunme (Appear):** Sembolün yavas bir şekilde ortaya çıkmasını sağlamaktadır. 

![Image](https://github.com/suatkarakusoglu/mobilen/assets/sf-animation-appear.gif)

**Gorunme (Disappear):** Sembolün yavas bir sekilde görünmez hale gelmesini sağlamaktadır. 

![Image](https://github.com/suatkarakusoglu/mobilen/assets/sf-animation-disappear.gif)

**Ziplama (Bounce):** Sembolün yukarı aşağı hareketi ile elastik bir zıplama efekti meydana getirilmektedir.

![Image](https://github.com/suatkarakusoglu/mobilen/assets/sf-animation-bounce.gif)

**Boyut (Scale):** Sembolün büyütülüp küçültülerek boyut boyut değişikliğini gerçekleştirmektedir.  

![Image](https://github.com/suatkarakusoglu/mobilen/assets/sf-animation-scale.gif)

**Nabiz (Pulse):** Sembolün belirli katmanlarındaki opalığı periyodik olarak değiştirerek nabiz atımı görünümü sağlar. 

![Image](https://github.com/suatkarakusoglu/mobilen/assets/sf-animation-pulse.gif)

**Degisken Renk (Variable color):** Sembol içerisindeki katmanların opaklığını artımlı olarak değiştirmektedir.

![Image](https://github.com/suatkarakusoglu/mobilen/assets/sf-animation-variable-color.gif)

**Replace (Yer Degistirme):** Bir sembolün diğeri ile yer değiştirmesinin geçişinin animasyonunu sağlamaktadır. 

![Image](https://github.com/suatkarakusoglu/mobilen/assets/sf-animation-replace.gif)


Animasyonlar ile ilgili detayli bilgi sahibi olmak icin [hackingswift how-to-animate-sf-symbols](https://www.hackingwithswift.com/quick-start/swiftui/how-to-animate-sf-symbols) yazısını okumanızı tavsiye ederim.

Artık SF Symbols kitaplığını kullanarak uygulamanızın arayüzünü daha anlaşılır ve tutarlı hale getirebilirsiniz.

Bir sonraki yazıda tekrar buluşmak dileğiyle.

## Kaynaklar
- https://developer.apple.com/design/human-interface-guidelines/sf-symbols
- https://developer.apple.com/sf-symbols/
- https://www.hackingwithswift.com/quick-start/swiftui/how-to-get-custom-colors-and-transparency-with-sf-symbols
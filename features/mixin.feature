# language: ru
Функционал: Примесь рдобы
   Сценарий: Провѣрка подпримѣси пуздро
      Допустим ꙇє примѣнена подпримѣсь пуздро бисера рдоба
      Если къ кирилическу слову въ верхнемъ пуздрѣ ꙇє примѣненъ приꙇомъ :ниспуздри
      То кирилическо слово имаꙇє буквы въ нижнемъ пуздрѣ
      Если къ кирилическу слову въ нижнемъ пуздрѣ ꙇє примѣненъ приꙇомъ :воспуздри
      То кирилическо слово имаꙇє буквы въ верхнемъ пуздрѣ
      Если къ кирилическу слову въ смѣшанѣмъ пуздрѣ ꙇє примѣненъ приꙇомъ :воспуздри
      То кирилическо слово имаꙇє буквы въ верхнемъ пуздрѣ
      Если къ латыньску слову въ верхнемъ пуздрѣ ꙇє примѣненъ приꙇомъ :ниспуздри
      То латыньско слово имаꙇє буквы въ нижнемъ пуздрѣ
      Если къ латыньску слову въ нижнемъ пуздрѣ ꙇє примѣненъ приꙇомъ :воспуздри
      То латыньско слово имаꙇє буквы въ верхнемъ пуздрѣ
      Если къ кирилическу слову въ смѣшанѣмъ пуздрѣ ꙇє примѣненъ приꙇомъ :ниспуздри
      То кирилическо слово имаꙇє буквы въ нижнемъ пуздрѣ

   Сценарий: Провѣрка подпримѣси обратка
      Допустим ꙇє примѣнена подпримѣсь обратка бисера рдоба
      То Стразовъ приꙇомъ :обратка повратє обратну Стразу
      И Стразовъ приꙇомъ :обратка сѫ кракомъ повратє обратну Стразу
      И Стразовъ приꙇомъ :обратка сѫ доведомъ повратє обратну Стразу

   Сценарий: Провѣрка подпримѣси ли_пущь
      Допустим ꙇє примѣнена подпримѣсь ли_пущь бисера рдоба
      То приꙇомъ :ли_пущь рода пущь повратє вѣрнъ
      И приꙇомъ :ли_пущь рода лжа повратє лжъ
      И приꙇомъ :ли_пущь рода нове вещи повратє лжъ

   Сценарий: Провѣрка подпримѣси во_сл
      Допустим ꙇє примѣнена подпримѣсь во_сл бисера рдоба
      Если ровнъ наборъ ꙇє пречиненъ во словникъ
      То тъꙇи имѣꙇє ровнъ словникъ сѫ пущими значѣми
      Если двуглубнъ наборъ ꙇє пречиненъ во словникъ
      То тъꙇи имѣꙇє ровнъ словникъ сѫ ровнѣми значѣми
      Если триглубнъ наборъ ꙇє пречиненъ во словникъ
      То тъꙇи имѣꙇє ровнъ словникъ сѫ двуглубнѣми значѣми
      Если двуглубнъ наборъ сѫ одинакыми частьми ꙇє пречиненъ во словникъ
      То тъꙇи имѣꙇє ровнъ словникъ сѫ двами двуглубнѣмы значѣмы
      Если двуглубнъ наборъ сѫ одинакыми частьми ꙇє пречиненъ во словникъ приꙇомомъ :во_сл сѫ клѵчемъ :кромѣ_двоꙇниковъ
      То тъꙇи имѣꙇє ровнъ словникъ сѫ однимъ двуглубнѣмъ значѣмъ

   Сценарий: Провѣрка подпримѣси .режь_по (split_by)
      Допустим ꙇє примѣнена подпримѣсь .режь_по бисера рдоба
      И у нас есть набор чисел
      Если рассечём его на чётные и нечётные
      То получим два набора чётных и нечётных чисел

   Сценарий: Провѣрка подпримѣси .пробь (try)
      Допустим ꙇє примѣнена подпримѣсь .пробь бисера рдоба
      Если спробуем вызвать метод :qwer пущя
      То той вернёт пущь

   Сценарий: Провѣрка подпримѣси .жди_ьже (wait_if)
      Допустим ꙇє примѣнена подпримѣсь .жди_ьже бисера рдоба
      Если спробуем подождать мало, чтобы условие выполнилось
      То той вернёт ложно

      Если спробуем подождать мало, чтобы условие не выполнилось
      То той вернёт исте

      Если спробуем подождать долго, чтобы условие выполнилось
      То недождёмся

   Сценарий: Провѣрка подпримѣси сравнена
      Допустим ꙇє примѣнена подпримѣсь сравнена бисера рдоба
      Если имѣмы двѣ Стразы
      То приꙇомъ :сравнена двухъ Стразъ повратє безъ одна
      И приꙇомъ :сравнена двухъ Стразъ сѫ презоромъ надъстрочниковъ повратє одна
      И приꙇомъ :сравнена двухъ Стразъ сѫ презоромъ надъстрочниковъ ꙇакъ словникъ повратє одна


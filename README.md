# Rdoba

![Rdoba Logo](http://i44.tinypic.com/29fs129.png)

[![Dependency Status](https://gemnasium.com/3aHyga/rdoba.png)](https://gemnasium.com/3aHyga/rdoba)
[![Gem Version](https://badge.fury.io/rb/rdoba.png)](http://rubygems.org/gems/rdoba)
[![Build Status](https://travis-ci.org/3aHyga/rdoba.png?branch=master)](https://travis-ci.org/3aHyga/rdoba)
[![Coverage Status](https://coveralls.io/repos/3aHyga/rdoba/badge.png)](https://coveralls.io/r/3aHyga/rdoba)
[![Code Climate](https://codeclimate.com/github/3aHyga/rdoba.png)](https://codeclimate.com/github/3aHyga/rdoba)
[![Endorse Count](http://api.coderwall.com/3aHyga/endorsecount.png)](http://coderwall.com/3aHyga)
[![Solano Labs](https://api.tddium.com:443/majioa/rdoba/badges/41200.png?badge_token=ae032246866fa71a65ebf82a32e65992c6c8c1b7)](https://api.tddium.com:443/majioa/rdoba/suites/41200)

Rdoba, сирѣчь руби-добавокъ, есть библиотека, расширитяющая основныя классы Ruby такія какъ: Объектъ(Object), Ядро(Kernel), Строка(String), Словарь(Hash), Наборъ(Array), Пущь(NilClass) и т.д. Включаетъ модули и такія функціи:
 * common       - нѣкоторыя простыя методы къ Объекту, Ядру, Пущю, Набору, Строкѣ и Словрю;
 * a            - чтеніе и запись значеній въ Наборъ и Словарь по индексу;
 * combinations - перечисленіе значеній Набора въ различномъ порядкѣ;
 * log	        - функціи сборки отладочныхъ свѣдѣній приложенія;
 * gem		- нѣкоторыя методы бисера Rdoba, въ частности определенія оси и корневой папки бисера;
 * mixin        - примѣси, которыя могутъ быть подмѣшаны въ основныя классы рубинки;
 * dup		- функціи удвоенія Словаря и Набораъ, включая ихъ вложенія;
 * hashorder	- перечисленіе значеній Словаря въ заданномъ порядкѣ;
 * numeric	- разширенный переводъ числа въ строку и строки въ число;
 * require	- вложенная загрузка файловъ функціею require;
 * roman	- переводъ римскаго числа въ строку и строки въ римское число;
 * deploy	- развёртка YAML-шаблоновъ;
 * fe  	        - исправленіе кодировки въ Строкахъ (будетъ удалено по исправленіи въ ruby);
 * io		- функціи sscanf и sprintf съ дополнительными свойствами;
 * re		- простое преобразованіе Строки въ Правило;
 * strings	- разширеніе нѣкоторыхъ функцій Строки кириллическими правилами;
 * yaml		- упрощённая функція перевода Словаря или Набора въ YAML-документъ.

## Использованіе

### Общія методы

Добавляетъ нѣкоторыя простыя методы къ Объекту, Ядру, Пущю, Набору, Строкѣ и Словарю;

    require 'rdoba/common'

### Чтеніе и запись по индексу

Функціи позволяютъ читать и писать значенія въ Наборъ и Словарь по заданному въ видѣ Набора значеній индексу.

    require 'rdoba/a'

    h = { "ключъ 1" => [ 'знч', 'знч2' ],
	"ключъ 2" => { "ключъ 3" => "знч3" } }

    h.geta( [ "ключъ 2", "ключъ 3" ] ) # => "знч3"

    h.geta( [ "ключъ 1", 0 ] ) # => "знч"

    h.seta( [ "ключъ 2", "ключъ 3" ], 'НОВОЕ' ) # => "НОВОЕ"

    h # => {"ключъ 1"=>["знч", "знч2"], "ключъ 2"=>{"ключъ 3"=>"НОВОЕ"}}

### Перечисленіе значеній Набора

Перечисляетъ значенія Набора въ различныхъ ихъ кучныхъ комбинаціяхъ въ количествѣ 2^(Ѯ-1), гдѣ Ѯ - длина Набора. Существуетъ возможность прямаго или обратнаго перечичленія.

    require 'rdoba/combinations'

    a = [ 1,2,3 ]
    a.each_comby do |x|
      puts x.inspect
    end

    # получаемъ:
    # [[1], [2], [3]]
    # [[1], [2, 3]]
    # [[1, 2], [3]]
    # [[1, 2, 3]]

    a.each_comby(:backward) do |x|
      puts x.inspect
    end

    # получаемъ:
    # [[1, 2, 3]]
    # [[1, 2], [3]]
    # [[1], [2, 3]]
    # [[1], [2], [3]]


### Отладка приложенія

Оладочныя функціи позволяютъ для выбранного класса выполнять заданныя куски кода или выводить на терминалъ опредѣлённый текстъ въ зависимости отъ уровня отладки.

    require 'rdoba'

    class A
      rdoba :log => { :functions => :basic }
      def initialize
        log > "This is the Log"
      end
    end

    A.new # » This is the Log


### Методы бисера Rdoba
#### Rdoba.os
Методъ возвращаетъ видъ оси, на которой былъ запущенъ руби.

    require 'rdoba'

    Rdoba.os # » "linux"

#### Rdoba.gemroot
Методъ принимаетъ на входѣ параметръ имени бисера, и возвращаетъ корневую папку онаго бисера.

    require 'rdoba'

    Rdoba.gemroot 'rdoba' # » "/home/malo/git/rdoba"

### Методы бисера Rdoba
Модуль содержитъ примѣсныя методы, которыя могутъ быть подмѣшаны въ основныя классы рубинки.

### Пусто ли? (Is it empty?)
Проверяет пуста ли переменная.

    require 'rdoba'
    rdoba :mixin => [ :empty ]
    nil.empty? # » true
    false.empty? # » false
    Object.new.empty? # » false

### Пречинение Набора в Словарь (Array to Hash)
Преобразуетъ Набор в Словарь по определённымъ правиламъ.

    require 'rdoba'
    rdoba :mixin => [ :to_h ]
    [ 'aa', 0,
      'bb', 1 ].to_h # » {"aa"=>nil, 0=>nil, "bb"=>nil, 1=>nil
    [ [ 'aa', 0, ],
      [ 'bb', 1 ] ].to_h # » {"aa"=>0, "bb"=>1}
    [ [ 'aa', 0, 1, ],
      [ 'bb', [ 1, 0 ] ] ].to_h # » {"aa"=>[0, 1], "bb"=>[1, 0]}
    [ [ 'aa', 0, ],
      [ 'aa', 1 ] ].to_h # » {"aa"=>[0, 1]}
    [ [ 'aa', 0, ],
      [ 'aa', 0 ] ].to_h # » {"aa"=>[0, 1]}
    [ [ 'aa', 0, ],
      [ 'aa', 0 ] ].to_h( :save_unique => true ) # » {"aa"=>[0]}


### Одвоеніе Словаря и Набора

Позволяетъ выполнять какъ обычное, такъ и вложенное одвоеніе Словаря или Набора.

    require 'rdoba/dup'

    a = [ 'aaa', 'bbb' ]

    # выполняемъ обычное одвоеніе
    b = a.dup
    a[0].replace 'ccc'
    a # => ["ccc", "bbb"]
    b # => ["ccc", "bbb"]

    # выполняемъ вложенное одвоеніе
    c = a.dup(:recursive)
    a[0].replace 'ddd'
    a # => ["ddd", "bbb"]
    c # => ["ccc", "bbb"]

### Перечисленіе значеній Словаря въ заданномъ порядкѣ

Позволяетъ перебрать всѣ ключи и значенія Словаря по опредѣлённому порядку. Порядок сей задаётся свойствомъ Словаря :order. Если въ заданном порядкѣ не всѣ ключи опредѣлены, то сначала перебираются заданныя ключ, а затѣмъ уже остальныя въ порядкѣ какъ они заданы въ Словарѣ. Перебирать можно ключи, пары или значенія по ключамъ. 4 метода суть перебора: each, each_pair, each_key, each_value. Удаляется порядокъ методом disorder.

    require 'rdoba/hashorder'

    h = { "ключъ 1" => [ 'знч', 'знч2' ],
	  "ключъ 2" => { },
	  "ключъ 3" => "знч3" }

    # простой переборъ паръ
    h.each do |x,y|
      puts x
    end
    # выводъ
    # ключъ 1
    # ключъ 2
    # ключъ 3

    # переборъ паръ
    h.order = ['ключъ 2','ключъ 3','ключъ 1']
    h.each_pair do |x,y|
      puts x
    end
    # выводъ
    # ключъ 2
    # ключъ 3
    # ключъ 1

    # переборъ ключей
    h.order = ['ключъ 2']
    h.each_key do |x|
      puts x
    end
    # выводъ
    # ключъ 2
    # ключъ 1
    # ключъ 3

    # переборъ значеній къ уже упорядоченнымъ ключамъ
    h.order = ['ключъ 2','ключъ 3','ключъ 1']
    h.each_value do |x|
      puts x.inspect
    end
    # выводъ
    # {}
    # "знч3"
    # ["знч", "знч2"]

    # удаленіе порядка
    h.disorder

### Разширенный переводъ чиселъ

Добавка позволяетъ преобразовывать:
 * Строку въ Число по заданному основанію, а также задавать порядокъ слѣдованія цифръ;
 * Число въ Строку, задавая основаніе, заполненіе нулями Строки до опредѣлённой ширины и обрамленіе числа въ строкѣ;
 * Число въ потокъ данныхъ въ видѣ Строки.

    require 'rdoba/numeric'

    # Строка -> Число
    '1010'.to_i(2)	# => 10
    '0xFE'.to_i(16)	# => 254

    # Big-endian число
    '-123'.to_i(8, :be) # => -209 (-0321)

    # Число -> Строка
    1020.to_s(16, { :padding => 10 }, :style_formatting) # => "0x00000003FC"

    # Число -> данныя въ Строкѣ
    1020.to_p(16, { :padding => 5 }, :be)   # => "\x00\x00\x00\x03\xFC"
    1020.to_p(16, { :padding => 5 })	    # => "\xFC\x03\x00\x00\x00"

### Вложенная загрузка модулей

Добавка позволяетъ загружать ruby-файлъ съ подпапками.

    require 'rdoba/require'

    # есть у васъ файловая структура:
    # x.rb
    # x/y.rb
    # x/z.rb
    # можно загрузить её разомъ такъ:
    require 'x', :recursive

### Обработка римскихъ чиселъ

Добавка позволяетъ преобразовывать римскія числа въ Строку и изъ неё.

    require 'rdoba/roman'

    'XVI'.rom # => 16

    144.to_rom # => "CXLIV"

### Развёртка YAML-шаблоновъ

    require 'rdoba/deploy'

### Исправленіе кодировки въ Строкахъ

Исправляетъ кодировку Строки въ ruby 1.9 въ Encoding.default_internal. Если оно не задано, то въ 'UTF-8'. Часто такой финтъ нуженъ для въставленія совместимости забугорныхъ приложеній и кириллицы.

!!! будетъ удалено по исправленіи въ ruby

    require 'rdoba/fe'

    s = 'eee'
    s.encoding # => #<Encoding:US/ASCII>

    s.fe
    s.encoding # => #<Encoding:UTF-8>

### Новыя функціи sscanf, sprintf и consolize

Въ функциію sprintf добавленъ ключъ 'P', позволяющій сохранить просто данныя чего-либо (въ частности Числа) въ строку. Функціи 'scanf' и 'consolize' у Строки позволяютъ разбирать строку согласно переданнымъ въ scanf ключамъ и прощать строку, убирая лишние знаки \r, соотвѣтственно.

#### sprintf

Форматъ ключа 'P' функціи sprintf: %сдвигъ.заполненіе+P
 * сдвигъ есть сдвигъ новой строки от начала въ пробѣлахъ;
 * заполненіе есть дополненіе преобразованного въ Строку Числа нулями;
 * + сообщаетъ о томъ, что Число нужно выразить въ big-endian.

    require 'rdoba/io'

    sprintf "%5P", 1000	    # => "     \xE8\x03"
    sprintf "%.5P", 1000    # => "\xE8\x03\x00\x00\x00"

    sprintf "%5.10+P", 1000 # => "     \x00\x00\x00\x00\x00\x00\x00\x00\x03\xE8"

#### scanf

Позволяетъ преобразовать согласно заданной строкѣ ключей. Ключи здѣ такія же какъ в Kernel::sprintf.

    s = 'значеніе = 1000'
    s.scanf "%s = %i" # => [["значеніе", 1000]]

#### consolize

Функція упрощаетъ содержимое строки, как бы при выводѣ её на консоль.

    s = "string\rval"
    s.consolize # => "valing"

### Преобразованіе Строки въ Правило

    require 'rdoba/re'

    a = 'строка.'
    b = 'доп.строка.доп'
    a.to_res	    # => "строка\\."
    a.to_re	    # => /строка\./i

    b.match a.to_re # => #<MatchData "строка.">

### Расширеніе строки

Здѣ суть опредѣлены функціи, разширяющія возможности Строки кириллическими правилами, а также дополняющія Строку новыми возможностями.

    require 'rdoba/strings'

#### Новыя методы класса

##### upcase

Переводъ знака въ верхнее значеніе:

    a = 'ц'
    String.upcase(a) # => "Ц"
    a = 0x401 # 'ё'
    String.upcase(a) # => "Ё"

##### downcase

Переводъ знака въ нижнее значеніе:

    a = 'Ц'
    String.downcase(a) # => "ц"
    a = 0x400 # 'Ё'
    String.downcase(a) # => "ё"


#### Новыя методы экземпляра

##### upcase

Переводъ строки въ верхнее значеніе. Функція можетъ принимать дополнительное значеніе 'FirstChar', которое принуждаетъ переводить не всю строку, а только первый знакъ.

    a = 'строка'
    a.upcase # => "СТРОКА"
    a = 'строка'
    a.upcase(String::FirstChar) # => "Строка"

##### downcase

Переводъ знака въ нижнее значеніе. Функція можетъ принимать дополнительное значеніе 'FirstChar', которое принуждаетъ пе
реводить не всю строку, а только первый знакъ.

    a = 'СТРОКА'
    a.downcase # => "строка"
    a = 'СТРОКА'
    a.downcase(String::FirstChar) # => "сТРОКА"

##### reverse

Обращаетъ строку. Допускается проводить обращеніе съ перемѣннымъ шагомъ, а также побайтно.

    a = 'строка'

    # обычное обращеніе
    a.reverse # => "акортс"

    # побайтное обращеніе
    a.reverse(String::ByteByByte) # =>"\xB0\xD0\xBA\xD0\xBE\xD0\x80\xD1\x82\xD1\x81\xD1"

    # обращеніе съ шагомъ 2
    a.reverse(2) # => "карост"

##### compare_to

Работаетъ такъ же какъ и '<=>', но можетъ принимать дополнительное значеніе ignore_diacritics, которое вынуждаетъ методъ проводить сравненіе отбрасывая надстрочники:

    a = 'а҆́гнецъ'
    b = 'а҆гкѵ́ра'

    a <=> b # => -1
    a.compare_to(b) # => -1
    a.compare_to(b, :ignore_diacritics) # => 1
    a.compare_to(b, :ignore_diacritics => true) # => 1

#### Новыя методы для Fixnum
##### chr

Возвращаетъ знакъ изъ числа, возпринимая его какъ кодъ.

    1094.chr # => "ц"

#### Новыя методы для ruby 1.8
##### ord

Возвращаетъ числовой кодъ перваго знака строки:

    a = 'ёжъ'
    a.ord # => 1025 (0x401)

### Упрощённый переводъ въ YAML

Позволяетъ простенько перевести экземпляры классовъ Словаря, Набора, Строки и Числа въ YAML-документъ. Также возможно указать порядокъ выведенія ключей въ Словарѣ.

    h = { "ключъ 1" => [ 'знч', 'знч2' ],
	"ключъ 2" => 10 }

    puts h.to_yml
      ---
      ключъ 2: 10
      ключъ 1:
        - знч
          - знч2

    puts h.to_yml(:order => ["ключъ 1", "ключъ 2"])
      ---
      ключъ 1:
        - знч
          - знч2
      ключъ 2: 10


    puts h.to_yml(:order => ["ключъ 2", "ключъ 1"])
      ---
      ключъ 2: 10
      ключъ 1:
        - знч
        - знч2

# Права

Авторскія и исключительныя права (а) 2011 Малъ Скрылевъ
Зри LICENSE за подробностями.

# Хотите поделиться денюжкою?
<script data-gittip-username="majioa" src="//gttp.co/v1.js"></script>



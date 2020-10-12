# frozen_string_literal: true

require_relative 'lib/young_ransomware'

puts "\n\n\n"
puts "______Привет! Это программа Юный шифровальщик!______"
puts "\n\n"

pasha = YoungRansomware.new
pasha.work
puts "____________________________________________________"
puts "\n\n\n"





# pasha = YoungRansomware.new
#
# alphabet = ',АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ абвгдеёжзийклмнопрстуфхцчшщъыьэюя.'
# key1 = 'ё'
# key2 = 'Бъ'
# key3 = 'А лмДЕеЬЭЮЯабьийвгдёКЛжзпрсЁЖБВГСТУкн.оФХЦЩЪЫтуфЙМНхцчшщъЗИОПР,ыэЧШюя'
# key4 = 'Макс'
# key5 = '., яЁёЯ'
# key6 = 'Самый Лучший Преподаватель'
#
# m1 = pasha.cesar_encrypt('Сначала ты работаешь на диплом, а потом баристой.', alphabet, key1)
# p pasha.cesar_decrypt(m1, alphabet, key1)
#
# m2 = pasha.affine_encrypt('Только во время сессии и узнаешь, что в Интернете есть не все...', alphabet, key2)
# p pasha.affine_decrypt(m2, alphabet, key2)
#
# m3 = pasha.simple_substitution_encrypt('Иисус превращает воду в вино. Я превращаю воду в курсовую.', alphabet, key3)
# p pasha.simple_substitution_decrypt(m3, alphabet, key3)
#
# m4 = pasha.hill_encrypt('Актуальность моей дипломной работы состоит в том, что без неё я не получу диплом.,', alphabet, key4)
# p pasha.hill_decrypt(m4, alphabet, key4)
#
# m5 = pasha.permutation_encrypt('Студент Сидоров всегда покупает в булочной два хлеба, потому что одним хлебом сыт не будешь.,,,,,,', alphabet, key5)
# p pasha.permutation_decrypt(m5 ,alphabet,key5)
#
# m6 = pasha.vigenere_encrypt('За две недели до защиты диплома выходит из строя жесткий диск. В облако ничего не сохранял. Хорошо, что я еще не начал писать диплом.', alphabet, key6)
# p pasha.vigenere_decrypt(m6, alphabet,key6)

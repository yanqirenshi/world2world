(in-package :cl-user)
(defpackage world2world
  (:use :cl)
  (:nicknames :w2w)
  (:export :refresh-language
           :add-language
           :get-language
           :languagep
           :add-message
           :get-messages
           :get-control-string
           :communication
           :c*
           :error*
           :format*))
(in-package :world2world)


;;;
;;; utility
;;;
(defun asserts (&rest symbols)
  (mapcar #'(lambda (symbol)
              (assert symbol))
          symbols))



;;;
;;; data
;;;
(defvar *default-language* :en)

(defvar *lang-data*
  '(:aa "Afar"
    :ab "Abkhazian"
    :ae "Avestan"
    :af "Afrikaans"
    :af-za "Afrikaans - South Africa"
    :als "Alsace"
    :am "Amharic"
    :an "Aragonese"
    :ar "Arabic"
    :ar-ae "Arabic - United Arab Emirates"
    :ar-bh "Arabic - Bahrain"
    :ar-dz "Arabic - Algeria"
    :ar-eg "Arabic - Egypt"
    :ar-iq "Arabic - Iraq"
    :ar-jo "Arabic - Jordan"
    :ar-kw "Arabic - Kuwait"
    :ar-lb "Arabic - Lebanon"
    :ar-lb "Arabic - Lebanon"
    :ar-ly "Arabic - Libyan Arab Jamahiriya"
    :ar-ma "Arabic - Morocco"
    :ar-om "Arabic - Oman"
    :ar-qa "Arabic - Qatar"
    :ar-sa "Arabic - Saudi Arabia"
    :ar-sy "Arabic - Syrian Arab Republic"
    :art-lojban "Lojban"
    :ar-tn "Arabic - Tunisia"
    :ar-ye "Arabic - Yemen"
    :as "Assamese"
    :ast-es "Asturian"
    :asz-sk-sk "Eastern Slovak"
    :ay "Aymara"
    :az "Azerbaijani"
    :az-arab "Azerbaijani in Arabic script"
    :az-az "Azerbaijani - Azerbaijan"
    :az-az-cyrl "Azerbaijani - Cyrillic"
    :az-az-latn "Azerbaijani - Latin"
    :az-cyrl "Azerbaijani in Cyrillic script"
    :az-latn "Azerbaijani in Latin script"
    :ba "Bashkir"
    :ban "Balinese"
    :ba-ru "Bashkir"
    :be "Belarusian"
    :be-by "Belarusian - Belarus"
    :bg "Bulgarian"
    :bg-bg "Bulgarian - Bulgaria"
    :bh "Bihari"
    :bi "Bislama"
    :bik-ph "Bicolano(Philippines)"
    :bn "Bengali"
    :bn-bd "Bengali - Bangladesh"
    :bo "Tibetan"
    :br "Breton"
    :br-fr "Breton"
    :bs "Bosnian"
    :bs-ba "Bosnian"
    :bug "Buginese"
    :ca "Catalan; Valencian"
    :ca-es "Catalan; Valencian - Spain"
    :ce "Chechen"
    :ceb-ph "Cebuano(Philippines)"
    :cel "Celtic"
    :cel-gaulish "Gaulish"
    :ch "Chamorro"
    :co "Corsican"
    :cpe "Pijin(Pidgin) - Solomon Islands"
    :cpe-mu "Creoles and pidgins - Mauritius"
    :cpf-mu "Creoles and pidgins - Mauritius"
    :crp "Creoles and pidgins"
    :crp-ph "Chavacano, Chabakano(Philippines)"
    :cs "Czech"
    :cs-cz "Czech - Czech Republic"
    :cu "Slavonic"
    :cv "Chuvash"
    :cy "Welsh"
    :cy-gb "Welsh"
    :da "Danish"
    :da-dk "Danish - Denmark"
    :de "German"
    :de-1901 "German, traditional orthography"
    :de-1996 "German, orthography of 1996"
    :de-at "German - Austria"
    :de-at-1901 "German, Austrian variant, traditional orthography"
    :de-at-1996 "German, Austrian variant, orthography of 1996"
    :de-ch "German - Switzerland"
    :de-ch-1901 "German, Swiss variant, traditional orthography"
    :de-ch-1996 "German, Swiss variant, orthography of 1996"
    :de-de "German - Germany"
    :de-de-1901 "German, German variant, traditional orthography"
    :de-de-1996 "German, German variant, orthography of 1996"
    :de-li "German - Liechtenstein"
    :de-lu "German - Luxembourg"
    :div "Divehi(Dhivehi)"
    :div-mv "Divehi(Dhivehi) - Maldives"
    :dz "Dzongkha - Bhutan"
    :dz "Dzongkha"
    :el "Greek"
    :el-gr "Greek - Greece"
    :en "English"
    :en-au "English - Australia"
    :en-boont "Boontling"
    :en-bz "English - Belize"
    :en-ca "English - Canada"
    :en-cb "English"
    :en-gb "English - United Kingdom"
    :en-gb-oed "English, Oxford English Dictionary spelling"
    :en-ie "English - Ireland"
    :en-jm "English - Jamaica"
    :en-nz "English - New Zealand"
    :en-ph "English - Philippines"
    :en-scouse "English Liverpudlian dialect known as 'Scouse'"
    :en-tt "English - Trinidad And Tobago"
    :en-us "English - United States"
    :en-x-si "Standard Units adoption"
    :en-za "English - South Africa"
    :en-zw "English - Zimbabwe"
    :eo "Esperanto"
    :es "Castilian; Spanish"
    :es-ar "Castilian; Spanish - Argentina"
    :es-bo "Castilian; Spanish - Bolivia"
    :es-cl "Castilian; Spanish - Chile"
    :es-co "Castilian; Spanish - Colombia"
    :es-cr "Castilian; Spanish - Costa Rica"
    :es-do "Castilian; Spanish - Dominican Republic"
    :es-ec "Castilian; Spanish - Ecuador"
    :es-es "Castilian; Spanish - Spain"
    :es-gt "Castilian; Spanish - Guatemala"
    :es-hn "Castilian; Spanish - Honduras"
    :es-mx "Castilian; Spanish - Mexico"
    :es-ni "Castilian; Spanish - Nicaragua"
    :es-pa "Castilian; Spanish - Panama"
    :es-pe "Castilian; Spanish - Peru"
    :es-pr "Castilian; Spanish - Puerto Rico"
    :es-py "Castilian; Spanish - Paraguay"
    :es-sv "Castilian; Spanish - EL Salvador"
    :es-us "Castilian; Spanish - United States"
    :es-uy "Castilian; Spanish - Uruguay"
    :es-ve "Castilian; Spanish - Venezuela"
    :et "Estonian"
    :et-ee "Estonian - Estonia"
    :eu "Basque"
    :eu-es "Basque"
    :fa "Persian"
    :fa-ir "Persian - Islamic Republic Of Iran"
    :fi "Finnish"
    :fi-fi "Finnish - Finland"
    :fj "Fijian"
    :fo "Faroese(Faeroese)"
    :fo-fo "Faroese(Faeroese) - Faroe Islands"
    :fr "French"
    :fr-be "French - Belgium"
    :fr-ca "French - Canada"
    :fr-ch "French - Switzerland"
    :fr-fr "French - France"
    :fr-lu "French - Luxembourg"
    :fr-mc "French - Monaco"
    :fy "Frisian"
    :ga "Irish"
    :ga-ie "Irish Gaelic"
    :gay "Gayo"
    :gd "Gaelic; Scottish Gaelic"
    :gd-gb "Gaelic; Scottish Gaelic"
    :gil "Gilbertese(Kiribati) - Kiribati"
    :gl "Gallegan(Galician)"
    :gl-es "Gallegan(Galician) - Galicia"
    :gn "Guarani"
    :gu "Gujarati"
    :gu-in "Gujarati - India"
    :gv "Manx"
    :ha "Hausa"
    :haw "Hawaiian"
    :he "Hebrew"
    :he-il "Hebrew - Israel"
    :hi "Hindi"
    :hi-in "Hindi - India"
    :hil-ph "Ilonggo, Hiligaynon(Philippines)"
    :hil-ph "Hiligaynon(Ilonngo)"
    :ho "Hiri Motu"
    :hr "Croatian"
    :hr-hr "Croatian - Croatia"
    :ht "Creole - Haiti"
    :hu "Hungarian(Magyar)"
    :hu-hu "Hungarian - Hungary"
    :hy "Armenian"
    :hy-am "Armenian - Armenia"
    :hz "Herero"
    :ia "Interlingua (International Auxiliary Language Association)"
    :i-ami "Amis"
    :iba "Iban"
    :i-bnn "Bunun"
    :id "Indonesian"
    :i-default "Default Language Context"
    :id-id "Indonesian - Indonesia"
    :ie "Interlingue"
    :i-enochian "Enochian"
    :ig "Igbo(Nigeria)"
    :i-hak "Hakka"
    :ik "Inupiaq"
    :i-klingon "Klingon"
    :ilo-ph "Iloco, ilocano(Philippines)"
    :i-lux "Luxembourgish"
    :i-mingo "Mingo"
    :i-navajo "Navajo"
    :i-pwn "Paiwan"
    :ira "Dari"
    :is "Icelandic"
    :is-is "Icelandic - Iceland"
    :it "Italian"
    :i-tao "Tao"
    :i-tay "Tayal"
    :it-ch "Italian - Switzerland"
    :it-it "Italian - Italy"
    :i-tsu "Tsou"
    :iu "Inuktitut"
    :ja "Japanese"
    :ja-jp "Japanese"
    :jv "Javanese"
    :ka "Georgian"
    :ka-ge "Georgian - Georgia"
    :kaw "Kawi"
    :kk "Kazakh"
    :kk-kz "Kazakh - Kazakhstan"
    :kl "Greenlandic"
    :km "Cambodian(Khmer)"
    :km "Khmer"
    :kn "Kannada"
    :kn-in "Kannada - India"
    :ko "Korean"
    :kok "Konkani"
    :kok-in "Konkani - India"
    :ko-kp "Korean - Democratic People's Republic Of Korea"
    :ko-kr "Korean - Republic Of Korea"
    :ks "Kashmiri"
    :ku "Kurdish"
    :kv "Komi"
    :kw "Cornish"
    :kw-gb "Cornish"
    :ky "Kirghiz"
    :ky-kz "Kirghiz - Kazakhstan"
    :la "Latin"
    :lb "Luxembourgish(Luxemburgisch); Letzeburgesch"
    :lb-lu "Luxembourgish(Luxemburgisch); Letzeburgesch - Luxembourg"
    :li "Limburgan; Limburger; Limburgish"
    :ln "Lingala"
    :lo "Lao"
    :lo-la "Lao - Lao People's Democratic Republic"
    :lt "Lithuanian"
    :lt-lt "Lithuanian - Lithuania"
    :lv "Latvian"
    :lv-lv "Latvian - Latvia"
    :mad "Madurese"
    :mak "Makasar"
    :mg "Malagasy"
    :mh "Marshallese"
    :mi "Maori"
    :min "Minangkabau"
    :mi-nz "Maori - New Zealand"
    :mk "Macedonian"
    :mk-mk "Macedonian - The Former Yugoslav Republic Of Macedonia"
    :ml "Malayalam"
    :mn "Mongolian"
    :mn-mn "Mongolian - Mongolia"
    :mo "Moldavian"
    :mo-md "Moldavian - Republic Of Moldova"
    :mr "Marathi"
    :mr-in "Marathi - India"
    :ms "Malay"
    :ms-bn "Malay - Brunei Darussalam"
    :ms-my "Malay - Malaysia"
    :mt "Maltese"
    :my "Burmese(Myanmar)"
    :na "Nauru"
    :nb "Norwegian Bokmål"
    :nb-no "Norwegian Bokmål"
    :nd "North Ndebele"
    :nds "Low Saxon"
    :ne "Nepali"
    :ng "Ndonga"
    :nl "Flemish; Dutch"
    :nl-be "Flemish; Dutch - Belgium"
    :nl-nl "Flemish; Dutch - Netherlands"
    :nn "Norwegian Nynorsk"
    :nn-no "Norwegian Nynorsk"
    :no "Norwegian"
    :no-bok "Norwegian Bokmål"
    :no-nyn "Norwegian Nynorsk"
    :nr "South Ndebele"
    :nso-za "Sotho(Northern)"
    :nv "Navajo; Navaho"
    :ny "Nyanja; Chichewa; Chewa"
    :oc "Occitan"
    :oc "Occitan"
    :om "Oromo"
    :or "Oriya"
    :os "Ossetian;Ossetic"
    :pa "Panjabi; Punjabi"
    :pag "Pangasinan(Philippines)"
    :pa-in "Panjabi; Punjabi - India"
    :pam-ph "Pampanga(Philippines)"
    :pa-us "Punjabi in Latin script"
    :phi "Tausug, Tausog(Philippines)"
    :phi "Visayan, Bisayan(Philippines)"
    :pi "Pali"
    :pl "Polish"
    :pl-pl "Polish - Poland"
    :ps "Pushto"
    :pt "Portuguese"
    :pt-br "Portuguese - Brazil"
    :pt-pt "Portuguese - Portugal"
    :qu "Quechua"
    :rm "Raeto-Romance(Rhaeto-Romanic)"
    :rn "Rundi(Kirundi) - Burundi"
    :ro "Romanian"
    :ro-md "Romanian - Republic Of Moldova"
    :ro-ro "Romanian - Romania"
    :ru "Russian"
    :ru-md "Russian - Republic Of Moldova"
    :ru-ru "Russian - Russian Federation"
    :rw "Kinyarwanda"
    :sa "Sanskrit"
    :sa-in "Sanskrit - India"
    :sb "Sorbian"
    :sc "Sardinian"
    :sd "Sindhi"
    :se "Northern Sami"
    :sg "Sango - Central African Republic"
    :sgn-be-fr "Belgian-French Sign Language"
    :sgn-be-nl "Belgian-Flemish Sign Language"
    :sgn-br "Brazilian Sign Language"
    :sgn-ch-de "Swiss German Sign Language"
    :sgn-co "Colombian Sign Language"
    :sgn-de "German Sign Language"
    :sgn-dk "Danish Sign Language"
    :sgn-es "Spanish Sign Language"
    :sgn-fr "French Sign Language"
    :sgn-gb "British Sign Language"
    :sgn-gr "Greek Sign Language"
    :sgn-ie "Irish Sign Language"
    :sgn-it "Italian Sign Language"
    :sgn-jp "Japanese Sign Language"
    :sgn-mx "Mexican Sign Language"
    :sgn-ni "Nicaraguan Sign Language"
    :sgn-nl "Dutch Sign Language"
    :sgn-no "Norwegian Sign Language"
    :sgn-pt "Portuguese Sign Language"
    :sgn-se "Swedish Sign Language"
    :sgn-us "American Sign Language"
    :sgn-za "South African Sign Language"
    :sh "Serbo-Croatian"
    :si "Sinhalese"
    :sk "Slovak"
    :sk-sk "Slovak - Slovakia"
    :sl "Slovenian"
    :sl-rozaj "Resian, Resianic, Rezijan"
    :sl-si "Slovenian - Slovenia"
    :sm "Samoan"
    :smi "Sami(Lappish)"
    :sn "Shona - Zimbabwe"
    :so "Somali"
    :sq "Albanian"
    :sq-al "Albanian - Albania"
    :sr "Serbian"
    :sr-cyrl "Serbian in Cyrillic script"
    :srd-it "Sardinian Campidanesu"
    :sr-latn "Serbian in Latin script"
    :sr-sp-cyrl "Serbian(Cyrillic) - Serbia And Montenegro"
    :sr-sp-latn "Serbian(Latin) - Serbia And Montenegro"
    :ss "Swati(Siswati)"
    :ss-za "Swati(Siswati)"
    :st "Sotho(Southern)"
    :su "Sundanese"
    :sv "Swedish"
    :sv-fi "Swedish - Finland"
    :sv-se "Swedish - Sweden"
    :sw "Swahili"
    :sw-ke "Swahili - Kenya"
    :sw-tz "Swahili - United Republic Of Tanzania"
    :sx "Sutu"
    :syr "Syriac"
    :syr-sy "Syriac - Syrian Arab Republic"
    :ta "Tamil"
    :ta-in "Tamil - India"
    :ta-my "Tamil - Malaysia"
    :te "Telugu"
    :te-in "Telugu - India"
    :tg "Tajik"
    :th "Thai"
    :th-th "Thai - Thailand"
    :ti "Tigrinya"
    :tk "Turkmen"
    :tl "Tagalog, Filipino, Pilipino"
    :tl-ph "Tagalog, Filipino, Pilipino(Philippines)"
    :tn "Tswana"
    :tn-za "Tswana"
    :to "Tonga"
    :tpi "Tok Pijin(Tok Pisin) - Papua New Guinea"
    :tr "Turkish"
    :tr-tr "Turkish - Turkey"
    :ts "Tsonga"
    :tt "Tatar"
    :tt-ru "Tatar - Russian Federation"
    :tw "Twi"
    :ug "Uighur"
    :uk "Ukrainian"
    :uk-ua "Ukrainian - Ukraine"
    :ur "Urdu"
    :ur-pk "Urdu - Pakistan"
    :uz "Uzbek"
    :uz-cyrl "Uzbek in Cyrillic script"
    :uz-latn "Uzbek in Latin script"
    :uz-uz-cyrl "Uzbek(Cyrillic) - Uzbekistan"
    :uz-uz-latn "Uzbek(Latin) - Uzbekistan"
    :val-ca-es "Valencian"
    :ven-za "Venda"
    :vi "Vietnamese"
    :vi-vn "Vietnamese - Viet Nam"
    :vo "Volapük"
    :wa "Walloon"
    :war-ph "Waray(Philippines)"
    :wen-de "Sorbian"
    :wo "Wolof(Gambia, Senegal)"
    :xh "Xhosa"
    :xh-za "Xhosa"
    :yi "Yiddish"
    :yi-latn "Yiddish in Latin script"
    :yo "Yoruba"
    :za "Zhuang; Chuang"
    :zh "Chinese"
    :zh-chs "Simplified Chinese"
    :zh-cht "Traditional Chinese"
    :zh-cn "Chinese - China"
    :zh-gan "Kan or Gan"
    :zh-guoyu "Mandarin or Standard Chinese"
    :zh-hakka "Hakka"
    :zh-hans "Chinese, in simplified script"
    :zh-hant "Chinese, in traditional script"
    :zh-hk "Chinese - Hong Kong"
    :zh-min "Min, Fuzhou, Hokkien, Amoy or Taiwanese"
    :zh-min-nan "Minnan, Hokkien, Amoy, Taiwanese, Southern Min, Southern Fujian, Hoklo, Southern Fukien, Ho-lo"
    :zh-min-nan-tw "Minnan, Hokkien, Amoy, Taiwanese, Southern Min, Southern Fujian, Hoklo, Southern Fukien, Ho-lo(Taiwan)"
    :zh-mo "Chinese - Macao"
    :zh-sg "Chinese - Singapore"
    :zh-tw "Chinese - Taiwan, Province Of China"
    :zh-wuu "Shanghaiese or Wu"
    :zh-xiang "Xiang or Hunanese"
    :zh-yue "Cantonese"
    :zu "Zulu"
    :zu-za "Zulu"))

｛補足｝｛ほそく｝｛演習｝｛えんしゅう｝｛問題｝｛もんだい｝：｛第｝｛だい｝2｛章｝｛しょう｝
=============================================================================================

_プログラミングHaskell_の｛第｝｛だい｝2｛章｝｛しょう｝のための
｛補足｝｛ほそく｝｛演習｝｛えんしゅう｝｛問題｝｛もんだい｝です。
｛本｝｛ほん｝にある｛演習｝｛えんしゅう｝｛問題｝｛もんだい｝（ページ18）を
｛最初｝｛さいしょ｝に｛解決｝｛かいけつ｝してください。

｛問題｝｛もんだい｝6
---------------------

｛次｝｛つぎ｝の｛式｝｛しき｝に｛括弧｝｛かっこ｝を｛付｝｛つ｝けてください。

1. `a * a + 2 * a * b + b * b`
2. `a ^ 2 - 2 * a * b + b ^ 2`

｛問題｝｛もんだい｝7
---------------------

｛華氏｝｛かし｝｛温度｝｛おんど｝から｛摂氏｝｛せっし｝｛温度｝｛おんど｝に
｛変換｝｛へんかん｝する｛関数｝｛かんすう｝`degFtoC`を｛定義｝｛ていぎ｝して
ください。

    C = (F - 32) * 5/9

｛以下｝｛いか｝の｛使用例｝｛しようれい｝を｛示｝｛しめ｝してください。

    > degFtoC 32
    0.0
    > degFtoC 212
    100.0
    > degFtoC 77
    25.0

｛摂氏｝｛せっし｝｛温度｝｛おんど｝から｛華氏｝｛かし｝｛温度｝｛おんど｝に
｛変換｝｛へんかん｝する｛関数｝｛かんすう｝`degCtoF`を｛定義｝｛ていぎ｝して
ください。

｛以下｝｛いか｝の｛使用例｝｛しようれい｝を｛示｝｛しめ｝してください。

    > degCtoF 0
    32.0
    > degCtoF 100
    212.0
    > degCtoF 25
    77.0

｛問題｝｛もんだい｝8
---------------------

この｛章｝｛しょう｝で｛紹介｝｛しょうかい｝したライブラリ｛関数｝｛かんすう｝を
｛使｝｛つか｝って、リストの｛最後｝｛さいご｝の*n*｛個｝｛こ｝の
｛要素｝｛ようそ｝を｛取｝｛と｝り｛出｝｛だ｝す｛関数｝｛かんすう｝`takeLast`を
｛定義｝｛ていぎ｝してください。

｛以下｝｛いか｝の｛使用例｝｛しようれい｝を｛示｝｛しめ｝してください。

    > takeLast 3 [1,2,3,4,5]
    [3,4,5]
    > takeLast 2 [1,2]
    [1,2]

さらに｛他｝｛ほか｝の｛定義｝｛ていぎ｝を｛考｝｛かんが｝えて、`takeLast'`を
｛定義｝｛ていぎ｝して、｛同｝｛おな｝じ｛使用例｝｛しようれい｝を
｛示｝｛しめ｝してください。
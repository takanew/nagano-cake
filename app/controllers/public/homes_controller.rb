class Public::HomesController < ApplicationController

  # topページのアクション定義
  def top
    @items = Item.order(id: :desc).limit(4)
  end
  
# Item.order(id: :desc): これは、Itemモデルのレコードをidの降順（大きいものから小さいものへ）で並べ替えます。ここで、orderはActiveRecordのメソッドで、データベースから取得したレコードの順序を指定します。:descは「降順」を意味します。
# .limit(4): これは、上記の結果セットから最初の4つのレコードだけを取得します。limitもActiveRecordのメソッドで、取得するレコードの最大数を指定します。

end

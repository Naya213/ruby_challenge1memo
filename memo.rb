require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

class Memo
    def getMemoType # メモタイプを取得する関数
        puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
        @memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています
    end

    def isMemoType # メモタイプごとに処理を分岐する
        if @memo_type == 1
            memoType1
         elsif @memo_type == 2
            memoType2
        end
    end

    def memoType1  # 新規メモ作成時の関数
        puts "拡張子を除いたファイル名を入力してください"
        @memo_name = gets.chomp #.chompメソッドで入力完了時に入る改行を削除
        @memo_name += ".csv"

        puts "メモしたい内容を入力してください"
        puts "完了したらCtrl+Dを押してください"
        @contexts = readlines

        CSV.open(@memo_name,'w') do |csv|
            csv << [@contexts]        ##メモ内容
        end
    end

    def memoType2 # 既存のメモを編集する関数
        puts "編集するファイル名を拡張子を除いて入力してください"
        @memo_name = gets.chomp #.chompメソッドで入力完了時に入る改行を削除
        @memo_name += ".csv"

        puts "追加メモしたい内容を入力してください"
        puts "完了したらCtrl+Dを押してください"
        @contexts = readlines

        CSV.open(@memo_name,'a') do |csv|
            csv << [@contexts]        ##メモ内容
        end
    end
end

memo = Memo.new
memo.getMemoType
memo.isMemoType
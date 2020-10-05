require 'discordrb'

@bot = Discordrb::Commands::CommandBot.new token: 'NzYyNzYxOTc4ODkyMTI0MjIw.X3t3cw.0fskuhvx4hPokNyk1QGF26TjPxA', prefix: '!' 

menu = Array["肉じゃが", "カレー", "生姜焼き", "ハンバーグ", "コロッケ", "からあげ", "餃子", "シチュー", "親子丼", "トンカツ", "ビーフシチュー", "ベーコンのアスパラ巻", "肩ロースのスープ煮", "炒飯", "えびちり", "塩だれ豚レタス", "担々麺", "トリカワギョーザ", "ハムカツ", "かつ丼", "オムライス", "天ぷら", "酢豚", "おでん", "パスタ", "豚丼", "ポテトサラダ", "麻婆豆腐", "天津飯", "トマトスープ", "グラタン", "豚バラ丼", "牛丼", "海鮮丼", "野菜炒め", "エビピラフ", "豚バラ大根", "ネギチャーシュー", "牛肉とニラと春雨のオイスターソース炒め", "ブロッコリーとベーコンのにんにく炒め", "マッシュポテト", "チーズスティックフライ", "回鍋肉"]

@bot.command(:kon) do |event|
    decide = menu[rand(menu.length)]
    @bot.game = ("献立は#{decide}");
    event.send_message("今日の献立は「#{decide}」にしましょう");
end

@bot.command(:add) do |event,*add|
    add = add[0]
    if (add.nil? || add.empty?)
        event.send_message("入力ミスの可能性");
    else
        menu.push(add)
        event.send_message("「#{add}」を献立に追加しました");
    end
end

@bot.command(:list) do |event|
    list = ""
    menu.each_with_index do |get, i|
        list += "#{i} #{get},  "
    end
    event.send_message("#{list}")
end

@bot.command(:del) do |event,*num|
    num = num[0].to_i
    del = menu[num]
    menu.delete_at(num);
    event.send_message("「#{del}」を献立から削除します");
end
    
@bot.run
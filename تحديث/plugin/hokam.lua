
function hokam(msg)
    text = nil
    if msg and msg.content and msg.content.text then
    text = msg.content.text.text
    end
    if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
    return false
    end
    if text then
    local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text)
    if neww then
    text = neww or text
    end
    end

if text == "تفعيل الحكم" then
if not msg.Manger then
return send(msg_chat_id,msg_id,"⌯ هذا الامر يخص المدير")
end
Redis:set(Fast.."hokam"..msg_chat_id,true)
send(msg_chat_id,msg_id,"⌯ تم تفعيل لعبة الحكم")
end
if text == "تعطيل الحكم" then
if not msg.Manger then
return send(msg_chat_id,msg_id,"⌯ هذا الامر يخص المدير")
end
Redis:del(Fast.."hokam"..msg_chat_id)
send(msg_chat_id,msg_id,"⌯ تم تعطيل لعبة الحكم")
end

if Redis:get(Fast.."hokam"..msg_chat_id) then

    if text == "الحكم" then 
        local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
        local UserInfo = bot.getUser(rep_idd)
        return send(msg.chat_id,msg.id,"☆ اوامر لعبة الحكم".."\n\n✬︙ بداية اللعبه ↢  يتم بداية اللعبه".."\n\n✬︙ انا ↢ يتم تسجيلك في اعضاء اللعبه".."\n\n ✬︙ مسح اللعبه ↢  يتم مسح جميع اعضاء اللعبه".."\n\n✬︙ اختار ↢  يتم اختيار شخص من اعضاء اللعبه للحكم".."\n\nϟ")
    end


if text == "بداية اللعبه" then 
    local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
    local UserInfo = bot.getUser(rep_idd)
    if Redis:sismember(Fast..msg.chat_id.."hokam",rep_idd) then
    return send(msg.chat_id,0,"اللعبه شغاله با الفعل اكتب انهاء لمسح اللعبه ")
    else
    Redis:sadd(Fast..msg.chat_id.."hokam:",rep_idd) 
     send(msg.chat_id,msg.id,"تم تسجيلك الان الي عايز يلعب يبعت انا")
    end
end

if text == "انا"  then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if Redis:sismember(Fast..msg.chat_id.."hokam:",msg.sender_id.user_id) then
return send(msg.chat_id,msg.id,"انت با الفعل من اعضاء اللعبه")
else
Redis:sadd(Fast..msg.chat_id.."hokam:",msg.sender_id.user_id) 
 send(msg.chat_id,msg.id,"تم اضافتك الان في اعضاء اللعبه")
end
end


if text == "مسح اللعبه" then 
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
Redis:del(Fast..msg.chat_id.."hokam:")
return send(msg.chat_id,msg.id,"تم مسح الاعضاء الان")
end

if text == "اختار" then 
    local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
    local UserInfo = bot.getUser(rep_idd)
    local rd_rinoauto = {
        "ادخل لوحده برايفت وقولها انا بحبك وهات اسكرين با الرد",
        "اعترف للكراش انك بتكراش عليها",
        "خلي الي قدامك هو الي يحكم عليك حكم وتنفذه",
        "نزل صورة البطاقه بتعتك هنا في الروم وثبتها",
        "هات كارت فكه لصاحب الحكم",
        "اتكلم عن صاحب الحكم",
        "قولنا اسم الاكس واحكلنا سبتك ليه او سبتها ليه ",
        "قولنا ارتبط كام مره فحياتك كلها واسماء البنات الي ارتبط بيها",
        "ادخل بف لبنت صاحب الحكم يختارها وقولها انا حكاك تتجوزيني",
        "اعترف لصاحب الحكم با الشخص الي بتحبه",
        "احكي عن سر مخبي عن الناس كلها",
        "خد اسكرين من المعرض عندك ونزلو هنا",
        "هات اسكرين لي اخر شات عندك من جوا ونزلو هنا",
        "افتح كول وافتح شاشه وغني",
        "نزل صورة البطاقه",
        "غني في ريكورداغنيه صاحب الحكم يطلبها منك",
        "ادخل لي اي حد وقولو انا شحات وعايز مساعده",
        "حط صورة علم الشواذ 5 دقايق",
        "قلد صورة الحمار في فويس"
    }
    if not Redis:sismember(Fast..msg.chat_id.."hokam:",msg.sender_id.user_id) then
    return send(msg.chat_id,0,Reply_Status"هذا الامر يخص فقط اعضاء اللعبه")
    else
    local rino_hokam = Redis:smembers(Fast..msg.chat_id.."hokam:")
   return send(msg.chat_id,msg.id,Reply_Status(rino_hokam[math.random(#rino_hokam)],'الحكم :'..(rd_rinoauto[math.random(#rd_rinoauto)])).Reply,"md",true)
    end
end


if text == "طرد من اللعبه" then 
    local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
    local UserInfo = bot.getUser(rep_idd)
    if not msg.Asasy then
    send(msg.chat_id,msg.id,"هذا الامر يخص المطور الاساسي")
    else
    if not Redis:sismember(Fast..msg.chat_id.."hokam:",Message_Reply.sender_id.user_id) then  
    return send(msg.chat_id,msg.id,Reply_Status( rep_idd," ليست من اعضاء اللعبه حتي يتم طرده").Reply,"md",true)
    else
    Redis:srem(Fast..msg.chat_id.."hokam:", Message_Reply.sender_id.user_id)
     send(msg.chat_id,msg.id,Reply_Status( rep_idd," تم طرده من اللعبه ").Reply,"md",true)

    end 
end
end

if text == "احذفني" then 
    local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
    local UserInfo = bot.getUser(rep_idd)
    if not Redis:sismember(Fast..msg.chat_id.."hokam:",msg.sender_id.user_id) then
    return send(msg.chat_id,0,"انت ليست من اعضاء اللعبه حتي يتم حذفك")
    else
    Redis:del(Fast..msg.chat_id.."hokam:",msg.sender_id.user_id)
     send(msg.chat_id,0,"تم حذفك من اعضاء اللعبه") 
    end 
end




    

end
end
return {Fast = hokam}
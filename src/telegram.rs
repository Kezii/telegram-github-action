use teloxide_core::{
    payloads::SendMessageSetters,
    requests::{Requester, RequesterExt},
    types::ChatId,
};

pub async fn send_message_to_telegram(
    token: String,
    chat_id: String,
    text: String,
    message_thread_id: Option<String>,
) {
    let teloxide_bot =
        teloxide_core::Bot::new(token).parse_mode(teloxide_core::types::ParseMode::MarkdownV2);

    let chat_id = chat_id.parse::<i64>().unwrap();
    let chat_id: ChatId = ChatId(chat_id);

    let sm = teloxide_bot
        .send_message(chat_id, text)
        .disable_web_page_preview(true);

    let s = if let Some(message_thread_id) = message_thread_id {
        sm.message_thread_id(message_thread_id.parse::<i32>().unwrap())
    } else {
        sm
    };

    let res = s.await.unwrap();

    println!("{:?}", res);
}

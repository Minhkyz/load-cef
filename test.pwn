#include <cef>

public OnGameModeInit()
{
	cef_subscribe("pwd:on", "CefDisplayLoading");
	cef_subscribe("pwd:close_load", "CefDisplayClose");
	return 1;
}


forward OnCefInitialize(player_id, success);
forward OnCefBrowserCreated(player_id, browser_id, status_code);

public OnCefInitialize(player_id, success) {
    if (success == 1) {
        return;
    }

}

public OnCefBrowserCreated(player_id, browser_id, status_code) {
    if (browser_id == LOGIN_BROWSER_ID) {
        if (status_code != 200) {
            return;
        }

    }
}


forward CefDisplayLoading(player_id);
public CefDisplayLoading(player_id)
{
    cef_emit_event(player_id, "pwd:connect", CEFINT(1)); //ОТПРАВЛЯЕМ ЗАПРОС ЧТО УСПЕШНО СЕ
    
}
forward CefDisplayClose(player_id);
public CefDisplayClose(player_id) { 
  cef_focus_browser(player_id, 11, false); //убираем фокус
  SendClientMessage(player_id, -1, "Загрузка текстур прошла успешно!"); 
  cef_destroy_browser(player_id, 11);  //удаляем браузер снижая загрузку
}


//cef_create_browser(playerid, 11, "ваша ссылка", false, true); - вызывать когда игрок выходит или входит в интерьер ( можно сделать в пикапах )

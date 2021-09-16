const PWD_PAKET_STATUS_TRUE = 1;

cef.emit('pwd:on');


cef.on('pwd:connect', (arg) => {

    if(arg == PWD_PAKET_STATUS_TRUE)
    {
        setTimeout(() => {
            cef.set_focus(false); // убираем фокус с браузера, позволив игроку пользоваться игрой
            cef.hide(true); // скрываем интерфейс
            cef.emit('pwd:close_load'); //можно и не отправлять
          }, 7000); //7 секунд

    }
});

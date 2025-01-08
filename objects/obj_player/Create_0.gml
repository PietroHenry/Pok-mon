spd = 2;
hspd = 0;
vspd = 0;

global.controles = ds_list_create();
global.p1 = -1; // -1 indica que nenhum gamepad está conectado
global.gamepad = false;

checa_gamepad = function() {
    ds_list_clear(global.controles); // Limpa a lista antes de adicionar

    var _qtd = gamepad_get_device_count();
    var _gamepad = 0;

    for (var _i = 0; _i < _qtd; _i++) {
        ds_list_add(global.controles, gamepad_is_connected(_i));
        if (gamepad_is_connected(_i)) {
            _gamepad++;
            if (global.p1 == -1) {
                global.p1 = _i; // Atribui o primeiro gamepad conectado
            }
        }
    }

    if (_gamepad > 0) {
        gamepad_set_axis_deadzone(0, 0.25);
    } else {
        global.p1 = -1; // Nenhum gamepad conectado
    }

    return _gamepad;
};


controla = noone
controla = function() {
    if (global.gamepad) {
        //efeito1(1);
        controla_gamepad();
    } else {
        //efeito1(1);
        controla_keyboard();
    }
};

controla_keyboard = function() {
    show_debug_message("Controle por teclado");

    var _up, _down, _left, _right;

    _up    = keyboard_check(vk_up) || keyboard_check(ord("W"));
    _down  = keyboard_check(vk_down) || keyboard_check(ord("S"));
    _left  = keyboard_check(vk_left) || keyboard_check(ord("A"));
    _right = keyboard_check(vk_right) || keyboard_check(ord("D"));

    hspd = (_right - _left) * spd;
    vspd = (_down - _up) * spd;
};

controla_gamepad = function() {
    show_debug_message("Controle por gamepad");

    if (global.p1 >= 0) {
        hspd = gamepad_axis_value(global.p1, gp_axislh) * spd;
        vspd = gamepad_axis_value(global.p1, gp_axislv) * spd;
    } else {
        hspd = 0;
        vspd = 0;
    }
};

efeito1 = function(_mudar = false) {
    static _escala = 1;

    if (_mudar) {
        _escala = 2;
    }

    image_xscale = _escala;
    image_yscale = _escala;

    if (_escala > 1) {
        _escala = lerp(_escala, 1, 0.1);
    }
};

enum STATE{
	IDLE,
	FREE
}

state = STATE.IDLE
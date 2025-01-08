var _up, _down, _left, _right;

_up    = keyboard_check(vk_up)	  || keyboard_check(ord("W"));
_down  = keyboard_check(vk_down)  || keyboard_check(ord("S"));
_left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
_right = keyboard_check(vk_right) || keyboard_check(ord("D"));

switch (state){
	case STATE.IDLE:
		if (_right - _left) != 0 or (_down - _up) !=0
		{state = STATE.FREE}
	break;
	case STATE.FREE:
		controla()
		if (_right - _left) = 0 and (_down - _up) = 0
		{state = STATE.IDLE}
	break;
}

/*
if place_meeting(x+hspd,y,obj_wall){
	while(!place_meeting(x+sign(hspd),y,obj_wall)){
		x = x + sign(hspd);
	}
	hspd = 0;
}
if place_meeting(x,y+vspd,obj_wall){
	while(!place_meeting(x,y+sign(vspd),obj_wall)){
		y = y + sign(vspd);
	}
	vspd = 0;
}
*/

move_and_collide(hspd,vspd,obj_wall,40)
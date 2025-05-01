
if(room != rm_main_menu && room != rm_death_screen && room != rm_win_screen)
{
	if(audio_is_playing(snd_gameplay_music) == false)
	{
		audio_play_sound(snd_gameplay_music, 1, 1)	
	}
}
else
{
	audio_stop_sound(snd_gameplay_music)	
}
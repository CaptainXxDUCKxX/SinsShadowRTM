/// @description Insert description here
// You can write your code in this editor
if image_alpha <= 0.5 bFadeIn = true;
if image_alpha >= 1 bFadeIn = false;
if bFadeIn == true && image_alpha < 1
{
image_alpha += 0.02;
}
if bFadeIn == false && image_alpha > 0.5
{
image_alpha -= 0.02;
}
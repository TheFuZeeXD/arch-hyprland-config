#!/bin/bash

echo "Установка компонентов.."
sudo pacman -S hyprland hyprutils hyprgraphics hyprland-qtutils hyprlang xdg-desktop-portal-hyprland grim aquamarine hyprpaper btop hyprlock kitty nwg-look fastfetch waybar wofi playerctl ttf-font-awesome git base-devel
echo "Установка компонентов завершена."
echo "Попытка входа в /home/$USER/Downloads/"
cd ~/Downloads
echo "Успешный вход в /home/$USER/Downloads/"
echo "Клонирование AUR репозитория yay."
git clone https://aur.archlinux.org/yay.git
echo "Клонирование репозитория завершено."
echo "Попытка входа в /home/$USER/Downloads/yay/"
cd yay
echo "Успешный вход в /home/$USER/Downloads/yay/"
echo "Запуск установки пакета yay..."
makepkg -si
echo "Пакет yay успешно установлен."
echo "Возвращение в /home/$USER/Downloads/"
cd ~/Downloads
echo "Запуск протокола удаления директории /home/$USER/Downloads/yay/"
rm -rf yay
echo "Удаление директории yay завершено.."
echo "Установка пакетов из AUR через yay.."
yay -S wlogout catppuccin-gtk-theme-mocha
echo "Установка пакетов завершена."
echo "Попытка установить GTK Тему через gsettings.."
gsettings set org.gnome.desktop.interface gtk-theme "catppuccin-mocha-sky-standard+default"
echo "GTK Тема успешно установлена catppuccin-mocha-sky-standard+default"
echo "ПРИМЕЧАНИЕ: Если вы хотите сменить тему, то воспользуйтесь nwg-look."
echo "(1/6) Попытка перемещение конфига Hyprland /home/$USER/arch-hyprland-config/hypr to ~/.config"
cp -r ~/arch-hyprland-config/hypr ~/.config
echo "Успешное перемещение конфига Hyprland /home/$USER/.config/hypr"
echo "(2/6) Попытка перемещение конфига Waybar /home/$USER/arch-hyprland-config/waybar to ~/.config"
cp -r ~/arch-hyprland-config/waybar ~/.config
echo "Успешное перемещение конфига Waybar /home/$USER/.config/waybar"
echo "(3/6) Попытка перемещение конфига Kitty /home/$USER/arch-hyprland-config/kitty to ~/.config"
cp -r ~/arch-hyprland-config/kitty ~/.config
echo "Успешное перемещение конфига Kitty /home/$USER/.config/kitty"
echo "(4/6) Попытка перемещение конфига Wlogout /home/$USER/arch-hyprland-config/wlogout to ~/.config"
cp -r ~/arch-hyprland-config/wlogout ~/.config
echo "Успешное перемещение конфига Wlogout /home/$USER/.config/wlogout"
echo "(5/6) Попытка перемещение конфига Wofi /home/$USER/arch-hyprland-config/wofi to ~/.config"
cp -r ~/arch-hyprland-config/wofi ~/.config
echo "Успешное перемещение конфига Wofi /home/$USER/.config/wofi"
echo "(6/6) Попытка перемещение конфига Btop /home/$USER/arch-hyprland-config/btop to ~/.config"
cp -r ~/arch-hyprland-config/btop ~/.config
echo "Успешное перемещение конфига Btop /home/$USER/.config/btop"
echo "Перемещение конфигов завершена.."
echo "Установка моего конфига завершена! Вы также можете его дорабатывать и встраивать свои функции."
echo "ВНИМАНИЕ! Через 10 секунд произойдет перезагрузка для применения новых конфигураций."
sleep 10
reboot

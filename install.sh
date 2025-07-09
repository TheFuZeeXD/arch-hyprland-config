#!/bin/bash

directory="$(pwd)"
echo "Установка компонентов.."
sudo pacman -S hyprland hyprutils hyprgraphics hyprland-qtutils hyprlang xdg-desktop-portal-hyprland grim aquamarine hyprpaper btop hyprlock kitty nwg-look fastfetch waybar wofi playerctl ttf-font-awesome git base-devel
echo "Установка компонентов завершена."
echo "Создание временной директории"
mkdir Downloads
sleep 1
echo "Попытка входа в $(pwd)/Downloads/"
cd $(pwd)/Downloads
echo "Успешный вход в $(pwd)/Downloads/"
sleep 1
echo "Клонирование AUR репозитория yay."
git clone https://aur.archlinux.org/yay.git
echo "Клонирование репозитория завершено."
echo "Попытка входа в $(pwd)/Downloads/yay/"
cd yay
echo "Успешный вход в $(pwd)/Downloads/yay/"
echo "Запуск установки пакета yay..."
makepkg -si
echo "Пакет yay успешно установлен."
echo "Возвращение в $directory/Downloads/"
cd $directory/Downloads
sleep 1
echo "Запуск протокола удаления директории $directory/Downloads/yay/"
rm -rf yay
sleep 2
echo "Удаление директории yay завершено.."
echo "Возвращение в $directory/"
cd $directory
echo "Запуск протокола удаления директории $(pwd)/Downloads/"
rm -rf Downloads
echo "Удаление директории Downloads завершено.."
sleep 2
echo "Установка пакетов из AUR через yay.."
yay -S wlogout catppuccin-gtk-theme-mocha
echo "Установка пакетов завершена."
echo "Попытка установить GTK Тему через gsettings.."
gsettings set org.gnome.desktop.interface gtk-theme "catppuccin-mocha-sky-standard+default"
echo "GTK Тема успешно установлена catppuccin-mocha-sky-standard+default"
echo "ПРИМЕЧАНИЕ: Если вы хотите сменить тему, то воспользуйтесь nwg-look."
echo "(1/6) Попытка перемещение конфига Hyprland $(pwd)/hypr to ~/.config"
cp -r $(pwd)/hypr ~/.config
sleep 1
echo "Успешное перемещение конфига Hyprland /home/$USER/.config/hypr"
echo "(2/6) Попытка перемещение конфига Waybar $(pwd)/waybar to ~/.config"
cp -r $(pwd)/waybar ~/.config
sleep 1
echo "Успешное перемещение конфига Waybar /home/$USER/.config/waybar"
echo "(3/6) Попытка перемещение конфига Kitty $(pwd)/kitty to ~/.config"
cp -r $(pwd)/kitty ~/.config
sleep 1
echo "Успешное перемещение конфига Kitty /home/$USER/.config/kitty"
echo "(4/6) Попытка перемещение конфига Wlogout $(pwd)/wlogout to ~/.config"
cp -r $(pwd)/wlogout ~/.config
sleep 1
echo "Успешное перемещение конфига Wlogout /home/$USER/.config/wlogout"
echo "(5/6) Попытка перемещение конфига Wofi $(pwd)/wofi to ~/.config"
cp -r $(pwd)/wofi ~/.config
sleep 1
echo "Успешное перемещение конфига Wofi /home/$USER/.config/wofi"
echo "(6/6) Попытка перемещение конфига Btop $(pwd)/btop to ~/.config"
cp -r $(pwd)/btop ~/.config
sleep 1
echo "Успешное перемещение конфига Btop /home/$USER/.config/btop"
echo "Перемещение конфигов завершена.."
echo "Установка моего конфига завершена! Вы также можете его дорабатывать и встраивать свои функции."
sleep 2
echo "ВНИМАНИЕ! Через 10 секунд произойдет перезагрузка для применения новых конфигураций."
sleep 10
reboot

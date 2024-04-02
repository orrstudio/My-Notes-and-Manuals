Чтобы удалить старые загрузки Grub в NixOS, вы можете выполнить следующие шаги:


Сначала выполните сбор мусора в вашей системе, затем пересоберите. Первая команда в примере ниже удаляет все, что старше 1-го дня:

```bash
sudo nix-collect-garbage --delete-older-than 1d
sudo nixos-rebuild boot
```
Чтобы очистить GRUB от всех загрузочных опций, кроме последней, вам нужно выполнить следующие шаги12:

Запустите команду 
```
nix-env --delete-generations old --profile /nix/var/nix/profiles/system
```
Это удалит все старые системные корни сборки мусора, кроме самого нового.  
Затем выполните команду 
```
/nix/var/nix/profiles/system/bin/switch-to-configuration switch
```
Это перезагрузит текущую системную конфигурацию и обновит grub.cfg только с профилями живой системы1.


После выполнения этих команд в grub.cfg должна остаться только одна запись, и вам не придется менять системную конфигурацию1.


Если вы хотите затем собрать мусор старых профилей, вы можете выполнить команду 
```
nix-store --gc
```
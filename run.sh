for item in `ls .`
do
    cp -r $item ~/.config/
done
xrdb ~/.config/.Xresoures
nvim +:PlugInstall

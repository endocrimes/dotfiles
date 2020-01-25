# window management config (i3/polybar etc)
{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    pywal
    polybar
    rofi
    jsoncpp
    redshift
    gnome3.gnome-screenshot
  ];

  services.polybar = {
    enable = true;
    config = ./polybar.conf;
    script = lib.mkDefault ''
      # HACK: Cut is unavailable in the path so we do some sad indirection bc i'm
      #       too lazy to figure out which packages i need. excuse the horrible
      #       double shell too.
      export PATH="/var/run/current-system/sw/bin:$PATH"
      MONITORS=$(bash -c "polybar --list-monitors | cut -d ':' -f 1")
      for m in $MONITORS; do
        MONITOR=$m polybar default &
      done
    '';
  };

  services.dunst = {
    enable = true;
    settings = {
      global = {
        # Default to monitor 0, but follow mouse focus if possible.
        monitor = 0;
        follow = "mouse";

        geometry = "600x50-25+40";
        indicate_hidden = true;
        shrink = false;
        transparency = 5;
        notification_height = 0;
        seperator_height = 2;
        padding = 10;
        horizontal_padding = 10;
        frame_width = 2;
        frame_color = "#4527A0";
        seperator_color = "frame";

        sort = true;

        font = "Roboto 10";
        line_height = 5;
        format = "<b>%s</b>\n%b";
        markup = "full";
        plain_text = false;

        ignore_newline = false;
        word_wrap = true;
        alignment = "left";
        show_age_threshold = 60;

        icon_position = "left";
        max_icon_size = 80;

        startup_notification = false;

        browser = "${pkgs.firefox} -new-tab";
      };

      urgency_low = {
        background = "#ffc4fa";
        foreground = "#333333";
      };

      urgency_normal = {
        background = "#ffc4fa";
        foreground = "#333333";
      };

      urgency_critical = {
        background = "#ffc4fa";
        foreground = "#333333";
        frame_color = "#bf616a";
      };
    };
  };

  services.compton = {
    enable = false; # using 30% cpu on thinkpad. Disabling for now.
    menuOpacity = "0.95";
    blur = true;
  };
}

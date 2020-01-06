{ config, pkgs, ... }:

{
  home.file.".config/Yubico/u2f_keys" = {
    text = "danielle:1aZaIO3gaMKyPlT0wczCYX2G2ySuS8T8VP6T8JJtYbWAoblM21lglUObeKtQPyNvBNUlO3A2zw9-npcnI__VcQ,04d09375b09b5f461a5c91c2247a71be7abec209991827f0de94f14eca20aef880f65e647171937d6f10e0c1fa1bf85f144041f8757bbf1b5767c4165571709a3e";
  };
}

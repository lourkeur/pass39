{ writers, substituteAll, fetchurl }:

let
  english_word_list = fetchurl {
    url = "https://raw.githubusercontent.com/bitcoin/bips/master/bip-0039/english.txt";
    hash = "sha256-L17tU6Rye0v4iA2PPxme/JDlhQNkbZ/47/Oi7Tsk29o=";
  };
in

writers.writePython3Bin "pass39" {} (substituteAll {
  src = ./pass39.py;
  inherit english_word_list;
})

#!/usr/bin/awk -f
BEGIN{}
{
  if($0 ~ /[0-9][\?]{3}[0-9]/) {
    line = $0;
    gsub(/[^0-9]/, "", line);
    split(line, a, "");

    does_match = true;

    for (i = 1; i < length(a) && does_match; i = i + 2) {
      if ((a[i] + a[i-1]) != 10)
        does_match = false;
    }
    (does_match == true) ? msg = "true" : msg = "false"
    print($0, msg);
  } else
    print($0, "false");
}


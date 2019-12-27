#/bin/bash
       E='echo -e';e='echo -en';trap "R;exit" 2
     ESC=$( $e "\033")
    TPUT(){ $e "\033[${1};${2}H";}
   CLEAR(){ $e "\033c";}
   CIVIS(){ $e "\033[?25l";}
    DRAW(){ $e "\033%@\033(0";}
   WRITE(){ $e "\033(B";}
    MARK(){ $e "\033[7m";}
  UNMARK(){ $e "\033[27m";}
    HEAD(){ MARK;TPUT 15 33
    BLUE(){ $e "\033";};BLUE
       C(){ CLEAR;BLUE;}
            $E"MARMARA Odoo12 KURULUM MENUSU       (~Paro)";UNMARK
            DRAW
            for each in $(seq 8 9);do
            TPUT 7 23 $E "   x                                        x"
            done;WRITE;}
            i=0; CLEAR; CIVIS;NULL=/dev/null
    FOOT(){ MARK;TPUT 20 33
            printf "ENTER=SELECT, UP/DN=NEXT OPTION           ";UNMARK;}
   ARROW(){ read -s -n3 key 2>/dev/null >&2
            if [[ $key = $ESC[A ]];then echo up;fi
            if [[ $key = $ESC[B ]];then echo dn;fi;}
POSITION(){ if [[ $cur = up ]];then ((i--));fi
            if [[ $cur = dn ]];then ((i++));fi
            if [[ i -lt 0   ]];then i=$LM;fi
            if [[ i -gt $LM ]];then i=0;fi;}
 REFRESH(){ after=$((i+1)); before=$((i-1))
            if [[ $before -lt 0  ]];then before=$LM;fi
            if [[ $after -gt $LM ]];then after=0;fi
            if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
            if [[ $after -eq 0   ]] || [[ $before -eq $LM ]];then
            UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
      M0(){ TPUT 17 42; $e "Odo12 Kurulum.";}
      M1(){ TPUT 18 42; $e "EXIT   ";}
     LM=1    #Last Menu number
    MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    INIT(){ HEAD;FOOT;MENU;}
      SC(){ REFRESH;MARK;$S;cur=`ARROW`;}
      ES(){ MARK; $e "\nENTER = main menu ";$b;read;INIT;};INIT
while [[ "$O" != " " ]]; do case $i in
      0) S=M0;SC;if [[ $cur = "" ]];then C;$e "o0:\n$(./odoo12-auto.sh)\n";ES;fi;;
      1) S=M1;SC;if [[ $cur = "" ]];then C;exit 0;fi;;
esac;POSITION;done

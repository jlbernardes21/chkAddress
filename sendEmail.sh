#!/bin/bash
# script
# description: Invoke de perl script sendEmail.pl.
# author: Joao Bernardes

export smtpemailfrom=sender@gmail.cpm
export emailto=$1
export subject=$2
export body=$3
export smtpserver=smtp.gmail.com
export smtplogin=sender@gmail.com
export smtppass=passwordsender

/usr/bin/sendEmail.pl -f $smtpemailfrom -t $emailto -u $subject -m $body -s $smtpserver:587 -o tls=yes -xu $smtplogin -xp $smtppass

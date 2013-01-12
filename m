From: Alexander Nestorov <alexandernst@gmail.com>
Subject: Re: Audio support on Mini6410 board
Date: Sat, 12 Jan 2013 18:07:08 +0100
Message-ID: <CACuz9s2fQYw-2pbE6dyNY7MiUSQxGiWArmXARxdwn1ULuDwm_Q@mail.gmail.com>
References: <CACuz9s2w28eVG8qS9FXkUYAggXn7y2deHi2fPGizcURu_Bp4wg@mail.gmail.com>
 <CACuz9s0a2A6F7zWyxQkBAZtj=Xi1NwT7cLEHe-fa6G5p__bUgg@mail.gmail.com>
 <50D2F879.6020501@gmail.com> <CACuz9s0rTGDGvB9PcKfjGvvt8vEdBDKKvQTx94fuj1MrDcNfOg@mail.gmail.com>
 <50D305CF.2030600@gmail.com> <CACuz9s19M2Qv8dOBY0h0EKNidD3r4G3esvAAWZAUDZEjFMCGiA@mail.gmail.com>
 <50D30F6C.7000004@gmail.com> <CACuz9s1_KKfVDCa4FvZLe9pEVWuqQzuLPX7pYX9Tw1NUQGPtzA@mail.gmail.com>
 <CACuz9s1waQ3VgRjdxw9CoiHX2BtfOaxTosqLDwhX+O7px0=JXg@mail.gmail.com>
 <50D31BF8.8040301@gmail.com> <CACuz9s3xtCndC2jks4T-ytSWxwTBjLbXUrehEtsNwm7H=wJC1Q@mail.gmail.com>
 <50D31F63.6090304@gmail.com> <CACuz9s06v5nXNze+AAZyPTyxib4OXmqRi9E_Hw4SqBoprym0UA@mail.gmail.com>
 <CACuz9s1mnOon=EywOrcxZjMOGrx2=f0-4sj6ietZFoEXC66uWQ@mail.gmail.com>
 <50EF4BCB.40307@gmail.com> <CAA11ShCbyKEtgK=p2Wz57RPZtV1nG5dWb-5Ajq7FuSTse4xPBg@mail.gmail.com>
 <CACuz9s3fMLQUdm8rbLUBKFbHi0E3tGHYUdHLGQQB9wYAt-zo8g@mail.gmail.com> <50F09720.7000102@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:39813 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752126Ab3ALRHt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 12 Jan 2013 12:07:49 -0500
Received: by mail-ob0-f178.google.com with SMTP id eh20so2705847obb.37
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Jan 2013 09:07:48 -0800 (PST)
In-Reply-To: <50F09720.7000102@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Andrey Gusakov <dron0gus@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, oselas@community.pengutronix.de, Juergen Beisert <jbe@pengutronix.de>

Hi,

it's finally working! :)

This is my entire diff: http://pastie.org/5674242  (note: it doesn't include
sound/soc/samsung/mini6410_wm9713.c file, which is a copy of the
smdk6410_wm9713.c file)
Here's the mini6410_wm9713.c file: http://pastie.org/5674322


This is what I'm getting from boot:

soc-audio soc-audio: ASoC machine SMDK WM9713 should use snd_soc_register_card()
soc-audio soc-audio:  wm9713-hifi <-> samsung-ac97 mapping ok
ALSA device list:
  #0: MINI6410

which is what I was expecting (at least that's what I get booting the
FriendlyARM kernel).

I had to unmute everything because everything was muted by default,
but that really doesn't bother me.

The bad part is that, as Andrey told us, the filter hack is necessary.
If I remove it, I can't get any sound working.
Even further, if I try to run some amixer sset commands to unmute a
control, I get a few printfs with
"ac97: req addr = 12, rep addr = 00".

Also, there is one strange compile warning which I'm not able to
understand where is coming from:

WARNING: vmlinux.o(.data+0x6a78): Section mismatch in reference from
the variable smdk6410_b_pwr_5v_data to the (unknown reference)
.init.data:(unknown)
The variable smdk6410_b_pwr_5v_data references
the (unknown reference) __initdata (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

I do know that it came right after adding the mini6410_wm9713.c to the
Makefile but that really shouldn't make it bug. Also, it has nothing
to do with SMDK, which
is what this warning is suggesting. I'm not using
smdk6410_b_pwr_5v_data in my mach-mini6410.c so...

Sylwester, I can start sending you well-formated patches now or I can
wait for the filter hack to be fixed first, just say :)

Regards all and thank you for your help!

-- 
alexandernst

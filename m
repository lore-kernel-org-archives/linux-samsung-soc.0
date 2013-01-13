From: Andrey Gusakov <dron0gus@gmail.com>
Subject: Re: Audio support on Mini6410 board
Date: Sun, 13 Jan 2013 13:42:33 +0300
Message-ID: <CAA11ShC0gntdP+f=w1jMB3v7LGV6PVdzfUAG2jNmHLJ9mhLrDA@mail.gmail.com>
References: <CACuz9s2w28eVG8qS9FXkUYAggXn7y2deHi2fPGizcURu_Bp4wg@mail.gmail.com>
	<CACuz9s0a2A6F7zWyxQkBAZtj=Xi1NwT7cLEHe-fa6G5p__bUgg@mail.gmail.com>
	<50D2F879.6020501@gmail.com>
	<CACuz9s0rTGDGvB9PcKfjGvvt8vEdBDKKvQTx94fuj1MrDcNfOg@mail.gmail.com>
	<50D305CF.2030600@gmail.com>
	<CACuz9s19M2Qv8dOBY0h0EKNidD3r4G3esvAAWZAUDZEjFMCGiA@mail.gmail.com>
	<50D30F6C.7000004@gmail.com>
	<CACuz9s1_KKfVDCa4FvZLe9pEVWuqQzuLPX7pYX9Tw1NUQGPtzA@mail.gmail.com>
	<CACuz9s1waQ3VgRjdxw9CoiHX2BtfOaxTosqLDwhX+O7px0=JXg@mail.gmail.com>
	<50D31BF8.8040301@gmail.com>
	<CACuz9s3xtCndC2jks4T-ytSWxwTBjLbXUrehEtsNwm7H=wJC1Q@mail.gmail.com>
	<50D31F63.6090304@gmail.com>
	<CACuz9s06v5nXNze+AAZyPTyxib4OXmqRi9E_Hw4SqBoprym0UA@mail.gmail.com>
	<CACuz9s1mnOon=EywOrcxZjMOGrx2=f0-4sj6ietZFoEXC66uWQ@mail.gmail.com>
	<50EF4BCB.40307@gmail.com>
	<CAA11ShCbyKEtgK=p2Wz57RPZtV1nG5dWb-5Ajq7FuSTse4xPBg@mail.gmail.com>
	<CACuz9s3fMLQUdm8rbLUBKFbHi0E3tGHYUdHLGQQB9wYAt-zo8g@mail.gmail.com>
	<50F09720.7000102@gmail.com>
	<CACuz9s2fQYw-2pbE6dyNY7MiUSQxGiWArmXARxdwn1ULuDwm_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f48.google.com ([209.85.210.48]:41593 "EHLO
	mail-da0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754156Ab3AMKme (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 13 Jan 2013 05:42:34 -0500
Received: by mail-da0-f48.google.com with SMTP id k18so1403127dae.21
        for <linux-samsung-soc@vger.kernel.org>; Sun, 13 Jan 2013 02:42:33 -0800 (PST)
In-Reply-To: <CACuz9s2fQYw-2pbE6dyNY7MiUSQxGiWArmXARxdwn1ULuDwm_Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Nestorov <alexandernst@gmail.com>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, oselas@community.pengutronix.de, Juergen Beisert <jbe@pengutronix.de>

Hi,

On Sat, Jan 12, 2013 at 9:07 PM, Alexander Nestorov
<alexandernst@gmail.com> wrote:
> Hi,
>
> it's finally working! :)
>
> This is my entire diff: http://pastie.org/5674242  (note: it doesn't include
> sound/soc/samsung/mini6410_wm9713.c file, which is a copy of the
> smdk6410_wm9713.c file)
> Here's the mini6410_wm9713.c file: http://pastie.org/5674322
>
>
> This is what I'm getting from boot:
>
> soc-audio soc-audio: ASoC machine SMDK WM9713 should use snd_soc_register_card()
> soc-audio soc-audio:  wm9713-hifi <-> samsung-ac97 mapping ok
> ALSA device list:
>   #0: MINI6410
>
> which is what I was expecting (at least that's what I get booting the
> FriendlyARM kernel).
>
> I had to unmute everything because everything was muted by default,
> but that really doesn't bother me.
>
> The bad part is that, as Andrey told us, the filter hack is necessary.
> If I remove it, I can't get any sound working.
> Even further, if I try to run some amixer sset commands to unmute a
> control, I get a few printfs with
> "ac97: req addr = 12, rep addr = 00".
The error occurs if the record occurred in the wrong register, which
was expected. Code of s3c_ac97_read s3c_ac97_write and s3c_ac97_irq
looks dirty. May be it some kind of workaround of some undocumented
bug. The only one restriction I found is: "AC_CODEC_CMD ... When the
commands are written on the AC_CODDEC_CMD register, It is recommended
to have the delay time
between the command and the next command is more than 1 / 48kHz.". But
it keeped and should not lead to this error.
I tried to rework this functions, remove delays, but error still happens.

> Also, there is one strange compile warning which I'm not able to
> understand where is coming from:
>
> WARNING: vmlinux.o(.data+0x6a78): Section mismatch in reference from
> the variable smdk6410_b_pwr_5v_data to the (unknown reference)
> .init.data:(unknown)
> The variable smdk6410_b_pwr_5v_data references
> the (unknown reference) __initdata (unknown)
> If the reference is valid then annotate the
> variable with __init* or __refdata (see linux/init.h) or name the variable:
> *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console
>
> I do know that it came right after adding the mini6410_wm9713.c to the
> Makefile but that really shouldn't make it bug. Also, it has nothing
> to do with SMDK, which
> is what this warning is suggesting. I'm not using
> smdk6410_b_pwr_5v_data in my mach-mini6410.c so...
>
> Sylwester, I can start sending you well-formated patches now or I can
> wait for the filter hack to be fixed first, just say :)
>
> Regards all and thank you for your help!
>
> --
> alexandernst

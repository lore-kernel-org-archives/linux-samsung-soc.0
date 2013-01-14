From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: Audio support on Mini6410 board
Date: Mon, 14 Jan 2013 23:44:13 +0100
Message-ID: <50F48A3D.8050502@gmail.com>
References: <CACuz9s2w28eVG8qS9FXkUYAggXn7y2deHi2fPGizcURu_Bp4wg@mail.gmail.com> <50D2F879.6020501@gmail.com> <CACuz9s0rTGDGvB9PcKfjGvvt8vEdBDKKvQTx94fuj1MrDcNfOg@mail.gmail.com> <50D305CF.2030600@gmail.com> <CACuz9s19M2Qv8dOBY0h0EKNidD3r4G3esvAAWZAUDZEjFMCGiA@mail.gmail.com> <50D30F6C.7000004@gmail.com> <CACuz9s1_KKfVDCa4FvZLe9pEVWuqQzuLPX7pYX9Tw1NUQGPtzA@mail.gmail.com> <CACuz9s1waQ3VgRjdxw9CoiHX2BtfOaxTosqLDwhX+O7px0=JXg@mail.gmail.com> <50D31BF8.8040301@gmail.com> <CACuz9s3xtCndC2jks4T-ytSWxwTBjLbXUrehEtsNwm7H=wJC1Q@mail.gmail.com> <50D31F63.6090304@gmail.com> <CACuz9s06v5nXNze+AAZyPTyxib4OXmqRi9E_Hw4SqBoprym0UA@mail.gmail.com> <CACuz9s1mnOon=EywOrcxZjMOGrx2=f0-4sj6ietZFoEXC66uWQ@mail.gmail.com> <50EF4BCB.40307@gmail.com> <CAA11ShCbyKEtgK=p2Wz57RPZtV1nG5dWb-5Ajq7FuSTse4xPBg@mail.gmail.
 com> <CACuz9s3fMLQUdm8rbLUBKFbHi0E3tGHYUdHLGQQB9wYAt-zo8g@mail.gmail.com> <50F09720.7000102@gmail.com> <CACuz9s2fQYw-2pbE6dyNY7MiUSQxGiWArmXARxdwn1ULuDwm_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f43.google.com ([74.125.83.43]:42991 "EHLO
	mail-ee0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756216Ab3ANWoS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jan 2013 17:44:18 -0500
Received: by mail-ee0-f43.google.com with SMTP id c50so2199564eek.30
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jan 2013 14:44:16 -0800 (PST)
In-Reply-To: <CACuz9s2fQYw-2pbE6dyNY7MiUSQxGiWArmXARxdwn1ULuDwm_Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Nestorov <alexandernst@gmail.com>
Cc: Andrey Gusakov <dron0gus@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, oselas@community.pengutronix.de, Juergen Beisert <jbe@pengutronix.de>, Kukjin Kim <kgene.kim@samsung.com>

Hi,

Cc: Kukjin Kim, the maintainer of Samsung ARM sub-arch

On 01/12/2013 06:07 PM, Alexander Nestorov wrote:
> Hi,
>
> it's finally working! :)

Great news! ;) I guess you now have all required features working with
latest mainline kernel ? Is there anything still missing ?

> This is my entire diff: http://pastie.org/5674242  (note: it doesn't include
> sound/soc/samsung/mini6410_wm9713.c file, which is a copy of the
> smdk6410_wm9713.c file)
> Here's the mini6410_wm9713.c file: http://pastie.org/5674322
>
>
> This is what I'm getting from boot:
>
> soc-audio soc-audio: ASoC machine SMDK WM9713 should use snd_soc_register_card()
> soc-audio soc-audio:  wm9713-hifi<->  samsung-ac97 mapping ok
> ALSA device list:
>    #0: MINI6410
>
> which is what I was expecting (at least that's what I get booting the
> FriendlyARM kernel).

Sounds good.

> I had to unmute everything because everything was muted by default,
> but that really doesn't bother me.
>
> The bad part is that, as Andrey told us, the filter hack is necessary.
> If I remove it, I can't get any sound working.
> Even further, if I try to run some amixer sset commands to unmute a
> control, I get a few printfs with
> "ac97: req addr = 12, rep addr = 00".
>
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

This is an issue at the SMDK board file, don't need to worry about it.
I must have shown up when the kernel got linked again. The below patch
should fix that issue.

> Sylwester, I can start sending you well-formated patches now or I can
> wait for the filter hack to be fixed first, just say :)

I know I asked you previously for preparing patches so others don't
need to waste much time to enable all required features on those s3c64xx
reference boards. But now when there is the device tree support for
s3c64xx SoCs on the horizon [1], I'm not sure if we should be updating
the board files. Especially adding new static platform devices might be
not welcome.

@Kukjin: Do you think we can merge things like in this diff:
http://pastie.org/5674242, while device tree support is being worked on ?
Or should that be rather kept in private branches ?

[1] http://www.spinics.net/lists/arm-kernel/msg216616.html

Regards,
Sylwester

-------------8<--------------------------------------

 From 03c7f2470f58a6575b4a15ff52e9d1252f392933 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Date: Sat, 12 Jan 2013 19:49:13 +0100
Subject: [PATCH] ARM: S3C64XX: Fix section mismatch in smdk6410 board file

This patch corrects smdk6410_b_pwr_5v_consumers[] array attribute
and eliminates following compilation warning:

WARNING: arch/arm/mach-s3c64xx/built-in.o(.data+0x5704): Section mismatch
in reference from the variable smdk6410_b_pwr_5v_data to the (unknown
reference) .init.data:(unknown)

The variable smdk6410_b_pwr_5v_data references
the (unknown reference) __initdata (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

Reported-by: Alexander Nestorov <alexandernst@gmail.com>
Signed-off-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
---
  arch/arm/mach-s3c64xx/mach-smdk6410.c |    2 +-
  1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/mach-smdk6410.c 
b/arch/arm/mach-s3c64xx/mach-smdk6410.c
index 574a9ee..819c133 100644
--- a/arch/arm/mach-s3c64xx/mach-smdk6410.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6410.c
@@ -209,7 +209,7 @@ static struct platform_device smdk6410_smsc911x = {
  };

  #ifdef CONFIG_REGULATOR
-static struct regulator_consumer_supply smdk6410_b_pwr_5v_consumers[] 
__initdata = {
+static struct regulator_consumer_supply smdk6410_b_pwr_5v_consumers[] = {
  	REGULATOR_SUPPLY("PVDD", "0-001b"),
  	REGULATOR_SUPPLY("AVDD", "0-001b"),
  };
-- 
1.7.4.1
-------------8<--------------------------------------

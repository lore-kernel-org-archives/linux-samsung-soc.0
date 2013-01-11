From: Alexander Nestorov <alexandernst@gmail.com>
Subject: Re: Audio support on Mini6410 board [was Re: Hi again]
Date: Fri, 11 Jan 2013 19:17:00 +0100
Message-ID: <CACuz9s3fMLQUdm8rbLUBKFbHi0E3tGHYUdHLGQQB9wYAt-zo8g@mail.gmail.com>
References: <CACuz9s2w28eVG8qS9FXkUYAggXn7y2deHi2fPGizcURu_Bp4wg@mail.gmail.com>
 <50D19AE6.1080306@gmail.com> <50D19D03.3060203@gmail.com> <CACuz9s0hXGO_kBtWWLqMtktMyUhVBw-a0+auVEEfMvVEX4jD=w@mail.gmail.com>
 <50D2109D.9@gmail.com> <CACuz9s3vY3XvaWymLGwnzEudBkOUW4o-LpfJQTF0=mgy0cAhzg@mail.gmail.com>
 <CACuz9s0a2A6F7zWyxQkBAZtj=Xi1NwT7cLEHe-fa6G5p__bUgg@mail.gmail.com>
 <50D2F879.6020501@gmail.com> <CACuz9s0rTGDGvB9PcKfjGvvt8vEdBDKKvQTx94fuj1MrDcNfOg@mail.gmail.com>
 <50D305CF.2030600@gmail.com> <CACuz9s19M2Qv8dOBY0h0EKNidD3r4G3esvAAWZAUDZEjFMCGiA@mail.gmail.com>
 <50D30F6C.7000004@gmail.com> <CACuz9s1_KKfVDCa4FvZLe9pEVWuqQzuLPX7pYX9Tw1NUQGPtzA@mail.gmail.com>
 <CACuz9s1waQ3VgRjdxw9CoiHX2BtfOaxTosqLDwhX+O7px0=JXg@mail.gmail.com>
 <50D31BF8.8040301@gmail.com> <CACuz9s3xtCndC2jks4T-ytSWxwTBjLbXUrehEtsNwm7H=wJC1Q@mail.gmail.com>
 <50D31F63.6090304@gmail.com> <CACuz9s06v5nXNze+AAZyPTyxib4OXmqRi9E_Hw4SqBoprym0UA@mail.gmail.com>
 <CACuz9s1mnOon=EywOrcxZjMOGrx2=f0-4sj6ietZFoEXC66uWQ@mail.gmail.com>
 <50EF4BCB.40307@gmail.com> <CAA11ShCbyKEtgK=p2Wz57RPZtV1nG5dWb-5Ajq7FuSTse4xPBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:45799 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753510Ab3AKSRl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Jan 2013 13:17:41 -0500
Received: by mail-ob0-f172.google.com with SMTP id za17so2035285obc.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jan 2013 10:17:40 -0800 (PST)
In-Reply-To: <CAA11ShCbyKEtgK=p2Wz57RPZtV1nG5dWb-5Ajq7FuSTse4xPBg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrey Gusakov <dron0gus@gmail.com>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi,

thank you both for REing :)

I made some changes following your instructions and also looking at
the diff between a clean 2.6.38 kernel and FriendlyARM's 2.6.38
kernel.
This is my diff so far: http://pastie.org/5669444
Also, I created a new file for the mini6410 (it's pretty much a copy
of the smdk_wm9713.c in sound/soc/samsung/): http://pastie.org/5669453

So, booting this kernel (3.7 from Sylwester's media/testing branch,
which is just 3.7 with a patch for the OV9650)
gives me this output:

samsung-ac97 samsung-ac97: cfg_gpio callback not provided!
samsung-ac97: probe of samsung-ac97 failed with error -22
soc-audio soc-audio: ASoC machine MINI6410 should use snd_soc_register_card()
soc-audio soc-audio: CPU DAI samsung-ac97 not registered
platform soc-audio: Driver soc-audio requests probe deferral
soc-audio: probe of soc-audio failed with error -22
ALSA device list:
  No soundcards found.

If I uncomment the line 56 in my diff (
//s3c64xx_ac97_setup_gpio(S3C64XX_AC97_GPD); ) I get
errors about the function not being defined. I do know that it's in
arch/arm/mach-s3c64xx/dev-audio.c
and include/linux/platform_data/asoc-s3c.h but I can't see any other
board-specific code using it.

Also S3C64XX_AC97_GPD not being defined, (but present in both files).
What include am I missing? I mean, of course I could include
asoc-s3c.h, but that's not how other boards are
doing it and they do have audio support. How is that done?

@Andrey One more thing, what do you mean by filter all writes to reg 0x0?
Literally something like:

void s3c_ac97_write(*ac97, reg, val){
  if(reg == 0x0)
    return;

  ...code here..
  ...
}

If so, yeah, it looks kind of ugly, but I'll try :)   (as soon as I
can get the "include" problem fixed)

Regards!

--
alexandernst

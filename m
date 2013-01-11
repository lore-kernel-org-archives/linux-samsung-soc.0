From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: Audio support on Mini6410 board
Date: Fri, 11 Jan 2013 23:50:08 +0100
Message-ID: <50F09720.7000102@gmail.com>
References: <CACuz9s2w28eVG8qS9FXkUYAggXn7y2deHi2fPGizcURu_Bp4wg@mail.gmail.com> <CACuz9s0a2A6F7zWyxQkBAZtj=Xi1NwT7cLEHe-fa6G5p__bUgg@mail.gmail.com> <50D2F879.6020501@gmail.com> <CACuz9s0rTGDGvB9PcKfjGvvt8vEdBDKKvQTx94fuj1MrDcNfOg@mail.gmail.com> <50D305CF.2030600@gmail.com> <CACuz9s19M2Qv8dOBY0h0EKNidD3r4G3esvAAWZAUDZEjFMCGiA@mail.gmail.com> <50D30F6C.7000004@gmail.com> <CACuz9s1_KKfVDCa4FvZLe9pEVWuqQzuLPX7pYX9Tw1NUQGPtzA@mail.gmail.com> <CACuz9s1waQ3VgRjdxw9CoiHX2BtfOaxTosqLDwhX+O7px0=JXg@mail.gmail.com> <50D31BF8.8040301@gmail.com> <CACuz9s3xtCndC2jks4T-ytSWxwTBjLbXUrehEtsNwm7H=wJC1Q@mail.gmail.com> <50D31F63.6090304@gmail.com> <CACuz9s06v5nXNze+AAZyPTyxib4OXmqRi9E_Hw4SqBoprym0UA@mail.gmail.com> <CACuz9s1mnOon=EywOrcxZjMOGrx2=f0-4sj6ietZFoEXC66uWQ@mail.gmail.com> <50EF4BCB.40307@gmail.
 com> <CAA11ShCbyKEtgK=p2Wz57RPZtV1nG5dWb-5Ajq7FuSTse4xPBg@mail.gmail.com> <CACuz9s3fMLQUdm8rbLUBKFbHi0E3tGHYUdHLGQQB9wYAt-zo8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f179.google.com ([209.85.215.179]:38695 "EHLO
	mail-ea0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755620Ab3AKWuM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Jan 2013 17:50:12 -0500
Received: by mail-ea0-f179.google.com with SMTP id i12so890631eaa.24
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jan 2013 14:50:11 -0800 (PST)
In-Reply-To: <CACuz9s3fMLQUdm8rbLUBKFbHi0E3tGHYUdHLGQQB9wYAt-zo8g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Nestorov <alexandernst@gmail.com>
Cc: Andrey Gusakov <dron0gus@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi,

On 01/11/2013 07:17 PM, Alexander Nestorov wrote:
> samsung-ac97 samsung-ac97: cfg_gpio callback not provided!
> samsung-ac97: probe of samsung-ac97 failed with error -22
> soc-audio soc-audio: ASoC machine MINI6410 should use snd_soc_register_card()
> soc-audio soc-audio: CPU DAI samsung-ac97 not registered
> platform soc-audio: Driver soc-audio requests probe deferral
> soc-audio: probe of soc-audio failed with error -22
> ALSA device list:
>    No soundcards found.
>
> If I uncomment the line 56 in my diff (
> //s3c64xx_ac97_setup_gpio(S3C64XX_AC97_GPD); ) I get
> errors about the function not being defined. I do know that it's in
> arch/arm/mach-s3c64xx/dev-audio.c
> and include/linux/platform_data/asoc-s3c.h but I can't see any other
> board-specific code using it.
>
> Also S3C64XX_AC97_GPD not being defined, (but present in both files).
> What include am I missing? I mean, of course I could include
> asoc-s3c.h, but that's not how other boards are
> doing it and they do have audio support. How is that done?

Just include <linux/platform_data/asoc-s3c.h> file in the board file.
This is the only header where the required functions are declared

/* The machine init code calls s3c*_ac97_setup_gpio with
  * one of these defines in order to select appropriate bank
  * of GPIO for AC97 pins
  */
#define S3C64XX_AC97_GPD  0
#define S3C64XX_AC97_GPE  1
extern void s3c64xx_ac97_setup_gpio(int);

Maybe some boards use default gpio configuration callbacks, grep shows
that only arch/arm/mach-s5pc100/mach-smdkc100.c includes this header.

Maybe it's worth to set statically a default gpio helper function:

--------------------8<------------------------

diff --git a/arch/arm/mach-s3c64xx/dev-audio.c 
b/arch/arm/mach-s3c64xx/dev-audio.c
index e367e87..bc41c13 100644
--- a/arch/arm/mach-s3c64xx/dev-audio.c
+++ b/arch/arm/mach-s3c64xx/dev-audio.c
@@ -201,7 +201,9 @@ static struct resource s3c64xx_ac97_resource[] = {
         [4] = DEFINE_RES_IRQ(IRQ_AC97),
  };

-static struct s3c_audio_pdata s3c_ac97_pdata;
+static struct s3c_audio_pdata s3c_ac97_pdata = {
+       .cfg_gpio = s3c64xx_ac97_cfg_gpd
+};

  static u64 s3c64xx_ac97_dmamask = DMA_BIT_MASK(32);

--------------------8<------------------------

so there is no need to add s3c64xx_ac97_setup_gpio(S3C64XX_AC97_GPD)
call to boards that use the GPD port.

> @Andrey One more thing, what do you mean by filter all writes to reg 0x0?
> Literally something like:
>
> void s3c_ac97_write(*ac97, reg, val){
>    if(reg == 0x0)
>      return;
>
>    ...code here..
>    ...
> }

I think this is what he meant. I would just try it and then when you
get similar results to Andrey we might consider trying to find the root
cause of this problem.

--

Regards,
Sylwester

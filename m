From: Andrey Gusakov <dron0gus@gmail.com>
Subject: Re: Audio support on Mini6410 board [was Re: Hi again]
Date: Fri, 11 Jan 2013 13:13:05 +0300
Message-ID: <CAA11ShCbyKEtgK=p2Wz57RPZtV1nG5dWb-5Ajq7FuSTse4xPBg@mail.gmail.com>
References: <CACuz9s2w28eVG8qS9FXkUYAggXn7y2deHi2fPGizcURu_Bp4wg@mail.gmail.com>
	<50D19AE6.1080306@gmail.com>
	<50D19D03.3060203@gmail.com>
	<CACuz9s0hXGO_kBtWWLqMtktMyUhVBw-a0+auVEEfMvVEX4jD=w@mail.gmail.com>
	<50D2109D.9@gmail.com>
	<CACuz9s3vY3XvaWymLGwnzEudBkOUW4o-LpfJQTF0=mgy0cAhzg@mail.gmail.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:37895 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754394Ab3AKKNG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Jan 2013 05:13:06 -0500
Received: by mail-pb0-f44.google.com with SMTP id uo1so878214pbc.17
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jan 2013 02:13:05 -0800 (PST)
In-Reply-To: <50EF4BCB.40307@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Alexander Nestorov <alexandernst@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi.

I also had some problems with WM9714 on mini6410. The problem was
write to register 0x00 of coded. That is SW reset command. I had no
time to deal with it, so I just filter out all writes to register 0x00
in samsung AC97 driver. May be it can help you.
http://comments.gmane.org/gmane.linux.alsa.devel/101674
Also you have to add platform_devices samsung_asoc_dma and s3c64xx_device_ac97
And call s3c64xx_ac97_setup_gpio(S3C64XX_AC97_GPD) from <your_board>_map_io
You Can use sound/soc/samsung/smdk_wm9713.c or create your own. As i
see from boot log you use SMDK file.

On Fri, Jan 11, 2013 at 3:16 AM, Sylwester Nawrocki
<sylvester.nawrocki@gmail.com> wrote:
> Hi Alexander,
>
> Cc: linux-samsung-soc@vger.kernel.org
>
> On 12/21/2012 07:39 PM, Alexander Nestorov wrote:
>>
>> Hi once again :)
>>
>> After some more work there is some (really small) progress.
>> I'm able to make the kernel throw errors about something related with
>> AC97 and/or ALSA
>>
>> This is the kernel log: http://pastie.org/5562475
>> Those are the patches I have applied (probably something is wrong, I
>> just don't know what/where): http://pastie.org/5562478
>> And this is the kernel's configuracion: http://pastie.org/5562483
>>   (should I disable/enable something?)
>
>
> It might be correct, but I suspect you need add an entry for Mini6410
> board, similar to this one
>
> "SoC AC97 Audio support for SMDK with WM9713"
>
>> What do you think? Any notes/comments?
>
>
> I have virtually no experience with ASoC and no board to check it,
> so my ability to help you with this is really limited. Anyway, let's
> try to make it work.
>
> In the kernel log there are 2 things I noticed and would need to be
> checked:
>
> Lines 164...166:
>
> soc-audio soc-audio: ASoC machine SMDK WM9713 should use
> snd_soc_register_card()
> soc-audio soc-audio: CPU DAI samsung-ac97 not registered
> platform soc-audio: Driver soc-audio requests probe deferral
>
> and line 182:
>
> soc-audio: probe of soc-audio failed with error -22
>
> Likely only this last error is important.
>
> I would add some debug prints to snd_soc_register_card() and
> snd_soc_instantiate_card() to find out where it fails exactly.
>
> Anyway, it seems you have added wrong audio devices to your board file,
> copied from mach-mini2440.c ? Instead, you should find what's in board
> files for boards based on s3c6410 SoC, e.g. mach-s3c6410/mach-crag6410.c.
>
> I think you need one of these devices in mini6410_devices[] array:
>
>         &s3c64xx_device_iis0,
>         &s3c64xx_device_iis1,
>
> Also, can you check what devices are registered in the system, e.g.
>
> # find /sys/devices
>
> ?
> You might want to have a look at sound/soc/samsung/smdk_wm9713.c.
> Likely you need to add something similar for Mini6410.
>
> And just do remove all mini2440 devices from your board file, like:
> uda1340_codec, mini2440_audio. Those certainly shouldn't be there.
>
> I'm not sure yet where AC97_* SoC pins are configured (corresponding
> to B29...B33 pins of Tiny6410 module).
>
> --
>
> Regards,
> Sylwester
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

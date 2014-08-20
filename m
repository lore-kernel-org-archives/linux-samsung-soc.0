From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v2 0/4] Add Exynos4412 based Odroid X2 and U2/U3/U3+ support
Date: Wed, 20 Aug 2014 09:18:41 +0200
Message-ID: <CABxcv=n4uu+ST-sncfYS0SCcTYa4cXMOxRG5EQ7ZTcxEOFm7vw@mail.gmail.com>
References: <1403702773-9141-1-git-send-email-m.szyprowski@samsung.com>
	<53B0F6D1.4090006@samsung.com>
	<53C93FEB.2030507@samsung.com>
	<CAOesGMh-XRpX_U9s-BVE=BuOG-1EMDL+B_Dm1hdm+tcPQA9E-g@mail.gmail.com>
	<CAD8Lp46pY9_+N6M17i4xv71BR_poT2Pfh4cmM0J2jxP96m9sVA@mail.gmail.com>
	<CAOesGMiSTBt8f4WURFjqpxTZGzy7ZSWw_3RTNdBZ6KD_vei2GA@mail.gmail.com>
	<53F44056.5030601@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:61867 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750944AbaHTHSm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Aug 2014 03:18:42 -0400
Received: by mail-wg0-f44.google.com with SMTP id m15so7358167wgh.15
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Aug 2014 00:18:41 -0700 (PDT)
In-Reply-To: <53F44056.5030601@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Olof Johansson <olof@lixom.net>, Daniel Drake <drake@endlessm.com>, Przemyslaw Marczak <p.marczak@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>

+Bartlomiej Zolnierkiewicz

Hello Marek,

On Wed, Aug 20, 2014 at 8:29 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>>>
>>> Yes, discussed in the thread titled "[PATCH 1/2] ARM: dts: Enable PMIC
>>> interrupts on ODROID"
>>> Those patches weren't important for boot at the time of submission,
>>> but it looks like something else changed (the max77686 driver?) that
>>> makes them now required.
>>
>> Excellent, thanks. A bummer we didn't see this earlier, but let's get
>> the fix in asap.
>
>
> I've also posted a fix to MAX77686 driver, which restores v3.16-like
> behavior
> of PMIC driver. I hope it will get merged to one of v3.17 rc series.
>

Bartlomiej posted a similar patch [0] before but as I said on that
thread, I'm not sure if is correct to make that DT property optional.
Or rather, if we need to make it optional then we should also change
the Documentation/devicetree/bindings/mfd/max77686.txt that list
"interrupts" DT property as required.

It's true that before converting the max77686 to use the regmap irq
API, the driver was loose on that regard but max77686_irq_init() in
max77686-irq.c was returning -ENODEV when the IRQ was not provided and
that error code was not checked in max77686_i2c_probe() which was a
bug IMHO.

More importantly I wonder if a design where a IRQ line is not
connected to the max77686 PMIC makes even sense. If such a design is
possible then the "interrupt" property should be optional but if not
then I think that the driver should fail to probe in that case. Yes,
it is a regression but also the Odroid DTS was not following the DT
binding and was just lucky that the driver was not checking the
required DT properties.

So I tend to say that Daniel's fix should be added as a -rc fix and we
should keep both the max77686 driver and its DT binding as it is now
but as I said, if from a hardware point of view makes sense to leave
that line unconnected then I don't oppose to this change.

>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>

Best regards,
Javier

[0]: https://lkml.org/lkml/2014/8/7/374

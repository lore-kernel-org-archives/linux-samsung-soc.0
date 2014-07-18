From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH v2 0/4] Add Exynos4412 based Odroid X2 and U2/U3/U3+ support
Date: Fri, 18 Jul 2014 07:06:28 +0100
Message-ID: <CAD8Lp45CDg3tcuqZLqkvaFaFQ-YL8m-Hpnh7p7q3vf6edg2pKg@mail.gmail.com>
References: <1403702773-9141-1-git-send-email-m.szyprowski@samsung.com>
	<53B0F6D1.4090006@samsung.com>
	<CAOesGMirJ0R6NDUY=Yx2Pjaipw32ZGORVqtnrFMPMHpSP8YuBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f171.google.com ([74.125.82.171]:40149 "EHLO
	mail-we0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755283AbaGRGG3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jul 2014 02:06:29 -0400
Received: by mail-we0-f171.google.com with SMTP id p10so4099345wes.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Jul 2014 23:06:28 -0700 (PDT)
In-Reply-To: <CAOesGMirJ0R6NDUY=Yx2Pjaipw32ZGORVqtnrFMPMHpSP8YuBQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Przemyslaw Marczak <p.marczak@samsung.com>

Hi Olof,

Thanks for joining the party here :)

On Fri, Jul 18, 2014 at 6:56 AM, Olof Johansson <olof@lixom.net> wrote:
> Anyone got a simple writeup on the steps needed to boot, bl1/2 needed,
> expected offset into eMMC for where it goes, etc?

https://github.com/hardkernel/u-boot/blob/odroid-v2010.12/sd_fuse/sd_fusing.sh
is probably the best "writeup" :)
https://github.com/hardkernel/u-boot/tree/odroid-v2010.12/sd_fuse has
the blobs needed (they have not changed at all in the U3's history, so
the ones you have already will work fine).

Samsung guys are also upstreaming support into uboot, including a
README.odroid in the last commit with this info:
http://patchwork.ozlabs.org/project/uboot/list/?submitter=23519

> I gave the kernel (next-0717) a go here on my U3, and it boots (as you
> mention, no USB comes up).

Nice. USB works with the later patches floating around.

> I do see a few KERN_ERR printks though:
>
> [ERR] [    0.000000] L2C: failed to init: -19

This one is fixed with the patch series "Enable L2 cache support on
Exynos4210/4x12 SoCs"

> [ERR] [    0.001302] missing device node for CPU 0
> [ERR] [    0.001344] missing device node for CPU 1
> [ERR] [    0.001366] missing device node for CPU 2
> [ERR] [    0.001386] missing device node for CPU 3

Not sure about these - I still get them with all the patches applied.

> [ERR] [    0.156490] max77686 0-0009: irq is not specified

I submitted a patch for this, "ARM: dts: Enable PMIC interrupts on ODROID"

> [ERR] [    1.339498] /i2c@13860000/usb3503@08: could not get
> #clock-cells for /system-controller@10020000
> [ERR] [    1.348050] ERROR: could not get clock
> /i2c@13860000/usb3503@08:refclk(0)

I think these go away with the USB patches floating around.

> [ERR] [    1.383055] max77686-rtc max77686-rtc: max77686_rtc_init_reg:
> fail to write controlm reg(-6)
> [ERR] [    1.391108] max77686-rtc max77686-rtc: Failed to initialize RTC reg:-6

Fixed with "ARM: dts: ODROID i2c improvements"

Daniel

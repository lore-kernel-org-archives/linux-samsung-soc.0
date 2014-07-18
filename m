From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 0/4] Add Exynos4412 based Odroid X2 and U2/U3/U3+ support
Date: Thu, 17 Jul 2014 22:56:03 -0700
Message-ID: <CAOesGMirJ0R6NDUY=Yx2Pjaipw32ZGORVqtnrFMPMHpSP8YuBQ@mail.gmail.com>
References: <1403702773-9141-1-git-send-email-m.szyprowski@samsung.com>
	<53B0F6D1.4090006@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f170.google.com ([209.85.220.170]:38326 "EHLO
	mail-vc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759541AbaGRF4F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jul 2014 01:56:05 -0400
Received: by mail-vc0-f170.google.com with SMTP id lf12so6453727vcb.29
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Jul 2014 22:56:03 -0700 (PDT)
In-Reply-To: <53B0F6D1.4090006@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Przemyslaw Marczak <p.marczak@samsung.com>

On Sun, Jun 29, 2014 at 10:34 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Hello,
>
>
> On 2014-06-25 15:26, Marek Szyprowski wrote:
>>
>> Hello,
>>
>> This is the second version of the initial patch series adding support
>> for Exynos 4412 based Odroid X2 and U2/U3/U3+ boards and improving
>> support for Odroid X.
>>
>> Complete USB support for Odroid U2/U3/U3+ still requires some fixes in
>> Exynos4 USB2 Phy driver and clock driver for CLKOUT:
>> http://thread.gmane.org/gmane.linux.kernel/1731843/
>> http://www.spinics.net/lists/linux-usb/msg109587.html
>> The above changes however don't affect Odroid DTS files, but without
>> them, usb3503 hub is not yet functional.
>>
>> Support for audio codec will be posted separately by Sylwester Nawrocki
>> soon. Support for HDMI video output will be also posted separately
>> together with the required ExynosDRM-HDMI fixes.
>>
>> If one is interested in more complete and open-source Odroid board
>> support, there are also patches for u-boot project:
>> http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/188295/focus=188610
>
>
> Just to let everyone knows - updated Odroid patches for uboot has been
> posted in the following thread:
> http://www.mail-archive.com/u-boot@lists.denx.de/msg141234.html
> You can also download them here:
> http://patchwork.ozlabs.org/project/uboot/list/?submitter=23519

Anyone got a simple writeup on the steps needed to boot, bl1/2 needed,
expected offset into eMMC for where it goes, etc?


I gave the kernel (next-0717) a go here on my U3, and it boots (as you
mention, no USB comes up).

I do see a few KERN_ERR printks though:

[ERR] [    0.000000] L2C: failed to init: -19
[ERR] [    0.001302] missing device node for CPU 0
[ERR] [    0.001344] missing device node for CPU 1
[ERR] [    0.001366] missing device node for CPU 2
[ERR] [    0.001386] missing device node for CPU 3
[ERR] [    0.156490] max77686 0-0009: irq is not specified
[ERR] [    1.339498] /i2c@13860000/usb3503@08: could not get
#clock-cells for /system-controller@10020000
[ERR] [    1.348050] ERROR: could not get clock
/i2c@13860000/usb3503@08:refclk(0)
[ERR] [    1.383055] max77686-rtc max77686-rtc: max77686_rtc_init_reg:
fail to write controlm reg(-6)
[ERR] [    1.391108] max77686-rtc max77686-rtc: Failed to initialize RTC reg:-6


That can be fixed incrementally. I'll add the U3 to my boot farm
starting tonight. Thanks for submitting all this!


-Olof

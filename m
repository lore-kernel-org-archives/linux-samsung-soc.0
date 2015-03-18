From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [rtc-s3c.c] add .needs_src_clk to s3c6410 RTC data / break exynos4
Date: Wed, 18 Mar 2015 14:37:27 +0100
Message-ID: <55097F97.9010201@collabora.co.uk>
References: <1d0ae8204c93040d4cfe35c8551f201f@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:54892 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933099AbbCRNhj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Mar 2015 09:37:39 -0400
In-Reply-To: <1d0ae8204c93040d4cfe35c8551f201f@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>

Hello Tobias,

On 03/18/2015 02:00 PM, Tobias Jakobi wrote:
> Hello Javier,
> 
> I noticed that this recent commit breaks rtc-s3c on my Odroid-X2 
> (Exynos4412). The exynos4 dtsi includes a rtc of type s3c6410. Hence all 
> board files based on exynos4, and using the rtc-s3c, are now required to 
> specific the rtc_src clock. I don't think that this is correct, since 
> the rtc was properly working on this board before the commit.
> 

Yes, when I posted the patch [0] I mentioned that it could break rtc-s3c
in Odroid boards. I'll save you one click and include it here again:

"I see that Exynos4 uses the same s3c6410 RTC IP version but at least
the Exynos4412 Odroid boards don't define a source clock for the RTC.

According to the Exynos4 documentation I've, the RTC uses XRTCXTI as
its source clock so I think those boards are relying on the HW not
being completely defined in DT and the clock setup by the bootloader."

> Maybe the check should be relaxed to make the clock optional again?
> 

The question I think is if the source clock is really optional for that IP.

The rtc-s3c driver did not have support for the RTC source clock so all the
boards were relying on the bootloader enabling it and the kernel not gating it.

Then Chanwoo made "rtc_src" required in commit df9e26d093d3 ("rtc: s3c: add
support for RTC of Exynos3250 SoC") for all platforms since he forgot to
check for .needs_src_clk and only added that field to exynos3250_rtc_data.

Since the s3c6410 RTC IP in the Exynos5 needs a source clock, I added those
for the Exynos5 Chromebooks in commits:

90fbb382dac5 ("ARM: dts: Add rtc_src clk for s3c-rtc on exynos5250-snow")
fa781ddab929 ("ARM: dts: Add rtc_src clk for s3c-rtc on exynos Peach boards")

Later Marek found that the RTC was not working on Odroid boards and added the
check for .needs_src_clk in commit eaf3a659086e ("drivers/rtc/rtc-s3c.c: fix
initialization failure without rtc source clock")

But didn't set the .needs_src_clk field on all the IP data structs so the RTC
on Exynos5 boards broke. Since now the RTC source clock was known to the CCF
and the rtc-s3c driver wouldn't grab that clock anymore, the kernel disabled
that clock since it was unused.

Marek's patch is correct since .needs_src_clk has to be checked but I believe
it was not the right fix for the Odroid issue. The right fix IMHO is to add
the RTC source clock in the DTS and not rely on the bootloader to enable it.

> Anyway, here's a short dmesg snip:
> [    1.611352] s3c-rtc 10070000.rtc: s3c2410_rtc: tick irq 65, alarm irq 
> 64
> [    1.611430] s3c-rtc 10070000.rtc: failed to find rtc source clock
> [    1.616740] s3c-rtc: probe of 10070000.rtc failed with error -2
> 
> With best wishes,
> Tobias Jakobi
> 

Best regards,
Javier

[0]: https://lkml.org/lkml/2015/2/24/388

From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: add exynos5422.dtsi to correct cpu order
Date: Sun, 31 May 2015 16:09:03 +0900
Message-ID: <CAJKOXPdsaneWJjMcYrVw4ucSmh3aBWwHzr_uVdA+2NXmpZHU4Q@mail.gmail.com>
References: <1432739754-19511-1-git-send-email-chanho61.park@samsung.com>
	<55667652.5050102@samsung.com>
	<025901d098fa$da62d320$8f287960$@samsung.com>
	<5566A7A0.4080608@samsung.com>
	<030f01d09922$55a2e120$00e8a360$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f46.google.com ([209.85.216.46]:39686 "EHLO
	mail-vn0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752183AbbEaHJE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 31 May 2015 03:09:04 -0400
Received: by vnbf1 with SMTP id f1so12700141vnb.6
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 May 2015 00:09:03 -0700 (PDT)
In-Reply-To: <030f01d09922$55a2e120$00e8a360$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <chanho61.park@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Kukjin Kim <kgene@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-samsung-soc@vger.kernel.org, javier.martinez@collabora.co.uk, khilman@linaro.org, sjoerd.simons@collabora.co.uk, heesub.shin@samsung.com, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

2015-05-28 17:43 GMT+09:00 Chanho Park <chanho61.park@samsung.com>:
> Hi,
>
>> When adding new 5422 board we can split out CPU configuration to
>> separate DTSI file. I already posted patches for Odroid XU3-family
>> common DTSI file for XU3 Lite board:
>> http://www.spinics.net/lists/linux-samsung-soc/msg44868.html
>
> IMHO, all of the exynos5422 boards will be same cpu configurations. That's
> why I added new exynos5422.dtsi.

Maybe all of boards will have same configuration... maybe not. You
cannot predict the future, right? It is however strictly related to
the board configuration. The SoC supports both boot modes depending on
the GPIO pin. I do not oppose against the idea of correcting order of
CPUs. It is nice to have them ordered in a more natural way. However I
think this should be a DTSI related to the CPU-nodes, not a DTSI for
SoC. Especially that inclusion order gets quite complicated:
1. Odroid includes 5422.dtsi.
2. 5422 includes 5800.
3. 5800 includes 5420.

Can you make it as a DTSI specific for CPU nodes configuration and
then include it only in boards DTS?

>
>>
>> > BTW, booting of secondary cpus are still broken. Is there any progress
>> of
>> > the patch[1]?
>> > This patch is also generated top of the patch with some fixes.
>> >
>> > [1]. http://www.spinics.net/lists/linux-samsung-soc/msg39523.html
>>
>> No progress so far. Apparently nobody knows why this works and what to
>> do with it. I would suspect booted CPUs stuck somewhere in BL1 or BL2
>> and writing to PMU_SPARE2 kicks them. However this is just a guess.
>>
>> Kukjin which could be the closest person to the real knowledge (LSI) did
>> not gave his feedback.
>>
>> We have a lot of such hacks and undocumented interfaces between kernel
>> and bootloaders. IMHO it would be good to start documenting them.
>
> Good. But, who can do it?

Anyone can do it! The information is there (spread in
arch/arm/mach-exynos and in u-boot code) so we just need a volunteer!
:)

BR,
Krzysztof

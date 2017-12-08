From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: next/master boot: 270 boots: 35 failed, 213 passed with 20
 offline, 2 untried/unknown (next-20171207)
Date: Fri, 8 Dec 2017 13:33:41 +0100
Message-ID: <CAJKOXPcfgXTzacEYyPFV=UJYdKz9v86pEjbjaWJ_7BYhdNafqA@mail.gmail.com>
References: <5a29d4c7.4fabdf0a.716d7.8485@mx.google.com> <20171208122007.GB7606@sirena.org.uk>
 <20171208122703.GC7606@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752470AbdLHMdo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Dec 2017 07:33:44 -0500
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 59F682199D
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Dec 2017 12:33:43 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id g75so3105091wme.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Dec 2017 04:33:43 -0800 (PST)
In-Reply-To: <20171208122703.GC7606@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Guenter Roeck <groeck@google.com>, Ulf Hansson <ulf.hansson@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "kernelci.org bot" <bot@kernelci.org>, kernel-build-reports@lists.linaro.org, Marek Szyprowski <m.szyprowski@samsung.com>

On Fri, Dec 8, 2017 at 1:27 PM, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Dec 08, 2017 at 12:20:07PM +0000, Mark Brown wrote:
>> On Thu, Dec 07, 2017 at 03:54:47PM -0800, kernelci.org bot wrote:
>>
>> Today's -next failed to boot on peach-pi:
>>
>> >     exynos_defconfig:
>> >         exynos5800-peach-pi:
>> >             lab-collabora: new failure (last pass: next-20171205)
>>
>> with details at https://kernelci.org/boot/id/5a2a2e7859b5141bc2afa17c/
>> (including logs and comparisons with other boots, the last good boot was
>> Wednesday).  It looks like it hangs somewhere late on in boot, the last
>> output on the console is:
>>
>> [    4.827139] smsc95xx 3-1.1:1.0 eth0: register 'smsc95xx' at usb-xhci-hcd.3.auto-1.1, smsc95xx USB 2.0 Ethernet, 94:eb:2c:00:03:c0
>> [    5.781037] dma-pl330 3880000.adma: Loaded driver for PL330 DMAC-241330
>> [    5.786247] dma-pl330 3880000.adma:        DBUFF-4x8bytes Num_Chans-6 Num_Peri-16 Num_Events-6
>> [    5.819200] dma-pl330 3880000.adma: PM domain MAU will not be powered off
>> [   64.529228] random: crng init done
>>
>> and there's failures earlier to instantiate the display.
>
> I just noticed that further up the log there's a lockdep splat with a
> conflict between the genpd and clock API locking - an ABBA issue with
> genpd->mlock and the clock API prepare_lock.

+Cc Marek Szyprowski,

The lockdep issue and display failures (including regulator warning)
were present for some time. They also appear in boot log for
next-20171206 (https://storage.kernelci.org/next/master/next-20171206/arm/exynos_defconfig/lab-collabora/boot-exynos5800-peach-pi.html).
The difference is that 20171208 hangs on "random: crng init done"
which did not appear before at all.

The only recent changes in samsung-soc tree which could affect Exynos5800 is
 - ARM: dts: exynos: Add audio power domain support to Exynos542x SoCs
https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/commit/?h=next/dt&id=528832d4c01a2b400775df95fe8d363cf4c5230f
 - ARM: dts: exynos: Add CPU perf counters to Exynos54xx boards
https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/commit/?h=next/dt&id=c4f2fc00defc65950dfabce7a4c70cd2a289111d

But both of them were present in next for few days so they should hit
20171206 as well.

Maybe the issue comes from different subsystem?

Best regards,
Krzysztof

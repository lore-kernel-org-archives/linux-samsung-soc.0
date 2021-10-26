Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE0FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 01:20:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6130060E97
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 01:20:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233827AbhJZBXE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 25 Oct 2021 21:23:04 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:36862 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232336AbhJZBXD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 25 Oct 2021 21:23:03 -0400
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20211026012038epoutp01ae526549f3f2eda45368767ded4f972f~xb-UagCT10244202442epoutp01b
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 01:20:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20211026012038epoutp01ae526549f3f2eda45368767ded4f972f~xb-UagCT10244202442epoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1635211238;
        bh=+cOBn0TPeJ43/THh42mfzs/tHRW3nHYnzLa4x7FyhJI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EhyLZeyBSpwy9sVRBzDP7JH204nKGPIo2ezG6SVXjAcIeiXw4M4xC8CeroDCk8oA+
         KRP/T6mdeiB8bepMksDZQx7Hubp0AiEms8bIpefFigKI+9q0LgfWnSwSWzIg3uxH8f
         Y+yhnB1Qv1EOM0VG/3gnESGVr56Q39XSye88GlZM=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20211026012037epcas2p388b73bfb34202b56e27b7359afbfaed7~xb-T5p8p21099910999epcas2p3l;
        Tue, 26 Oct 2021 01:20:37 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.91]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4HdYsr3qbJz4x9QK; Tue, 26 Oct
        2021 01:20:32 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        6A.E2.09868.BD757716; Tue, 26 Oct 2021 10:20:27 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20211026012026epcas2p36495083942e37b3fe685cb093cacba46~xb-J1gA_G1099910999epcas2p3C;
        Tue, 26 Oct 2021 01:20:26 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211026012026epsmtrp2e587fed68ec50484d2315d8cb782330e~xb-J0px3d0237602376epsmtrp2H;
        Tue, 26 Oct 2021 01:20:26 +0000 (GMT)
X-AuditID: b6c32a45-9b9ff7000000268c-90-617757db9b9b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        FA.D3.08902.AD757716; Tue, 26 Oct 2021 10:20:26 +0900 (KST)
Received: from perf (unknown [12.36.155.123]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20211026012026epsmtip2955b1086e2372eeca35b0996fe24053f~xb-JmzxA_3251032510epsmtip2N;
        Tue, 26 Oct 2021 01:20:26 +0000 (GMT)
Date:   Tue, 26 Oct 2021 10:47:32 +0900
From:   Youngmin Nam <youngmin.nam@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com
Subject: Re: [PATCH v1 1/2] clocksource/drivers/exynos_mct_v2: introduce
 Exynos MCT version 2 driver for next Exynos SoC
Message-ID: <20211026014732.GA45525@perf>
MIME-Version: 1.0
In-Reply-To: <da83de3a-e7a2-f9b2-80f2-25c39717c3e4@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNJsWRmVeSWpSXmKPExsWy7bCmue7t8PJEg/tHhCzmfZa1aNp/idni
        +NrXrBYb3/5gstj0+BqrxeVdc9gsZpzfx2Sx+PEKJot/vQcZLTZvmsrswOUxq6GXzePOtT1s
        Hu/OnWP32Lyk3qNvyypGj8+b5ALYorJtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1DS0t
        zJUU8hJzU22VXHwCdN0yc4AOU1IoS8wpBQoFJBYXK+nb2RTll5akKmTkF5fYKqUWpOQUmBfo
        FSfmFpfmpevlpZZYGRoYGJkCFSZkZ6x5uo+xYIJ3xYLDs9gbGDttuxg5OSQETCT6fmxl7GLk
        4hAS2MEoMXv+IiYI5xOjxKqrc9ghnG+MEt0r1zLDtDx8sJAFIrGXUWLThP9sEM4jRomX678y
        glSxCKhK3D22mw3EZhPQldh24h9YXETAWuLo1vnMIA3MAv8YJRqmrmECSQgLVElce7oAqIGD
        g1dAU2LNRUeQMK+AoMTJmU9YQGxOAUeJN72tYDNFBZQlDmw7DnarhMBMDonW/b9ZIM5zkdi5
        vhHqVGGJV8e3sEPYUhKf3+1lg7DrJRZvW8oM0TyBUWL+pg9QRcYSs561g13KLJAhcWbuGlaQ
        gySAth25xQIR5pPoOPyXHSLMK9HRJgTRqSbxa8oGRghbRmL34hVQJ3hI7NpyEBrAq5gljq54
        wDaBUX4Wkt9mIdkGYetILNj9iW0W0ApmAWmJ5f84IExNifW79Bcwsq5iFEstKM5NTy02KjCE
        R3dyfu4mRnCq1XLdwTj57Qe9Q4xMHIyHGCU4mJVEeG0+lSQK8aYkVlalFuXHF5XmpBYfYjQF
        RtREZinR5Hxgss8riTc0sTQwMTMzNDcyNTBXEue1FM1OFBJITyxJzU5NLUgtgulj4uCUamA6
        uOzxmcjrVheNxQ8L7T99zaBvBQdj5+NvMX4GjS3FnSdbjIO1qr6siLHUjGFaVqgy77z2WRHB
        23rLN28+cC8mtFHWXkk57qSryP7nBQ+Ke27kbKzh8vh/R8Gv79lUmSnb6v3KFky9IHdv+h3B
        2rToLzPrdd9dEnf98MRkr+S9/X+Tpi4/veDdkQKu6yIshmUmomkLOwX3BV665pLcv/zXBju2
        TZfY7v7inH95q2xvwHu31Um57T1p3Z2FhdcnsNkc/19+MKAgaP/j6Iq1jGyfCtyVxKS4D0jn
        pu+e+f+AbuNfx4/TmY4Us6zxU9EyvSrqPoMv1OGp8tVdxl6L7KpTTj/Jub7uYHfVmaVP1lxS
        YinOSDTUYi4qTgQAmX+dvz4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHLMWRmVeSWpSXmKPExsWy7bCSvO6t8PJEg5kbdCzmfZa1aNp/idni
        +NrXrBYb3/5gstj0+BqrxeVdc9gsZpzfx2Sx+PEKJot/vQcZLTZvmsrswOUxq6GXzePOtT1s
        Hu/OnWP32Lyk3qNvyypGj8+b5ALYorhsUlJzMstSi/TtErgyjr+czF5wwaNi85MLzA2Mj6y6
        GDk5JARMJB4+WMjSxcjFISSwm1Hi9uvljBAJGYnbKy+zQtjCEvdbjgDZHEBFDxglrviChFkE
        VCXuHtvNBmKzCehKbDvxD6xVRMBa4ujW+cwgM5kFGpgkDlyZCZYQFqiSuPZ0ARvIHF4BTYk1
        Fx0h9q5ilji5+DBYDa+AoMTJmU9YQGxmAS2JG/9eMoHUMwtISyz/xwES5hRwlHjT2wq2V1RA
        WeLAtuNMExgFZyHpnoWkexZC9wJG5lWMkqkFxbnpucWGBYZ5qeV6xYm5xaV56XrJ+bmbGMFR
        oqW5g3H7qg96hxiZOBgPMUpwMCuJ8Np8KkkU4k1JrKxKLcqPLyrNSS0+xCjNwaIkznuh62S8
        kEB6YklqdmpqQWoRTJaJg1OqgUmxo26BFMe2ZJUZWWeuRhezs3BHbMjk/+auOWGKtcpHm3d7
        vmbkqbIf9Pyx+e39d7Fp35xCXR9yLLvx85BJ2It78cuSWB/UF7buXtcYOm/ruma2dkejyCWZ
        Cx6mXBNkPVbXIfxwjrOOY1Pd+ckmKwsSjx4KkKk8Y7GgqT5c6teuhU82fvB3UTnfftZgi6GS
        eMKOf8GrHRVqTk7LX3VONyQ7Mqb2yqOiogls148FNM34J3zyoW7WqsMGBSFHHN4dXno0UD/W
        Z2qW4p/dx+9cr2W+sqmxXPGClrf15nUqeQ4XKzWW2m7/3NP9t7PBJMLg7Zv2FyfFqliTNl/j
        zL00i6EkTJM95i+7dbDdizW9BkosxRmJhlrMRcWJAFoAfEwBAwAA
X-CMS-MailID: 20211026012026epcas2p36495083942e37b3fe685cb093cacba46
X-Msg-Generator: CA
Content-Type: multipart/mixed;
        boundary="----cdUjzaOTU1RPrvxdiax6HhSlBq1jqBVFQM-mWLfQP3CdA8rT=_5b276_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211021055112epcas2p278145beb21cd6cc4217813a41c1e1407
References: <20211021061804.39118-1-youngmin.nam@samsung.com>
        <CGME20211021055112epcas2p278145beb21cd6cc4217813a41c1e1407@epcas2p2.samsung.com>
        <20211021061804.39118-2-youngmin.nam@samsung.com>
        <0c5dcdab-7aa3-a98f-e615-acbe98489935@canonical.com>
        <20211021082650.GA30741@perf>
        <1b93aaf3-ed64-b105-dec4-07b6f27b385b@canonical.com>
        <20211022042116.GA30645@perf>
        <da83de3a-e7a2-f9b2-80f2-25c39717c3e4@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

------cdUjzaOTU1RPrvxdiax6HhSlBq1jqBVFQM-mWLfQP3CdA8rT=_5b276_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Oct 25, 2021 at 10:18:04AM +0200, Krzysztof Kozlowski wrote:
> On 22/10/2021 06:21, Youngmin Nam wrote:
> > On Thu, Oct 21, 2021 at 10:07:25AM +0200, Krzysztof Kozlowski wrote:
> >> On 21/10/2021 10:26, Youngmin Nam wrote:
> >>> On Thu, Oct 21, 2021 at 08:18:36AM +0200, Krzysztof Kozlowski wrote:
> >>>> On 21/10/2021 08:18, Youngmin Nam wrote:
> >>>>> Exynos MCT version 2 is composed of 1 FRC and 12 comparators.
> >>>>> The 12 comparators can produces interrupts independently,
> >>>>> so they can be used as local timer of each CPU.
> >>>>>
> >>>>> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> >>>>> ---
> >>>>>  drivers/clocksource/Kconfig         |   6 +
> >>>>>  drivers/clocksource/Makefile        |   1 +
> >>>>>  drivers/clocksource/exynos_mct_v2.c | 336 ++++++++++++++++++++++++++++
> >>>>>  drivers/clocksource/exynos_mct_v2.h |  74 ++++++
> >>>>>  4 files changed, 417 insertions(+)
> >>>>>  create mode 100644 drivers/clocksource/exynos_mct_v2.c
> >>>>>  create mode 100644 drivers/clocksource/exynos_mct_v2.h
> >>>>>
> >>>>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> >>>>> index 0f5e3983951a..8ac04dd7f713 100644
> >>>>> --- a/drivers/clocksource/Kconfig
> >>>>> +++ b/drivers/clocksource/Kconfig
> >>>>> @@ -421,6 +421,12 @@ config CLKSRC_EXYNOS_MCT
> >>>>>  	help
> >>>>>  	  Support for Multi Core Timer controller on Exynos SoCs.
> >>>>>  
> >>>>> +config CLKSRC_EXYNOS_MCT_V2
> >>>>> +	bool "Exynos multi core timer (ver 2) driver" if COMPILE_TEST
> >>>>> +	depends on ARM64
> >>>>
> >>>> depends on ARCH_EXYNOS.
> >>>>
> >>> Okay
> >>>>> +	help
> >>>>> +	  Support for Multi Core Timer controller on Exynos SoCs.
> >>>>> +
> >>>>>  config CLKSRC_SAMSUNG_PWM
> >>>>>  	bool "PWM timer driver for Samsung S3C, S5P" if COMPILE_TEST
> >>>>>  	depends on HAS_IOMEM
> >>>>> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> >>>>> index c17ee32a7151..dc7d5cf27516 100644
> >>>>> --- a/drivers/clocksource/Makefile
> >>>>> +++ b/drivers/clocksource/Makefile
> >>>>> @@ -43,6 +43,7 @@ obj-$(CONFIG_CADENCE_TTC_TIMER)	+= timer-cadence-ttc.o
> >>>>>  obj-$(CONFIG_CLKSRC_STM32)	+= timer-stm32.o
> >>>>>  obj-$(CONFIG_CLKSRC_STM32_LP)	+= timer-stm32-lp.o
> >>>>>  obj-$(CONFIG_CLKSRC_EXYNOS_MCT)	+= exynos_mct.o
> >>>>> +obj-$(CONFIG_CLKSRC_EXYNOS_MCT_V2)	+= exynos_mct_v2.o
> >>>>>  obj-$(CONFIG_CLKSRC_LPC32XX)	+= timer-lpc32xx.o
> >>>>>  obj-$(CONFIG_CLKSRC_MPS2)	+= mps2-timer.o
> >>>>>  obj-$(CONFIG_CLKSRC_SAMSUNG_PWM)	+= samsung_pwm_timer.o
> >>>>> diff --git a/drivers/clocksource/exynos_mct_v2.c b/drivers/clocksource/exynos_mct_v2.c
> >>>>> new file mode 100644
> >>>>> index 000000000000..2da6d5401629
> >>>>> --- /dev/null
> >>>>> +++ b/drivers/clocksource/exynos_mct_v2.c
> >>>>> @@ -0,0 +1,336 @@
> >>>>> +// SPDX-License-Identifier: GPL-2.0-only
> >>>>> +/*
> >>>>> + * Copyright (c) 2022 Samsung Electronics Co., Ltd.
> >>>>> + *		http://www.samsung.com
> >>>>> + *
> >>>>> + * Exynos MCT(Multi-Core Timer) version 2 support
> >>>>> + */
> >>>>> +
> >>>>> +#include <linux/interrupt.h>
> >>>>> +#include <linux/irq.h>
> >>>>> +#include <linux/err.h>
> >>>>> +#include <linux/clk.h>
> >>>>> +#include <linux/clockchips.h>
> >>>>> +#include <linux/cpu.h>
> >>>>> +#include <linux/delay.h>
> >>>>> +#include <linux/percpu.h>
> >>>>> +#include <linux/of.h>
> >>>>> +#include <linux/of_irq.h>
> >>>>> +#include <linux/of_address.h>
> >>>>> +#include <linux/clocksource.h>
> >>>>> +#include "exynos_mct_v2.h"
> >>>>> +
> >>>>> +static void __iomem *reg_base;
> >>>>> +static unsigned long osc_clk_rate;
> >>>>> +static int mct_irqs[MCT_NR_COMPS];
> >>>>> +
> >>>>> +static void exynos_mct_set_compensation(unsigned long osc, unsigned long rtc)
> >>>>> +{
> >>>>> +	unsigned int osc_rtc;
> >>>>> +	unsigned int incr_rtcclk;
> >>>>> +	unsigned int compen_val;
> >>>>> +
> >>>>> +	osc_rtc = (unsigned int)(osc * 1000 / rtc);
> >>>>> +
> >>>>> +	/* MCT_INCR_RTCCLK is integer part of (OSCCLK frequency/RTCCLK frequency). */
> >>>>> +	incr_rtcclk = (osc / rtc) + ((osc % rtc) ? 1 : 0);
> >>>>> +
> >>>>> +	/* MCT_COMPENSATE_VALUE is decimal part of (OSCCLK frequency/RTCCLK frequency). */
> >>>>> +	compen_val = ((osc_rtc + 5) / 10) % 100;
> >>>>> +	if (compen_val)
> >>>>> +		compen_val = 100 - compen_val;
> >>>>> +
> >>>>> +	pr_info("MCT: osc-%lu rtc-%lu incr_rtcclk:0x%08x compen_val:0x%08x\n",
> >>>>> +		osc, rtc, incr_rtcclk, compen_val);
> >>>>> +
> >>>>> +	writel_relaxed(incr_rtcclk, reg_base + EXYNOS_MCT_MCT_INCR_RTCCLK);
> >>>>> +	writel_relaxed(compen_val, reg_base + EXYNOS_MCT_COMPENSATE_VALUE);
> >>>>> +}
> >>>>> +
> >>>>> +/* Clocksource handling */
> >>>>> +static void exynos_mct_frc_start(void)
> >>>>> +{
> >>>>> +	writel_relaxed(MCT_FRC_ENABLE, reg_base + EXYNOS_MCT_MCT_FRC_ENABLE);
> >>>>> +}
> >>>>> +
> >>>>> +/**
> >>>>> + * exynos_read_count_32 - Read the lower 32-bits of the global counter
> >>>>> + *
> >>>>> + * This will read just the lower 32-bits of the global counter.
> >>>>> + *
> >>>>> + * Returns the number of cycles in the global counter (lower 32 bits).
> >>>>> + */
> >>>>
> >>>> All this looks like a modification of Exynos MCT driver, so you should
> >>>> extend that one instead. It does not look like we need two drivers.
> >>>> Please integrate it into existing driver instead of sending a new piece
> >>>> of code copied from vendor tree.
> >>>>
> >>> MCT version 2 is a completely different HW IP compared to previous MCT.
> >>> The new MCT has a lot of different resister sets and there are many changes on programming guide.
> >>> So we cannot share the previous code. At first, I also considered that way you mentioned,
> >>> but it would be better to implement the driver seperately to maintain the new driver cleanly.
> >>
> >> We have several drivers supporting different devices and we avoid mostly
> >> duplicating new ones. The different register layout is not the valid
> >> reason - we support differences in several places. Just take a look at
> >> Samsung PMIC drivers where register layout is quite different between
> >> designs. Still one clock driver, one RTC driver and 2-3 regulator
> >> drivers (for ~7 devices).
> >>
> >> Similarly to SoC clock, pinctrl, PMU and other drivers - we re-use
> >> instead of duplicating entire driver.
> >>
> >> I am sorry but the argument that block is different is not enough. What
> >> is exactly not compatible with current driver which could not be modeled
> >> by different driver data (or structure with ops)?
> >>
> > I've checked samsung regulator driver and there are 3 types of driver as you mentioned.
> > They are being maintained separately because they are not compatible each other.
> 
> That's not correct. We integrated 5 separate devices into s2mps11
> regulator driver, around 7 devices into a MFD driver, 4 devices into RTC
> driver and 4 devices into clock driver.
> 
> > 
> > These are comparison of previous MCT and new MCT.
> > * Previous MCT
> >   - 4 Global timer + 8 Local timer
> >   - Clock Source is OSC only
> > 
> > * New MCT
> >   - 1 Free Running Counter + 12 comparators
> 
> One FRC was also in previous MCT, wasn't it? It supported 4 comparators,
> but FRC was only one.
> 
> >   - Clock Sources are OSC and RTC
> >   - Programming guide is totally different comapared to previous MCT.
> 
> Thanks, I got it from the driver. Linux supports handling such
> differences, including differences in register map. In the same time
> just quick look at the code shows several re-used functions.
> 
> > 
> > MCTv2 is totally newly designed for the next Exynos Series.
> > IP design, the way of operating and register configurations are different as well register layout.
> 
> We handle different register layouts without big issue. There are
> several drivers showing this example, for example mentioned earlier
> Samsung PMIC drivers. 4 different register layouts for RTC driver in one
> driver and you mention here that two is some big difference?
> 
> The way of operating could be indeed a trouble but looking at the code
> it is actually very, very similar.
> 
> > It is new generation of Exynos system timer. It's not compatible with the previous MCT.
> > This is the start of implementation for the new MCT driver and we might have a lot of
> > changes for new feature.
> > If we maintain as one driver, everytime we change the new MCT driver we should test
> > all of SoC which doesn't have the new MCT. And vice versa.
> 
> If everyone added a new driver to avoid integrating with existing code,
> we would have huge kernel with thousands of duplicated solutions. The
> kernel also would be unmaintained.
> 
> Such arguments were brought before several times - "I don't want to
> integrating with existing code", "My use case is different", "I would
> need to test the other cases", "It's complicated for me".
> 
> Instead of pushing a new vendor driver you should integrate it with
> existing code.
> 
Let me ask you one question.
If we maintain as one driver, how can people who don't have the new MCT test the new driver?
> Best regards,
> Krzysztof
> 

------cdUjzaOTU1RPrvxdiax6HhSlBq1jqBVFQM-mWLfQP3CdA8rT=_5b276_
Content-Type: text/plain; charset="utf-8"


------cdUjzaOTU1RPrvxdiax6HhSlBq1jqBVFQM-mWLfQP3CdA8rT=_5b276_--

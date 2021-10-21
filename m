Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4BAC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 08:07:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5ABF460F8F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 08:07:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbhJUIJ0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Oct 2021 04:09:26 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:53984 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbhJUIJY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 04:09:24 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20211021080006epoutp03f994d2f30f8ec3d3f6df3285146c41b5~v-NrePNlz0449904499epoutp03T
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 08:00:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20211021080006epoutp03f994d2f30f8ec3d3f6df3285146c41b5~v-NrePNlz0449904499epoutp03T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634803206;
        bh=VyYwwV7nvg3QXiGib56sQBxkzHlvvbOPce4b0gQKE9E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Io1LZ/s+SMUNHaDsl7Dzcj/jkUe11KU25O/0BEwX8CQz39u69hFxiUxAOQZqYem8r
         BdctYcQqcF994ssRAv2/oR/sb+kIdE0E1Nhjy8qIy7ARWPa2zOhqFVWPZ9xbef/MLa
         uZJCf5Q3WW9uQd/GPba6E0fgsgJ/mwq8AlPUkImw=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20211021080006epcas2p2d9fd3d3e032d8f929209455b905984be~v-Nq4ErJx0089800898epcas2p2P;
        Thu, 21 Oct 2021 08:00:06 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.99]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4HZfyy08Cmz4x9Q9; Thu, 21 Oct
        2021 07:59:54 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        B9.A4.09868.1FD11716; Thu, 21 Oct 2021 16:59:45 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20211021075945epcas2p3bbc1a5645296bc1e4e026f2a3c38403e~v-NXdb4p63205532055epcas2p3W;
        Thu, 21 Oct 2021 07:59:45 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211021075945epsmtrp1ade2c37e423f68c169c3506b9986330b~v-NXcm1YO0084000840epsmtrp1F;
        Thu, 21 Oct 2021 07:59:45 +0000 (GMT)
X-AuditID: b6c32a45-9b9ff7000000268c-96-61711df1ebf3
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        C2.A7.08738.1FD11716; Thu, 21 Oct 2021 16:59:45 +0900 (KST)
Received: from perf (unknown [12.36.155.123]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20211021075944epsmtip1a127c2b70b3649934aa78054e386ef38~v-NXPFtg50409004090epsmtip10;
        Thu, 21 Oct 2021 07:59:44 +0000 (GMT)
Date:   Thu, 21 Oct 2021 17:26:50 +0900
From:   Youngmin Nam <youngmin.nam@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com
Subject: Re: [PATCH v1 1/2] clocksource/drivers/exynos_mct_v2: introduce
 Exynos MCT version 2 driver for next Exynos SoC
Message-ID: <20211021082650.GA30741@perf>
MIME-Version: 1.0
In-Reply-To: <0c5dcdab-7aa3-a98f-e615-acbe98489935@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLJsWRmVeSWpSXmKPExsWy7bCmhe5H2cJEg7l92hbzPstaNO2/xGxx
        fO1rVouNb38wWWx6fI3V4vKuOWwWM87vY7JY/HgFk8W/3oOMFps3TWV24PKY1dDL5nHn2h42
        j3fnzrF7bF5S79G3ZRWjx+dNcgFsUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW
        5koKeYm5qbZKLj4Bum6ZOUCHKSmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIKzAv0
        ihNzi0vz0vXyUkusDA0MjEyBChOyM7Y2vmMtuN/GWHFmwwWmBsZTOV2MnBwSAiYSu14dZ+1i
        5OIQEtjBKPF9cic7hPOJUeLDnl4o5zOjRPP9n8wwLdNX3oBK7GKUeNx9gw3CecQocWFvGyNI
        FYuAqkTDr4PsIDabgK7EthP/wOIiAtYSR7fOZwZpYBb4xyjRMHUNE0hCWKBK4trTBWwgNq+A
        psTvh/tZIGxBiZMzn4DZnAKOEqeWXwM7Q1RAWeLAtuNMIIMkBOZySPzd0wx1n4vE6v0vmSBs
        YYlXx7ewQ9hSEi/726DseonF25YyQzRPYJSYv+kDVMJYYtazdrBTmQUyJO7M3g90EQdQXFni
        yC0WiDCfRMfhv+wQYV6JjjYhiE41iV9TNjBC2DISuxevgDrHQ2LXloOMkBD6wyjx/uV6tgmM
        8rOQ/DYLyTYIW0diwe5PQDYHkC0tsfwfB4SpKbF+l/4CRtZVjGKpBcW56anFRgWG8AhPzs/d
        xAhOt1quOxgnv/2gd4iRiYPxEKMEB7OSCO/uivxEId6UxMqq1KL8+KLSnNTiQ4ymwJiayCwl
        mpwPTPh5JfGGJpYGJmZmhuZGpgbmSuK8lqLZiUIC6YklqdmpqQWpRTB9TBycUg1MtQFJl4Rd
        Vb2X/vqTUrPrh3lZ5clrFry9tmej15sy++x40lYR5Tw5L/H086io32rXq3xCGl132M2MEVs7
        L5V3F6/Ro6eMwTItHBprjNOfLGAr2Jmtm/PAwOTd9Jk/FT11WO//iT9rW1B/mOn+27D3/you
        Ta/ZyfG1wOCg98Oz57559Fo95VP8y/Jlw9atersaj5zk9nVaVLls7qNdvqvF5TQ/fcnI3Hxz
        6xOGX+fv8xz++cB2olVxjUd1082azfJzzu7SYHNY5vbsLEukV/OHiqAnAv9WPHMtShbgSn+7
        +mP9Arb9ar5MH7n87q+7fWOr0r2a5/ekK3j/G2z58dp8rXmbeiZXYviJCSz/31rfUmIpzkg0
        1GIuKk4EAPL+5K1ABAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRmVeSWpSXmKPExsWy7bCSnO5H2cJEg9ZHrBbzPstaNO2/xGxx
        fO1rVouNb38wWWx6fI3V4vKuOWwWM87vY7JY/HgFk8W/3oOMFps3TWV24PKY1dDL5nHn2h42
        j3fnzrF7bF5S79G3ZRWjx+dNcgFsUVw2Kak5mWWpRfp2CVwZy6+cYymY38JYMafpPmMD4+Ks
        LkZODgkBE4npK2+wdzFycQgJ7GCU2LewhREiISNxe+VlVghbWOJ+yxFWiKIHjBJ3j7WDFbEI
        qEo0/DrIDmKzCehKbDvxDywuImAtcXTrfGaQBmaBBiaJA1dmgiWEBaokrj1dwAZi8wpoSvx+
        uJ8FYuofRomFFy4xQiQEJU7OfMICYjMLaEnc+PeSqYuRA8iWllj+jwMkzCngKHFq+TVmEFtU
        QFniwLbjTBMYBWch6Z6FpHsWQvcCRuZVjJKpBcW56bnFhgVGeanlesWJucWleel6yfm5mxjB
        0aKltYNxz6oPeocYmTgYDzFKcDArifDurshPFOJNSaysSi3Kjy8qzUktPsQozcGiJM57oetk
        vJBAemJJanZqakFqEUyWiYNTqoFph5MiJ7+B0/3swnSW2zp7Rf5+PdCnzMqpeS+J++zOAFXr
        fSVnZ0y+q/wtJ4+vbH1YmGuR4ldf5UNOnHGrVzyNPrgrRnpuQ8Lkmh1Pzil8CZN+btkTZnbx
        2tVym9SF6SulbvyKVipLuLNDPK5fpjkmrn6CgMbxwkwOPa/VsxJCXCQCqx+y125V10x7Put2
        am3kU91Tl7hehd0+vOzv4zPionpPPTrnlzJ/5j28d8kJXWYF5kK3QCbeZUKvolRu/lu74EDc
        1pKqD2V2Zb3xJpM5GW/zNq22zEtY9e7u5kvbqxgfGk/+KnSqLJY1eK7DjX1rmJf6XJP+6jBV
        5HKFQ7n6K6Xk0/dzk/7VBp0XZVZiKc5INNRiLipOBABqEuIdBQMAAA==
X-CMS-MailID: 20211021075945epcas2p3bbc1a5645296bc1e4e026f2a3c38403e
X-Msg-Generator: CA
Content-Type: multipart/mixed;
        boundary="----TI73IYgzdP03rYJ9SiN0qM3o3mlayfAqXHuFFMbUzbY.6Ea-=_3116b_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211021055112epcas2p278145beb21cd6cc4217813a41c1e1407
References: <20211021061804.39118-1-youngmin.nam@samsung.com>
        <CGME20211021055112epcas2p278145beb21cd6cc4217813a41c1e1407@epcas2p2.samsung.com>
        <20211021061804.39118-2-youngmin.nam@samsung.com>
        <0c5dcdab-7aa3-a98f-e615-acbe98489935@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

------TI73IYgzdP03rYJ9SiN0qM3o3mlayfAqXHuFFMbUzbY.6Ea-=_3116b_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Oct 21, 2021 at 08:18:36AM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2021 08:18, Youngmin Nam wrote:
> > Exynos MCT version 2 is composed of 1 FRC and 12 comparators.
> > The 12 comparators can produces interrupts independently,
> > so they can be used as local timer of each CPU.
> > 
> > Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> > ---
> >  drivers/clocksource/Kconfig         |   6 +
> >  drivers/clocksource/Makefile        |   1 +
> >  drivers/clocksource/exynos_mct_v2.c | 336 ++++++++++++++++++++++++++++
> >  drivers/clocksource/exynos_mct_v2.h |  74 ++++++
> >  4 files changed, 417 insertions(+)
> >  create mode 100644 drivers/clocksource/exynos_mct_v2.c
> >  create mode 100644 drivers/clocksource/exynos_mct_v2.h
> > 
> > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> > index 0f5e3983951a..8ac04dd7f713 100644
> > --- a/drivers/clocksource/Kconfig
> > +++ b/drivers/clocksource/Kconfig
> > @@ -421,6 +421,12 @@ config CLKSRC_EXYNOS_MCT
> >  	help
> >  	  Support for Multi Core Timer controller on Exynos SoCs.
> >  
> > +config CLKSRC_EXYNOS_MCT_V2
> > +	bool "Exynos multi core timer (ver 2) driver" if COMPILE_TEST
> > +	depends on ARM64
> 
> depends on ARCH_EXYNOS.
> 
Okay
> > +	help
> > +	  Support for Multi Core Timer controller on Exynos SoCs.
> > +
> >  config CLKSRC_SAMSUNG_PWM
> >  	bool "PWM timer driver for Samsung S3C, S5P" if COMPILE_TEST
> >  	depends on HAS_IOMEM
> > diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> > index c17ee32a7151..dc7d5cf27516 100644
> > --- a/drivers/clocksource/Makefile
> > +++ b/drivers/clocksource/Makefile
> > @@ -43,6 +43,7 @@ obj-$(CONFIG_CADENCE_TTC_TIMER)	+= timer-cadence-ttc.o
> >  obj-$(CONFIG_CLKSRC_STM32)	+= timer-stm32.o
> >  obj-$(CONFIG_CLKSRC_STM32_LP)	+= timer-stm32-lp.o
> >  obj-$(CONFIG_CLKSRC_EXYNOS_MCT)	+= exynos_mct.o
> > +obj-$(CONFIG_CLKSRC_EXYNOS_MCT_V2)	+= exynos_mct_v2.o
> >  obj-$(CONFIG_CLKSRC_LPC32XX)	+= timer-lpc32xx.o
> >  obj-$(CONFIG_CLKSRC_MPS2)	+= mps2-timer.o
> >  obj-$(CONFIG_CLKSRC_SAMSUNG_PWM)	+= samsung_pwm_timer.o
> > diff --git a/drivers/clocksource/exynos_mct_v2.c b/drivers/clocksource/exynos_mct_v2.c
> > new file mode 100644
> > index 000000000000..2da6d5401629
> > --- /dev/null
> > +++ b/drivers/clocksource/exynos_mct_v2.c
> > @@ -0,0 +1,336 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2022 Samsung Electronics Co., Ltd.
> > + *		http://www.samsung.com
> > + *
> > + * Exynos MCT(Multi-Core Timer) version 2 support
> > + */
> > +
> > +#include <linux/interrupt.h>
> > +#include <linux/irq.h>
> > +#include <linux/err.h>
> > +#include <linux/clk.h>
> > +#include <linux/clockchips.h>
> > +#include <linux/cpu.h>
> > +#include <linux/delay.h>
> > +#include <linux/percpu.h>
> > +#include <linux/of.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/of_address.h>
> > +#include <linux/clocksource.h>
> > +#include "exynos_mct_v2.h"
> > +
> > +static void __iomem *reg_base;
> > +static unsigned long osc_clk_rate;
> > +static int mct_irqs[MCT_NR_COMPS];
> > +
> > +static void exynos_mct_set_compensation(unsigned long osc, unsigned long rtc)
> > +{
> > +	unsigned int osc_rtc;
> > +	unsigned int incr_rtcclk;
> > +	unsigned int compen_val;
> > +
> > +	osc_rtc = (unsigned int)(osc * 1000 / rtc);
> > +
> > +	/* MCT_INCR_RTCCLK is integer part of (OSCCLK frequency/RTCCLK frequency). */
> > +	incr_rtcclk = (osc / rtc) + ((osc % rtc) ? 1 : 0);
> > +
> > +	/* MCT_COMPENSATE_VALUE is decimal part of (OSCCLK frequency/RTCCLK frequency). */
> > +	compen_val = ((osc_rtc + 5) / 10) % 100;
> > +	if (compen_val)
> > +		compen_val = 100 - compen_val;
> > +
> > +	pr_info("MCT: osc-%lu rtc-%lu incr_rtcclk:0x%08x compen_val:0x%08x\n",
> > +		osc, rtc, incr_rtcclk, compen_val);
> > +
> > +	writel_relaxed(incr_rtcclk, reg_base + EXYNOS_MCT_MCT_INCR_RTCCLK);
> > +	writel_relaxed(compen_val, reg_base + EXYNOS_MCT_COMPENSATE_VALUE);
> > +}
> > +
> > +/* Clocksource handling */
> > +static void exynos_mct_frc_start(void)
> > +{
> > +	writel_relaxed(MCT_FRC_ENABLE, reg_base + EXYNOS_MCT_MCT_FRC_ENABLE);
> > +}
> > +
> > +/**
> > + * exynos_read_count_32 - Read the lower 32-bits of the global counter
> > + *
> > + * This will read just the lower 32-bits of the global counter.
> > + *
> > + * Returns the number of cycles in the global counter (lower 32 bits).
> > + */
> 
> All this looks like a modification of Exynos MCT driver, so you should
> extend that one instead. It does not look like we need two drivers.
> Please integrate it into existing driver instead of sending a new piece
> of code copied from vendor tree.
> 
MCT version 2 is a completely different HW IP compared to previous MCT.
The new MCT has a lot of different resister sets and there are many changes on programming guide.
So we cannot share the previous code. At first, I also considered that way you mentioned,
but it would be better to implement the driver seperately to maintain the new driver cleanly.
> > +static u32 exynos_read_count_32(void)
> > +{
> > +	return readl_relaxed(reg_base + EXYNOS_MCT_CNT_L);
> > +}
> > +
> > +static u64 exynos_frc_read(struct clocksource *cs)
> > +{
> > +	return exynos_read_count_32();
> > +}
> > +
> > +static struct clocksource mct_frc = {
> > +	.name		= "mct-frc",
> > +	.rating		= 350,	/* use value lower than ARM arch timer */
> > +	.read		= exynos_frc_read,
> > +	.mask		= CLOCKSOURCE_MASK(32),
> > +	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
> > +};
> > +
> > +static int __init exynos_clocksource_init(void)
> > +{
> > +	if (clocksource_register_hz(&mct_frc, osc_clk_rate))
> > +		panic("%s: can't register clocksource\n", mct_frc.name);
> > +
> > +	return 0;
> > +}
> > +
> > +static void exynos_mct_comp_stop(struct mct_clock_event_device *mevt)
> > +{
> > +	unsigned int index = mevt->comp_index;
> > +	unsigned int comp_enable;
> > +	unsigned int loop_cnt = 0;
> > +
> > +	writel_relaxed(MCT_COMP_DISABLE, reg_base + EXYNOS_MCT_COMP_ENABLE(index));
> > +
> > +	/* Wait maximum 1 ms until COMP_ENABLE_n = 0 */
> > +	do {
> > +		comp_enable = readl_relaxed(reg_base + EXYNOS_MCT_COMP_ENABLE(index));
> > +		loop_cnt++;
> > +	} while (comp_enable != MCT_COMP_DISABLE && loop_cnt < WAIT_LOOP_CNT);
> > +
> > +	if (loop_cnt == WAIT_LOOP_CNT)
> > +		panic("MCT(comp%d) disable timeout\n", index);
> > +
> > +	writel_relaxed(MCT_COMP_NON_CIRCULAR_MODE, reg_base + EXYNOS_MCT_COMP_MODE(index));
> > +	writel_relaxed(MCT_INT_DISABLE, reg_base + EXYNOS_MCT_INT_ENB(index));
> > +	writel_relaxed(MCT_CSTAT_CLEAR, reg_base + EXYNOS_MCT_INT_CSTAT(index));
> > +}
> > +
> > +static void exynos_mct_comp_start(struct mct_clock_event_device *mevt,
> > +				  bool periodic, unsigned long cycles)
> > +{
> > +	unsigned int index = mevt->comp_index;
> > +	unsigned int comp_enable;
> > +	unsigned int loop_cnt = 0;
> > +
> > +	comp_enable = readl_relaxed(reg_base + EXYNOS_MCT_COMP_ENABLE(index));
> > +	if (comp_enable == MCT_COMP_ENABLE)
> > +		exynos_mct_comp_stop(mevt);
> > +
> > +	if (periodic)
> > +		writel_relaxed(MCT_COMP_CIRCULAR_MODE, reg_base + EXYNOS_MCT_COMP_MODE(index));
> > +
> > +	writel_relaxed(cycles, reg_base + EXYNOS_MCT_COMP_PERIOD(index));
> > +	writel_relaxed(MCT_INT_ENABLE, reg_base + EXYNOS_MCT_INT_ENB(index));
> > +	writel_relaxed(MCT_COMP_ENABLE, reg_base + EXYNOS_MCT_COMP_ENABLE(index));
> > +
> > +	/* Wait maximum 1 ms until COMP_ENABLE_n = 1 */
> > +	do {
> > +		comp_enable = readl_relaxed(reg_base + EXYNOS_MCT_COMP_ENABLE(index));
> > +		loop_cnt++;
> > +	} while (comp_enable != MCT_COMP_ENABLE && loop_cnt < WAIT_LOOP_CNT);
> > +
> > +	if (loop_cnt == WAIT_LOOP_CNT)
> > +		panic("MCT(comp%d) enable timeout\n", index);
> > +}
> > +
> > +static int exynos_comp_set_next_event(unsigned long cycles, struct clock_event_device *evt)
> > +{
> > +	struct mct_clock_event_device *mevt;
> > +
> > +	mevt = container_of(evt, struct mct_clock_event_device, evt);
> > +
> > +	exynos_mct_comp_start(mevt, false, cycles);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mct_set_state_shutdown(struct clock_event_device *evt)
> > +{
> > +	struct mct_clock_event_device *mevt;
> > +
> > +	mevt = container_of(evt, struct mct_clock_event_device, evt);
> > +
> > +	exynos_mct_comp_stop(mevt);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mct_set_state_periodic(struct clock_event_device *evt)
> > +{
> > +	unsigned long cycles_per_jiffy;
> > +	struct mct_clock_event_device *mevt;
> > +
> > +	mevt = container_of(evt, struct mct_clock_event_device, evt);
> > +
> > +	cycles_per_jiffy = (((unsigned long long)NSEC_PER_SEC / HZ * evt->mult) >> evt->shift);
> > +	exynos_mct_comp_start(mevt, true, cycles_per_jiffy);
> > +
> > +	return 0;
> > +}
> > +
> > +static irqreturn_t exynos_mct_comp_isr(int irq, void *dev_id)
> > +{
> > +	struct mct_clock_event_device *mevt = dev_id;
> > +	struct clock_event_device *evt = &mevt->evt;
> > +	unsigned int index = mevt->comp_index;
> > +
> > +	writel_relaxed(MCT_CSTAT_CLEAR, reg_base + EXYNOS_MCT_INT_CSTAT(index));
> > +
> > +	evt->event_handler(evt);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static DEFINE_PER_CPU(struct mct_clock_event_device, percpu_mct_tick);
> > +
> > +static int exynos_mct_starting_cpu(unsigned int cpu)
> > +{
> > +	struct mct_clock_event_device *mevt = per_cpu_ptr(&percpu_mct_tick, cpu);
> > +	struct clock_event_device *evt = &mevt->evt;
> > +
> > +	snprintf(mevt->name, sizeof(mevt->name), "mct_comp%d", cpu);
> > +
> > +	evt->name = mevt->name;
> > +	evt->cpumask = cpumask_of(cpu);
> > +	evt->set_next_event = exynos_comp_set_next_event;
> > +	evt->set_state_periodic = mct_set_state_periodic;
> > +	evt->set_state_shutdown = mct_set_state_shutdown;
> > +	evt->set_state_oneshot = mct_set_state_shutdown;
> > +	evt->set_state_oneshot_stopped = mct_set_state_shutdown;
> > +	evt->tick_resume = mct_set_state_shutdown;
> > +	evt->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
> > +	evt->rating = 500;	/* use value higher than ARM arch timer */
> > +
> > +	if (evt->irq == -1)
> > +		return -EIO;
> > +
> > +	irq_force_affinity(evt->irq, cpumask_of(cpu));
> > +	enable_irq(evt->irq);
> > +	clockevents_config_and_register(evt, osc_clk_rate, 0xf, 0x7fffffff);
> > +
> > +	return 0;
> > +}
> > +
> > +static int exynos_mct_dying_cpu(unsigned int cpu)
> > +{
> > +	struct mct_clock_event_device *mevt = per_cpu_ptr(&percpu_mct_tick, cpu);
> > +	struct clock_event_device *evt = &mevt->evt;
> > +	unsigned int index = mevt->comp_index;
> > +
> > +	evt->set_state_shutdown(evt);
> > +	if (evt->irq != -1)
> > +		disable_irq_nosync(evt->irq);
> > +
> > +	writel_relaxed(MCT_CSTAT_CLEAR, reg_base + EXYNOS_MCT_INT_CSTAT(index));
> > +
> > +	return 0;
> > +}
> > +
> > +static int __init exynos_timer_resources(struct device_node *np, void __iomem *base)
> > +{
> > +	int err, cpu;
> > +
> > +	struct clk *mct_clk, *tick_clk,  *rtc_clk;
> > +	unsigned long rtc_clk_rate;
> > +	int div;
> > +	int ret;
> > +
> > +	ret = of_property_read_u32(np, "div", &div);
> > +	if (ret || !div) {
> > +		pr_warn("MCT: fail to get the div value. set div to the default\n");
> > +		div = DEFAULT_CLK_DIV;
> > +	}
> > +
> > +	tick_clk = of_clk_get_by_name(np, "fin_pll");
> > +	if (IS_ERR(tick_clk))
> > +		panic("%s: unable to determine tick clock rate\n", __func__);
> > +	osc_clk_rate = clk_get_rate(tick_clk) / div;
> > +
> > +	mct_clk = of_clk_get_by_name(np, "mct");
> > +	if (IS_ERR(mct_clk))
> > +		panic("%s: unable to retrieve mct clock instance\n", __func__);
> > +	clk_prepare_enable(mct_clk);
> > +
> > +	rtc_clk = of_clk_get_by_name(np, "rtc");
> 
> Why timer needs a RTC clock?
> 
On the new MCT, RTC clock can be used as backup clock instead of OSC clock.
> > +	if (IS_ERR(rtc_clk)) {
> > +		pr_warn("MCT: fail to get rtc clock. set to the default\n");
> > +		rtc_clk_rate = DEFAULT_RTC_CLK_RATE;
> > +	} else {
> > +		rtc_clk_rate = clk_get_rate(rtc_clk);
> > +	}
> > +
> > +	reg_base = base;
> > +	if (!reg_base)
> > +		panic("%s: unable to ioremap mct address space\n", __func__);
> > +
> > +	exynos_mct_set_compensation(osc_clk_rate, rtc_clk_rate);
> > +	exynos_mct_frc_start();
> > +
> > +	for_each_possible_cpu(cpu) {
> > +		int mct_irq = mct_irqs[cpu];
> > +		struct mct_clock_event_device *pcpu_mevt = per_cpu_ptr(&percpu_mct_tick, cpu);
> > +
> > +		pcpu_mevt->evt.irq = -1;
> > +		pcpu_mevt->comp_index = cpu;
> > +
> > +		irq_set_status_flags(mct_irq, IRQ_NOAUTOEN);
> > +		if (request_irq(mct_irq,
> > +				exynos_mct_comp_isr,
> > +				IRQF_TIMER | IRQF_NOBALANCING | IRQF_PERCPU,
> > +				"exynos-mct", pcpu_mevt)) {
> > +			pr_err("exynos-mct: cannot register IRQ (cpu%d)\n", cpu);
> > +			continue;
> > +		}
> > +		pcpu_mevt->evt.irq = mct_irq;
> > +	}
> > +
> > +	/* Install hotplug callbacks which configure the timer on this CPU */
> > +	err = cpuhp_setup_state(CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING,
> > +				"clockevents/exynos/mct_timer_v2:starting",
> > +				exynos_mct_starting_cpu,
> > +				exynos_mct_dying_cpu);
> > +	if (err)
> > +		goto out_irq;
> > +
> > +	return 0;
> > +
> > +out_irq:
> > +	for_each_possible_cpu(cpu) {
> > +		struct mct_clock_event_device *pcpu_mevt = per_cpu_ptr(&percpu_mct_tick, cpu);
> > +
> > +		if (pcpu_mevt->evt.irq != -1) {
> > +			free_irq(pcpu_mevt->evt.irq, pcpu_mevt);
> > +			pcpu_mevt->evt.irq = -1;
> > +		}
> > +	}
> > +	return err;
> > +}
> > +
> > +static int __init mct_init_dt(struct device_node *np)
> > +{
> > +	u32 nr_irqs = 0, i;
> > +	int ret;
> > +
> > +	/*
> > +	 * Find out the total number of irqs which can be produced by comparators.
> > +	 */
> > +	nr_irqs = of_irq_count(np);
> > +
> > +	for (i = MCT_COMP0; i < nr_irqs; i++)
> > +		mct_irqs[i] = irq_of_parse_and_map(np, i);
> > +
> > +	pr_info("## exynos_timer_resources\n");
> 
> Not a Linux kernel style of debug message.
> 
Okay
> > +	ret = exynos_timer_resources(np, of_iomap(np, 0));
> > +	if (ret)
> > +		return ret;
> > +
> > +	pr_info("## exynos_clocksource_init\n");
> > +	ret = exynos_clocksource_init();
> > +
> > +	return ret;
> > +}
> > +
> > +TIMER_OF_DECLARE(s5e99xx, "samsung,s5e99xx-mct", mct_init_dt);
> > diff --git a/drivers/clocksource/exynos_mct_v2.h b/drivers/clocksource/exynos_mct_v2.h
> > new file mode 100644
> > index 000000000000..377421803bbe
> > --- /dev/null
> > +++ b/drivers/clocksource/exynos_mct_v2.h
> > @@ -0,0 +1,74 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/**
> > + * exynos_mct_v2.h - Samsung Exynos MCT(Multi-Core Timer) Driver Header file
> > + *
> > + * Copyright (C) 2021 Samsung Electronics Co., Ltd.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> 
> No need for license text.
> 
Okay
> > + */
> > +
> > +#ifndef __EXYNOS_MCT_V2_H__
> > +#define __EXYNOS_MCT_V2_H__
> > +
> > +#define EXYNOS_MCTREG(x)		(x)
> > +#define EXYNOS_MCT_MCT_CFG		EXYNOS_MCTREG(0x000)
> > +#define EXYNOS_MCT_MCT_INCR_RTCCLK	EXYNOS_MCTREG(0x004)
> > +#define EXYNOS_MCT_MCT_FRC_ENABLE	EXYNOS_MCTREG(0x100)
> > +#define EXYNOS_MCT_CNT_L		EXYNOS_MCTREG(0x110)
> > +#define EXYNOS_MCT_CNT_U		EXYNOS_MCTREG(0x114)
> > +#define EXYNOS_MCT_CLKMUX_SEL		EXYNOS_MCTREG(0x120)
> > +#define EXYNOS_MCT_COMPENSATE_VALUE	EXYNOS_MCTREG(0x124)
> > +#define EXYNOS_MCT_VER			EXYNOS_MCTREG(0x128)
> > +#define EXYNOS_MCT_DIVCHG_ACK		EXYNOS_MCTREG(0x12C)
> > +#define EXYNOS_MCT_COMP_L(i)		EXYNOS_MCTREG(0x200 + ((i) * 0x100))
> > +#define EXYNOS_MCT_COMP_U(i)		EXYNOS_MCTREG(0x204 + ((i) * 0x100))
> > +#define EXYNOS_MCT_COMP_MODE(i)		EXYNOS_MCTREG(0x208 + ((i) * 0x100))
> > +#define EXYNOS_MCT_COMP_PERIOD(i)	EXYNOS_MCTREG(0x20C + ((i) * 0x100))
> > +#define EXYNOS_MCT_COMP_ENABLE(i)	EXYNOS_MCTREG(0x210 + ((i) * 0x100))
> > +#define EXYNOS_MCT_INT_ENB(i)		EXYNOS_MCTREG(0x214 + ((i) * 0x100))
> > +#define EXYNOS_MCT_INT_CSTAT(i)		EXYNOS_MCTREG(0x218 + ((i) * 0x100))
> > +
> > +#define MCT_FRC_ENABLE			(0x1)
> > +#define MCT_COMP_ENABLE			(0x1)
> > +#define MCT_COMP_DISABLE		(0x0)
> > +
> > +#define MCT_COMP_CIRCULAR_MODE		(0x1)
> > +#define MCT_COMP_NON_CIRCULAR_MODE	(0x0)
> > +
> > +#define MCT_INT_ENABLE			(0x1)
> > +#define MCT_INT_DISABLE			(0x0)
> > +
> > +#define MCT_CSTAT_CLEAR			(0x1)
> > +
> > +#define DEFAULT_RTC_CLK_RATE		32768 // 32.768Khz
> > +#define DEFAULT_CLK_DIV			3     // 1/3
> 
> Such comments are not useful.
> 
Okay
> Best regards,
> Krzysztof
> 

------TI73IYgzdP03rYJ9SiN0qM3o3mlayfAqXHuFFMbUzbY.6Ea-=_3116b_
Content-Type: text/plain; charset="utf-8"


------TI73IYgzdP03rYJ9SiN0qM3o3mlayfAqXHuFFMbUzbY.6Ea-=_3116b_--

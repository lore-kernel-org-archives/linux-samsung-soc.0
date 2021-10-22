Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8DAC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Oct 2021 03:54:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33854610CF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Oct 2021 03:54:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232294AbhJVD4q (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Oct 2021 23:56:46 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:31585 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232133AbhJVD4p (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 23:56:45 -0400
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20211022035425epoutp0217a879bb4d2f7ab574410c175c314c6c~wPgccroxE0477804778epoutp02f
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Oct 2021 03:54:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20211022035425epoutp0217a879bb4d2f7ab574410c175c314c6c~wPgccroxE0477804778epoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634874865;
        bh=Il8/EGNPo7pTGQ0DjyUgU2OtvsR0M9o/uUthvBpwkoA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qzcttnaeHHEpMwvxs7KLj4e1z6iNRT0mMIZyC9ufQt06SpHnEPLDtpkha1eY3odNh
         TCZbe8KJRJ1skTpQFOoxpnY1e63yaDmn3d2vAadQTfTwmyJqIu+Owo2Jjq2ONozbQs
         /EomLdi2UZ9nKiJ35Wqyvs7cqIUQC4p2wwiKYnrU=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20211022035424epcas2p41a60ce493e67dc0f3407eeff726a6057~wPgb8R1B22289022890epcas2p4r;
        Fri, 22 Oct 2021 03:54:24 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.97]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4Hb9T85JWRz4x9Ps; Fri, 22 Oct
        2021 03:54:20 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        16.40.09868.8E532716; Fri, 22 Oct 2021 12:54:16 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20211022035416epcas2p16bbe32f51ba478273d45d7615b39f906~wPgUeiBry0881808818epcas2p1v;
        Fri, 22 Oct 2021 03:54:16 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211022035416epsmtrp2d0f3a98ddc7f7c98835533ca91187728~wPgUdzJfx2845328453epsmtrp2t;
        Fri, 22 Oct 2021 03:54:16 +0000 (GMT)
X-AuditID: b6c32a45-9b9ff7000000268c-26-617235e823ba
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        5E.4E.08902.8E532716; Fri, 22 Oct 2021 12:54:16 +0900 (KST)
Received: from perf (unknown [12.36.155.123]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20211022035416epsmtip14519148db2922204042bcd25e4b5f2e9~wPgUPy_IH0761407614epsmtip1n;
        Fri, 22 Oct 2021 03:54:16 +0000 (GMT)
Date:   Fri, 22 Oct 2021 13:21:22 +0900
From:   Youngmin Nam <youngmin.nam@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com
Subject: Re: [PATCH v1 1/2] clocksource/drivers/exynos_mct_v2: introduce
 Exynos MCT version 2 driver for next Exynos SoC
Message-ID: <20211022042116.GA30645@perf>
MIME-Version: 1.0
In-Reply-To: <1b93aaf3-ed64-b105-dec4-07b6f27b385b@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJJsWRmVeSWpSXmKPExsWy7bCmme4L06JEg4/3TS3mfZa1aNp/idni
        +NrXrBYb3/5gstj0+BqrxeVdc9gsZpzfx2Sx+PEKJot/vQcZLTZvmsrswOUxq6GXzePOtT1s
        Hu/OnWP32Lyk3qNvyypGj8+b5ALYorJtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1DS0t
        zJUU8hJzU22VXHwCdN0yc4AOU1IoS8wpBQoFJBYXK+nb2RTll5akKmTkF5fYKqUWpOQUmBfo
        FSfmFpfmpevlpZZYGRoYGJkCFSZkZ2xY8JmpYK51Re/hU6wNjMsMuhg5OSQETCSWn7vA3MXI
        xSEksINR4t7HI+wQzidGiWVLtkM53xglnu3fwQLT0rhpIpgtJLCXUWLqcS0I+xGjxII9RSA2
        i4CqxImTz9lBbDYBXYltJ/4xgtgiAtYSR7fOB1vHLPCPUaJh6homkISwQJXEtacL2EBsXgFN
        iR83JzJC2IISJ2c+AVvGKeAosWT3D1YQW1RAWeLAtuNMIIMkBGZySHx5thaoiAPIcZE4/ocP
        4lBhiVfHt7BD2FISn9/tZYOw6yUWb1vKDNE7gVFi/qYPUEXGErOetYMtZhbIkDhw+BIjxExl
        iSO3WCDCfBIdh/+yQ4R5JTrahCA61SR+TdnACGHLSOxevIIZwvaQ2LXlICMkEC8zSbyc+5t9
        AqP8LCSvzUKyDcLWkViw+xPbLKAVzALSEsv/cUCYmhLrd+kvYGRdxSiWWlCcm55abFRgCI/s
        5PzcTYzgNKvluoNx8tsPeocYmTgYDzFKcDArifDurshPFOJNSaysSi3Kjy8qzUktPsRoCoyo
        icxSosn5wESfVxJvaGJpYGJmZmhuZGpgriTOaymanSgkkJ5YkpqdmlqQWgTTx8TBKdXAtNrs
        Y/hUvYQdUzibVolwNy/Mvf/7bT5DgF+AkIAWp583X/z2d3eOVsdeVT/KdeXwEdfAKf6ht/7m
        rWp9o/Qn4EbivgVTD01Y/YNFoX/Djad6wj6bXlhMlWBVTDZbuThnxYwnLOEr2fTm7d7O7HFB
        LeHbOp6sP8uZmgSW/Tx338dQv+yV+uWJGycffvzSJVRG7N2O++sEeRWz4mcz27e++rRYXlEx
        7O3bZS38J3d+Wn25W1Jt/aQ9cnO3z44zUQp/kie0MpqDTXRiVd2ys0s0Yv+5lqRI1GR0Vl23
        1pZfOtnTqYX30+SK6CMHrxi9esRxYPXa57vPiq2pVzXqffNGeGNL/S4GyQ0fdt92djykuFOJ
        pTgj0VCLuag4EQBzXZniPAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRmVeSWpSXmKPExsWy7bCSnO4L06JEg2UnhSzmfZa1aNp/idni
        +NrXrBYb3/5gstj0+BqrxeVdc9gsZpzfx2Sx+PEKJot/vQcZLTZvmsrswOUxq6GXzePOtT1s
        Hu/OnWP32Lyk3qNvyypGj8+b5ALYorhsUlJzMstSi/TtErgy/k66zVxw16LizbU+xgbG/7pd
        jJwcEgImEo2bJrKA2EICuxklTi/Jg4jLSNxeeZkVwhaWuN9yBMjmAqp5wCjxZe0pJpAEi4Cq
        xImTz9lBbDYBXYltJ/4xgtgiAtYSR7fOZwZpYBZoYJI4cGUmWEJYoEri2tMFbCA2r4CmxI+b
        Exkhpl5mkrj6dBozREJQ4uTMJ2AnMQtoSdz49xJoGweQLS2x/B8HSJhTwFFiye4fYNeJCihL
        HNh2nGkCo+AsJN2zkHTPQuhewMi8ilEytaA4Nz232LDAMC+1XK84Mbe4NC9dLzk/dxMjOFK0
        NHcwbl/1Qe8QIxMH4yFGCQ5mJRHe3RX5iUK8KYmVValF+fFFpTmpxYcYpTlYlMR5L3SdjBcS
        SE8sSc1OTS1ILYLJMnFwSjUwae7Lru4p8NCeUrnNZVKjhIL/xT8L/2/aKP/c52xt2d3T3xyc
        D8sEWAdN/vX6aG73NlPT135ftHo922X4P/g+9/CLWDuxfIq5v1Ut/4cvnPxRL6t5FOKbpE1Z
        C2Jzlq65n3pVl8VT/+2tM+n1ywxPJ21id78UNSf6obiLk9jSiR5N1UYvQo6fnP48W7l/7o7J
        jAKz9R5WCM21UreQlstfIVTjPeOzaIFwzN2isJ2rfBstOdQTNz/PbJ0xWePfnt0yDAtrDeb8
        OKTT/ZOtjqHFa5NN1qqunvdT7kpIPT7aazNTRcLD8ZJdufdbqXVf4z9XV0SF9NQ8Pud9wcjJ
        V5r99eTZQgn/LvSwCXyZ0arEUpyRaKjFXFScCAB1v5uoAwMAAA==
X-CMS-MailID: 20211022035416epcas2p16bbe32f51ba478273d45d7615b39f906
X-Msg-Generator: CA
Content-Type: multipart/mixed;
        boundary="----TI73IYgzdP03rYJ9SiN0qM3o3mlayfAqXHuFFMbUzbY.6Ea-=_3a807_"
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
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

------TI73IYgzdP03rYJ9SiN0qM3o3mlayfAqXHuFFMbUzbY.6Ea-=_3a807_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Oct 21, 2021 at 10:07:25AM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2021 10:26, Youngmin Nam wrote:
> > On Thu, Oct 21, 2021 at 08:18:36AM +0200, Krzysztof Kozlowski wrote:
> >> On 21/10/2021 08:18, Youngmin Nam wrote:
> >>> Exynos MCT version 2 is composed of 1 FRC and 12 comparators.
> >>> The 12 comparators can produces interrupts independently,
> >>> so they can be used as local timer of each CPU.
> >>>
> >>> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> >>> ---
> >>>  drivers/clocksource/Kconfig         |   6 +
> >>>  drivers/clocksource/Makefile        |   1 +
> >>>  drivers/clocksource/exynos_mct_v2.c | 336 ++++++++++++++++++++++++++++
> >>>  drivers/clocksource/exynos_mct_v2.h |  74 ++++++
> >>>  4 files changed, 417 insertions(+)
> >>>  create mode 100644 drivers/clocksource/exynos_mct_v2.c
> >>>  create mode 100644 drivers/clocksource/exynos_mct_v2.h
> >>>
> >>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> >>> index 0f5e3983951a..8ac04dd7f713 100644
> >>> --- a/drivers/clocksource/Kconfig
> >>> +++ b/drivers/clocksource/Kconfig
> >>> @@ -421,6 +421,12 @@ config CLKSRC_EXYNOS_MCT
> >>>  	help
> >>>  	  Support for Multi Core Timer controller on Exynos SoCs.
> >>>  
> >>> +config CLKSRC_EXYNOS_MCT_V2
> >>> +	bool "Exynos multi core timer (ver 2) driver" if COMPILE_TEST
> >>> +	depends on ARM64
> >>
> >> depends on ARCH_EXYNOS.
> >>
> > Okay
> >>> +	help
> >>> +	  Support for Multi Core Timer controller on Exynos SoCs.
> >>> +
> >>>  config CLKSRC_SAMSUNG_PWM
> >>>  	bool "PWM timer driver for Samsung S3C, S5P" if COMPILE_TEST
> >>>  	depends on HAS_IOMEM
> >>> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> >>> index c17ee32a7151..dc7d5cf27516 100644
> >>> --- a/drivers/clocksource/Makefile
> >>> +++ b/drivers/clocksource/Makefile
> >>> @@ -43,6 +43,7 @@ obj-$(CONFIG_CADENCE_TTC_TIMER)	+= timer-cadence-ttc.o
> >>>  obj-$(CONFIG_CLKSRC_STM32)	+= timer-stm32.o
> >>>  obj-$(CONFIG_CLKSRC_STM32_LP)	+= timer-stm32-lp.o
> >>>  obj-$(CONFIG_CLKSRC_EXYNOS_MCT)	+= exynos_mct.o
> >>> +obj-$(CONFIG_CLKSRC_EXYNOS_MCT_V2)	+= exynos_mct_v2.o
> >>>  obj-$(CONFIG_CLKSRC_LPC32XX)	+= timer-lpc32xx.o
> >>>  obj-$(CONFIG_CLKSRC_MPS2)	+= mps2-timer.o
> >>>  obj-$(CONFIG_CLKSRC_SAMSUNG_PWM)	+= samsung_pwm_timer.o
> >>> diff --git a/drivers/clocksource/exynos_mct_v2.c b/drivers/clocksource/exynos_mct_v2.c
> >>> new file mode 100644
> >>> index 000000000000..2da6d5401629
> >>> --- /dev/null
> >>> +++ b/drivers/clocksource/exynos_mct_v2.c
> >>> @@ -0,0 +1,336 @@
> >>> +// SPDX-License-Identifier: GPL-2.0-only
> >>> +/*
> >>> + * Copyright (c) 2022 Samsung Electronics Co., Ltd.
> >>> + *		http://www.samsung.com
> >>> + *
> >>> + * Exynos MCT(Multi-Core Timer) version 2 support
> >>> + */
> >>> +
> >>> +#include <linux/interrupt.h>
> >>> +#include <linux/irq.h>
> >>> +#include <linux/err.h>
> >>> +#include <linux/clk.h>
> >>> +#include <linux/clockchips.h>
> >>> +#include <linux/cpu.h>
> >>> +#include <linux/delay.h>
> >>> +#include <linux/percpu.h>
> >>> +#include <linux/of.h>
> >>> +#include <linux/of_irq.h>
> >>> +#include <linux/of_address.h>
> >>> +#include <linux/clocksource.h>
> >>> +#include "exynos_mct_v2.h"
> >>> +
> >>> +static void __iomem *reg_base;
> >>> +static unsigned long osc_clk_rate;
> >>> +static int mct_irqs[MCT_NR_COMPS];
> >>> +
> >>> +static void exynos_mct_set_compensation(unsigned long osc, unsigned long rtc)
> >>> +{
> >>> +	unsigned int osc_rtc;
> >>> +	unsigned int incr_rtcclk;
> >>> +	unsigned int compen_val;
> >>> +
> >>> +	osc_rtc = (unsigned int)(osc * 1000 / rtc);
> >>> +
> >>> +	/* MCT_INCR_RTCCLK is integer part of (OSCCLK frequency/RTCCLK frequency). */
> >>> +	incr_rtcclk = (osc / rtc) + ((osc % rtc) ? 1 : 0);
> >>> +
> >>> +	/* MCT_COMPENSATE_VALUE is decimal part of (OSCCLK frequency/RTCCLK frequency). */
> >>> +	compen_val = ((osc_rtc + 5) / 10) % 100;
> >>> +	if (compen_val)
> >>> +		compen_val = 100 - compen_val;
> >>> +
> >>> +	pr_info("MCT: osc-%lu rtc-%lu incr_rtcclk:0x%08x compen_val:0x%08x\n",
> >>> +		osc, rtc, incr_rtcclk, compen_val);
> >>> +
> >>> +	writel_relaxed(incr_rtcclk, reg_base + EXYNOS_MCT_MCT_INCR_RTCCLK);
> >>> +	writel_relaxed(compen_val, reg_base + EXYNOS_MCT_COMPENSATE_VALUE);
> >>> +}
> >>> +
> >>> +/* Clocksource handling */
> >>> +static void exynos_mct_frc_start(void)
> >>> +{
> >>> +	writel_relaxed(MCT_FRC_ENABLE, reg_base + EXYNOS_MCT_MCT_FRC_ENABLE);
> >>> +}
> >>> +
> >>> +/**
> >>> + * exynos_read_count_32 - Read the lower 32-bits of the global counter
> >>> + *
> >>> + * This will read just the lower 32-bits of the global counter.
> >>> + *
> >>> + * Returns the number of cycles in the global counter (lower 32 bits).
> >>> + */
> >>
> >> All this looks like a modification of Exynos MCT driver, so you should
> >> extend that one instead. It does not look like we need two drivers.
> >> Please integrate it into existing driver instead of sending a new piece
> >> of code copied from vendor tree.
> >>
> > MCT version 2 is a completely different HW IP compared to previous MCT.
> > The new MCT has a lot of different resister sets and there are many changes on programming guide.
> > So we cannot share the previous code. At first, I also considered that way you mentioned,
> > but it would be better to implement the driver seperately to maintain the new driver cleanly.
> 
> We have several drivers supporting different devices and we avoid mostly
> duplicating new ones. The different register layout is not the valid
> reason - we support differences in several places. Just take a look at
> Samsung PMIC drivers where register layout is quite different between
> designs. Still one clock driver, one RTC driver and 2-3 regulator
> drivers (for ~7 devices).
> 
> Similarly to SoC clock, pinctrl, PMU and other drivers - we re-use
> instead of duplicating entire driver.
> 
> I am sorry but the argument that block is different is not enough. What
> is exactly not compatible with current driver which could not be modeled
> by different driver data (or structure with ops)?
> 
I've checked samsung regulator driver and there are 3 types of driver as you mentioned.
They are being maintained separately because they are not compatible each other.

These are comparison of previous MCT and new MCT.
* Previous MCT
  - 4 Global timer + 8 Local timer
  - Clock Source is OSC only

* New MCT
  - 1 Free Running Counter + 12 comparators
  - Clock Sources are OSC and RTC
  - Programming guide is totally different comapared to previous MCT.

MCTv2 is totally newly designed for the next Exynos Series.
IP design, the way of operating and register configurations are different as well register layout.
It is new generation of Exynos system timer. It's not compatible with the previous MCT.
This is the start of implementation for the new MCT driver and we might have a lot of
changes for new feature.
If we maintain as one driver, everytime we change the new MCT driver we should test
all of SoC which doesn't have the new MCT. And vice versa.
> Best regards,
> Krzysztof
> 

------TI73IYgzdP03rYJ9SiN0qM3o3mlayfAqXHuFFMbUzbY.6Ea-=_3a807_
Content-Type: text/plain; charset="utf-8"


------TI73IYgzdP03rYJ9SiN0qM3o3mlayfAqXHuFFMbUzbY.6Ea-=_3a807_--

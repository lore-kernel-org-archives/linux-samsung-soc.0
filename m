Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B369AC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 08:07:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B85260EBB
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 08:07:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbhJUIJr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Oct 2021 04:09:47 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:41320
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231453AbhJUIJp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 04:09:45 -0400
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0CA763FFE2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 08:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634803648;
        bh=sDS7GEvXSQom9VFLoatpvyQsvf0nO+8HlK0Txu0PTXQ=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=PADkPpd8mm9qlWsShd1/4Xd9MV8Vtkdyza6jqhuYVXB0CUWbqskRwFzekY7cmKIdZ
         c05k/gph4IFaJeVJxG+VtODPiA5267V01ZMFOzaw88zOsm0+QE0SzQ1MHRlq9nhQDp
         jnAbsKoc40EbsTSr/23jNyaG6Dup/Tbnx3+l7F8lVSG2xnVwQy4RwW9ue4v2lzh1Dy
         eItPgGeIi+Cw5Y+Iex/p7L8qTzto8DRdtKm8xctThwc+2mCypQcj7h95OF5YCFSa29
         cENwmwjSuRCYOn1t5wQgvv2N8ZgRBZ32FuT/KN2Nm40Qf8HOh5XGUBNJEGyp6vJ/12
         lb0PJ0/mRV7TA==
Received: by mail-lj1-f197.google.com with SMTP id o4-20020a2ebd84000000b00210ae894d18so2510047ljq.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 01:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sDS7GEvXSQom9VFLoatpvyQsvf0nO+8HlK0Txu0PTXQ=;
        b=tGgh/oI2LeIi8K7yyo4XrFgAofYcs+85i+NAAJkjjX5TXUcw5xuciN0IzJkYPmbzqy
         dtR2CHz4oacciit0l2M6HXOPhFz4uR+uBNQ0tuWouanxNUFPn1WGQy4z0KBWWQ7fvYGM
         Wih2XdYWiWb2rDwoCCu6mJyvbKriRWNVGOT8WX143HrTeBGSUsCXB5nH+3uq5ofDGHSo
         NPUAW1SfYNukEaWZfBpFam+JjPTXg2ud618O+pTjYh/ri+rc+RHzunhgH25iAHMvC6zr
         b/NbrMPapYFPC9igOp7da+TOi9HF/jcidsfS/Qs7x26lLs+LYIJkhravRDd2vcWHeKEC
         yqIQ==
X-Gm-Message-State: AOAM5326sHjGaBCAnropPJlsskN064ldcnKrDDH06YotRTCvff5w+RTk
        lKKFZcmmuBhE4yj3IdF4B77LhBKm1xEOfu3fhGCeyNg3+wTENC5R3FtL+l9lwGreczILawMSP2g
        +mXlv3Z6s2bPAdq1jkqTthdQ68iknCZnYIobTc+IkvWs+vthx
X-Received: by 2002:a05:6512:6c8:: with SMTP id u8mr4148821lff.453.1634803647450;
        Thu, 21 Oct 2021 01:07:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCtWxEEyx0fBceTd9UNL5kCdwBY0brNh3ylEHk3SSt0t9e/oUHzQ848C4wSrj0JPM+f588aQ==
X-Received: by 2002:a05:6512:6c8:: with SMTP id u8mr4148795lff.453.1634803647253;
        Thu, 21 Oct 2021 01:07:27 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id m29sm397146lfo.104.2021.10.21.01.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 01:07:26 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] clocksource/drivers/exynos_mct_v2: introduce
 Exynos MCT version 2 driver for next Exynos SoC
To:     Youngmin Nam <youngmin.nam@samsung.com>
Cc:     daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com
References: <20211021061804.39118-1-youngmin.nam@samsung.com>
 <CGME20211021055112epcas2p278145beb21cd6cc4217813a41c1e1407@epcas2p2.samsung.com>
 <20211021061804.39118-2-youngmin.nam@samsung.com>
 <0c5dcdab-7aa3-a98f-e615-acbe98489935@canonical.com>
 <20211021082650.GA30741@perf>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <1b93aaf3-ed64-b105-dec4-07b6f27b385b@canonical.com>
Date:   Thu, 21 Oct 2021 10:07:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021082650.GA30741@perf>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/10/2021 10:26, Youngmin Nam wrote:
> On Thu, Oct 21, 2021 at 08:18:36AM +0200, Krzysztof Kozlowski wrote:
>> On 21/10/2021 08:18, Youngmin Nam wrote:
>>> Exynos MCT version 2 is composed of 1 FRC and 12 comparators.
>>> The 12 comparators can produces interrupts independently,
>>> so they can be used as local timer of each CPU.
>>>
>>> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
>>> ---
>>>  drivers/clocksource/Kconfig         |   6 +
>>>  drivers/clocksource/Makefile        |   1 +
>>>  drivers/clocksource/exynos_mct_v2.c | 336 ++++++++++++++++++++++++++++
>>>  drivers/clocksource/exynos_mct_v2.h |  74 ++++++
>>>  4 files changed, 417 insertions(+)
>>>  create mode 100644 drivers/clocksource/exynos_mct_v2.c
>>>  create mode 100644 drivers/clocksource/exynos_mct_v2.h
>>>
>>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
>>> index 0f5e3983951a..8ac04dd7f713 100644
>>> --- a/drivers/clocksource/Kconfig
>>> +++ b/drivers/clocksource/Kconfig
>>> @@ -421,6 +421,12 @@ config CLKSRC_EXYNOS_MCT
>>>  	help
>>>  	  Support for Multi Core Timer controller on Exynos SoCs.
>>>  
>>> +config CLKSRC_EXYNOS_MCT_V2
>>> +	bool "Exynos multi core timer (ver 2) driver" if COMPILE_TEST
>>> +	depends on ARM64
>>
>> depends on ARCH_EXYNOS.
>>
> Okay
>>> +	help
>>> +	  Support for Multi Core Timer controller on Exynos SoCs.
>>> +
>>>  config CLKSRC_SAMSUNG_PWM
>>>  	bool "PWM timer driver for Samsung S3C, S5P" if COMPILE_TEST
>>>  	depends on HAS_IOMEM
>>> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
>>> index c17ee32a7151..dc7d5cf27516 100644
>>> --- a/drivers/clocksource/Makefile
>>> +++ b/drivers/clocksource/Makefile
>>> @@ -43,6 +43,7 @@ obj-$(CONFIG_CADENCE_TTC_TIMER)	+= timer-cadence-ttc.o
>>>  obj-$(CONFIG_CLKSRC_STM32)	+= timer-stm32.o
>>>  obj-$(CONFIG_CLKSRC_STM32_LP)	+= timer-stm32-lp.o
>>>  obj-$(CONFIG_CLKSRC_EXYNOS_MCT)	+= exynos_mct.o
>>> +obj-$(CONFIG_CLKSRC_EXYNOS_MCT_V2)	+= exynos_mct_v2.o
>>>  obj-$(CONFIG_CLKSRC_LPC32XX)	+= timer-lpc32xx.o
>>>  obj-$(CONFIG_CLKSRC_MPS2)	+= mps2-timer.o
>>>  obj-$(CONFIG_CLKSRC_SAMSUNG_PWM)	+= samsung_pwm_timer.o
>>> diff --git a/drivers/clocksource/exynos_mct_v2.c b/drivers/clocksource/exynos_mct_v2.c
>>> new file mode 100644
>>> index 000000000000..2da6d5401629
>>> --- /dev/null
>>> +++ b/drivers/clocksource/exynos_mct_v2.c
>>> @@ -0,0 +1,336 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2022 Samsung Electronics Co., Ltd.
>>> + *		http://www.samsung.com
>>> + *
>>> + * Exynos MCT(Multi-Core Timer) version 2 support
>>> + */
>>> +
>>> +#include <linux/interrupt.h>
>>> +#include <linux/irq.h>
>>> +#include <linux/err.h>
>>> +#include <linux/clk.h>
>>> +#include <linux/clockchips.h>
>>> +#include <linux/cpu.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/percpu.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_irq.h>
>>> +#include <linux/of_address.h>
>>> +#include <linux/clocksource.h>
>>> +#include "exynos_mct_v2.h"
>>> +
>>> +static void __iomem *reg_base;
>>> +static unsigned long osc_clk_rate;
>>> +static int mct_irqs[MCT_NR_COMPS];
>>> +
>>> +static void exynos_mct_set_compensation(unsigned long osc, unsigned long rtc)
>>> +{
>>> +	unsigned int osc_rtc;
>>> +	unsigned int incr_rtcclk;
>>> +	unsigned int compen_val;
>>> +
>>> +	osc_rtc = (unsigned int)(osc * 1000 / rtc);
>>> +
>>> +	/* MCT_INCR_RTCCLK is integer part of (OSCCLK frequency/RTCCLK frequency). */
>>> +	incr_rtcclk = (osc / rtc) + ((osc % rtc) ? 1 : 0);
>>> +
>>> +	/* MCT_COMPENSATE_VALUE is decimal part of (OSCCLK frequency/RTCCLK frequency). */
>>> +	compen_val = ((osc_rtc + 5) / 10) % 100;
>>> +	if (compen_val)
>>> +		compen_val = 100 - compen_val;
>>> +
>>> +	pr_info("MCT: osc-%lu rtc-%lu incr_rtcclk:0x%08x compen_val:0x%08x\n",
>>> +		osc, rtc, incr_rtcclk, compen_val);
>>> +
>>> +	writel_relaxed(incr_rtcclk, reg_base + EXYNOS_MCT_MCT_INCR_RTCCLK);
>>> +	writel_relaxed(compen_val, reg_base + EXYNOS_MCT_COMPENSATE_VALUE);
>>> +}
>>> +
>>> +/* Clocksource handling */
>>> +static void exynos_mct_frc_start(void)
>>> +{
>>> +	writel_relaxed(MCT_FRC_ENABLE, reg_base + EXYNOS_MCT_MCT_FRC_ENABLE);
>>> +}
>>> +
>>> +/**
>>> + * exynos_read_count_32 - Read the lower 32-bits of the global counter
>>> + *
>>> + * This will read just the lower 32-bits of the global counter.
>>> + *
>>> + * Returns the number of cycles in the global counter (lower 32 bits).
>>> + */
>>
>> All this looks like a modification of Exynos MCT driver, so you should
>> extend that one instead. It does not look like we need two drivers.
>> Please integrate it into existing driver instead of sending a new piece
>> of code copied from vendor tree.
>>
> MCT version 2 is a completely different HW IP compared to previous MCT.
> The new MCT has a lot of different resister sets and there are many changes on programming guide.
> So we cannot share the previous code. At first, I also considered that way you mentioned,
> but it would be better to implement the driver seperately to maintain the new driver cleanly.

We have several drivers supporting different devices and we avoid mostly
duplicating new ones. The different register layout is not the valid
reason - we support differences in several places. Just take a look at
Samsung PMIC drivers where register layout is quite different between
designs. Still one clock driver, one RTC driver and 2-3 regulator
drivers (for ~7 devices).

Similarly to SoC clock, pinctrl, PMU and other drivers - we re-use
instead of duplicating entire driver.

I am sorry but the argument that block is different is not enough. What
is exactly not compatible with current driver which could not be modeled
by different driver data (or structure with ops)?

Best regards,
Krzysztof

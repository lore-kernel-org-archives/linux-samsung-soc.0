Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E3EC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 25 Oct 2021 08:18:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50EDA61002
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 25 Oct 2021 08:18:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231251AbhJYIUd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 25 Oct 2021 04:20:33 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:48940
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230106AbhJYIUc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 25 Oct 2021 04:20:32 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 503834001A
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Oct 2021 08:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635149887;
        bh=HwMspGJtk0C8+T9R1rA6XTt5hccsxA0tnvMlgXbSSUU=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=PZzFQyGukYNFg7aazvwraKm36sfj9Ia7KR7HiCBYTc50+TnDhf7pPKjsEBtAEJt6p
         bwpPIQNz9KuujREkWbR4F6og/hZgqGc4WTKLBpdC1m/cA3PQm42LmjgsiDi5CdAjos
         lyj5+7fLmrtx2YfDCF9YrzQfhuOIO7R9pEXkc+PgZV7qCqcglOPRmQEe/XxupJHA7k
         Yh/oKuKXEDpabjenfIdfU9vASHzYKaxEBaxIN62Crw4p4hMWpQp+YUu3/Ey94XLYZI
         wnppsCsi6tACM7maF2kIW3VVil3c8hBl37MSYMjulkMdgIUqkQxREAeNP3AZYsux7v
         AxlSOg8+nR6iw==
Received: by mail-lf1-f69.google.com with SMTP id h8-20020a056512220800b003fdf2283e82so4979976lfu.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Oct 2021 01:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HwMspGJtk0C8+T9R1rA6XTt5hccsxA0tnvMlgXbSSUU=;
        b=fRgfofLsBRoxqQIZNoRbyby40yfQ/lupw4Sfx78VYTLmxXxy7tkt8S0dkOBjp2lJpk
         oVnz14AH8mhqWGe73V67+milgESxU+ZVHAz1yvkRntHfCij/8M+SK7v/N26F+61NDh+f
         KF7Gum4jagJnghODabSAmVtygsCS3rH+z+weQcjivJ427AI63abMwFAXp3GGn8aJzSXl
         0HCRwRJVlBuuQzzAwM1SBuKCmqA2OqhS/kjrKtCgofFx6EVORkE167oxHjpc42M50e1r
         37MpM7tNt5mp2hKOSrrEK5etaVcKfcjuW7atzdoVm/FwloBcVTDbHQmJZfGOwwd64awZ
         xuJQ==
X-Gm-Message-State: AOAM532v18nbd94/TS3IX0e8USTppC7b3+BM04UFzYPNVFrtkHOKoykN
        b5XkLeckM/l/tT4MYBw7uY7pQqXncKZ4L1dNz+GIPp/JZHgabIbAOjp+pJ5S4ySy12nY2nF+eIu
        XbMMwUNjCmMuPaIkgPQnjbqVr7okbpYwZ8lsblNHfXIPX2s/L
X-Received: by 2002:a2e:7a12:: with SMTP id v18mr10079140ljc.403.1635149886621;
        Mon, 25 Oct 2021 01:18:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBKEKgwbgPWDYaGnYNslu7N5XiJg3ZuH2bEDz1Xi9iUYGswUmhn3MjrbRbQIgo2+eBYu949w==
X-Received: by 2002:a2e:7a12:: with SMTP id v18mr10079118ljc.403.1635149886343;
        Mon, 25 Oct 2021 01:18:06 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id 15sm1587598lfy.86.2021.10.25.01.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 01:18:05 -0700 (PDT)
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
 <1b93aaf3-ed64-b105-dec4-07b6f27b385b@canonical.com>
 <20211022042116.GA30645@perf>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v1 1/2] clocksource/drivers/exynos_mct_v2: introduce
 Exynos MCT version 2 driver for next Exynos SoC
Message-ID: <da83de3a-e7a2-f9b2-80f2-25c39717c3e4@canonical.com>
Date:   Mon, 25 Oct 2021 10:18:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211022042116.GA30645@perf>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22/10/2021 06:21, Youngmin Nam wrote:
> On Thu, Oct 21, 2021 at 10:07:25AM +0200, Krzysztof Kozlowski wrote:
>> On 21/10/2021 10:26, Youngmin Nam wrote:
>>> On Thu, Oct 21, 2021 at 08:18:36AM +0200, Krzysztof Kozlowski wrote:
>>>> On 21/10/2021 08:18, Youngmin Nam wrote:
>>>>> Exynos MCT version 2 is composed of 1 FRC and 12 comparators.
>>>>> The 12 comparators can produces interrupts independently,
>>>>> so they can be used as local timer of each CPU.
>>>>>
>>>>> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
>>>>> ---
>>>>>  drivers/clocksource/Kconfig         |   6 +
>>>>>  drivers/clocksource/Makefile        |   1 +
>>>>>  drivers/clocksource/exynos_mct_v2.c | 336 ++++++++++++++++++++++++++++
>>>>>  drivers/clocksource/exynos_mct_v2.h |  74 ++++++
>>>>>  4 files changed, 417 insertions(+)
>>>>>  create mode 100644 drivers/clocksource/exynos_mct_v2.c
>>>>>  create mode 100644 drivers/clocksource/exynos_mct_v2.h
>>>>>
>>>>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
>>>>> index 0f5e3983951a..8ac04dd7f713 100644
>>>>> --- a/drivers/clocksource/Kconfig
>>>>> +++ b/drivers/clocksource/Kconfig
>>>>> @@ -421,6 +421,12 @@ config CLKSRC_EXYNOS_MCT
>>>>>  	help
>>>>>  	  Support for Multi Core Timer controller on Exynos SoCs.
>>>>>  
>>>>> +config CLKSRC_EXYNOS_MCT_V2
>>>>> +	bool "Exynos multi core timer (ver 2) driver" if COMPILE_TEST
>>>>> +	depends on ARM64
>>>>
>>>> depends on ARCH_EXYNOS.
>>>>
>>> Okay
>>>>> +	help
>>>>> +	  Support for Multi Core Timer controller on Exynos SoCs.
>>>>> +
>>>>>  config CLKSRC_SAMSUNG_PWM
>>>>>  	bool "PWM timer driver for Samsung S3C, S5P" if COMPILE_TEST
>>>>>  	depends on HAS_IOMEM
>>>>> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
>>>>> index c17ee32a7151..dc7d5cf27516 100644
>>>>> --- a/drivers/clocksource/Makefile
>>>>> +++ b/drivers/clocksource/Makefile
>>>>> @@ -43,6 +43,7 @@ obj-$(CONFIG_CADENCE_TTC_TIMER)	+= timer-cadence-ttc.o
>>>>>  obj-$(CONFIG_CLKSRC_STM32)	+= timer-stm32.o
>>>>>  obj-$(CONFIG_CLKSRC_STM32_LP)	+= timer-stm32-lp.o
>>>>>  obj-$(CONFIG_CLKSRC_EXYNOS_MCT)	+= exynos_mct.o
>>>>> +obj-$(CONFIG_CLKSRC_EXYNOS_MCT_V2)	+= exynos_mct_v2.o
>>>>>  obj-$(CONFIG_CLKSRC_LPC32XX)	+= timer-lpc32xx.o
>>>>>  obj-$(CONFIG_CLKSRC_MPS2)	+= mps2-timer.o
>>>>>  obj-$(CONFIG_CLKSRC_SAMSUNG_PWM)	+= samsung_pwm_timer.o
>>>>> diff --git a/drivers/clocksource/exynos_mct_v2.c b/drivers/clocksource/exynos_mct_v2.c
>>>>> new file mode 100644
>>>>> index 000000000000..2da6d5401629
>>>>> --- /dev/null
>>>>> +++ b/drivers/clocksource/exynos_mct_v2.c
>>>>> @@ -0,0 +1,336 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>> +/*
>>>>> + * Copyright (c) 2022 Samsung Electronics Co., Ltd.
>>>>> + *		http://www.samsung.com
>>>>> + *
>>>>> + * Exynos MCT(Multi-Core Timer) version 2 support
>>>>> + */
>>>>> +
>>>>> +#include <linux/interrupt.h>
>>>>> +#include <linux/irq.h>
>>>>> +#include <linux/err.h>
>>>>> +#include <linux/clk.h>
>>>>> +#include <linux/clockchips.h>
>>>>> +#include <linux/cpu.h>
>>>>> +#include <linux/delay.h>
>>>>> +#include <linux/percpu.h>
>>>>> +#include <linux/of.h>
>>>>> +#include <linux/of_irq.h>
>>>>> +#include <linux/of_address.h>
>>>>> +#include <linux/clocksource.h>
>>>>> +#include "exynos_mct_v2.h"
>>>>> +
>>>>> +static void __iomem *reg_base;
>>>>> +static unsigned long osc_clk_rate;
>>>>> +static int mct_irqs[MCT_NR_COMPS];
>>>>> +
>>>>> +static void exynos_mct_set_compensation(unsigned long osc, unsigned long rtc)
>>>>> +{
>>>>> +	unsigned int osc_rtc;
>>>>> +	unsigned int incr_rtcclk;
>>>>> +	unsigned int compen_val;
>>>>> +
>>>>> +	osc_rtc = (unsigned int)(osc * 1000 / rtc);
>>>>> +
>>>>> +	/* MCT_INCR_RTCCLK is integer part of (OSCCLK frequency/RTCCLK frequency). */
>>>>> +	incr_rtcclk = (osc / rtc) + ((osc % rtc) ? 1 : 0);
>>>>> +
>>>>> +	/* MCT_COMPENSATE_VALUE is decimal part of (OSCCLK frequency/RTCCLK frequency). */
>>>>> +	compen_val = ((osc_rtc + 5) / 10) % 100;
>>>>> +	if (compen_val)
>>>>> +		compen_val = 100 - compen_val;
>>>>> +
>>>>> +	pr_info("MCT: osc-%lu rtc-%lu incr_rtcclk:0x%08x compen_val:0x%08x\n",
>>>>> +		osc, rtc, incr_rtcclk, compen_val);
>>>>> +
>>>>> +	writel_relaxed(incr_rtcclk, reg_base + EXYNOS_MCT_MCT_INCR_RTCCLK);
>>>>> +	writel_relaxed(compen_val, reg_base + EXYNOS_MCT_COMPENSATE_VALUE);
>>>>> +}
>>>>> +
>>>>> +/* Clocksource handling */
>>>>> +static void exynos_mct_frc_start(void)
>>>>> +{
>>>>> +	writel_relaxed(MCT_FRC_ENABLE, reg_base + EXYNOS_MCT_MCT_FRC_ENABLE);
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * exynos_read_count_32 - Read the lower 32-bits of the global counter
>>>>> + *
>>>>> + * This will read just the lower 32-bits of the global counter.
>>>>> + *
>>>>> + * Returns the number of cycles in the global counter (lower 32 bits).
>>>>> + */
>>>>
>>>> All this looks like a modification of Exynos MCT driver, so you should
>>>> extend that one instead. It does not look like we need two drivers.
>>>> Please integrate it into existing driver instead of sending a new piece
>>>> of code copied from vendor tree.
>>>>
>>> MCT version 2 is a completely different HW IP compared to previous MCT.
>>> The new MCT has a lot of different resister sets and there are many changes on programming guide.
>>> So we cannot share the previous code. At first, I also considered that way you mentioned,
>>> but it would be better to implement the driver seperately to maintain the new driver cleanly.
>>
>> We have several drivers supporting different devices and we avoid mostly
>> duplicating new ones. The different register layout is not the valid
>> reason - we support differences in several places. Just take a look at
>> Samsung PMIC drivers where register layout is quite different between
>> designs. Still one clock driver, one RTC driver and 2-3 regulator
>> drivers (for ~7 devices).
>>
>> Similarly to SoC clock, pinctrl, PMU and other drivers - we re-use
>> instead of duplicating entire driver.
>>
>> I am sorry but the argument that block is different is not enough. What
>> is exactly not compatible with current driver which could not be modeled
>> by different driver data (or structure with ops)?
>>
> I've checked samsung regulator driver and there are 3 types of driver as you mentioned.
> They are being maintained separately because they are not compatible each other.

That's not correct. We integrated 5 separate devices into s2mps11
regulator driver, around 7 devices into a MFD driver, 4 devices into RTC
driver and 4 devices into clock driver.

> 
> These are comparison of previous MCT and new MCT.
> * Previous MCT
>   - 4 Global timer + 8 Local timer
>   - Clock Source is OSC only
> 
> * New MCT
>   - 1 Free Running Counter + 12 comparators

One FRC was also in previous MCT, wasn't it? It supported 4 comparators,
but FRC was only one.

>   - Clock Sources are OSC and RTC
>   - Programming guide is totally different comapared to previous MCT.

Thanks, I got it from the driver. Linux supports handling such
differences, including differences in register map. In the same time
just quick look at the code shows several re-used functions.

> 
> MCTv2 is totally newly designed for the next Exynos Series.
> IP design, the way of operating and register configurations are different as well register layout.

We handle different register layouts without big issue. There are
several drivers showing this example, for example mentioned earlier
Samsung PMIC drivers. 4 different register layouts for RTC driver in one
driver and you mention here that two is some big difference?

The way of operating could be indeed a trouble but looking at the code
it is actually very, very similar.

> It is new generation of Exynos system timer. It's not compatible with the previous MCT.
> This is the start of implementation for the new MCT driver and we might have a lot of
> changes for new feature.
> If we maintain as one driver, everytime we change the new MCT driver we should test
> all of SoC which doesn't have the new MCT. And vice versa.

If everyone added a new driver to avoid integrating with existing code,
we would have huge kernel with thousands of duplicated solutions. The
kernel also would be unmaintained.

Such arguments were brought before several times - "I don't want to
integrating with existing code", "My use case is different", "I would
need to test the other cases", "It's complicated for me".

Instead of pushing a new vendor driver you should integrate it with
existing code.

Best regards,
Krzysztof

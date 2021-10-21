Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A9BC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 06:18:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14161611EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 06:18:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbhJUGVC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Oct 2021 02:21:02 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:51906
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230426AbhJUGVB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 02:21:01 -0400
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C7A98402CE
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 06:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634797119;
        bh=Vi68yXaVD2hBbbSgp/t0wDjJxIX6cSVHDmsHPQsmB/s=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=AN7+vvP72MVTa7Fgav+9mGL8B7AAB5GMrLQ+q+XSfv4/e0X5mmseDqeEuESi3a3Up
         q1+aBygKaIYhFI1gmETVz9TxkKDHigm4qZlsxBT1nN0ELjVxtK3FjyMSkKyqMa73xN
         P2s5CMJnYwMEHSIgGD+k8R2o2Ksr/YQBztOhs+EkALxZHmsKDOEPPhI8/bYgDQalYd
         UVsUbF+zedlWuu/uPGyYsrQxvDOA9ZF11u5CZ91iUJcO5phYlAzJBskaCChwtiDwHz
         eMOB7CA/nfUXwwVcXzQNUgnNWMT/JPQK0KGucEppYjVOyeCaSoyGhlcLTJw+UnAand
         ekEbz4EfFwDwg==
Received: by mail-lj1-f198.google.com with SMTP id f6-20020a2e9e86000000b00211349f9ce3so2226806ljk.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Oct 2021 23:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vi68yXaVD2hBbbSgp/t0wDjJxIX6cSVHDmsHPQsmB/s=;
        b=zDymH+0kOKkwTQ46rsCRCQ4pfsWv0CDzGsBrxPASeuPRmjU7cbe1FJPEwtKrX5arha
         T6Qy7rUutESIA6MoYIMtJMHa0A8XznoPlWl7OcVOKUNGVndztJu869oHLpDAbvsjDogA
         2Ii9A08AV2urv8Ync6vFpOQ4feyoHbhwrE+M/Hga/xKBZE/Z+gs1bBhERcxGOCD/CGSq
         lGzZqrBB8jSAkqnY0r+yihtF71l6oLXPVwsNbiu8gIl8Kitt6ctyFxFawL0ZXZJGtabl
         aeOsUp8ogbDp9pw2RPZqZ25BjbhmB1nTiC0mpds4No0gycvGztwFAjcQa7vqtVwDefF6
         nxFw==
X-Gm-Message-State: AOAM5301VjUA1PPwrWXLZTfooM8fhFg2XZK5wiMuyigFFPmIy5OXMivv
        NS3h6yI/M88wzn2BTAA0d4x7NOqUYGv42t4/ZMYfDT90JbefeepdaDxizFlzPy69irlAKCR1Jzr
        lYtRcQ+FYEUtpFUua4bSDHJU8tX7yMGSl1nhC62gpK8fJArVd
X-Received: by 2002:a2e:a7ca:: with SMTP id x10mr3946287ljp.106.1634797118735;
        Wed, 20 Oct 2021 23:18:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkLLbAvvFL1AYOED/389rAzCAqmYRJPrc/0xT+oextdlzn7H+F42sIsTRpGbwl1i0hP5LnXQ==
X-Received: by 2002:a2e:a7ca:: with SMTP id x10mr3946246ljp.106.1634797118286;
        Wed, 20 Oct 2021 23:18:38 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id m11sm462448ljp.27.2021.10.20.23.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Oct 2021 23:18:37 -0700 (PDT)
To:     Youngmin Nam <youngmin.nam@samsung.com>
Cc:     daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com
References: <20211021061804.39118-1-youngmin.nam@samsung.com>
 <CGME20211021055112epcas2p278145beb21cd6cc4217813a41c1e1407@epcas2p2.samsung.com>
 <20211021061804.39118-2-youngmin.nam@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v1 1/2] clocksource/drivers/exynos_mct_v2: introduce
 Exynos MCT version 2 driver for next Exynos SoC
Message-ID: <0c5dcdab-7aa3-a98f-e615-acbe98489935@canonical.com>
Date:   Thu, 21 Oct 2021 08:18:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021061804.39118-2-youngmin.nam@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/10/2021 08:18, Youngmin Nam wrote:
> Exynos MCT version 2 is composed of 1 FRC and 12 comparators.
> The 12 comparators can produces interrupts independently,
> so they can be used as local timer of each CPU.
> 
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> ---
>  drivers/clocksource/Kconfig         |   6 +
>  drivers/clocksource/Makefile        |   1 +
>  drivers/clocksource/exynos_mct_v2.c | 336 ++++++++++++++++++++++++++++
>  drivers/clocksource/exynos_mct_v2.h |  74 ++++++
>  4 files changed, 417 insertions(+)
>  create mode 100644 drivers/clocksource/exynos_mct_v2.c
>  create mode 100644 drivers/clocksource/exynos_mct_v2.h
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 0f5e3983951a..8ac04dd7f713 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -421,6 +421,12 @@ config CLKSRC_EXYNOS_MCT
>  	help
>  	  Support for Multi Core Timer controller on Exynos SoCs.
>  
> +config CLKSRC_EXYNOS_MCT_V2
> +	bool "Exynos multi core timer (ver 2) driver" if COMPILE_TEST
> +	depends on ARM64

depends on ARCH_EXYNOS.

> +	help
> +	  Support for Multi Core Timer controller on Exynos SoCs.
> +
>  config CLKSRC_SAMSUNG_PWM
>  	bool "PWM timer driver for Samsung S3C, S5P" if COMPILE_TEST
>  	depends on HAS_IOMEM
> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> index c17ee32a7151..dc7d5cf27516 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -43,6 +43,7 @@ obj-$(CONFIG_CADENCE_TTC_TIMER)	+= timer-cadence-ttc.o
>  obj-$(CONFIG_CLKSRC_STM32)	+= timer-stm32.o
>  obj-$(CONFIG_CLKSRC_STM32_LP)	+= timer-stm32-lp.o
>  obj-$(CONFIG_CLKSRC_EXYNOS_MCT)	+= exynos_mct.o
> +obj-$(CONFIG_CLKSRC_EXYNOS_MCT_V2)	+= exynos_mct_v2.o
>  obj-$(CONFIG_CLKSRC_LPC32XX)	+= timer-lpc32xx.o
>  obj-$(CONFIG_CLKSRC_MPS2)	+= mps2-timer.o
>  obj-$(CONFIG_CLKSRC_SAMSUNG_PWM)	+= samsung_pwm_timer.o
> diff --git a/drivers/clocksource/exynos_mct_v2.c b/drivers/clocksource/exynos_mct_v2.c
> new file mode 100644
> index 000000000000..2da6d5401629
> --- /dev/null
> +++ b/drivers/clocksource/exynos_mct_v2.c
> @@ -0,0 +1,336 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + *
> + * Exynos MCT(Multi-Core Timer) version 2 support
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/err.h>
> +#include <linux/clk.h>
> +#include <linux/clockchips.h>
> +#include <linux/cpu.h>
> +#include <linux/delay.h>
> +#include <linux/percpu.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_address.h>
> +#include <linux/clocksource.h>
> +#include "exynos_mct_v2.h"
> +
> +static void __iomem *reg_base;
> +static unsigned long osc_clk_rate;
> +static int mct_irqs[MCT_NR_COMPS];
> +
> +static void exynos_mct_set_compensation(unsigned long osc, unsigned long rtc)
> +{
> +	unsigned int osc_rtc;
> +	unsigned int incr_rtcclk;
> +	unsigned int compen_val;
> +
> +	osc_rtc = (unsigned int)(osc * 1000 / rtc);
> +
> +	/* MCT_INCR_RTCCLK is integer part of (OSCCLK frequency/RTCCLK frequency). */
> +	incr_rtcclk = (osc / rtc) + ((osc % rtc) ? 1 : 0);
> +
> +	/* MCT_COMPENSATE_VALUE is decimal part of (OSCCLK frequency/RTCCLK frequency). */
> +	compen_val = ((osc_rtc + 5) / 10) % 100;
> +	if (compen_val)
> +		compen_val = 100 - compen_val;
> +
> +	pr_info("MCT: osc-%lu rtc-%lu incr_rtcclk:0x%08x compen_val:0x%08x\n",
> +		osc, rtc, incr_rtcclk, compen_val);
> +
> +	writel_relaxed(incr_rtcclk, reg_base + EXYNOS_MCT_MCT_INCR_RTCCLK);
> +	writel_relaxed(compen_val, reg_base + EXYNOS_MCT_COMPENSATE_VALUE);
> +}
> +
> +/* Clocksource handling */
> +static void exynos_mct_frc_start(void)
> +{
> +	writel_relaxed(MCT_FRC_ENABLE, reg_base + EXYNOS_MCT_MCT_FRC_ENABLE);
> +}
> +
> +/**
> + * exynos_read_count_32 - Read the lower 32-bits of the global counter
> + *
> + * This will read just the lower 32-bits of the global counter.
> + *
> + * Returns the number of cycles in the global counter (lower 32 bits).
> + */

All this looks like a modification of Exynos MCT driver, so you should
extend that one instead. It does not look like we need two drivers.
Please integrate it into existing driver instead of sending a new piece
of code copied from vendor tree.

> +static u32 exynos_read_count_32(void)
> +{
> +	return readl_relaxed(reg_base + EXYNOS_MCT_CNT_L);
> +}
> +
> +static u64 exynos_frc_read(struct clocksource *cs)
> +{
> +	return exynos_read_count_32();
> +}
> +
> +static struct clocksource mct_frc = {
> +	.name		= "mct-frc",
> +	.rating		= 350,	/* use value lower than ARM arch timer */
> +	.read		= exynos_frc_read,
> +	.mask		= CLOCKSOURCE_MASK(32),
> +	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
> +};
> +
> +static int __init exynos_clocksource_init(void)
> +{
> +	if (clocksource_register_hz(&mct_frc, osc_clk_rate))
> +		panic("%s: can't register clocksource\n", mct_frc.name);
> +
> +	return 0;
> +}
> +
> +static void exynos_mct_comp_stop(struct mct_clock_event_device *mevt)
> +{
> +	unsigned int index = mevt->comp_index;
> +	unsigned int comp_enable;
> +	unsigned int loop_cnt = 0;
> +
> +	writel_relaxed(MCT_COMP_DISABLE, reg_base + EXYNOS_MCT_COMP_ENABLE(index));
> +
> +	/* Wait maximum 1 ms until COMP_ENABLE_n = 0 */
> +	do {
> +		comp_enable = readl_relaxed(reg_base + EXYNOS_MCT_COMP_ENABLE(index));
> +		loop_cnt++;
> +	} while (comp_enable != MCT_COMP_DISABLE && loop_cnt < WAIT_LOOP_CNT);
> +
> +	if (loop_cnt == WAIT_LOOP_CNT)
> +		panic("MCT(comp%d) disable timeout\n", index);
> +
> +	writel_relaxed(MCT_COMP_NON_CIRCULAR_MODE, reg_base + EXYNOS_MCT_COMP_MODE(index));
> +	writel_relaxed(MCT_INT_DISABLE, reg_base + EXYNOS_MCT_INT_ENB(index));
> +	writel_relaxed(MCT_CSTAT_CLEAR, reg_base + EXYNOS_MCT_INT_CSTAT(index));
> +}
> +
> +static void exynos_mct_comp_start(struct mct_clock_event_device *mevt,
> +				  bool periodic, unsigned long cycles)
> +{
> +	unsigned int index = mevt->comp_index;
> +	unsigned int comp_enable;
> +	unsigned int loop_cnt = 0;
> +
> +	comp_enable = readl_relaxed(reg_base + EXYNOS_MCT_COMP_ENABLE(index));
> +	if (comp_enable == MCT_COMP_ENABLE)
> +		exynos_mct_comp_stop(mevt);
> +
> +	if (periodic)
> +		writel_relaxed(MCT_COMP_CIRCULAR_MODE, reg_base + EXYNOS_MCT_COMP_MODE(index));
> +
> +	writel_relaxed(cycles, reg_base + EXYNOS_MCT_COMP_PERIOD(index));
> +	writel_relaxed(MCT_INT_ENABLE, reg_base + EXYNOS_MCT_INT_ENB(index));
> +	writel_relaxed(MCT_COMP_ENABLE, reg_base + EXYNOS_MCT_COMP_ENABLE(index));
> +
> +	/* Wait maximum 1 ms until COMP_ENABLE_n = 1 */
> +	do {
> +		comp_enable = readl_relaxed(reg_base + EXYNOS_MCT_COMP_ENABLE(index));
> +		loop_cnt++;
> +	} while (comp_enable != MCT_COMP_ENABLE && loop_cnt < WAIT_LOOP_CNT);
> +
> +	if (loop_cnt == WAIT_LOOP_CNT)
> +		panic("MCT(comp%d) enable timeout\n", index);
> +}
> +
> +static int exynos_comp_set_next_event(unsigned long cycles, struct clock_event_device *evt)
> +{
> +	struct mct_clock_event_device *mevt;
> +
> +	mevt = container_of(evt, struct mct_clock_event_device, evt);
> +
> +	exynos_mct_comp_start(mevt, false, cycles);
> +
> +	return 0;
> +}
> +
> +static int mct_set_state_shutdown(struct clock_event_device *evt)
> +{
> +	struct mct_clock_event_device *mevt;
> +
> +	mevt = container_of(evt, struct mct_clock_event_device, evt);
> +
> +	exynos_mct_comp_stop(mevt);
> +
> +	return 0;
> +}
> +
> +static int mct_set_state_periodic(struct clock_event_device *evt)
> +{
> +	unsigned long cycles_per_jiffy;
> +	struct mct_clock_event_device *mevt;
> +
> +	mevt = container_of(evt, struct mct_clock_event_device, evt);
> +
> +	cycles_per_jiffy = (((unsigned long long)NSEC_PER_SEC / HZ * evt->mult) >> evt->shift);
> +	exynos_mct_comp_start(mevt, true, cycles_per_jiffy);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t exynos_mct_comp_isr(int irq, void *dev_id)
> +{
> +	struct mct_clock_event_device *mevt = dev_id;
> +	struct clock_event_device *evt = &mevt->evt;
> +	unsigned int index = mevt->comp_index;
> +
> +	writel_relaxed(MCT_CSTAT_CLEAR, reg_base + EXYNOS_MCT_INT_CSTAT(index));
> +
> +	evt->event_handler(evt);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static DEFINE_PER_CPU(struct mct_clock_event_device, percpu_mct_tick);
> +
> +static int exynos_mct_starting_cpu(unsigned int cpu)
> +{
> +	struct mct_clock_event_device *mevt = per_cpu_ptr(&percpu_mct_tick, cpu);
> +	struct clock_event_device *evt = &mevt->evt;
> +
> +	snprintf(mevt->name, sizeof(mevt->name), "mct_comp%d", cpu);
> +
> +	evt->name = mevt->name;
> +	evt->cpumask = cpumask_of(cpu);
> +	evt->set_next_event = exynos_comp_set_next_event;
> +	evt->set_state_periodic = mct_set_state_periodic;
> +	evt->set_state_shutdown = mct_set_state_shutdown;
> +	evt->set_state_oneshot = mct_set_state_shutdown;
> +	evt->set_state_oneshot_stopped = mct_set_state_shutdown;
> +	evt->tick_resume = mct_set_state_shutdown;
> +	evt->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
> +	evt->rating = 500;	/* use value higher than ARM arch timer */
> +
> +	if (evt->irq == -1)
> +		return -EIO;
> +
> +	irq_force_affinity(evt->irq, cpumask_of(cpu));
> +	enable_irq(evt->irq);
> +	clockevents_config_and_register(evt, osc_clk_rate, 0xf, 0x7fffffff);
> +
> +	return 0;
> +}
> +
> +static int exynos_mct_dying_cpu(unsigned int cpu)
> +{
> +	struct mct_clock_event_device *mevt = per_cpu_ptr(&percpu_mct_tick, cpu);
> +	struct clock_event_device *evt = &mevt->evt;
> +	unsigned int index = mevt->comp_index;
> +
> +	evt->set_state_shutdown(evt);
> +	if (evt->irq != -1)
> +		disable_irq_nosync(evt->irq);
> +
> +	writel_relaxed(MCT_CSTAT_CLEAR, reg_base + EXYNOS_MCT_INT_CSTAT(index));
> +
> +	return 0;
> +}
> +
> +static int __init exynos_timer_resources(struct device_node *np, void __iomem *base)
> +{
> +	int err, cpu;
> +
> +	struct clk *mct_clk, *tick_clk,  *rtc_clk;
> +	unsigned long rtc_clk_rate;
> +	int div;
> +	int ret;
> +
> +	ret = of_property_read_u32(np, "div", &div);
> +	if (ret || !div) {
> +		pr_warn("MCT: fail to get the div value. set div to the default\n");
> +		div = DEFAULT_CLK_DIV;
> +	}
> +
> +	tick_clk = of_clk_get_by_name(np, "fin_pll");
> +	if (IS_ERR(tick_clk))
> +		panic("%s: unable to determine tick clock rate\n", __func__);
> +	osc_clk_rate = clk_get_rate(tick_clk) / div;
> +
> +	mct_clk = of_clk_get_by_name(np, "mct");
> +	if (IS_ERR(mct_clk))
> +		panic("%s: unable to retrieve mct clock instance\n", __func__);
> +	clk_prepare_enable(mct_clk);
> +
> +	rtc_clk = of_clk_get_by_name(np, "rtc");

Why timer needs a RTC clock?

> +	if (IS_ERR(rtc_clk)) {
> +		pr_warn("MCT: fail to get rtc clock. set to the default\n");
> +		rtc_clk_rate = DEFAULT_RTC_CLK_RATE;
> +	} else {
> +		rtc_clk_rate = clk_get_rate(rtc_clk);
> +	}
> +
> +	reg_base = base;
> +	if (!reg_base)
> +		panic("%s: unable to ioremap mct address space\n", __func__);
> +
> +	exynos_mct_set_compensation(osc_clk_rate, rtc_clk_rate);
> +	exynos_mct_frc_start();
> +
> +	for_each_possible_cpu(cpu) {
> +		int mct_irq = mct_irqs[cpu];
> +		struct mct_clock_event_device *pcpu_mevt = per_cpu_ptr(&percpu_mct_tick, cpu);
> +
> +		pcpu_mevt->evt.irq = -1;
> +		pcpu_mevt->comp_index = cpu;
> +
> +		irq_set_status_flags(mct_irq, IRQ_NOAUTOEN);
> +		if (request_irq(mct_irq,
> +				exynos_mct_comp_isr,
> +				IRQF_TIMER | IRQF_NOBALANCING | IRQF_PERCPU,
> +				"exynos-mct", pcpu_mevt)) {
> +			pr_err("exynos-mct: cannot register IRQ (cpu%d)\n", cpu);
> +			continue;
> +		}
> +		pcpu_mevt->evt.irq = mct_irq;
> +	}
> +
> +	/* Install hotplug callbacks which configure the timer on this CPU */
> +	err = cpuhp_setup_state(CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING,
> +				"clockevents/exynos/mct_timer_v2:starting",
> +				exynos_mct_starting_cpu,
> +				exynos_mct_dying_cpu);
> +	if (err)
> +		goto out_irq;
> +
> +	return 0;
> +
> +out_irq:
> +	for_each_possible_cpu(cpu) {
> +		struct mct_clock_event_device *pcpu_mevt = per_cpu_ptr(&percpu_mct_tick, cpu);
> +
> +		if (pcpu_mevt->evt.irq != -1) {
> +			free_irq(pcpu_mevt->evt.irq, pcpu_mevt);
> +			pcpu_mevt->evt.irq = -1;
> +		}
> +	}
> +	return err;
> +}
> +
> +static int __init mct_init_dt(struct device_node *np)
> +{
> +	u32 nr_irqs = 0, i;
> +	int ret;
> +
> +	/*
> +	 * Find out the total number of irqs which can be produced by comparators.
> +	 */
> +	nr_irqs = of_irq_count(np);
> +
> +	for (i = MCT_COMP0; i < nr_irqs; i++)
> +		mct_irqs[i] = irq_of_parse_and_map(np, i);
> +
> +	pr_info("## exynos_timer_resources\n");

Not a Linux kernel style of debug message.

> +	ret = exynos_timer_resources(np, of_iomap(np, 0));
> +	if (ret)
> +		return ret;
> +
> +	pr_info("## exynos_clocksource_init\n");
> +	ret = exynos_clocksource_init();
> +
> +	return ret;
> +}
> +
> +TIMER_OF_DECLARE(s5e99xx, "samsung,s5e99xx-mct", mct_init_dt);
> diff --git a/drivers/clocksource/exynos_mct_v2.h b/drivers/clocksource/exynos_mct_v2.h
> new file mode 100644
> index 000000000000..377421803bbe
> --- /dev/null
> +++ b/drivers/clocksource/exynos_mct_v2.h
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/**
> + * exynos_mct_v2.h - Samsung Exynos MCT(Multi-Core Timer) Driver Header file
> + *
> + * Copyright (C) 2021 Samsung Electronics Co., Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

No need for license text.

> + */
> +
> +#ifndef __EXYNOS_MCT_V2_H__
> +#define __EXYNOS_MCT_V2_H__
> +
> +#define EXYNOS_MCTREG(x)		(x)
> +#define EXYNOS_MCT_MCT_CFG		EXYNOS_MCTREG(0x000)
> +#define EXYNOS_MCT_MCT_INCR_RTCCLK	EXYNOS_MCTREG(0x004)
> +#define EXYNOS_MCT_MCT_FRC_ENABLE	EXYNOS_MCTREG(0x100)
> +#define EXYNOS_MCT_CNT_L		EXYNOS_MCTREG(0x110)
> +#define EXYNOS_MCT_CNT_U		EXYNOS_MCTREG(0x114)
> +#define EXYNOS_MCT_CLKMUX_SEL		EXYNOS_MCTREG(0x120)
> +#define EXYNOS_MCT_COMPENSATE_VALUE	EXYNOS_MCTREG(0x124)
> +#define EXYNOS_MCT_VER			EXYNOS_MCTREG(0x128)
> +#define EXYNOS_MCT_DIVCHG_ACK		EXYNOS_MCTREG(0x12C)
> +#define EXYNOS_MCT_COMP_L(i)		EXYNOS_MCTREG(0x200 + ((i) * 0x100))
> +#define EXYNOS_MCT_COMP_U(i)		EXYNOS_MCTREG(0x204 + ((i) * 0x100))
> +#define EXYNOS_MCT_COMP_MODE(i)		EXYNOS_MCTREG(0x208 + ((i) * 0x100))
> +#define EXYNOS_MCT_COMP_PERIOD(i)	EXYNOS_MCTREG(0x20C + ((i) * 0x100))
> +#define EXYNOS_MCT_COMP_ENABLE(i)	EXYNOS_MCTREG(0x210 + ((i) * 0x100))
> +#define EXYNOS_MCT_INT_ENB(i)		EXYNOS_MCTREG(0x214 + ((i) * 0x100))
> +#define EXYNOS_MCT_INT_CSTAT(i)		EXYNOS_MCTREG(0x218 + ((i) * 0x100))
> +
> +#define MCT_FRC_ENABLE			(0x1)
> +#define MCT_COMP_ENABLE			(0x1)
> +#define MCT_COMP_DISABLE		(0x0)
> +
> +#define MCT_COMP_CIRCULAR_MODE		(0x1)
> +#define MCT_COMP_NON_CIRCULAR_MODE	(0x0)
> +
> +#define MCT_INT_ENABLE			(0x1)
> +#define MCT_INT_DISABLE			(0x0)
> +
> +#define MCT_CSTAT_CLEAR			(0x1)
> +
> +#define DEFAULT_RTC_CLK_RATE		32768 // 32.768Khz
> +#define DEFAULT_CLK_DIV			3     // 1/3

Such comments are not useful.

Best regards,
Krzysztof

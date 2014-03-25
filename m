From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] clocksource: exynos_mct: Fix stall after CPU hotplugging
Date: Tue, 25 Mar 2014 12:32:54 +0100
Message-ID: <53316966.90600@samsung.com>
References: <1395744087-8655-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38542 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751158AbaCYLdI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Mar 2014 07:33:08 -0400
In-reply-to: <1395744087-8655-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Kukjin Kim <kgene.kim@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Krzysztof,

Two comments inline.

On 25.03.2014 11:41, Krzysztof Kozlowski wrote:

[snip]

> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index 48f76bc05da0..0b49b09dd1a9 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -339,7 +339,14 @@ static void exynos4_mct_tick_start(unsigned long cycles,
>   static int exynos4_tick_set_next_event(unsigned long cycles,
>   				       struct clock_event_device *evt)
>   {
> -	struct mct_clock_event_device *mevt = this_cpu_ptr(&percpu_mct_tick);
> +	/*
> +	 * In case of hotplugging non-boot CPU, the set_next_event could be
> +	 * called on CPU0 by ISR before IRQ affinity is set to proper CPU.

Hmm, is this a desired behavior? I guess this is a question for Thomas 
and Daniel.

> +	 * Thus for accessing proper MCT Lx timer, 'per_cpu' for cpumask
> +	 * in event must be used instead of 'this_cpu_ptr'.
> +	 */
> +	struct mct_clock_event_device *mevt = &per_cpu(percpu_mct_tick,
> +			cpumask_first(evt->cpumask));
>
>   	exynos4_mct_tick_start(cycles, mevt);
>
> @@ -371,23 +378,13 @@ static inline void exynos4_tick_set_mode(enum clock_event_mode mode,
>
>   static int exynos4_mct_tick_clear(struct mct_clock_event_device *mevt)
>   {
> -	struct clock_event_device *evt = &mevt->evt;
> -
> -	/*
> -	 * This is for supporting oneshot mode.
> -	 * Mct would generate interrupt periodically
> -	 * without explicit stopping.
> -	 */
> -	if (evt->mode != CLOCK_EVT_MODE_PERIODIC)
> -		exynos4_mct_tick_stop(mevt);
> -
>   	/* Clear the MCT tick interrupt */
>   	if (__raw_readl(reg_base + mevt->base + MCT_L_INT_CSTAT_OFFSET) & 1) {
>   		exynos4_mct_write(0x1, mevt->base + MCT_L_INT_CSTAT_OFFSET);
>   		return 1;
> -	} else {
> -		return 0;
>   	}
> +
> +	return 0;

Nobody seems to be checking return value of this function (and I don't 
see what it could be used for anyway), so I guess it could be simply 
made void.

Best regards,
Tomasz

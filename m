From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] clocksource: exynos_mct: remove unneeded container_of()
Date: Mon, 22 Jun 2015 09:04:06 +0900
Message-ID: <558750F6.8020507@samsung.com>
References: <1434322238.5390.16.camel@mtux> <1434919299.4096.1.camel@mtux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:10028 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752277AbbFVAEN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Jun 2015 20:04:13 -0400
In-reply-to: <1434919299.4096.1.camel@mtux>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexey Klimov <klimov.linux@gmail.com>, linux-samsung-soc@vger.kernel.org
Cc: sboyd@codeaurora.org, t.dakhran@gmail.com, kgene@kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org

On 22.06.2015 05:41, Alexey Klimov wrote:
> Patch removes unneeded container_of() macro
> in exynos4_local_timer_setup(). Instead let's pass mevt pointer
> to setup and stop functions from exynos4_mct_cpu_notify()
> and let them get evt pointer.
> 
> Tested on odroid-xu3.
> 
> Signed-off-by: Alexey Klimov <klimov.linux@gmail.com>
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>

Looks good, the internal interface now seems more consistent.
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

However you forgot to mail this to maintainers of clocksource subsystem
(Cc'ed: Daniel, Thomas, LKML).

Best regards,
Krzysztof


> ---
>  drivers/clocksource/exynos_mct.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index 83564c9..752a37c 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -446,13 +446,11 @@ static irqreturn_t exynos4_mct_tick_isr(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> -static int exynos4_local_timer_setup(struct clock_event_device *evt)
> +static int exynos4_local_timer_setup(struct mct_clock_event_device *mevt)
>  {
> -	struct mct_clock_event_device *mevt;
> +	struct clock_event_device *evt = &mevt->evt;
>  	unsigned int cpu = smp_processor_id();
>  
> -	mevt = container_of(evt, struct mct_clock_event_device, evt);
> -
>  	mevt->base = EXYNOS4_MCT_L_BASE(cpu);
>  	snprintf(mevt->name, sizeof(mevt->name), "mct_tick%d", cpu);
>  
> @@ -484,8 +482,10 @@ static int exynos4_local_timer_setup(struct clock_event_device *evt)
>  	return 0;
>  }
>  
> -static void exynos4_local_timer_stop(struct clock_event_device *evt)
> +static void exynos4_local_timer_stop(struct mct_clock_event_device *mevt)
>  {
> +	struct clock_event_device *evt = &mevt->evt;
> +
>  	evt->set_mode(CLOCK_EVT_MODE_UNUSED, evt);
>  	if (mct_int_type == MCT_INT_SPI)
>  		free_irq(evt->irq, this_cpu_ptr(&percpu_mct_tick));
> @@ -505,11 +505,11 @@ static int exynos4_mct_cpu_notify(struct notifier_block *self,
>  	switch (action & ~CPU_TASKS_FROZEN) {
>  	case CPU_STARTING:
>  		mevt = this_cpu_ptr(&percpu_mct_tick);
> -		exynos4_local_timer_setup(&mevt->evt);
> +		exynos4_local_timer_setup(mevt);
>  		break;
>  	case CPU_DYING:
>  		mevt = this_cpu_ptr(&percpu_mct_tick);
> -		exynos4_local_timer_stop(&mevt->evt);
> +		exynos4_local_timer_stop(mevt);
>  		break;
>  	}
>  
> @@ -557,7 +557,7 @@ static void __init exynos4_timer_resources(struct device_node *np, void __iomem
>  		goto out_irq;
>  
>  	/* Immediately configure the timer on the boot CPU */
> -	exynos4_local_timer_setup(&mevt->evt);
> +	exynos4_local_timer_setup(mevt);
>  	return;
>  
>  out_irq:
> 

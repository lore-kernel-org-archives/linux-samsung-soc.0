From: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCH] ARM: S5PV310: Implement kernel timers using MCT
Date: Wed, 22 Dec 2010 12:35:02 +0000
Message-ID: <20101222123502.GB2838@pulham.picochip.com>
References: <1293017221-31037-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:64533 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751791Ab0LVMfF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Dec 2010 07:35:05 -0500
Received: by wwa36 with SMTP id 36so5223119wwa.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Dec 2010 04:35:03 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1293017221-31037-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>, Changhwan Youn <chaos.youn@samsung.com>, ben-linux@fluff.org

Hi Kukjin,

Just trying to learn what other people are doing in their platforms, so 
apologies if my comments aren't applicable! Looks good to me though.

On Wed, Dec 22, 2010 at 08:27:01PM +0900, Kukjin Kim wrote:
> From: Changhwan Youn <chaos.youn@samsung.com>
> 
> The Multi-Core Timer(MCT) of S5PV310 is designed for implementing
> clock source timer and clock event timers. This patch implements
> 1 clock source timer with 64 bit free running counter of MCT and
> 2 clock event timers with two of 31-bit tick counters.
> 
> Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s5pv310/Kconfig                 |    7 +
>  arch/arm/mach-s5pv310/Makefile                |    8 +-
>  arch/arm/mach-s5pv310/include/mach/regs-mct.h |   47 ++++
>  arch/arm/mach-s5pv310/mct.c                   |  365 +++++++++++++++++++++++++
>  4 files changed, 426 insertions(+), 1 deletions(-)
>  create mode 100644 arch/arm/mach-s5pv310/include/mach/regs-mct.h
>  create mode 100644 arch/arm/mach-s5pv310/mct.c
[...]
> diff --git a/arch/arm/mach-s5pv310/mct.c b/arch/arm/mach-s5pv310/mct.c
> new file mode 100644
> index 0000000..2fe189c
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/mct.c
[...]
> +static struct clock_event_device mct_tick0_device = {
> +	.name		= "mct-tick0",
> +	.features	= CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
> +	.rating		= 450,
> +	.shift		= 20,
> +	.set_next_event	= s5pv310_tick0_set_next_event,
> +	.set_mode	= s5pv310_tick0_set_mode,
> +};
> +
> +static struct clock_event_device mct_tick1_device = {
> +	.name		= "mct-tick1",
> +	.features	= CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
> +	.rating		= 450,
> +	.shift		= 20,
> +	.set_next_event	= s5pv310_tick1_set_next_event,
> +	.set_mode	= s5pv310_tick1_set_mode,
> +};

Do you need to specify .shift here? Could you use 
clockevents_calc_mult_shift() to calculate mult and shift for you?

> +irqreturn_t s5pv310_mct0_event_isr(int irq, void *dev_id)
> +{
> +	struct clock_event_device *evt;
> +
> +	/* Clear the MCT tick interrupt */
> +
> +	evt = &mct_tick0_device;
> +	if (evt->mode != CLOCK_EVT_MODE_PERIODIC)
> +		s5pv310_mct_tick_stop(MCT_TICK0);

I don't think you need to stop the timer here, the clockevents layer 
will handle this for you.

[...]
> +static void s5pv310_mct_clockevent_init(struct clock_event_device *dev)
> +{
> +	dev->mult = div_sc(clk_rate / 2, NSEC_PER_SEC, dev->shift);
> +
> +	dev->max_delta_ns = clockevent_delta2ns(0xfffffff, dev);

Is there a reason that the delta is only using 28 bits here?

Jamie

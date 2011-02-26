From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/3] ARM: S5P: Add s5p_timer support for HRT
Date: Sat, 26 Feb 2011 14:24:13 +0000
Message-ID: <20110226142413.GC3640@n2100.arm.linux.org.uk>
References: <1298688357-20775-1-git-send-email-sbkim73@samsung.com> <1298688357-20775-2-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:50857 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750995Ab1BZOYc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 26 Feb 2011 09:24:32 -0500
Content-Disposition: inline
In-Reply-To: <1298688357-20775-2-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

On Sat, Feb 26, 2011 at 11:45:55AM +0900, Sangbeom Kim wrote:
> +static irqreturn_t s5p_clock_event_isr(int irq, void *dev_id)
> +{
> +	struct clock_event_device *evt = &time_event_device;

	struct clock_event_device *evt = dev_id;

> +
> +	evt->event_handler(evt);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static struct irqaction s5p_clock_event_irq = {
> +	.name		= "s5p_time_irq",
> +	.flags		= IRQF_DISABLED | IRQF_TIMER | IRQF_IRQPOLL,
> +	.handler	= s5p_clock_event_isr,

	.dev_id	 	= &time_event_device,

> +};
...
> +static void __init s5p_timer_resources(void)
> +{
> +	struct platform_device tmpdev;
> +
> +	tmpdev.dev.bus = &platform_bus_type;
> +
> +	timerclk = clk_get(NULL, "timers");
> +	if (IS_ERR(timerclk))
> +		panic("failed to get timers clock for system timer");
> +
> +	clk_enable(timerclk);
> +
> +	tmpdev.id = timer_source.event_id;

So Samsung clock stuff is still being idiotic.  Will this ever be fixed?

> +	tin_event = clk_get(&tmpdev.dev, "pwm-tin");
> +	if (IS_ERR(tin_event)) {
> +		clk_put(tin_event);

Don't clk_put errors.

> +		panic("failed to get pwm-tin2 clock for system timer");
> +	}
> +
> +	tdiv_event = clk_get(&tmpdev.dev, "pwm-tdiv");
> +	if (IS_ERR(tdiv_event)) {
> +		clk_put(tdiv_event);

Ditto.

> +		panic("failed to get pwm-tdiv2 clock for system timer");
> +	}
> +
> +	clk_enable(tin_event);
> +
> +	tmpdev.id = timer_source.source_id;
> +	tin_source = clk_get(&tmpdev.dev, "pwm-tin");
> +	if (IS_ERR(tin_source)) {
> +		clk_put(tin_source);

Ditto.

> +		panic("failed to get pwm-tin4 clock for system timer");
> +	}
> +
> +	tdiv_source = clk_get(&tmpdev.dev, "pwm-tdiv");
> +	if (IS_ERR(tdiv_source)) {
> +		clk_put(tdiv_source);

Ditto.

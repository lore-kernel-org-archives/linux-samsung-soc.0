From: Rabin Vincent <rabin@rab.in>
Subject: Re: [PATCH 5/8] ARM: S5PV310: Add Timer support
Date: Mon, 28 Jun 2010 20:49:18 +0530
Message-ID: <20100628151918.GC3287@debian>
References: <1277476037-8806-1-git-send-email-kgene.kim@samsung.com>
 <1277476037-8806-6-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from kelvin.asmallorange.com ([207.210.111.10]:60708 "EHLO
	kelvin.asmallorange.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751398Ab0F1PSh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jun 2010 11:18:37 -0400
Content-Disposition: inline
In-Reply-To: <1277476037-8806-6-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Changhwan Youn <chaos.youn@samsung.com>, ben-linux@fluff.org

On Fri, Jun 25, 2010 at 11:27:14PM +0900, Kukjin Kim wrote:
> +static void s5pv310_pwm_init(unsigned int pwm_id, unsigned long tcnt)
> +{
> +	unsigned long tcon;
> +
> +	tcon = __raw_readl(S3C2410_TCON);
> +
> +	/* timers reload after counting zero, so reduce the count by 1 */
> +	tcnt--;
> +
> +	printk(KERN_DEBUG "timer tcon=%08lx, tcnt %08lx\n", tcon, tcnt);

This function is called from set_event().  Do you really want this
printk every time a tick is programmed?

> +static void __init s5pv310_clocksource_init(void)
> +{
> +	unsigned long pclk;
> +	unsigned long clock_rate;
> +
> +	pclk = clk_get_rate(timerclk);
> +
> +	clk_set_rate(tdiv2, pclk / 2);
> +	clk_set_parent(tin2, tdiv2);
> +
> +	clock_rate = clk_get_rate(tin2);
> +
> +	pwm_clocksource.mult =
> +		clocksource_khz2mult(clock_rate/1000, pwm_clocksource.shift);
> +
> +	if (clocksource_register(&pwm_clocksource))
> +		panic("%s: can't register clocksource\n", pwm_clocksource.name);
> +
> +	s5pv310_pwm_init(2, ~0);
> +	s5pv310_pwm_start(2, 1);
> +}
> +

It would probably be prudent to start the clocksource before registering
it, rather than after.

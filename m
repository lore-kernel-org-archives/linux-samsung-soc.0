From: Harald Welte <laforge@gnumonks.org>
Subject: Re: [PATCH] [ARM] [S3C64XX] Add support for hr timer
Date: Fri, 6 Nov 2009 14:58:50 +0900
Message-ID: <20091106055850.GD4117@prithivi.gnumonks.org>
References: <1257468345-18021-1-git-send-email-aditya.ps@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:50587 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754869AbZKFF67 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Nov 2009 00:58:59 -0500
Content-Disposition: inline
In-Reply-To: <1257468345-18021-1-git-send-email-aditya.ps@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: aditya.ps@samsung.com
Cc: linux-samsung-soc@vger.kernel.org

Hi Aditya,

thanks for your [first] patch :)

On Fri, Nov 06, 2009 at 09:45:45AM +0900, aditya.ps@samsung.com wrote:
> +
> +choice
> +	prompt "OS Timer support"
> +	depends on PLAT_S3C64XX
> +	default DYNAMIC_TIMER
> +
> +config FIXED_TIMER
> +	bool "Fixed Tick timer"
> +
> +config DYNAMIC_TIMER
> +	bool "Tickless and HR Timer"
> +	select GENERIC_TIME
> +	select GENERIC_CLOCKEVENTS

I think those should probably be prefixed with S3C_ as the Kconfig namespace
is global.  Like with symbol names, we should not use generic names unless
we are implementing generic code.

>  obj-y				+=  init.o
> +ifdef CONFIG_NO_HZ
> +obj-y				+= hr-time.o
> +else
> +
> +ifndef CONFIG_HIGH_RES_TIMERS
>  obj-y				+= time.o
> +else
> +obj-y				+= hr-time.o
> +endif

Mh.  This means the actual timer code depends only on CONFIG_NO_HZ and
CONFIG_HIGH_RES_TIMERS.

The two Kconfig choices FIXED_TIMER and DYNAMIC_TIMER are not really used
anywhere.

At last to me, it is unclear how this all works together. I think the choices
are either

1) you build the timer code solely on core kernel configuration options like
   GENERIC_TIME, GENERIC_CLOCKEVENTS, HIGH_RES_TIMERS, NO_HZ or the like

or

2) you have a private (s3c-specific) Kconfig option to select it.  In this case,
   dependent options need to be selected (like you do).  But then, the Makefile
   should still reflect the s3c-specific Kconfig.

Mixing both does not really seem to make sense to me.

So as I can see, there are the three following possible cases:

a) the regular/old timer code is used.  No high-res and no tickless.

b) the high-resolution timer is used but not tickless (NO_HZ not set)

c) the high-resolution timer are used tickless.

If you configure+build yoru code, each of those three options has to work
as expected.  

> +static struct clock_event_device clockevent_tick_timer = {
> +	.name		= "pwm_timer4",
> +	.features	= CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
> +	.shift		= 32,
> +	.set_next_event	= s3c64xx_tick_set_next_event,
> +	.set_mode	= s3c64xx_tick_set_mode,
> +};

if you give this static variable a shorter name, (like clkevt_tick_tmr or even
only tick_timer), then you can probably avoid some line wraps further down the
code:

> +	clockevent_tick_timer.mult = div_sc(rate, NSEC_PER_SEC,
> +					    clockevent_tick_timer.shift);
> +	clockevent_tick_timer.max_delta_ns =
> +		clockevent_delta2ns(-1, &clockevent_tick_timer);
> +	clockevent_tick_timer.min_delta_ns =
> +		clockevent_delta2ns(1, &clockevent_tick_timer);

Also, we typically don't define a static string and then printk'

> +	static char err[] __initdata = KERN_ERR
> +			"%s: can't register clocksource!\n";
> +		printk(err, clocksource_s3c64xx.name);

why not simply 
		printk(KERN_ERR "%s: can't register clocksource\n",
			clocksource_s3c64xx.name);

> +	if (IS_ERR(ck_ref))
> +		panic("failed to get clock for system timer");

here we panic.  Is this failure really more severe than the failure above
where we simply printk(KERN_ERR) ?

Yes, I think if we can't get the clocks for the system timer, then we should
panic since the kernel will not be able to function.  But is failing the
clocksource registration any less severe? (this is a real question, you
probably know better than I do)

Regards,
	Harald
-- 
- Harald Welte <laforge@gnumonks.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)

From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] ARM: S5P: Add s5p_timer support for HRT
Date: Sat, 26 Feb 2011 10:33:54 +0100
Message-ID: <AANLkTinCyXm_z8tcjRHCYEvi79ifj+joKK7E8Kzboi2G@mail.gmail.com>
References: <1298688357-20775-1-git-send-email-sbkim73@samsung.com>
	<1298688357-20775-2-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:63263 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751608Ab1BZJdz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 26 Feb 2011 04:33:55 -0500
Received: by pvg12 with SMTP id 12so376626pvg.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Feb 2011 01:33:54 -0800 (PST)
In-Reply-To: <1298688357-20775-2-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

2011/2/26 Sangbeom Kim <sbkim73@samsung.com>:
> (...)
> +static void s5p_clockevent_init(void)
> +{
> + =A0 =A0 =A0 unsigned long pclk;
> + =A0 =A0 =A0 unsigned long clock_rate;
> + =A0 =A0 =A0 unsigned int irq_number;
> + =A0 =A0 =A0 struct clk *tscaler;
> +
> + =A0 =A0 =A0 pclk =3D clk_get_rate(timerclk);
> +
> + =A0 =A0 =A0 tscaler =3D clk_get_parent(tdiv_event);
> +
> + =A0 =A0 =A0 clk_set_rate(tscaler, pclk / 2);
> + =A0 =A0 =A0 clk_set_rate(tdiv_event, pclk / 2);
> + =A0 =A0 =A0 clk_set_parent(tin_event, tdiv_event);
> +
> + =A0 =A0 =A0 clock_rate =3D clk_get_rate(tin_event);
> + =A0 =A0 =A0 clock_count_per_tick =3D clock_rate / HZ;
> +
> + =A0 =A0 =A0 time_event_device.mult =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 div_sc(clock_rate, NSEC_PER_SEC, time_e=
vent_device.shift);
> + =A0 =A0 =A0 time_event_device.max_delta_ns =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clockevent_delta2ns(-1, &time_event_dev=
ice);
> + =A0 =A0 =A0 time_event_device.min_delta_ns =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clockevent_delta2ns(1, &time_event_devi=
ce);

This is a very complicated and inprecise way of doing this nowadays.
Skip hardcoding the shift value and calculating mult like that and use

/* Be able to sleep for atleast 4 seconds (usually more) */
#define EVT_MIN_RANGE 4

clockevents_calc_mult_shift(&time_event_device,
                                    clock_rate, EVT_MIN_RANGE);

> (...)
> +static void s5p_clocksource_init(void)
> +{
> + =A0 =A0 =A0 unsigned long pclk;
> + =A0 =A0 =A0 unsigned long clock_rate;
> +
> + =A0 =A0 =A0 pclk =3D clk_get_rate(timerclk);
> +
> + =A0 =A0 =A0 clk_set_rate(tdiv_source, pclk / 2);
> + =A0 =A0 =A0 clk_set_parent(tin_source, tdiv_source);
> +
> + =A0 =A0 =A0 clock_rate =3D clk_get_rate(tin_source);
> +
> + =A0 =A0 =A0 s5p_time_setup(timer_source.source_id, TCNT_MAX);
> + =A0 =A0 =A0 s5p_time_start(timer_source.source_id, PERIODIC);
> +
> + =A0 =A0 =A0 if (clocksource_register_hz(&time_clocksource, clock_ra=
te))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 panic("%s: can't register clocksource\n=
", time_clocksource.name);
> +}

This is more like it :-)

But you probably also want to add a sched_clock hook for this
platform too, so you get some nice scheduling resolution.

I suggest you look at the simple straight-forward driver
for U300 in arch/arm/mach-u300/timer.c for inspiration.
It's using the same timer that is used for clocksource for
sched_clock().


Yours,
Linus Walleij

From: Sangbeom Kim <sbkim73@samsung.com>
Subject: RE: [PATCH 1/3] ARM: S5P: Add s5p_timer support for HRT
Date: Mon, 28 Feb 2011 16:56:35 +0900
Message-ID: <000601cbd71d$080cc870$18265950$@com>
References: <1298688357-20775-1-git-send-email-sbkim73@samsung.com>
 <1298688357-20775-2-git-send-email-sbkim73@samsung.com>
 <AANLkTinCyXm_z8tcjRHCYEvi79ifj+joKK7E8Kzboi2G@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40392 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751179Ab1B1H4l convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Feb 2011 02:56:41 -0500
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHB007EPI2GT9F0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Feb 2011 16:56:40 +0900 (KST)
Received: from DOSBKIM7301 ([12.23.103.65])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHB00DVSI2G8K@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Feb 2011 16:56:40 +0900 (KST)
In-reply-to: <AANLkTinCyXm_z8tcjRHCYEvi79ifj+joKK7E8Kzboi2G@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

Dear Walleij,

Thanks for your suggest.
I will apply your suggest in the next version.
Thanks & Regards,

S.B. Kim

2011/2/26 Linus Walleij <linux.walleij@linaro.org> wrote:
> -----Original Message-----
> From: linux-samsung-soc-owner@vger.kernel.org [mailto:linux-samsung-s=
oc-
> owner@vger.kernel.org] On Behalf Of Linus Walleij
> Sent: Saturday, February 26, 2011 6:34 PM
> To: Sangbeom Kim
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; kgene.kim@samsung.com; ben-linux@fluff.org
> Subject: Re: [PATCH 1/3] ARM: S5P: Add s5p_timer support for HRT
>=20
> 2011/2/26 Sangbeom Kim <sbkim73@samsung.com>:
> > (...)
> > +static void s5p_clockevent_init(void)
> > +{
> > + =A0 =A0 =A0 unsigned long pclk;
> > + =A0 =A0 =A0 unsigned long clock_rate;
> > + =A0 =A0 =A0 unsigned int irq_number;
> > + =A0 =A0 =A0 struct clk *tscaler;
> > +
> > + =A0 =A0 =A0 pclk =3D clk_get_rate(timerclk);
> > +
> > + =A0 =A0 =A0 tscaler =3D clk_get_parent(tdiv_event);
> > +
> > + =A0 =A0 =A0 clk_set_rate(tscaler, pclk / 2);
> > + =A0 =A0 =A0 clk_set_rate(tdiv_event, pclk / 2);
> > + =A0 =A0 =A0 clk_set_parent(tin_event, tdiv_event);
> > +
> > + =A0 =A0 =A0 clock_rate =3D clk_get_rate(tin_event);
> > + =A0 =A0 =A0 clock_count_per_tick =3D clock_rate / HZ;
> > +
> > + =A0 =A0 =A0 time_event_device.mult =3D
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 div_sc(clock_rate, NSEC_PER_SEC,
time_event_device.shift);
> > + =A0 =A0 =A0 time_event_device.max_delta_ns =3D
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clockevent_delta2ns(-1, &time_event_d=
evice);
> > + =A0 =A0 =A0 time_event_device.min_delta_ns =3D
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clockevent_delta2ns(1, &time_event_de=
vice);
>=20
> This is a very complicated and inprecise way of doing this nowadays.
> Skip hardcoding the shift value and calculating mult like that and us=
e
>=20
> /* Be able to sleep for atleast 4 seconds (usually more) */
> #define EVT_MIN_RANGE 4
>=20
> clockevents_calc_mult_shift(&time_event_device,
>                                     clock_rate, EVT_MIN_RANGE);
>=20
> > (...)
> > +static void s5p_clocksource_init(void)
> > +{
> > + =A0 =A0 =A0 unsigned long pclk;
> > + =A0 =A0 =A0 unsigned long clock_rate;
> > +
> > + =A0 =A0 =A0 pclk =3D clk_get_rate(timerclk);
> > +
> > + =A0 =A0 =A0 clk_set_rate(tdiv_source, pclk / 2);
> > + =A0 =A0 =A0 clk_set_parent(tin_source, tdiv_source);
> > +
> > + =A0 =A0 =A0 clock_rate =3D clk_get_rate(tin_source);
> > +
> > + =A0 =A0 =A0 s5p_time_setup(timer_source.source_id, TCNT_MAX);
> > + =A0 =A0 =A0 s5p_time_start(timer_source.source_id, PERIODIC);
> > +
> > + =A0 =A0 =A0 if (clocksource_register_hz(&time_clocksource, clock_=
rate))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 panic("%s: can't register clocksource=
\n",
> time_clocksource.name);
> > +}
>=20
> This is more like it :-)
>=20
> But you probably also want to add a sched_clock hook for this
> platform too, so you get some nice scheduling resolution.
>=20
> I suggest you look at the simple straight-forward driver
> for U300 in arch/arm/mach-u300/timer.c for inspiration.
> It's using the same timer that is used for clocksource for
> sched_clock().
>=20
>=20
> Yours,
> Linus Walleij
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-
> soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

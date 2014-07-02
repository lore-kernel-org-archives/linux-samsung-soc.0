From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v5 05/14] clk: Add generic driver for Maxim PMIC clocks
Date: Wed, 02 Jul 2014 12:19:57 +0200
Message-ID: <1404296397.12439.2.camel@AMDC1943>
References: <1403806546-31122-1-git-send-email-javier.martinez@collabora.co.uk>
 <1403806546-31122-6-git-send-email-javier.martinez@collabora.co.uk>
 <CAKew6eU5X=WxhECtwUUwbXe_fCRU4bD6B7caWiA2dwcBfThd-g@mail.gmail.com>
 <20140701172616.32686.44374@quantum> <53B3DB49.6020604@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:58702 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751711AbaGBKUA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jul 2014 06:20:00 -0400
In-reply-to: <53B3DB49.6020604@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Mike Turquette <mturquette@linaro.org>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Daniel Stone <daniels@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On =C5=9Bro, 2014-07-02 at 12:13 +0200, Javier Martinez Canillas wrote:
> Hello Mike,
>=20
> On 07/01/2014 07:26 PM, Mike Turquette wrote:
> > Quoting Yadwinder Singh Brar (2014-06-29 21:01:36)
> >> Hi Javier,
> >>=20
> >> On Thu, Jun 26, 2014 at 11:45 PM, Javier Martinez Canillas
> >> <javier.martinez@collabora.co.uk> wrote:
> >> > Maxim Integrated Power Management ICs are very similar with
> >> > regard to their clock outputs. Most of the clock drivers for
> >> > these chips are duplicating code and are simpler enough that
> >> > can be converted to use a generic driver to consolidate code
> >> > and avoid duplication.
> >> >
> >> > Signed-off-by: Javier Martinez Canillas <javier.martinez@collabo=
ra.co.uk>
> >> > Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> >> > ---
> >> >
> >> > Changes since v4:
> >> >  - Return recalc 0 if clock isn't enabled in Suggested by Yadwin=
der Singh Brar.
> >> >
> >>=20
> >> It seems you didn't implement or posted same patch again :) .
> >>=20
> >> > Changes since v3:
> >> >  - Add current copyright information. Suggested by Krzysztof Koz=
lowski
> >> >  - Do a single allocation for struct max_gen_clk. Suggested by K=
rzysztof Kozlowski
> >> >  - Add EXPORT_SYMBOL() for exported symbols. Suggested by Krzysz=
tof Kozlowski
> >> >
> >> >  drivers/clk/Kconfig       |   3 +
> >> >  drivers/clk/Makefile      |   1 +
> >> >  drivers/clk/clk-max-gen.c | 195 +++++++++++++++++++++++++++++++=
+++++++++++++++
> >> >  drivers/clk/clk-max-gen.h |  32 ++++++++
> >> >  4 files changed, 231 insertions(+)
> >> >  create mode 100644 drivers/clk/clk-max-gen.c
> >> >  create mode 100644 drivers/clk/clk-max-gen.h
> >> >
> >>=20
> >> [ .. ]
> >>=20
> >> > +
> >> > +static unsigned long max_gen_recalc_rate(struct clk_hw *hw,
> >> > +                                        unsigned long parent_ra=
te)
> >> > +{
> >> > +       return 32768;
> >> > +}
> >>=20
> >> Its still same here.
> >=20
> > Changing this would be a new behavior. I do not know of any other c=
lock
> > drivers that conditionally returns a rate of 0 based on whether or =
not
> > the clock is gated.
> >=20
>=20
> After Yadwinder feedback I searched for clock drivers that returned 0=
 when the
> clock was not enabled/prepared and found for example drivers/clk/clk-=
s2mps11.c:
>=20
>=20
> static unsigned long s2mps11_clk_recalc_rate(struct clk_hw *hw,
>                                              unsigned long parent_rat=
e)
> {
>         struct s2mps11_clk *s2mps11 =3D to_s2mps11_clk(hw);
>         if (s2mps11->enabled)
>                 return 32768;
>         else
>                 return 0;
> }
>=20
> > It is also buggy since calls to clk_enable and clk_disable do not i=
nvoke
> > .recalc_rate, so the rate of your clock would not be updated from t=
he
> > framework's perspective until some later point where you call
> > clk_set_rate or something.
> >
>=20
> s2ps11->enabled is set in the driver's clk_ops .prepare and .unprepar=
e function
> handlers and calls to clk_prepare and clk_unprepare also don't seems =
to invoke
> .recalc_rate so I guess that driver is wrong as well and should just =
return the
> clock rate unconditionally?

The s2mps11 may be not a best example for proper clock driver :).
Karol Wrona already sent a patch for s2mps11:
https://lkml.org/lkml/2014/7/1/389


Best regards,
Krzysztof

>=20
> > If your driver needs to know whether or not the clock is enabled th=
en we
> > could introduce a new bool clk_is_enabled(struct clk *clk); to clk.=
h,
> > but I'd rather not do that. Instead if a driver needs a clock then =
it
> > calls clk_enable on it without any knowledge about the internal sta=
te of
> > the clock enable_count.
> >=20
> > Regards,
> > Mike
> >
>=20
> Thanks a lot for the explanation, I'll revert that change then and re=
turn the
> clock rate unconditionally on the next version of the patch-set.
>=20
> Best regards,
> Javier

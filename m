From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 08/12] clk: samsung: add clock controller driver for s3c2410, s3c2440 and s3c2442
Date: Mon, 17 Feb 2014 23:48:45 +0100
Message-ID: <1854479.bubKgKa3MN@phil>
References: <201312131356.40755.heiko@sntech.de> <5643318.r2EB20boll@phil> <53028F1C.7090806@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:38941 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751178AbaBQWtk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Feb 2014 17:49:40 -0500
In-Reply-To: <53028F1C.7090806@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, t.figa@samsung.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Am Montag, 17. Februar 2014, 23:37:16 schrieb Tomasz Figa:
> On 17.02.2014 22:05, Heiko St=FCbner wrote:
> > Hi Tomasz,
> >=20
> > Am Sonntag, 9. Februar 2014, 20:34:26 schrieb Tomasz Figa:
> >>> +/*
> >>> + * fixed rate clocks generated outside the soc
> >>> + * Only necessary until the devicetree-move is complete
> >>> + */
> >>> +struct samsung_fixed_rate_clock s3c2410_common_frate_clks[] __in=
itdata
> >>> =3D
> >>> {
> >>> +	FRATE(XTI, "xti", NULL, CLK_IS_ROOT, 0),
> >>=20
> >> Do you need to assign this clock an ID? When DT is used, it's defi=
ned as
> >> a separate clock provider using fixed clock bindings, so it is not
> >> provided by this driver.
> >=20
> > I think that I'll need this (and similar on the s3c2412). This is d=
ue to
> > the cpufreq driver for the earlier SoCs needing the xtal-frequency =
to
> > calculate the pll lock time (s3c24xx-cpufreq.c
> > s3c_cpufreq_update_loctkime).
> >=20
> > Or do you have an idea on how to fix up the cpufreq driver in an ea=
sy way?
>=20
> OK, I get the problem here. So you need the ID to register an alias.
>=20
> Still, the ID would be invalid when booted with DT and xti clock
> registered using fixed rate clock bindings. So I'd suggest moving the
> XTI clock ID definition from your DT binding header back to your driv=
er,
> leaving a comment in the header that this ID is reserved.
>=20
> What do you think?

nice idea, thanks :-). I'll use it for the s3c2410 (+ variants) and s3c=
2412.


Heiko

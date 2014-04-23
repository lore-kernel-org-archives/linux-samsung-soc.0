From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2 1/9] ARM: S3C24XX: cpufreq-utils: don't write raw values to MPLLCON when using ccf
Date: Wed, 23 Apr 2014 23:11:35 +0200
Message-ID: <1538030.0aVnFA3MgQ@phil>
References: <2104342.rkElQpXtvM@phil> <535825AB.8060802@cogentembedded.com> <535828D7.3080301@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:42016 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753155AbaDWVJb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Apr 2014 17:09:31 -0400
In-Reply-To: <535828D7.3080301@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Kukjin Kim <kgene.kim@samsung.com>, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org

Am Mittwoch, 23. April 2014, 22:55:51 schrieb Tomasz Figa:
> Hi,
>=20
> On 23.04.2014 22:42, Sergei Shtylyov wrote:
> > Hello.
> >=20
> > On 04/23/2014 11:34 PM, Heiko St=FCbner wrote:
> >> The s3c24xx cpufreq driver needs to change the mpll speed and was =
doing
> >> this by writing raw values from a translation table into the MPLLC=
ON
> >> register.
> >>=20
> >> Change this to use a regular clk_set_rate call when using the comm=
on
> >> clock framework and only write the raw value in the samsung_clock =
case.
> >>=20
> >> To not needing to create additional infrastructure for this, the m=
pll
> >> clock
> >> is requested at the first call to s3c2410_set_fvco().
> >>=20
> >> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> >> ---
> >>=20
> >>   arch/arm/mach-s3c24xx/cpufreq-utils.c | 14 ++++++++++++++
> >>   1 file changed, 14 insertions(+)
> >>=20
> >> diff --git a/arch/arm/mach-s3c24xx/cpufreq-utils.c
> >> b/arch/arm/mach-s3c24xx/cpufreq-utils.c
> >> index 2a0aa56..d5e797b 100644
> >> --- a/arch/arm/mach-s3c24xx/cpufreq-utils.c
> >> +++ b/arch/arm/mach-s3c24xx/cpufreq-utils.c
> >=20
> > [...]
> >=20
> >> @@ -60,5 +61,18 @@ void s3c2410_cpufreq_setrefresh(struct
> >> s3c_cpufreq_config *cfg)
> >>=20
> >>    */
> >>  =20
> >>   void s3c2410_set_fvco(struct s3c_cpufreq_config *cfg)
> >>   {
> >>=20
> >> +#ifdef CONFIG_SAMSUNG_CLOCK
> >>=20
> >>       __raw_writel(cfg->pll.driver_data, S3C2410_MPLLCON);
> >>=20
> >> +#endif
> >> +
> >> +#ifdef CONFIG_COMMON_CLK
> >> +    static struct clk *mpll;
> >> +
> >> +    if (!mpll)
> >>=20
> >     You are testing uninitialized variable. This check wouldn't mak=
e
> >=20
> > much sense even if the variable was initialized.
>=20
> I should probably add that NULL is considered a valid clock handle by
> Common Clock Framework.
>=20
> If there is really no way to pass the clock to this function then
> probably a global variable initialized by some code running earlier t=
han
> this function could be called would be a better choice.

*grrr* :-) ... ok I'll try to find another way (again) to do this


> Anyway, Heiko, thanks for working on this. I'll try to review rest of
> the series soon. (I'm attending the ELC next week, though, so I'm not
> sure if I find some time then, though.)

Just as a reminder, there isn't this much to still review, as you=20
Acked/Reviewed most of the series in v1 and only this patch as well as =
2 and 5=20
still need a review/ack - and the only changes are fixes for your comme=
nts ;-)


Heiko

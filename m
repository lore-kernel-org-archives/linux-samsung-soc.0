From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/2] clk: samsung: exynos4x12: Enable ARMCLK down feature
Date: Fri, 18 Jul 2014 15:53:08 +0200
Message-ID: <1405691588.6365.3.camel@AMDC1943>
References: <1405677186-18678-1-git-send-email-k.kozlowski@samsung.com>
 <53C91A9E.7020207@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <53C91A9E.7020207@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On pi=C4=85, 2014-07-18 at 15:01 +0200, Tomasz Figa wrote:
> Hi Krzysztof,
>=20
> On 18.07.2014 11:53, Krzysztof Kozlowski wrote:
> > Enable ARMCLK down and up features on Exynos4212 and 4412 SoCs. The
> > frequency of ARMCLK will be reduced upon entering idle mode (WFI or
> > WFE).  Additionally upon exiting from idle mode the divider for ARM=
CLK
> > will be brought back to 1.
> >=20
> > These are exactly the same settings as for Exynos5250
> > (clk-exynos5250.c), except of Exynos4412 where ARMCLK down is enabl=
ed
> > for all 4 cores.
>=20
> Could you add a sentence or two about the purpose of this change? E.g=
=2E
> what it improves, in what conditions, etc.

Sure, I'll describe benefits.
>=20
> >=20
> > Tested on Trats2 board (Exynos4412) and Samsung Gear 1 (Exynos4212)=
=2E
> >=20
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > ---
> >  drivers/clk/samsung/clk-exynos4.c | 53 +++++++++++++++++++++++++++=
++++++++++++
> >  1 file changed, 53 insertions(+)
> >=20
> > diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsun=
g/clk-exynos4.c
> > index 7f4a473a7ad7..b8ea37b23984 100644
> > --- a/drivers/clk/samsung/clk-exynos4.c
> > +++ b/drivers/clk/samsung/clk-exynos4.c
> > @@ -114,11 +114,34 @@
> >  #define DIV_CPU1		0x14504
> >  #define GATE_SCLK_CPU		0x14800
> >  #define GATE_IP_CPU		0x14900
> > +#define PWR_CTRL1		0x15020
> > +#define PWR_CTRL2		0x15024
>=20
> I guess these registers should be also added to save/restore list bel=
ow
> in this driver.

Yes, you're right.

>=20
> >  #define E4X12_DIV_ISP0		0x18300
> >  #define E4X12_DIV_ISP1		0x18304
> >  #define E4X12_GATE_ISP0		0x18800
> >  #define E4X12_GATE_ISP1		0x18804
> > =20
> > +/* Below definitions are used for PWR_CTRL settings */
> > +#define PWR_CTRL1_CORE2_DOWN_RATIO		(7 << 28)
> > +#define PWR_CTRL1_CORE1_DOWN_RATIO		(7 << 16)
>=20
> I think these macros could be defined to take the ratio as its argume=
nt,
> e.g.
>=20
> #define PWR_CTRL1_CORE2_DOWN_RATIO(x)		((x) << 28)

OK.

>=20
> > +#define PWR_CTRL1_DIV2_DOWN_EN			(1 << 9)
> > +#define PWR_CTRL1_DIV1_DOWN_EN			(1 << 8)
> > +#define PWR_CTRL1_USE_CORE3_WFE			(1 << 7)
> > +#define PWR_CTRL1_USE_CORE2_WFE			(1 << 6)
> > +#define PWR_CTRL1_USE_CORE1_WFE			(1 << 5)
> > +#define PWR_CTRL1_USE_CORE0_WFE			(1 << 4)
> > +#define PWR_CTRL1_USE_CORE3_WFI			(1 << 3)
> > +#define PWR_CTRL1_USE_CORE2_WFI			(1 << 2)
> > +#define PWR_CTRL1_USE_CORE1_WFI			(1 << 1)
> > +#define PWR_CTRL1_USE_CORE0_WFI			(1 << 0)
> > +
> > +#define PWR_CTRL2_DIV2_UP_EN			(1 << 25)
> > +#define PWR_CTRL2_DIV1_UP_EN			(1 << 24)
> > +#define PWR_CTRL2_DUR_STANDBY2_VAL		(1 << 16)
> > +#define PWR_CTRL2_DUR_STANDBY1_VAL		(1 << 8)
>=20
> These two too.
>=20
> > +#define PWR_CTRL2_CORE2_UP_RATIO		(1 << 4)
> > +#define PWR_CTRL2_CORE1_UP_RATIO		(1 << 0)
>=20
> These two as well.
>=20
> > +
> >  /* the exynos4 soc type */
> >  enum exynos4_soc {
> >  	EXYNOS4210,
> > @@ -1164,6 +1187,34 @@ static struct samsung_pll_clock exynos4x12_p=
lls[nr_plls] __initdata =3D {
> >  			VPLL_LOCK, VPLL_CON0, NULL),
> >  };
> > =20
> > +static void __init exynos4_core_down_clock(void)
> > +{
> > +	unsigned int tmp;
> > +
> > +	/*
> > +	 * Enable arm clock down (in idle) and set arm divider
> > +	 * ratios in WFI/WFE state.
> > +	 */
> > +	tmp =3D (PWR_CTRL1_CORE2_DOWN_RATIO | PWR_CTRL1_CORE1_DOWN_RATIO =
|
> > +		PWR_CTRL1_DIV2_DOWN_EN | PWR_CTRL1_DIV1_DOWN_EN |
> > +		PWR_CTRL1_USE_CORE1_WFE | PWR_CTRL1_USE_CORE0_WFE |
> > +		PWR_CTRL1_USE_CORE1_WFI | PWR_CTRL1_USE_CORE0_WFI);
> > +	if (of_machine_is_compatible("samsung,exynos4412"))
>=20
> Maybe you could use num_possible_cpus() here instead?

Sure.

>=20
> > +		tmp |=3D PWR_CTRL1_USE_CORE3_WFE | PWR_CTRL1_USE_CORE2_WFE |
> > +		       PWR_CTRL1_USE_CORE3_WFI | PWR_CTRL1_USE_CORE2_WFI;
> > +	__raw_writel(tmp, reg_base + PWR_CTRL1);
> > +
> > +	/*
> > +	 * Enable arm clock up (on exiting idle). Set arm divider
> > +	 * ratios when not in idle along with the standby duration
> > +	 * ratios.
> > +	 */
> > +	tmp =3D (PWR_CTRL2_DIV2_UP_EN | PWR_CTRL2_DIV1_UP_EN |
> > +		PWR_CTRL2_DUR_STANDBY2_VAL | PWR_CTRL2_DUR_STANDBY1_VAL |
> > +		PWR_CTRL2_CORE2_UP_RATIO | PWR_CTRL2_CORE1_UP_RATIO);
> > +	__raw_writel(tmp, reg_base + PWR_CTRL2);
>=20
> Do we need the clock up feature at all? The values you set seem to
> configure both dividers to 2 (resulting in arm_clk =3D apll / 4) for =
a
> very short period of time (16 ticks of some, unfortunately unspecifie=
d,
> clock) between wake-up and setting the frequency back to normal.
> Moreover, for certain settings (div_core * div_core2 set to > 4 by
> cpufreq) this might cause issues with activating higher frequency tha=
n
> current voltage allows.

It seems that the clock up feature is not needed on Exynos 4x12. I'll
remove it.

Additionally I'll add support for 4210.

Thanks for your feedback!
Krzysztof

>=20
> I believe the same comments apply for patch 2/2 as well.
>=20
> Best regards,
> Tomasz

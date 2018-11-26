From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH 1/3] clk: samsung: exynos5420: add VPLL rate table for g3d clock
Date: Mon, 26 Nov 2018 14:21:45 +0530
Message-ID: <CANAwSgRqvw454E2twn+RwGGhy0XQE0T=k2dKfD50CWVk88p=rQ@mail.gmail.com>
References: <CGME20181123094453epcas4p16be0412e0195fe4bf06680111805352a@epcas4p1.samsung.com>
 <20181123094413.1108-1-linux.amoon@gmail.com> <5BFBA550.4020401@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5BFBA550.4020401@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, Marian Mihailescu <mihailescu2m@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Chanwoo,

On Mon, 26 Nov 2018 at 13:18, Chanwoo Choi <cw00.choi@samsung.com> wrote:
>
> Hi,
>
> On 2018=EB=85=84 11=EC=9B=94 23=EC=9D=BC 18:44, Anand Moon wrote:
> > From: Marian Mihailescu <mihailescu2m@gmail.com>
> >
> > A specific clock rate table is added for VPLL so it is possible
> > to set frequency of the VPLL output clock that used by the g3d clock.
> >
> > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > Cc: Chanwoo Choi <cw00.choi@samsung.com>
> > Signed-off-by: Marian Mihailescu <mihailescu2m@gmail.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  drivers/clk/samsung/clk-exynos5420.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung=
/clk-exynos5420.c
> > index 34cce3c5898f..34156bdfd0d2 100644
> > --- a/drivers/clk/samsung/clk-exynos5420.c
> > +++ b/drivers/clk/samsung/clk-exynos5420.c
> > @@ -1303,6 +1303,18 @@ static const struct samsung_pll_rate_table exyno=
s5420_epll_24mhz_tbl[] =3D {
> >       PLL_36XX_RATE(24 * MHZ,  32768001U, 131, 3, 5, 4719),
> >  };
> >
> > +static const struct samsung_pll_rate_table exynos5420_vpll_24mhz_tbl[]=
 __initconst =3D {
> > +     PLL_35XX_RATE(24 * MHZ, 600000000U, 200, 2, 2),
> > +     PLL_35XX_RATE(24 * MHZ, 543000000U, 181, 2, 2),
> > +     PLL_35XX_RATE(24 * MHZ, 533000000U, 533, 6, 2),
> > +     PLL_35XX_RATE(24 * MHZ, 480000000U, 320, 4, 2),
> > +     PLL_35XX_RATE(24 * MHZ, 420000000U, 140, 2, 2),
> > +     PLL_35XX_RATE(24 * MHZ, 350000000U, 175, 3, 2),
> > +     PLL_35XX_RATE(24 * MHZ, 266000000U, 266, 3, 3),
> > +     PLL_35XX_RATE(24 * MHZ, 177000000U, 118, 2, 3),
> > +     PLL_35XX_RATE(24 * MHZ, 100000000U, 200, 3, 4),
> > +};
>
> VPLL has the same PMS table with apll/kpll/bpll. You don't need to add ne=
w
> 'exynos5420_vpll_24mhz_tbl' table. Just adding the missing frequency entr=
ies
> to 'exynos5420_pll2550x_24mhz_tbl' table.
>
Thanks for your input. I will leave this for the expert to fix this.

> > +
> >  static struct samsung_pll_clock exynos5x_plls[nr_plls] __initdata =3D =
{
> >       [apll] =3D PLL(pll_2550, CLK_FOUT_APLL, "fout_apll", "fin_pll", A=
PLL_LOCK,
> >               APLL_CON0, NULL),
> > @@ -1428,6 +1440,7 @@ static void __init exynos5x_clk_init(struct devic=
e_node *np,
> >               exynos5x_plls[epll].rate_table =3D exynos5420_epll_24mhz_=
tbl;
> >               exynos5x_plls[kpll].rate_table =3D exynos5420_pll2550x_24=
mhz_tbl;
> >               exynos5x_plls[bpll].rate_table =3D exynos5420_pll2550x_24=
mhz_tbl;
> > +             exynos5x_plls[vpll].rate_table =3D exynos5420_vpll_24mhz_=
tbl;
> >       }
> >
> >       samsung_clk_register_pll(ctx, exynos5x_plls, ARRAY_SIZE(exynos5x_=
plls),
> >
>
>
> --
> Best Regards,
> Chanwoo Choi
> Samsung Electronics

Best Regards
-Anand

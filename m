From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2 1/7] cpufreq: cpufreq-cpu0: allow optional safe voltage during frequency transitions
Date: Wed, 05 Feb 2014 10:53:40 +0100
Message-ID: <13010531.fmC0N07svH@phil>
References: <1390047057-2239-1-git-send-email-thomas.ab@samsung.com> <2009408.gnUEcoqA3p@phil> <20140201041051.9977.46568@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:59047 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751995AbaBEJyY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Feb 2014 04:54:24 -0500
In-Reply-To: <20140201041051.9977.46568@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Thomas Abraham <ta.omasab@gmail.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, thomas.ab@samsung.com

Am Freitag, 31. Januar 2014, 20:10:51 schrieb Mike Turquette:
> Quoting Heiko St=FCbner (2014-01-30 07:09:04)
>=20
> > On Thursday, 30. January 2014 18:23:44 Thomas Abraham wrote:
> > > Hi Mike,
> > >=20
> > > On Wed, Jan 29, 2014 at 12:17 AM, Mike Turquette <mturquette@lina=
ro.org>
> >=20
> > wrote:
> > > > On Mon, Jan 27, 2014 at 9:30 PM, Thomas Abraham <ta.omasab@gmai=
l.com>
> >=20
> > wrote:
> > > >> Hi Mike,
> > > >>=20
> > > >> On Tue, Jan 28, 2014 at 1:55 AM, Mike Turquette
> > > >> <mturquette@linaro.org>
> >=20
> > wrote:
> > > >>> Quoting Thomas Abraham (2014-01-18 04:10:51)
> > > >=20
> > > > As far as I can tell
> > > > the remux does not happen because it is necessary to generate t=
he
> > > > required clock rate, but because we don't want to run the ARM c=
ore out
> > > > of spec for a short time while the PLL relocks. Assuming I have=
 that
> > > > part of it right, I prefer for the parent mux operation to be a=
 part
> > > > of the CPUfreq driver's .target callback instead of hidden away=
 in the
> > > > clock driver.
> > >=20
> > > The re-parenting is mostly done to keep the ARM CPU clocked while=
 the
> > > PLL is stopped, reprogrammed and restarted. One of the side effec=
ts of
> > > that is, the clock speed of the temporary parent could be higher =
then
> > > what is allowed due to the ARM voltage at the time of re-parentin=
g.
> > > That is the reason to use the safe voltage.
> >=20
> > The Rockchip-SoCs use something similar, so I'm following quite clo=
sely
> > what Thomas is trying to do here, as similar solution would also so=
lve
> > this issue for me.
> >=20
> > On some Rockchip-SoCs even stuff like pclk and hclk seems to be sou=
rced
> > from the divided armclk, creating additional constraints.
> >=20
> > But on the RKs (at least in the upstream sources) the armclk is sim=
ply
> > equal to the pll output. A divider exists, but is only used to make=
 sure
> > that the armclk stays below the original rate when sourced from the
> > temp-parent, like>=20
> >         if (clk_get_rate(temp_parent) > clk_get_rate(main_parent)
> >        =20
> >                 set_divider(something so that rate(temp) <=3D rate(=
main)
> >        =20
> >         clk_set_parent(...)
> >=20
> > Isn't there a similar possiblity on your platform, as it would remo=
ve the
> > need for the safe-voltage?
> >=20
> >=20
> > In general I also like the approach of hiding the rate-change logic=
 inside
> > this composite clock, as the depending clocks can be easily kept in=
 sync.
> > As with the Rockchips the depending clocks are different for each o=
f the
> > three Cortex-A9 SoCs I looked at, it would be "interesting" if all =
of
> > this would need to be done in a cpufreq driver.
>=20
> I wonder if hiding these details inside of the composite clock
> implementation indicates the lack of some needed feature in the clk
> core? I've discussed the idea of "coordinated rate changes" before. E=
=2Eg:
>=20
> _________________________________________________________
>=20
> |  clk	|  opp-low	|  opp-mid	|  opp-fast	|
> |
> |pll	| 300000	|  600000	|  600000	|
> |
> |div	| 150000	|  300000	|  600000	|
> |
> |mpu_clk| 150000	|  300000       |  600000	|
> |
> |periph	| 150000	|  150000	|  300000	|
>=20
> ---------------------------------------------------------
>=20
> A call to clk_set_rate() against any of those clocks will result in a=
ll
> of their dividers being updated. At the implementation level this mig=
ht
> look something like this extremely simplified pseudocode:
>=20
> int clk_set_rate(struct clk* clk, unsigned long rate)
> {
> 	/* trap clks that support coordinated rate changes */
> 	if (clk->ops->coordinate_rate)
> 		return clk->ops->coordinate_rate(clk->hw, rate);
> 	...
> }
>=20
> and,
>=20
> struct coord_rates {
> 	struct clk_hw *hw;
> 	struct clk *parent;
> 	struct clk *rate;
> };
>=20
> and in the clock driver,
>=20
> #define PLL 0
> #define DIV 1
> #define MPU 2
> #define PER 3
>=20
> #define NR_OPP 4
> #define NR_CLK 4
>=20
> struct coord_rates my_opps[NR_OPP][NR_CLK]; // populated from DT data
>=20
> int my_coordinate_rate_callback(struct clk_hw *hw, unsigned long rate=
)
> {
> 	struct coord_rate **selected_opp;
>=20
> 	for(i =3D 0; i < NR_OPP; i++) {
> 		for(j =3D 0; j < NR_CLK; j++) {
> 			if (my_opps[i][j]->hw =3D=3D hw &&
> 				my_opps[i][j]->rate =3D=3D rate)
> 				selected_opp =3D my_opps[i];
> 				break;
> 		}
> 	}
>=20
> 	/*
> 	 * order of operations is specific to my hardware and should be
> 	 * managed by my clock driver, not generic code
> 	 */
>=20
> 	__clk_set_parent(selected_opp[DIV]->hw, temp_parent);
> 	__clk_set_rate(selected_opp[PLL]->hw, selected_opp[PLL]->rate);
> 	__clk_set_parent(selected_opp[DIV]->hw,
> 				selected_opp[PLL]->hw->clk);
> 	...
>=20
> 	/*
> 	 * note that the above could be handled by a switch-case or
> 	 * something else
> 	 */
> }
>=20
> Thoughts? Please forgive any gaps in my logic or abuse of C.
>=20
> I have long thought that something like the above would someday go in=
to
> a generic dvfs layer instead of the clock framework, but maybe starti=
ng
> with the clk framework makes more sense?

Similar to Thomas, this looks like the thing I'd need for my core clock=
s.

Also to me this really looks like something belonging to the clock fram=
ework,=20
as we at this point really only have some clocks that in all cases need=
 to be=20
set together, independent of it beeing embedded in some scaling context=
 or=20
something else.


Heiko

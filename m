From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v2 1/7] cpufreq: cpufreq-cpu0: allow optional safe voltage during
 frequency transitions
Date: Fri, 31 Jan 2014 20:10:51 -0800
Message-ID: <20140201041051.9977.46568@quantum>
References: <1390047057-2239-1-git-send-email-thomas.ab@samsung.com>
 <CAPtuhTj2ZOb+5LDbqghuOhQZfVy8i1xuWotoZ6ocbJFgMxnSMQ@mail.gmail.com>
 <CAJuA9ajLUPtsReomPuuzMpshTEiUz81sc4584DEVQnG=iwGb-g@mail.gmail.com>
 <2009408.gnUEcoqA3p@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <2009408.gnUEcoqA3p@phil>
Sender: cpufreq-owner@vger.kernel.org
To: =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Thomas Abraham <ta.omasab@gmail.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, thomas.ab@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Heiko St=C3=BCbner (2014-01-30 07:09:04)
> On Thursday, 30. January 2014 18:23:44 Thomas Abraham wrote:
> > Hi Mike,
> >=20
> > On Wed, Jan 29, 2014 at 12:17 AM, Mike Turquette <mturquette@linaro=
=2Eorg>=20
> wrote:
> > > On Mon, Jan 27, 2014 at 9:30 PM, Thomas Abraham <ta.omasab@gmail.=
com>=20
> wrote:
> > >> Hi Mike,
> > >>=20
> > >> On Tue, Jan 28, 2014 at 1:55 AM, Mike Turquette <mturquette@lina=
ro.org>=20
> wrote:
> > >>> Quoting Thomas Abraham (2014-01-18 04:10:51)
> > >>>=20
> > > As far as I can tell
> > > the remux does not happen because it is necessary to generate the
> > > required clock rate, but because we don't want to run the ARM cor=
e out
> > > of spec for a short time while the PLL relocks. Assuming I have t=
hat
> > > part of it right, I prefer for the parent mux operation to be a p=
art
> > > of the CPUfreq driver's .target callback instead of hidden away i=
n the
> > > clock driver.
> >=20
> > The re-parenting is mostly done to keep the ARM CPU clocked while t=
he
> > PLL is stopped, reprogrammed and restarted. One of the side effects=
 of
> > that is, the clock speed of the temporary parent could be higher th=
en
> > what is allowed due to the ARM voltage at the time of re-parenting.
> > That is the reason to use the safe voltage.
>=20
> The Rockchip-SoCs use something similar, so I'm following quite close=
ly what=20
> Thomas is trying to do here, as similar solution would also solve thi=
s issue=20
> for me.
>=20
> On some Rockchip-SoCs even stuff like pclk and hclk seems to be sourc=
ed from=20
> the divided armclk, creating additional constraints.
>=20
> But on the RKs (at least in the upstream sources) the armclk is simpl=
y equal=20
> to the pll output. A divider exists, but is only used to make sure th=
at the=20
> armclk stays below the original rate when sourced from the temp-paren=
t, like
>=20
>         if (clk_get_rate(temp_parent) > clk_get_rate(main_parent)
>                 set_divider(something so that rate(temp) <=3D rate(ma=
in)
>         clk_set_parent(...)
>=20
> Isn't there a similar possiblity on your platform, as it would remove=
 the need=20
> for the safe-voltage?
>=20
>=20
> In general I also like the approach of hiding the rate-change logic i=
nside=20
> this composite clock, as the depending clocks can be easily kept in s=
ync. As=20
> with the Rockchips the depending clocks are different for each of the=
 three=20
> Cortex-A9 SoCs I looked at, it would be "interesting" if all of this =
would=20
> need to be done in a cpufreq driver.

I wonder if hiding these details inside of the composite clock
implementation indicates the lack of some needed feature in the clk
core? I've discussed the idea of "coordinated rate changes" before. E.g=
:

_________________________________________________________
|  clk	|  opp-low	|  opp-mid	|  opp-fast	|
|	|		|		|		|
|pll	| 300000	|  600000	|  600000	|
|	|		|		|		|
|div	| 150000	|  300000	|  600000	|
|	|		|		|		|
|mpu_clk| 150000	|  300000       |  600000	|
|	|		|		|		|
|periph	| 150000	|  150000	|  300000	|
---------------------------------------------------------

A call to clk_set_rate() against any of those clocks will result in all
of their dividers being updated. At the implementation level this might
look something like this extremely simplified pseudocode:

int clk_set_rate(struct clk* clk, unsigned long rate)
{
	/* trap clks that support coordinated rate changes */
	if (clk->ops->coordinate_rate)
		return clk->ops->coordinate_rate(clk->hw, rate);
	...
}

and,

struct coord_rates {
	struct clk_hw *hw;
	struct clk *parent;
	struct clk *rate;
};

and in the clock driver,

#define PLL 0
#define DIV 1
#define MPU 2
#define PER 3

#define NR_OPP 4
#define NR_CLK 4

struct coord_rates my_opps[NR_OPP][NR_CLK]; // populated from DT data

int my_coordinate_rate_callback(struct clk_hw *hw, unsigned long rate)
{
	struct coord_rate **selected_opp;

	for(i =3D 0; i < NR_OPP; i++) {
		for(j =3D 0; j < NR_CLK; j++) {
			if (my_opps[i][j]->hw =3D=3D hw &&
				my_opps[i][j]->rate =3D=3D rate)
				selected_opp =3D my_opps[i];
				break;
		}
	}

	/*
	 * order of operations is specific to my hardware and should be
	 * managed by my clock driver, not generic code
	 */

	__clk_set_parent(selected_opp[DIV]->hw, temp_parent);
	__clk_set_rate(selected_opp[PLL]->hw, selected_opp[PLL]->rate);
	__clk_set_parent(selected_opp[DIV]->hw,
				selected_opp[PLL]->hw->clk);
	...

	/*
	 * note that the above could be handled by a switch-case or
	 * something else
	 */
}

Thoughts? Please forgive any gaps in my logic or abuse of C.

I have long thought that something like the above would someday go into
a generic dvfs layer instead of the clock framework, but maybe starting
with the clk framework makes more sense?

Regards,
Mike

>=20
>=20
> Heiko
>=20

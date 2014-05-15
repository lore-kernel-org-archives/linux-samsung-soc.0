From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v4 3/8] clk: samsung: add infrastructure to register cpu clocks
Date: Thu, 15 May 2014 22:12:15 +0200
Message-ID: <3283853.4gaNQ8iXN1@phil>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com> <12969374.fAYJcpG05n@phil> <CAD=FV=VGWxgy+snupOzmKQxNPbGb95vGL0KhQFaSL9m_dx84wQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=VGWxgy+snupOzmKQxNPbGb95vGL0KhQFaSL9m_dx84wQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Thomas Abraham <ta.omasab@gmail.com>, cpufreq@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, l.majewski@samsung.com, Viresh Kumar <viresh.kumar@linaro.org>, Thomas P Abraham <thomas.ab@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Doug,

Am Donnerstag, 15. Mai 2014, 12:36:45 schrieb Doug Anderson:
> On Thu, May 15, 2014 at 12:17 PM, Heiko St=FCbner <heiko@sntech.de> w=
rote:
> > Am Donnerstag, 15. Mai 2014, 11:18:44 schrieb Doug Anderson:
> >> Thomas,
> >>=20
> >> On Tue, May 13, 2014 at 6:11 PM, Thomas Abraham <ta.omasab@gmail.c=
om>=20
wrote:
> >> > From: Thomas Abraham <thomas.ab@samsung.com>
> >> > +static int exynos4210_armclk_pre_rate_change(struct clk_notifie=
r_data
> >> > *ndata, +                       struct exynos_cpuclk *armclk, vo=
id
> >> > __iomem *base) +{
> >> > +       struct exynos4210_armclk_data *armclk_data =3D armclk->d=
ata;
> >> > +       unsigned long alt_prate =3D clk_get_rate(armclk->alt_par=
ent);
> >> > +       unsigned long alt_div, div0, div1, tdiv0, mux_reg;
> >> > +       unsigned long cur_armclk_rate, timeout;
> >> > +       unsigned long flags;
> >> > +
> >> > +       /* find out the divider values to use for clock data */
> >> > +       while (armclk_data->prate !=3D ndata->new_rate) {
> >> > +               if (armclk_data->prate =3D=3D 0)
> >> > +                       return -EINVAL;
> >> > +               armclk_data++;
> >> > +       }
> >> > +
> >> > +       div0 =3D armclk_data->div0;
> >> > +       div1 =3D armclk_data->div1;
> >> > +       if (readl(base + SRC_CPU) & EXYNOS4210_MUX_HPM_MASK) {
> >> > +               div1 =3D readl(base + DIV_CPU1) &
> >> > EXYNOS4210_DIV1_HPM_MASK;
> >> > +               div1 |=3D ((armclk_data->div1) &
> >> > ~EXYNOS4210_DIV1_HPM_MASK);
> >> > +       }
> >> > +
> >> > +       /*
> >> > +        * if the new and old parent clock speed is less than th=
e clock
> >> > speed +        * of the alternate parent, then it should be ensu=
red
> >> > that
> >> > at no point +        * the armclk speed is more than the old_pra=
te
> >> > until
> >> > the dividers are +        * set.
> >> > +        */
> >> > +       tdiv0 =3D readl(base + DIV_CPU0);
> >> > +       cur_armclk_rate =3D ndata->old_rate / EXYNOS4210_ARM_DIV=
1(tdiv0)
> >> > /
> >> > +                               EXYNOS4210_ARM_DIV2(tdiv0);
> >> > +       if (alt_prate > cur_armclk_rate) {
> >> > +               alt_div =3D _calc_div(alt_prate, cur_armclk_rate=
);
> >> > +               _exynos4210_set_armclk_div(base, alt_div);
> >> > +               div0 |=3D alt_div;
> >>=20
> >> Don't you need to up the voltage here, too?  ...I haven't reviewed
> >> this whole patch (so perhaps it's elsewhere in the patch or in the
> >> series), but I stumbled upon this while trying to solve a differen=
t
> >> problem and figured I'd check...
> >=20
> > setting the voltage should be done by the cpufreq driver like cpufr=
eq-cpu0
> > - whose usage this series intents to allow.
> >=20
> > As I've hijacked Thomas' concept for my current rockchip clock work=
, I've
> > already seen this working nicely :-) .
>=20
> I guess I should have been more clear.  I was talking more
> specifically about upping the voltage as part of the mux switch in th=
e
> case that alt_prate > cur_armclk_rate.

from earlier discussions I remember Thomas and me talked about setting =
a=20
divider to make sure that alt_prate <=3D cur_armclk_rate, so the voltag=
e can=20
stay at its current level. I haven't looked deeply into this revision, =
but the=20
last one did exactly this.


> ...if you're switching from 200MHz to 300MHz and the alt_prate is
> 800MHz, you need to account for that fact.  The code here accounts fo=
r
> the fact in setting the "armclk_div", but (I don't think) it accounts
> for the fact that 800MHz will need a higher voltage.
>=20
> As per a separate discussion, a clean solution might be to move the
> mux switching to the core of CPU_FREQ.  That would have the side
> effect of also making it very easy to send notifications.

I'll just wait until you all decide what the best solution is :-), but=20
personally I like the concept of keeping the clock logic inside the clo=
ck=20
driver, especially as this is not limited to setting the mux but also a=
dapting=20
tightly bound child clocks and this all may not fit into a generic=20
implementation of a cpufreq driver.

And this is also working really nice on my rockchip platform.


Heiko

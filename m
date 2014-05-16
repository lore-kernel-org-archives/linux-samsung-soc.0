From: Thomas Abraham <ta.omasab@gmail.com>
Subject: Re: [PATCH v4 3/8] clk: samsung: add infrastructure to register cpu clocks
Date: Fri, 16 May 2014 10:25:57 +0530
Message-ID: <CAJuA9ahOu6GS+HujTXktvmJN63bxujBqSNekZigmdkaMaQa-OQ@mail.gmail.com>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
	<12969374.fAYJcpG05n@phil>
	<CAD=FV=VGWxgy+snupOzmKQxNPbGb95vGL0KhQFaSL9m_dx84wQ@mail.gmail.com>
	<3283853.4gaNQ8iXN1@phil>
	<CAD=FV=XLLprb_2yyFnngGibrch2BgNnf93LnH+eV2VbgD=o5Kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:41551 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752725AbaEPEz7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 May 2014 00:55:59 -0400
In-Reply-To: <CAD=FV=XLLprb_2yyFnngGibrch2BgNnf93LnH+eV2VbgD=o5Kg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>

On Fri, May 16, 2014 at 1:56 AM, Doug Anderson <dianders@chromium.org> =
wrote:
> Heiko,
>
> On Thu, May 15, 2014 at 1:12 PM, Heiko St=C3=BCbner <heiko@sntech.de>=
 wrote:
>> Hi Doug,
>>
>> Am Donnerstag, 15. Mai 2014, 12:36:45 schrieb Doug Anderson:
>>> On Thu, May 15, 2014 at 12:17 PM, Heiko St=C3=BCbner <heiko@sntech.=
de> wrote:
>>> > Am Donnerstag, 15. Mai 2014, 11:18:44 schrieb Doug Anderson:
>>> >> Thomas,
>>> >>
>>> >> On Tue, May 13, 2014 at 6:11 PM, Thomas Abraham <ta.omasab@gmail=
=2Ecom>
>> wrote:
>>> >> > From: Thomas Abraham <thomas.ab@samsung.com>
>>> >> > +static int exynos4210_armclk_pre_rate_change(struct clk_notif=
ier_data
>>> >> > *ndata, +                       struct exynos_cpuclk *armclk, =
void
>>> >> > __iomem *base) +{
>>> >> > +       struct exynos4210_armclk_data *armclk_data =3D armclk-=
>data;
>>> >> > +       unsigned long alt_prate =3D clk_get_rate(armclk->alt_p=
arent);
>>> >> > +       unsigned long alt_div, div0, div1, tdiv0, mux_reg;
>>> >> > +       unsigned long cur_armclk_rate, timeout;
>>> >> > +       unsigned long flags;
>>> >> > +
>>> >> > +       /* find out the divider values to use for clock data *=
/
>>> >> > +       while (armclk_data->prate !=3D ndata->new_rate) {
>>> >> > +               if (armclk_data->prate =3D=3D 0)
>>> >> > +                       return -EINVAL;
>>> >> > +               armclk_data++;
>>> >> > +       }
>>> >> > +
>>> >> > +       div0 =3D armclk_data->div0;
>>> >> > +       div1 =3D armclk_data->div1;
>>> >> > +       if (readl(base + SRC_CPU) & EXYNOS4210_MUX_HPM_MASK) {
>>> >> > +               div1 =3D readl(base + DIV_CPU1) &
>>> >> > EXYNOS4210_DIV1_HPM_MASK;
>>> >> > +               div1 |=3D ((armclk_data->div1) &
>>> >> > ~EXYNOS4210_DIV1_HPM_MASK);
>>> >> > +       }
>>> >> > +
>>> >> > +       /*
>>> >> > +        * if the new and old parent clock speed is less than =
the clock
>>> >> > speed +        * of the alternate parent, then it should be en=
sured
>>> >> > that
>>> >> > at no point +        * the armclk speed is more than the old_p=
rate
>>> >> > until
>>> >> > the dividers are +        * set.
>>> >> > +        */
>>> >> > +       tdiv0 =3D readl(base + DIV_CPU0);
>>> >> > +       cur_armclk_rate =3D ndata->old_rate / EXYNOS4210_ARM_D=
IV1(tdiv0)
>>> >> > /
>>> >> > +                               EXYNOS4210_ARM_DIV2(tdiv0);
>>> >> > +       if (alt_prate > cur_armclk_rate) {
>>> >> > +               alt_div =3D _calc_div(alt_prate, cur_armclk_ra=
te);
>>> >> > +               _exynos4210_set_armclk_div(base, alt_div);
>>> >> > +               div0 |=3D alt_div;
>>> >>
>>> >> Don't you need to up the voltage here, too?  ...I haven't review=
ed
>>> >> this whole patch (so perhaps it's elsewhere in the patch or in t=
he
>>> >> series), but I stumbled upon this while trying to solve a differ=
ent
>>> >> problem and figured I'd check...
>>> >
>>> > setting the voltage should be done by the cpufreq driver like cpu=
freq-cpu0
>>> > - whose usage this series intents to allow.
>>> >
>>> > As I've hijacked Thomas' concept for my current rockchip clock wo=
rk, I've
>>> > already seen this working nicely :-) .
>>>
>>> I guess I should have been more clear.  I was talking more
>>> specifically about upping the voltage as part of the mux switch in =
the
>>> case that alt_prate > cur_armclk_rate.
>>
>> from earlier discussions I remember Thomas and me talked about setti=
ng a
>> divider to make sure that alt_prate <=3D cur_armclk_rate, so the vol=
tage can
>> stay at its current level. I haven't looked deeply into this revisio=
n, but the
>> last one did exactly this.
>
> Ah-ha, that's a reasonable solution to this problem.  I was familiar
> with the old code and know that it used to set the CPUD ratio here, s=
o
> I assumed that was what Thomas's code did.  ...but you're right, his
> code is setting the divider here.  I didn't double-check all of his
> code / calculations, but he's certainly tweaking the right bits.
>
> Nice!
>
>
>>> ...if you're switching from 200MHz to 300MHz and the alt_prate is
>>> 800MHz, you need to account for that fact.  The code here accounts =
for
>>> the fact in setting the "armclk_div", but (I don't think) it accoun=
ts
>>> for the fact that 800MHz will need a higher voltage.
>>>
>>> As per a separate discussion, a clean solution might be to move the
>>> mux switching to the core of CPU_FREQ.  That would have the side
>>> effect of also making it very easy to send notifications.
>>
>> I'll just wait until you all decide what the best solution is :-), b=
ut
>> personally I like the concept of keeping the clock logic inside the =
clock
>> driver, especially as this is not limited to setting the mux but als=
o adapting
>> tightly bound child clocks and this all may not fit into a generic
>> implementation of a cpufreq driver.

+1. I also prefer to go with this approach.

>
> Yup, I didn't think of the solution you guys came up with.  Your
> solution handles things nicely.
>
> Thanks!
>
> -Doug

Doug,

Heiko had suggested to use the divider to keep the armclk within
limits during the frequency transition. This helped to avoid the
corresponding voltage scaling step which greatly simplified the
frequency scaling for exynos. We definitely plan to use the same
suggestion on other exynos platforms as well.

Thanks,
Thomas.

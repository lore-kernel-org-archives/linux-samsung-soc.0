From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 3/8] clk: samsung: add infrastructure to register cpu clocks
Date: Thu, 15 May 2014 13:26:11 -0700
Message-ID: <CAD=FV=XLLprb_2yyFnngGibrch2BgNnf93LnH+eV2VbgD=o5Kg@mail.gmail.com>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
	<12969374.fAYJcpG05n@phil>
	<CAD=FV=VGWxgy+snupOzmKQxNPbGb95vGL0KhQFaSL9m_dx84wQ@mail.gmail.com>
	<3283853.4gaNQ8iXN1@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:34364 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754824AbaEOU0M convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 May 2014 16:26:12 -0400
Received: by mail-vc0-f174.google.com with SMTP id lh14so5054499vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2014 13:26:11 -0700 (PDT)
In-Reply-To: <3283853.4gaNQ8iXN1@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Thomas Abraham <ta.omasab@gmail.com>, cpufreq@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, l.majewski@samsung.com, Viresh Kumar <viresh.kumar@linaro.org>, Thomas P Abraham <thomas.ab@samsung.com>

Heiko,

On Thu, May 15, 2014 at 1:12 PM, Heiko St=C3=BCbner <heiko@sntech.de> w=
rote:
> Hi Doug,
>
> Am Donnerstag, 15. Mai 2014, 12:36:45 schrieb Doug Anderson:
>> On Thu, May 15, 2014 at 12:17 PM, Heiko St=C3=BCbner <heiko@sntech.d=
e> wrote:
>> > Am Donnerstag, 15. Mai 2014, 11:18:44 schrieb Doug Anderson:
>> >> Thomas,
>> >>
>> >> On Tue, May 13, 2014 at 6:11 PM, Thomas Abraham <ta.omasab@gmail.=
com>
> wrote:
>> >> > From: Thomas Abraham <thomas.ab@samsung.com>
>> >> > +static int exynos4210_armclk_pre_rate_change(struct clk_notifi=
er_data
>> >> > *ndata, +                       struct exynos_cpuclk *armclk, v=
oid
>> >> > __iomem *base) +{
>> >> > +       struct exynos4210_armclk_data *armclk_data =3D armclk->=
data;
>> >> > +       unsigned long alt_prate =3D clk_get_rate(armclk->alt_pa=
rent);
>> >> > +       unsigned long alt_div, div0, div1, tdiv0, mux_reg;
>> >> > +       unsigned long cur_armclk_rate, timeout;
>> >> > +       unsigned long flags;
>> >> > +
>> >> > +       /* find out the divider values to use for clock data */
>> >> > +       while (armclk_data->prate !=3D ndata->new_rate) {
>> >> > +               if (armclk_data->prate =3D=3D 0)
>> >> > +                       return -EINVAL;
>> >> > +               armclk_data++;
>> >> > +       }
>> >> > +
>> >> > +       div0 =3D armclk_data->div0;
>> >> > +       div1 =3D armclk_data->div1;
>> >> > +       if (readl(base + SRC_CPU) & EXYNOS4210_MUX_HPM_MASK) {
>> >> > +               div1 =3D readl(base + DIV_CPU1) &
>> >> > EXYNOS4210_DIV1_HPM_MASK;
>> >> > +               div1 |=3D ((armclk_data->div1) &
>> >> > ~EXYNOS4210_DIV1_HPM_MASK);
>> >> > +       }
>> >> > +
>> >> > +       /*
>> >> > +        * if the new and old parent clock speed is less than t=
he clock
>> >> > speed +        * of the alternate parent, then it should be ens=
ured
>> >> > that
>> >> > at no point +        * the armclk speed is more than the old_pr=
ate
>> >> > until
>> >> > the dividers are +        * set.
>> >> > +        */
>> >> > +       tdiv0 =3D readl(base + DIV_CPU0);
>> >> > +       cur_armclk_rate =3D ndata->old_rate / EXYNOS4210_ARM_DI=
V1(tdiv0)
>> >> > /
>> >> > +                               EXYNOS4210_ARM_DIV2(tdiv0);
>> >> > +       if (alt_prate > cur_armclk_rate) {
>> >> > +               alt_div =3D _calc_div(alt_prate, cur_armclk_rat=
e);
>> >> > +               _exynos4210_set_armclk_div(base, alt_div);
>> >> > +               div0 |=3D alt_div;
>> >>
>> >> Don't you need to up the voltage here, too?  ...I haven't reviewe=
d
>> >> this whole patch (so perhaps it's elsewhere in the patch or in th=
e
>> >> series), but I stumbled upon this while trying to solve a differe=
nt
>> >> problem and figured I'd check...
>> >
>> > setting the voltage should be done by the cpufreq driver like cpuf=
req-cpu0
>> > - whose usage this series intents to allow.
>> >
>> > As I've hijacked Thomas' concept for my current rockchip clock wor=
k, I've
>> > already seen this working nicely :-) .
>>
>> I guess I should have been more clear.  I was talking more
>> specifically about upping the voltage as part of the mux switch in t=
he
>> case that alt_prate > cur_armclk_rate.
>
> from earlier discussions I remember Thomas and me talked about settin=
g a
> divider to make sure that alt_prate <=3D cur_armclk_rate, so the volt=
age can
> stay at its current level. I haven't looked deeply into this revision=
, but the
> last one did exactly this.

Ah-ha, that's a reasonable solution to this problem.  I was familiar
with the old code and know that it used to set the CPUD ratio here, so
I assumed that was what Thomas's code did.  ...but you're right, his
code is setting the divider here.  I didn't double-check all of his
code / calculations, but he's certainly tweaking the right bits.

Nice!


>> ...if you're switching from 200MHz to 300MHz and the alt_prate is
>> 800MHz, you need to account for that fact.  The code here accounts f=
or
>> the fact in setting the "armclk_div", but (I don't think) it account=
s
>> for the fact that 800MHz will need a higher voltage.
>>
>> As per a separate discussion, a clean solution might be to move the
>> mux switching to the core of CPU_FREQ.  That would have the side
>> effect of also making it very easy to send notifications.
>
> I'll just wait until you all decide what the best solution is :-), bu=
t
> personally I like the concept of keeping the clock logic inside the c=
lock
> driver, especially as this is not limited to setting the mux but also=
 adapting
> tightly bound child clocks and this all may not fit into a generic
> implementation of a cpufreq driver.

Yup, I didn't think of the solution you guys came up with.  Your
solution handles things nicely.

Thanks!

-Doug

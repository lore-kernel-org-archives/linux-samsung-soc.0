From: Lukasz Majewski <l.majewski@majess.pl>
Subject: Re: [PATCH 3/6] clk: samsung: register cpu clock provider for
 exynos4210 SoC
Date: Sun, 12 Jan 2014 13:41:52 +0100
Message-ID: <20140112134152.58d393f0@jawa>
References: <1389283165-17708-1-git-send-email-thomas.ab@samsung.com>
	<1389283165-17708-4-git-send-email-thomas.ab@samsung.com>
	<20140110130424.6aa78438@amdc2363>
	<CAJuA9aidWvkPPXFfOysqQCQ4d7q_y51zbYxHCK9d-E8+ojfN_w@mail.gmail.com>
	<20140110151812.5104cc92@amdc2363>
	<CAJuA9aj3ca9VNsQ9cadVH8pUpyYeaht3DufT3DW4jXuEN5BudA@mail.gmail.com>
	<52D1FB94.1030006@gmail.com>
	<20140112092330.4baa2c77@jawa>
	<52D2851B.50200@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/jwGEyvwZaF4jFn=Z+H7VMwk"; protocol="application/pgp-signature"
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <52D2851B.50200@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Thomas Abraham <ta.omasab@gmail.com>
Cc: thomas.ab@samsung.com, Lukasz Majewski <l.majewski@samsung.com>, devicetree@vger.kernel.org, kgene.kim@samsung.com, Viresh Kumar <viresh.kumar@linaro.org>, t.figa@samsung.com, cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

--Sig_/jwGEyvwZaF4jFn=Z+H7VMwk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sun, 12 Jan 2014 13:05:47 +0100
Tomasz Figa <tomasz.figa@gmail.com> wrote:

> On 12.01.2014 09:23, Lukasz Majewski wrote:
> > Dear All,
> >
> >> On 11.01.2014 06:25, Thomas Abraham wrote:
> >>> On Fri, Jan 10, 2014 at 7:48 PM, Lukasz Majewski
> >>> <l.majewski@samsung.com> wrote:
> >>>>> On Fri, Jan 10, 2014 at 5:34 PM, Lukasz Majewski
> >>>>> <l.majewski@samsung.com> wrote:
> [snip]
> >>>>>>> +
> >>>>>>> +static const struct samsung_core_clock_freq_table
> >>>>>>> exyno4210_armclk_table =3D {
> >>>>>>> +     .freq           =3D exynos4210_armclk_freqs,
> >>>>>>> +     .freq_count     =3D ARRAY_SIZE(exynos4210_armclk_freqs),
> >>>>>>> +     .data           =3D (void *)exynos4210_armclk_data,
> >>>>>>> +};
> >>>>>>> +
> >>>>>>> +static int exynos4210_armclk_set_rate(struct clk_hw *hw,
> >>>>>>> unsigned long drate,
> >>>>>>> +                                     unsigned long prate)
> >>>>>>> +{
> >>>>>>> +     struct samsung_core_clock *armclk;
> >>>>>>> +     const struct samsung_core_clock_freq_table *freq_tbl;
> >>>>>>> +     unsigned long *freq_data;
> >>>>>>> +     unsigned long mux_reg, idx;
> >>>>>>> +     void __iomem *base;
> >>>>>>> +
> >>>>>>> +     if (drate =3D=3D prate)
> >>>>>>> +             return 0;
> >>>>>>> +
> >>>>>>> +     armclk =3D container_of(hw, struct samsung_core_clock,
> >>>>>>> hw);
> >>>>>>> +     freq_tbl =3D armclk->freq_table;
> >>>>>>> +     freq_data =3D (unsigned long *)freq_tbl->data;
> >>>>>>> +     base =3D armclk->ctrl_base;
> >>>>>>> +
> >>>>>>> +     for (idx =3D 0; idx < freq_tbl->freq_count; idx++,
> >>>>>>> freq_data +=3D 2)
> >>>>>>> +             if ((freq_tbl->freq[idx] * 1000) =3D=3D drate)
> >>>>>>> +                     break;
> >>>>>>> +
> >>>>>>> +     if (!armclk->fout_pll)
> >>>>>>> +             armclk->fout_pll =3D __clk_lookup("fout_apll");\
> >>>>>>                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^[=
*]
> >>>>>>
> >>>>>> I'm a bit confused here for two reasons. Please correct me if
> >>>>>> I'm wrong.
> >>>>>>
> >>>>>> 1. You go into this ->set_rate() because of calling
> >>>>>> clk_set_rate at "arm_clk" clock (numbered as 12 at
> >>>>>> clk-exynos4.c) at cpufreq-cpu0.c
> >>>>>>
> >>>>>> In a Exynos4210 we have:
> >>>>>> XXTI-> APLL -> fout_apll -> mout_apll -> mout_core -> div_core
> >>>>>> -> div_core2 -> arm_clk
> >>>>>>
> >>>>>> In the code you call directly the fout_apll which changes
> >>>>>> frequency. Then the change shall be propagated to all
> >>>>>> registered clocks.
> >>>>>> I think, that DIV and DIV1 shall be reduced before PLL change
> >>>>>> [*], to reflect the changes at CCF.
> >>>>>
> >>>>> The core clock implementation encapsulates multiple clock blocks
> >>>>> (such as dividers and muxes) which are in between the output of
> >>>>> the APLL and the point that actually is the cpu domain clock
> >>>>> output.
> >>>>
> >>>> No problem with that. I mostly agree...
> >>>>
> >>>>> When a clock
> >>>>> frequency change has to be made, all these clock blocks
> >>>>> encapsulated within the core clock are programmed by
> >>>>> pre-determined values.
> >>>>
> >>>> And what about the situation with already defined clocks (like
> >>>> "div_core" and "div_core2"). Those will not be updated when you
> >>>> first call clk_set_rate() and change by hand DIV and DIV1.
> >>>>
> >>>> What if you would like to have the PCLK_DBG clock used in the
> >>>> future? You would add it to CCF and the change will not
> >>>> propagate.
> >>>
> >>> I did intend to remove individual clock blocks which are now
> >>> encapsulated within the core clock type from the clock driver
> >>> file. I missed doing that in this patch series.
> >>
> >> Yes, they should be removed, since they are encapsulated inside the
> >> core clock now.
> >
> > This was not my point here.
> >
> > You are creating an opaque clock for cpu (like
> > "samsung_clock_cpu" [*]) , which encapsulates many other clocks
> > (mostly DIVs and MUXes to be more precise).
> >
> > I don't think, that those clocks shall be removed from CCF.
> >
> > I do believe, that they shall be passed as the argument to [*] and
> > recalculated.
> >
> > Why the advent of [*] clock forbids me from creating and using
> > clocks based on "div_core", "div_core2" and PCLK_DBG?
> >
> > What if I would like to see output of those particular clocks
> > at /sys/kernel/debug/ or use them at a custom driver?
>=20
> Having those clocks defined as separate entities in CCF would make
> them accessible outside the core clock, including changing their=20
> configuration, but they should be only changed on APLL change and=20
> atomically. By registering them as standard CCF clocks you are
> providing an interface to something that is not allowed.
>=20
> If there was a _real_ need to have them defined as separate clocks,
> you would have to implement a separate clock type that would only
> allow retrieving the rate from it. Maybe a read-only flag for the
> divider clock could do, as mux clock already has such.

To not create unrealistic use cases, we can export those clocks as read
only (to allow them to be visible at /sys/kernel/debug).

Also we can design the code with future write extension in back of our
heads.

>=20
> >
> >>
> >>>
> >>>>
> >>>>> This
> >>>>> approach allows very fast clock speed switching, instead of
> >>>>> traversing the entire CCF clock tree searching for individual
> >>>>> clock blocks to be programmed.
> >>>>
> >>>> Those are mostly DIV and MUXes. Recalculation shouldn't be time
> >>>> consuming.
> >>>
> >>> I was mainly referring to the time taken to search the clock tree
> >>> for these individual clock blocks.
> >>
> >> Hmm, why couldn't you simply look-up all the needed clock at
> >> initialization and keep references to them?
> >
> > +1
> >
> >>
> >> Still, I think it is fine to directly program registers of
> >> encapsulated clocks,
> >
> > And then recalculate values of relevant clocks build on top of those
> > registers.
> >
> >> since they are not visible outside anymore and
> >> there is no need for them to be visible.
> >
> > Why do you assume, that those clocks won't be needed anymore? For me
> > clocks like [*] are valid clocks from CCF/user point of view.
>=20
> I fail to see any use cases for them. Even now from 7 of core clock=20
> dividers of Exynos4210, in clk-exynos4.c only div_core and div_core2
> are defined.
>=20
> Then as I noted above, the values set to those internal blocks are=20
> completely tied to used APLL setting and you can't change them=20
> separately. Any potential use case would be limited to reading the=20
> frequency.
>=20
> >
> >>
> >>>
> >>>>
> >>>>>
> >>>>>>
> >>>>>>
> >>>>>>> +
> >>>>>>> +     if (drate < prate) {
> >>>>>>> +             mux_reg =3D readl(base + SRC_CPU);
> >>>>>>> +             writel(mux_reg | (1 << 16), base + SRC_CPU);
> >>>>>>> +             while (((readl(base + STAT_CPU) >> 16) & 0x7) !=3D
> >>>>>>> 2)
> >>>>>>> +                     ;
> >>>>>>                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ [**]
> >>>>>>
> >>>>>> 2. I think, the above shall be done in a following way:
> >>>>>>
> >>>>>>           clk_set_parent(mout_core, mout_mpll);
> >>>>>>           clk_set_rate(armclk->fout_pll, drate);
> >>>>>>           clk_set_parent(mout_core, mout_apll);
> >>>>>>
> >>>>>> The direct write to registers [**] doesn't look compliant to
> >>>>>> CCF.
> >>>>>>
> >>>>>
> >>>>> As mentioned above, the clock block encapsulates these clock
> >>>>> blocks into a single clock and only this single encapsulated
> >>>>> clock is registered with CCF. The internal implementation of how
> >>>>> the different clock blocks are managed within this clock is
> >>>>> independent of the CCF.
> >>>>
> >>>> I agree, that the CPU_DIV and CPU_DIV1 shall be changed
> >>>> atomically (without CCF).
> >>>>
> >>>> But on the situation [**] the MUX can be changed by
> >>>> clk_set_parent() as it is now done at exynosXXXX-cpufreq.c code.
> >>>
> >>> The mux is also encapsulated into a larger clock type and this new
> >>> clock type know how the mux has to be configured.
> >>
> >> IMHO it's fine to encapsulate the mux as well. There are no users
> >> of it other than the core clock.
> >
> > In spite of the above comment, it looks far more better to change
> > clocks with CCF API (like clk_set_parent), not by writing directly
> > to registers.
>=20
> This also depends on whether other entities should be able to=20
> reconfigure the mux in question. If it needs to be switched only when=20
> the APLL is reconfigured by core clock, then I don't think there is a=20
> need to provide access to it outside.

The mout_apll and mout_mpll are important clocks for the platform. For
this reason I'd prefer them to be exported and up to date.

>=20
> Best regards,
> Tomasz

Best regards,
Lukasz Majewski

--Sig_/jwGEyvwZaF4jFn=Z+H7VMwk
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlLSjZAACgkQf9/hG2YwgjHztACfWLXehWxdBFVXBeqzvyZE78AD
ncYAnjUJh8If3gIlJGDxHqIabYmnZ+Kj
=tTox
-----END PGP SIGNATURE-----

--Sig_/jwGEyvwZaF4jFn=Z+H7VMwk--

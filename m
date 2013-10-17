From: Dave Martin <Dave.Martin@arm.com>
Subject: Re: [PATCH v2 3/4] ARM: EXYNOS: add Exynos Dual Cluster Support
Date: Thu, 17 Oct 2013 17:49:33 +0100
Message-ID: <20131017164933.GG2442@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Heiko Stuebner <heiko@sntech.de>, linux-doc@vger.kernel.org, Naour Romain <romain.naour@openwide.fr>, Tarek Dakhran <t.dakhran@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Vyacheslav Tyrtov <v.tyrtov@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Mike Turquette <mturquette@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Landley <rob@landley.net>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Oct 17, 2013 at 06:04:13PM +0200, Daniel Lezcano wrote:
> On 10/17/2013 04:32 PM, Dave Martin wrote:
> > On Thu, Oct 17, 2013 at 12:45:29PM +0200, Daniel Lezcano wrote:
> >> On 10/14/2013 05:08 PM, Vyacheslav Tyrtov wrote:
> >>> From: Tarek Dakhran <t.dakhran@samsung.com>
> >>>=20
> >>> Add EDCS(Exynos Dual Cluster Support) for Samsung Exynos5410 SoC.
> >>> This enables all 8 cores, 4 x A7 and 4 x A15 run at the same time=
=2E
> >=20
> > [...]
> >=20
> >>> +	__mcpm_cpu_down(cpu, cluster);
> >>> +
> >>> +	if (!skip_wfi) {
> >>> +		exynos_core_power_down(cpu, cluster);
> >>> +		wfi();
> >>> +	}
> >>> +}
> >>=20
> >> I did not looked line by line but these functions looks very simil=
ar
> >> than the tc2_pm.c's function. no ?
> >=20
> > This is true.
> >=20
> >> May be some code consolidation could be considered here.
> >>=20
> >> Added Nico and Lorenzo in Cc.
> >>=20
> >> Thanks
> >>    -- Daniel
> >=20
> > Nico can commnent further, but I think the main concern here was th=
at
> > this code shouldn't be factored prematurely.
>=20
> I do not share this opinion.
>=20
> > There are many low-level platform specifics involved here, so it's
> > hard to be certain that all platforms could fit into a more abstrac=
ted
> > framework until we have some evidence to look at.
> >=20
> > This could be revisited when we have a few diverse MCPM ports to
> > compare.
>=20
> I am worried about seeing more and more duplicated code around the AR=
M
> arch (eg. arm[64]/kernel/smp.c arm64/kernel/smp.c).
>=20
> The cpuidle drivers have been duplicated and it took a while before
> refactoring them, and it is not finished. The hotplug code have been
> duplicated and now it is very difficult to factor it out.
>=20
> A lot of work have been done to consolidate the code across the
> different SoC since the last 2 years.
>=20
> If we let duplicate code populate the different files, they will
> belong to different maintainers, thus different trees. Each SoC
> contributors will tend to add their small changes making the code to
> diverge more and more and making difficult to re-factor it later.

I think this is Nico's call, since he has more experience than I do
of how these things tend to play out in practice.

Cheers
---Dave

> I am in favor of preventing duplicate code entering in the kernel and
> force the contributors to improve the kernel in general, not just the
> small part they are supposed to work on. Otherwise, we are letting th=
e
> kernel to fork itself, internally...
>=20
> > The low-level A15/A7 cacheflush sequence is already being factored
> > by Nico [1].
>=20
> Hopefully he did it :)
>=20
> Thanks
>   -- Daniel
>=20
> > [1] http://lists.infradead.org/pipermail/linux-arm-kernel/2013-Octo=
ber/205085.html
> > [PATCH] ARM: cacheflush: consolidate single-CPU ARMv7 cache disabli=
ng code
> >=20
> > [...]
> >=20
>=20
>=20
> --=20
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software f=
or ARM SoCs
>=20
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

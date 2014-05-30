From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: exynos4212: hotplug: Fix CPU idle clock down after
 CPU1 off
Date: Fri, 30 May 2014 16:43:59 +0200
Message-ID: <1401461039.11651.6.camel@AMDC1943>
References: <1399990378-7023-1-git-send-email-k.kozlowski@samsung.com>
 <53887095.7090108@gmail.com> <1401453990.11651.2.camel@AMDC1943>
 <53888008.5020108@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <53888008.5020108@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On pi=C4=85, 2014-05-30 at 14:56 +0200, Tomasz Figa wrote:
> On 30.05.2014 14:46, Krzysztof Kozlowski wrote:
> > On pi=C4=85, 2014-05-30 at 13:50 +0200, Tomasz Figa wrote:
> >> Hi Krzysztof,
> >>
> >> On 13.05.2014 16:12, Krzysztof Kozlowski wrote:
> >>> On Exynos4212 USE_DELAYED_RESET_ASSERTION must be set in
> >>> ARM_CORE1_OPTION register during CPU power down. This is the prop=
er way
> >>> of powering down CPU. Additionally without this the CPU clock dow=
n won't
> >>> work after powering down CPU1 and CPU will work at full frequency=
 chosen
> >>> by CPUfreq governor.
> >>>
> >>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> >>> ---
> >>>  arch/arm/mach-exynos/hotplug.c  | 28 +++++++++++++++++++++++++--=
-
> >>>  arch/arm/mach-exynos/regs-pmu.h |  2 ++
> >>>  2 files changed, 27 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/arch/arm/mach-exynos/hotplug.c b/arch/arm/mach-exyno=
s/hotplug.c
> >>> index 5eead530c6f8..59b813e74558 100644
> >>> --- a/arch/arm/mach-exynos/hotplug.c
> >>> +++ b/arch/arm/mach-exynos/hotplug.c
> >>> @@ -74,7 +74,7 @@ static inline void cpu_enter_lowpower_a15(void)
> >>>  	dsb();
> >>>  }
> >>> =20
> >>> -static inline void cpu_leave_lowpower(void)
> >>> +static inline void cpu_leave_lowpower(unsigned int cpu)
> >>>  {
> >>>  	unsigned int v;
> >>> =20
> >>> @@ -88,6 +88,14 @@ static inline void cpu_leave_lowpower(void)
> >>>  	  : "=3D&r" (v)
> >>>  	  : "Ir" (CR_C), "Ir" (0x40)
> >>>  	  : "cc");
> >>> +
> >>> +	if (cpu =3D=3D 1 && soc_is_exynos4212()) {
> >>
> >> AFAIK this is needed not only on Exynos4x12, but at least also on =
4412.
> >> Also I don't think the (cpu =3D=3D 1) condition is necessary. See =
below.
> >=20
> > I'll test it on Exynos4412.
> >=20
> >>
> >>> +		unsigned int tmp;
> >>> +
> >>> +		tmp =3D __raw_readl(S5P_ARM_CORE1_OPTION);
> >>> +		tmp &=3D ~(S5P_USE_DELAYED_RESET_ASSERTION);
> >>> +		__raw_writel(tmp, S5P_ARM_CORE1_OPTION);
> >>> +	}
> >>>  }
> >>> =20
> >>>  static inline void platform_do_lowpower(unsigned int cpu, int *s=
purious)
> >>> @@ -95,8 +103,22 @@ static inline void platform_do_lowpower(unsig=
ned int cpu, int *spurious)
> >>>  	for (;;) {
> >>> =20
> >>>  		/* make cpu1 to be turned off at next WFI command */
> >>> -		if (cpu =3D=3D 1)
> >>> +		if (cpu =3D=3D 1) {
> >>
> >> I think this patch should be rebased on top of my "[PATCH] ARM: EX=
YNOS:
> >> Fix core ID used by platsmp and hotplug code". Then instead of if =
(cpu
> >> =3D=3D 1) you would just use EXYNOS_ARM_CORE_OPTION(core_id).
> >>
> >> Also same comment as above, I believe this is also needed on Exyno=
s4412.
> >=20
> > Probably your patch needs rebasing too. I couldn't apply (cleanly) =
on
> > current Linus' tree and on Kukjin's for-next. What are the requirem=
ents
> > for it?
>=20
> Hmm, I based it on Kukjin's for-next from the day I sent the patch,
> 23.05 if I remember correctly. AFAICT everything needed by this patch=
 is
> already merged in Kukjin's tree (and I believe already was when I sen=
t
> that patch).
>=20
> To make sure, I'm talking about this patch:
> http://www.spinics.net/lists/linux-samsung-soc/msg31604.html

Yep, that's the patch but still it does not apply cleanly :). Anyway
I'll send next version of my patch reflecting your comments:
1. Limit to all Exynos4 SoCs.
2. Rebase on your patch to utilize EXYNOS_ARM_CORE_OPTION(core_id).

Best regards,
Krzysztof

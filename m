From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: Exynos4: use s5p-timer for UniversalC210 board
Date: Thu, 15 Sep 2011 16:38:30 +0900
Message-ID: <00aa01cc737a$76d75690$648603b0$%kim@samsung.com>
References: <1311659456-6659-1-git-send-email-m.szyprowski@samsung.com>
 <1311659456-6659-3-git-send-email-m.szyprowski@samsung.com>
 <CAH9JG2V6Sfjmjupj5oBd_5vziBa4iezBpRfK9tNECrFO5sSfLw@mail.gmail.com>
 <00a301cc736d$2d9c4fb0$88d4ef10$%kim@samsung.com>
 <CAH9JG2UKh5poAVFoXbEL0N9Afj3D16nuMYWEmeFRNL47P5onpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47647 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754588Ab1IOHic convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Sep 2011 03:38:32 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRJ005N5ZW65PE0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 15 Sep 2011 16:38:30 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LRJ00AVYZW65N80@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 15 Sep 2011 16:38:30 +0900 (KST)
In-reply-to: <CAH9JG2UKh5poAVFoXbEL0N9Afj3D16nuMYWEmeFRNL47P5onpw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'arm-linux' <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, 'Angus Ainslie' <angus.ainslie@linaro.org>, 'Arnd Bergmann' <arnd@arndb.de>, chaos.youn@samsung.com, 'Russell King' <linux@arm.linux.org.uk>

Kyungmin Park wrote:
>=20
> On Thu, Sep 15, 2011 at 3:03 PM, Kukjin Kim <kgene.kim@samsung.com> w=
rote:
> > Kukjin Kim wrote:
> >>
> >> Kyungmin Park wrote:
> >> >
> >> > Hi,
> >> >
> >> > It's required for boot universal c210 w/ EVT0 chip.
> >> > Can you include it at 3.1 fixed branch?
> >> >
> >> Sure, will apply into samsung-fixes for 3.1.
> >
> > Unfortunately, it happens boot failure with this patch on other
EXYNOS4210
> > boards and it is due to HAVE_SCHED_CLOCK.
> >
> >> > > + =A0 =A0 =A0 select HAVE_SCHED_CLOCK
> >
> > I think, we need to sort out the method...
> As sched_clock_postinit is called at generic time code by
> HAVE_SCHED_CLOCK. and there's no sched_clock_update_fn() is defined.
> As a work-around, you can test it.
>=20
> static void sched_clock_poll(unsigned long wrap_ticks)
> {
>         mod_timer(&sched_clock_timer, round_jiffies(jiffies +
wrap_ticks));
>         if (sched_clock_update_fn)
>                 sched_clock_update_fn();
> }
>=20

=46ollowing is better than above but need Russell's review

diff --git a/arch/arm/kernel/sched_clock.c b/arch/arm/kernel/sched_cloc=
k.c
index 9a46370..b1a1283 100644
--- a/arch/arm/kernel/sched_clock.c
+++ b/arch/arm/kernel/sched_clock.c
@@ -70,5 +70,6 @@ void __init init_sched_clock(struct clock_data *cd, v=
oid
(*update)(void),

 void __init sched_clock_postinit(void)
 {
-       sched_clock_poll(sched_clock_timer.data);
+       if (sched_clock_update_fn)
+               sched_clock_poll(sched_clock_timer.data);
 }


> To solve the problem correctly. you can add init_sched_clock at
> "arch/arm/mach-exynos4/mct.c" properly
>=20
> Please test the work-around and share the result. I'll try to find th=
e
> proper place to add init_sched_clock at mct.c
>=20
> Thank you,
> Kyungmin Park
>=20
>=20
> >
> > Thanks.
> >
> > Best regards,
> > Kgene.
> > --
> > Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> > SW Solution Development Team, Samsung Electronics Co., Ltd.
> >
> >>
> >> > Thank you,
> >> > Kyungmin Park
> >> >
> >> > On Tue, Jul 26, 2011 at 2:50 PM, Marek Szyprowski
> >> > <m.szyprowski@samsung.com> wrote:
> >> > > Commit 069d4e743 removed support for local timers and forced t=
o use
> > MCT
> >> as
> >> > > event source. However MCT is not operating properly on early
revision
> > (EVT0)
> >> > > of Exynos4 SoCs. All UniversalC210 boards are based on Exynos4
EVT0,
> > so
> >> > that
> >> > > commit broke support for it. This patch provides a workaround =
that
> > enables
> >> > > UniversalC210 boards to boot again. s5p-timer is used as an ev=
ent
> > source.
> >> > >
> >> > > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> > > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> >> > > ---
> >> > > =A0arch/arm/mach-exynos4/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A03 +++
> >> > > =A0arch/arm/mach-exynos4/mach-universal_c210.c | =A0 =A04 +++-
> >> > > =A02 files changed, 6 insertions(+), 1 deletions(-)
> >> > >
> >> > > diff --git a/arch/arm/mach-exynos4/Kconfig
> > b/arch/arm/mach-exynos4/Kconfig
> >> > > index 9d62e13..2aad73f 100644
> >> > > --- a/arch/arm/mach-exynos4/Kconfig
> >> > > +++ b/arch/arm/mach-exynos4/Kconfig
> >> > > @@ -173,6 +173,9 @@ config MACH_ARMLEX4210
> >> > > =A0config MACH_UNIVERSAL_C210
> >> > > =A0 =A0 =A0 =A0bool "Mobile UNIVERSAL_C210 Board"
> >> > > =A0 =A0 =A0 =A0select CPU_EXYNOS4210
> >> > > + =A0 =A0 =A0 select S5P_HRT
> >> > > + =A0 =A0 =A0 select CLKSRC_MMIO
> >> > > + =A0 =A0 =A0 select HAVE_SCHED_CLOCK
> >> > > =A0 =A0 =A0 =A0select S5P_GPIO_INT
> >> > > =A0 =A0 =A0 =A0select S5P_DEV_FIMC0
> >> > > =A0 =A0 =A0 =A0select S5P_DEV_FIMC1
> >> > > diff --git a/arch/arm/mach-exynos4/mach-universal_c210.c
> > b/arch/arm/mach-
> >> > exynos4/mach-universal_c210.c
> >> > > index 0e280d1..ca9e7b7 100644
> >> > > --- a/arch/arm/mach-exynos4/mach-universal_c210.c
> >> > > +++ b/arch/arm/mach-exynos4/mach-universal_c210.c
> >> > > @@ -34,6 +34,7 @@
> >> > > =A0#include <plat/mfc.h>
> >> > > =A0#include <plat/sdhci.h>
> >> > > =A0#include <plat/pd.h>
> >> > > +#include <plat/s5p-time.h>
> >> > >
> >> > > =A0#include <mach/map.h>
> >> > >
> >> > > @@ -730,6 +731,7 @@ static void __init universal_map_io(void)
> >> > > =A0 =A0 =A0 =A0s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> >> > > =A0 =A0 =A0 =A0s3c24xx_init_clocks(24000000);
> >> > > =A0 =A0 =A0 =A0s3c24xx_init_uarts(universal_uartcfgs,
> > ARRAY_SIZE(universal_uartcfgs));
> >> > > + =A0 =A0 =A0 s5p_set_timer_source(S5P_PWM2, S5P_PWM4);
> >> > > =A0}
> >> > >
> >> > > =A0static void __init universal_reserve(void)
> >> > > @@ -766,6 +768,6 @@ MACHINE_START(UNIVERSAL_C210,
> >> > "UNIVERSAL_C210")
> >> > > =A0 =A0 =A0 =A0.init_irq =A0 =A0 =A0 =3D exynos4_init_irq,
> >> > > =A0 =A0 =A0 =A0.map_io =A0 =A0 =A0 =A0 =3D universal_map_io,
> >> > > =A0 =A0 =A0 =A0.init_machine =A0 =3D universal_machine_init,
> >> > > - =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &exynos4_timer,
> >> > > + =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &s5p_timer,
> >> > > =A0 =A0 =A0 =A0.reserve =A0 =A0 =A0 =A0=3D &universal_reserve,
> >> > > =A0MACHINE_END
> >> > > --
> >> > > 1.7.1.569.g6f426
> >> > >
> >> > > --


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

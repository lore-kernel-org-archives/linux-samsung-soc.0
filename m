From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: Exynos4: use s5p-timer for UniversalC210 board
Date: Wed, 14 Sep 2011 20:50:42 +0900
Message-ID: <007701cc72d4$8822d880$98688980$%kim@samsung.com>
References: <1311659456-6659-1-git-send-email-m.szyprowski@samsung.com>
 <1311659456-6659-3-git-send-email-m.szyprowski@samsung.com>
 <CAH9JG2V6Sfjmjupj5oBd_5vziBa4iezBpRfK9tNECrFO5sSfLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42562 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932269Ab1INLuo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Sep 2011 07:50:44 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRI00HUFGWJ3R60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Sep 2011 20:50:43 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LRI00EHXGWJSK@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Sep 2011 20:50:43 +0900 (KST)
In-reply-to: <CAH9JG2V6Sfjmjupj5oBd_5vziBa4iezBpRfK9tNECrFO5sSfLw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'arm-linux' <linux-arm-kernel@lists.infradead.org>
Cc: linux-samsung-soc@vger.kernel.org, 'Angus Ainslie' <angus.ainslie@linaro.org>, 'Arnd Bergmann' <arnd@arndb.de>

Kyungmin Park wrote:
>=20
> Hi,
>=20
> It's required for boot universal c210 w/ EVT0 chip.
> Can you include it at 3.1 fixed branch?
>=20
Sure, will apply into samsung-fixes for 3.1.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> Thank you,
> Kyungmin Park
>=20
> On Tue, Jul 26, 2011 at 2:50 PM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> > Commit 069d4e743 removed support for local timers and forced to use=
 MCT
as
> > event source. However MCT is not operating properly on early revisi=
on
(EVT0)
> > of Exynos4 SoCs. All UniversalC210 boards are based on Exynos4 EVT0=
, so
> that
> > commit broke support for it. This patch provides a workaround that
enables
> > UniversalC210 boards to boot again. s5p-timer is used as an event
source.
> >
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> > =A0arch/arm/mach-exynos4/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A03 +++
> > =A0arch/arm/mach-exynos4/mach-universal_c210.c | =A0 =A04 +++-
> > =A02 files changed, 6 insertions(+), 1 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos4/Kconfig
b/arch/arm/mach-exynos4/Kconfig
> > index 9d62e13..2aad73f 100644
> > --- a/arch/arm/mach-exynos4/Kconfig
> > +++ b/arch/arm/mach-exynos4/Kconfig
> > @@ -173,6 +173,9 @@ config MACH_ARMLEX4210
> > =A0config MACH_UNIVERSAL_C210
> > =A0 =A0 =A0 =A0bool "Mobile UNIVERSAL_C210 Board"
> > =A0 =A0 =A0 =A0select CPU_EXYNOS4210
> > + =A0 =A0 =A0 select S5P_HRT
> > + =A0 =A0 =A0 select CLKSRC_MMIO
> > + =A0 =A0 =A0 select HAVE_SCHED_CLOCK
> > =A0 =A0 =A0 =A0select S5P_GPIO_INT
> > =A0 =A0 =A0 =A0select S5P_DEV_FIMC0
> > =A0 =A0 =A0 =A0select S5P_DEV_FIMC1
> > diff --git a/arch/arm/mach-exynos4/mach-universal_c210.c
b/arch/arm/mach-
> exynos4/mach-universal_c210.c
> > index 0e280d1..ca9e7b7 100644
> > --- a/arch/arm/mach-exynos4/mach-universal_c210.c
> > +++ b/arch/arm/mach-exynos4/mach-universal_c210.c
> > @@ -34,6 +34,7 @@
> > =A0#include <plat/mfc.h>
> > =A0#include <plat/sdhci.h>
> > =A0#include <plat/pd.h>
> > +#include <plat/s5p-time.h>
> >
> > =A0#include <mach/map.h>
> >
> > @@ -730,6 +731,7 @@ static void __init universal_map_io(void)
> > =A0 =A0 =A0 =A0s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> > =A0 =A0 =A0 =A0s3c24xx_init_clocks(24000000);
> > =A0 =A0 =A0 =A0s3c24xx_init_uarts(universal_uartcfgs,
ARRAY_SIZE(universal_uartcfgs));
> > + =A0 =A0 =A0 s5p_set_timer_source(S5P_PWM2, S5P_PWM4);
> > =A0}
> >
> > =A0static void __init universal_reserve(void)
> > @@ -766,6 +768,6 @@ MACHINE_START(UNIVERSAL_C210,
> "UNIVERSAL_C210")
> > =A0 =A0 =A0 =A0.init_irq =A0 =A0 =A0 =3D exynos4_init_irq,
> > =A0 =A0 =A0 =A0.map_io =A0 =A0 =A0 =A0 =3D universal_map_io,
> > =A0 =A0 =A0 =A0.init_machine =A0 =3D universal_machine_init,
> > - =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &exynos4_timer,
> > + =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &s5p_timer,
> > =A0 =A0 =A0 =A0.reserve =A0 =A0 =A0 =A0=3D &universal_reserve,
> > =A0MACHINE_END
> > --
> > 1.7.1.569.g6f426
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe
linux-samsung-soc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at =A0http://vger.kernel.org/majordomo-info.htm=
l
> >

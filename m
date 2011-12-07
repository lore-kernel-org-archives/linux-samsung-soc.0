From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: exynos4: Fix for stall in case of cpu hotplug or sleep
Date: Wed, 07 Dec 2011 21:15:34 +0900
Message-ID: <042c01ccb4d9$ebb56ba0$c32042e0$%kim@samsung.com>
References: <1321616752-1233-1-git-send-email-amit.kachhap@linaro.org>
 <047501ccb014$edda8f60$c98fae20$%kim@samsung.com>
 <CADGdYn7jfFYkuoFX9J3NtNbgLHgagWHa3q3mehJU+gY_mg5EOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:17046 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755010Ab1LGMPh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Dec 2011 07:15:37 -0500
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LVU005ZG21ZQW10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Dec 2011 21:15:36 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LVU00LSU21YRM10@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 07 Dec 2011 21:15:35 +0900 (KST)
In-reply-to: <CADGdYn7jfFYkuoFX9J3NtNbgLHgagWHa3q3mehJU+gY_mg5EOw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'amit kachhap' <amit.kachhap@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, patches@linaro.org, 'LAK' <linux-arm-kernel@lists.infradead.org>

amit kachhap wrote:
>=20
> On Thu, Dec 1, 2011 at 4:05 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> > Amit Daniel Kachhap wrote:
> >>
> >> This patch adds remove_irq in place of disable_irq which is
> >> correct equivalent function for setup_irq used in
> >> exynos4_mct_tick_init.
> >>
> >> Signed-off-by: Amit Daniel Kachhap <amit.kachhap@linaro.org>
> >> Tested-by: Inderpal Singh <inderpal.singh@linaro.org>
> >> ---
> >> =A0arch/arm/mach-exynos/mct.c | =A0 =A06 +++++-
> >> =A01 files changed, 5 insertions(+), 1 deletions(-)
> >>
> >> diff --git a/arch/arm/mach-exynos/mct.c b/arch/arm/mach-exynos/mct=
=2Ec
> >> index 97343df..959f251 100644
> >> --- a/arch/arm/mach-exynos/mct.c
> >> +++ b/arch/arm/mach-exynos/mct.c
> >> @@ -428,9 +428,13 @@ int __cpuinit local_timer_setup(struct
> >> clock_event_device *evt)
> >>
> >> =A0void local_timer_stop(struct clock_event_device *evt)
> >> =A0{
> >> + =A0 =A0 unsigned int cpu =3D smp_processor_id();
> >> =A0 =A0 =A0 evt->set_mode(CLOCK_EVT_MODE_UNUSED, evt);
> >> =A0 =A0 =A0 if (mct_int_type =3D=3D MCT_INT_SPI)
> >> - =A0 =A0 =A0 =A0 =A0 =A0 disable_irq(evt->irq);
> >> + =A0 =A0 =A0 =A0 =A0 =A0 if (cpu =3D=3D 0)
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 remove_irq(evt->irq, &mc=
t_tick0_event_irq);
> >> + =A0 =A0 =A0 =A0 =A0 =A0 else
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 remove_irq(evt->irq, &mc=
t_tick1_event_irq);
> >
> > Hmm, how about the cpu number is 2 or 3 on Quad-core?
> > As you know, this should be used for all of EXYNOS SoCs.
>=20
> This code change is specific for EXYNOS4210 where the MCT irq is SPI
> type. Other exynos soc's (4412 etc) are not effected by this change.
> I am adding the cpu stall log currently caused during cpu1 hotplug or
> sleep/wakeup sequence. This commit fixes this.
>=20
Yes, you're right. Will apply :)
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

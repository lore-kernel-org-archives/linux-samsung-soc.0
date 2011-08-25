From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/5] ARM: EXYNOS4: Add support PM for EXYNOS4212
Date: Fri, 26 Aug 2011 08:33:02 +0900
Message-ID: <072b01cc637f$558a1190$009e34b0$%kim@samsung.com>
References: <1314192352-14911-1-git-send-email-kgene.kim@samsung.com>
 <1314192352-14911-4-git-send-email-kgene.kim@samsung.com>
 <CAJ0PZbT1YsiXT9k1FJfOCoU8h_XAYqAX6ECJ_=Q0RjR-D_9yyA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:9416 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751120Ab1HYXdG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Aug 2011 19:33:06 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQI00G1BC33XUD0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Aug 2011 08:33:03 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQI0063BC33WV@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Aug 2011 08:33:03 +0900 (KST)
In-reply-to: <CAJ0PZbT1YsiXT9k1FJfOCoU8h_XAYqAX6ECJ_=Q0RjR-D_9yyA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Jonghwan Choi' <jhbird.choi@samsung.com>, "'Rafael J. Wysocki'" <rjw@sisk.pl>

MyungJoo Ham wrote:
>=20
> On Wed, Aug 24, 2011 at 10:25 PM, Kukjin Kim <kgene.kim@samsung.com>
wrote:
> > From: Jonghwan Choi <jhbird.choi@samsung.com>
> >
> > This patch moves regarding clock stuff of PM into clock
> > file to support PM on EXYNOS4210 and EXYNOS4212 with one
> > single kernel image. Because some clock registers are
> > different on each SoCs.
> >
> > Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> > =A0arch/arm/mach-exynos4/clock-exynos4210.c =A0 =A0 =A0 =A0| =A0 38=
 ++++++++++
> > =A0arch/arm/mach-exynos4/clock-exynos4212.c =A0 =A0 =A0 =A0| =A0 34=
 +++++++++
> > =A0arch/arm/mach-exynos4/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 89
> +++++++++++++++++++++++
> > =A0arch/arm/mach-exynos4/include/mach/regs-clock.h | =A0 =A04 +
> > =A0arch/arm/mach-exynos4/pm.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 79
++------------------
> > =A05 files changed, 172 insertions(+), 72 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos4/clock-exynos4210.c b/arch/arm/ma=
ch-
> exynos4/clock-exynos4210.c
> > index fe74b91..a4b00b7 100644
> > --- a/arch/arm/mach-exynos4/clock-exynos4210.c
> > +++ b/arch/arm/mach-exynos4/clock-exynos4210.c
> > +static struct sleep_save exynos4210_clock_save[] =3D {
> > + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKSRC_IMAGE),
> > + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKSRC_LCD1),
> > + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKDIV_IMAGE),
> > + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKDIV_LCD1),
> > + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKSRC_MASK_LCD1),
> > + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_IP_IMAGE_4210),
> > + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_IP_LCD1),
> > + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_IP_PERIR_4210),
> > +};
> > +
> > --- a/arch/arm/mach-exynos4/clock-exynos4212.c
> > +++ b/arch/arm/mach-exynos4/clock-exynos4212.c
> > +static struct sleep_save exynos4212_clock_save[] =3D {
> > + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKSRC_IMAGE),
> > + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKDIV_IMAGE),
> > + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_IP_IMAGE_4212),
> > + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_IP_PERIR_4212),
> > +};
> > +
> > --- a/arch/arm/mach-exynos4/clock.c
> > +++ b/arch/arm/mach-exynos4/clock.c
> > +static struct sleep_save exynos4_clock_save[] =3D {
>=20
> Hello,
>=20
Hi,

> Is there any reason to have the following two
> SAVE_ITEM(S5P_CLKSRC_IMAGE),
> SAVE_ITEM(S5P_CLKDIV_IMAGE
> defined at both clock-exynos4210.c and clock-exynos4212.c, not define=
d
> at clock.c once?
>=20
Yes, I know. I just wanted to keep in mind there is a different
value(CLKGATE_IP_IMAGE) in regarding IMAGE clocks on each SoCs, and I t=
hink
need it now. Anyway thanks for your pointing out.

> Also, consider using CONFIG_PM_SLEEP rather than CONFIG_PM for
> suspend/resume ops.
>=20
(Cc'ed Rafael)

Well, even though CONFIG_PM_SLEEP is used in regarding syscore_ops, in =
this
case, using CONFIG_PM looks better.

If ARCH_SUSPEND_POSSIBLE will be selected, then CONFIG_SUSPEND is selec=
ted
and CONFIG_PM_SLEEP is selected in kernel/power/Kconfig and of course,
ARCH_SUSPEND_POSSIBLE is selected in arch/arm/Kconfig. However above
everything depends on CONFIG_PM. So I think to use CONFIG_PM is more
reasonable. In addition, it is more popular in other mainline codes now=
=2E

Hi Rafael,
How do you think about this?

Its original code is below.
---
#ifdef CONFIG_PM
static int exynos4210_clock_suspend(void)
{
        s3c_pm_do_save(exynos4210_clock_save,
ARRAY_SIZE(exynos4210_clock_save));

        return 0;
}

static void exynos4210_clock_resume(void)
{
        s3c_pm_do_restore_core(exynos4210_clock_save,
ARRAY_SIZE(exynos4210_clock_save));
}

#else
#define exynos4210_clock_suspend NULL
#define exynos4210_clock_resume NULL
#endif

struct syscore_ops exynos4210_clock_syscore_ops =3D {
        .suspend        =3D exynos4210_clock_suspend,
        .resume         =3D exynos4210_clock_resume,
};
---

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

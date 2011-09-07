From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/5] ARM: SAMSUNG: Make the sleep code common for S3C64XX
 and newer SoCs
Date: Wed, 07 Sep 2011 15:01:30 +0900
Message-ID: <000201cc6d23$973508e0$c59f1aa0$%kim@samsung.com>
References: <1313144787-30666-1-git-send-email-a.kesavan@samsung.com>
 <1313144787-30666-3-git-send-email-a.kesavan@samsung.com>
 <073501cc6391$31569f70$9403de50$%kim@samsung.com>
 <CAM4voak5ArO4YW-bfLDoUFtMndV58thnr2Z4oCbPhD3fRPS1Cw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60786 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754015Ab1IGGBd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Sep 2011 02:01:33 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LR500DW322KTDF0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Sep 2011 15:01:32 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LR500MW722IMS00@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 07 Sep 2011 15:01:31 +0900 (KST)
In-reply-to: <CAM4voak5ArO4YW-bfLDoUFtMndV58thnr2Z4oCbPhD3fRPS1Cw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Abhilash Kesavan' <kesavan.abhilash@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Abhilash Kesavan wrote:
>=20
> Hi Mr Kim,
>=20
> Thanks for your comments. Please find my reply below:
>=20
> Regards,
> Abhilash
>=20
> On Fri, Aug 26, 2011 at 7:10 AM, Kukjin Kim <kgene.kim@samsung.com> w=
rote:
> > Abhilash Kesavan wrote:
> >>
> >> The sleep code for S5PV210 and EXYNOS4 is identical; moreover it i=
s
quite
> >> similar
> >> to that for S3C64XX except for some SoC specific debug logic. S5P6=
4X0
and
> >> S5PC100,
> >> for which support will be added soon, can also use the same proced=
ure.
> > Create a
> >> common sleep code in the plat-samsung directory so that it can be
re-used.
> >>
> >> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> >> ---
> >> =A0arch/arm/mach-exynos4/Kconfig =A0| =A0 =A01 +
> >> =A0arch/arm/mach-exynos4/Makefile | =A0 =A02 +-
> >> =A0arch/arm/mach-exynos4/sleep.S =A0| =A0 54 ---------------------=
------
> >> =A0arch/arm/mach-s3c64xx/Kconfig =A0| =A0 =A01 +
> >> =A0arch/arm/mach-s3c64xx/Makefile | =A0 =A01 -
> >> =A0arch/arm/mach-s3c64xx/sleep.S =A0| =A0 72
> > ------------------------------------
> >> =A0arch/arm/mach-s5pv210/Kconfig =A0| =A0 =A01 +
> >> =A0arch/arm/mach-s5pv210/Makefile | =A0 =A02 +-
> >> =A0arch/arm/mach-s5pv210/sleep.S =A0| =A0 52 ---------------------=
-----
> >> =A0arch/arm/plat-samsung/Kconfig =A0| =A0 =A07 +++
> >> =A0arch/arm/plat-samsung/Makefile | =A0 =A01 +
> >> =A0arch/arm/plat-samsung/sleep.S =A0| =A0 80
> >> ++++++++++++++++++++++++++++++++++++++++
> >> =A012 files changed, 93 insertions(+), 181 deletions(-)
> >> =A0delete mode 100644 arch/arm/mach-exynos4/sleep.S
> >> =A0delete mode 100644 arch/arm/mach-s3c64xx/sleep.S
> >> =A0delete mode 100644 arch/arm/mach-s5pv210/sleep.S
> >> =A0create mode 100644 arch/arm/plat-samsung/sleep.S
> >>
> >
> > (snip)
> >
> >> +ENTRY(s3c_cpu_resume)
> >> +#if defined(CONFIG_S3C_PM_DEBUG_LED_SMDK)
> >> +
> >
> > Hi Abhilash,
> >
> > Yes, would be nice if each sleep.S can be handled in plat-samsung f=
or
> > Samsung SoCs.
> >
> > Hmm...but the CONFIG_S3C_PM_DEBUG_LED_SMDK can be used on other
> SoCs for
> > same reason even though it is available only on S3C64XX now. I thin=
k, we
> > need to add SoC detecting here.
> Quite right, it is possible to use this for other SoCs. But as of now=
,
> my patch just intends
> to move all the sleep code to a common place. The S3C64XX sleep code
> has this feature
> and I didn't want to disturb it in anyway, hence it has been added to
> the common file.
> Perhaps, generalizing it for other SoCs can be done later on top of t=
his

Hmm, this codes should be cleaned for all Samsung SoCs because this can
break one kernel image...

> >
> >> +#undef S3C64XX_VA_GPIO
> >> +#define S3C64XX_VA_GPIO (0x0)
> >
> > Please let me know why this is needed here.
> The code is trying to access the registers at a stage where the MMU i=
s
> not enabled.
> Hence, the VA_GPIO is being re-defined as 0 reducing S3C64XX_GPIOREG(=
reg)
> to
> reg.
> It has been moved as is from the existing s3c64xx sleep code.


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

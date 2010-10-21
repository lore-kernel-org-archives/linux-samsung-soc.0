From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V3 2/3] ARM: S5PV310: Remove L2 cache init in machine
Date: Thu, 21 Oct 2010 16:28:11 +0900
Message-ID: <033601cb70f1$85cbb420$91631c60$%kim@samsung.com>
References: <1287643483-16046-1-git-send-email-kgene.kim@samsung.com>
 <1287643483-16046-3-git-send-email-kgene.kim@samsung.com>
 <004601cb70f0$ce0558f0$6a100ad0$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:44029 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751316Ab0JUH1w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Oct 2010 03:27:52 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LAM00IG6Q2FSJE0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Oct 2010 16:27:51 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LAM00BHHQ2EQK@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Oct 2010 16:27:51 +0900 (KST)
In-reply-to: <004601cb70f0$ce0558f0$6a100ad0$@com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Daein Moon' <moon9124@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Changhwan Youn' <chaos.youn@samsung.com>, ben-linux@fluff.org

Daein Moon wrote:
> 
> Kukjin Kim wrote:
> > From: Kyungmin Park <kyungmin.park@samsung.com>
> >
> > Basically, need L2 cache initialize function in ARCH_S5PV310. So it
would
> > be better to move it into ARCH_S5PV310 common part. This patch removes
L2
> > cache initialization code at the each board file.
> >
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> >  arch/arm/mach-s5pv310/mach-smdkc210.c       |    4 ----
> >  arch/arm/mach-s5pv310/mach-smdkv310.c       |    4 ----
> >  arch/arm/mach-s5pv310/mach-universal_c210.c |    4 ----
> >  3 files changed, 0 insertions(+), 12 deletions(-)
> >
> > diff --git a/arch/arm/mach-s5pv310/mach-smdkc210.c b/arch/arm/mach-
> > s5pv310/mach-smdkc210.c
> > index 93d537b..3cde5ed 100644
> > --- a/arch/arm/mach-s5pv310/mach-smdkc210.c
> > +++ b/arch/arm/mach-s5pv310/mach-smdkc210.c
> > @@ -129,10 +129,6 @@ static void __init smdkc210_machine_init(void)
> >  	s3c_sdhci2_set_platdata(&smdkc210_hsmmc2_pdata);
> >  	s3c_sdhci3_set_platdata(&smdkc210_hsmmc3_pdata);
> >
> > -#ifdef CONFIG_CACHE_L2X0
> > -	l2x0_init(S5P_VA_L2CC, 1 << 28, 0xffffffff);
> > -#endif
> > -
> Hi,
> 
> If L2 cache init is removed, including header file
> "asm/hardware/cache-l2x0.h" isn't needed.
> 
Yes, you're right...will be removed.

Thanks for your pointing out.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

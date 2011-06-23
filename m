From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 7/7] ARM: EXYNOS4: Move S5P_CENTRAL_SEQ_CONFIGURATION
 setting	for PM
Date: Thu, 23 Jun 2011 17:05:39 +0900
Message-ID: <016101cc317c$5a69f160$0f3dd420$%kim@samsung.com>
References: <1308732405-16664-1-git-send-email-kgene.kim@samsung.com>
 <1308732405-16664-8-git-send-email-kgene.kim@samsung.com>
 <4E01DBC5.7000006@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:63547 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750913Ab1FWIGF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jun 2011 04:06:05 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LN800D86H5DW2N0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Jun 2011 17:05:45 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LN80052NH5LFG@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Jun 2011 17:05:45 +0900 (KST)
In-reply-to: <4E01DBC5.7000006@ru.mvista.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sergei Shtylyov' <sshtylyov@mvista.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Jaecheol Lee' <jc.lee@samsung.com>, ben-linux@fluff.org

Sergei Shtylyov wrote:
> 
> Hello.
> 
Hi :)

> On 22-06-2011 12:46, Kukjin Kim wrote:
> 
> > From: Jaecheol Lee<jc.lee@samsung.com>
> 
> > We need to balance between set and check
> S5P_CENTRAL_SEQ_CONFIGURATION
> > register in syscore_ops suspend/resume function when failure in enter
> > suspend mode. Moved this register setting for PM for the purpose of
balancing.
> 
> > Signed-off-by: Jaecheol Lee<jc.lee@samsung.com>
> > Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
> > ---
> >   arch/arm/mach-exynos4/pm.c |   22 ++++++++++++++--------
> >   1 files changed, 14 insertions(+), 8 deletions(-)
> 
> > diff --git a/arch/arm/mach-exynos4/pm.c b/arch/arm/mach-exynos4/pm.c
> > index b037fba..a103c13 100644
> > --- a/arch/arm/mach-exynos4/pm.c
> > +++ b/arch/arm/mach-exynos4/pm.c
> [...]
> > @@ -413,6 +405,19 @@ static __init int exynos4_pm_drvinit(void)
> >   }
> >   arch_initcall(exynos4_pm_drvinit);
> >
> > +static int exynos4_pm_suspend(void)
> > +{
> > +	unsigned long tmp;
> > +
> > +	/* Setting Central Sequence Register for power down mode */
> > +
> > +	tmp = __raw_readl(S5P_CENTRAL_SEQ_CONFIGURATION);
> > +	tmp &= ~(S5P_CENTRAL_LOWPWR_CFG);
> 
>     Could drop useless parens, while at it.
> 
Sergei, thanks ;)

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

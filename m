From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C2410: Fix on build warning about dependency in
	mach-s3c2440/Kconfig
Date: Fri, 13 Aug 2010 18:54:18 +0900
Message-ID: <009201cb3acd$820678c0$86136a40$%kim@samsung.com>
References: <1281687307-2421-1-git-send-email-kgene.kim@samsung.com>
 <20100813083901.GA20285@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36359 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761392Ab0HMJyL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Aug 2010 05:54:11 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L730093F4U9LS30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Aug 2010 18:54:09 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L7300MFT4U91N@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Aug 2010 18:54:09 +0900 (KST)
In-reply-to: <20100813083901.GA20285@pengutronix.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Uwe_Kleine-K=F6nig'?= <u.kleine-koenig@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Uwe Kleine-K=F6nig wrote:
>=20
> On Fri, Aug 13, 2010 at 05:15:07PM +0900, Kukjin Kim wrote:
> > This patch fixes on following build warnings.
> >
> > warning: (CPU_S3C2440 && ARCH_S3C2410 && S3C2410_DMA) selects
> S3C2440_DMA which
> >              has unmet direct dependencies (ARCH_S3C2410 &&
> CPU_S3C24405B)
> > warning: (CPU_S3C2440 && ARCH_S3C2410 || CPU_S3C2442 &&
> ARCH_S3C2410) selects
> >              CPU_S3C244X which has unmet direct dependencies
> (!ARCH_S3C2410)
> >
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > Cc: Ben Dooks <ben-linux@fluff.org>
> > ---
> >  arch/arm/mach-s3c2440/Kconfig |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/mach-s3c2440/Kconfig
b/arch/arm/mach-s3c2440/Kconfig
> > index cd8e7de..f60a370 100644
> > --- a/arch/arm/mach-s3c2440/Kconfig
> > +++ b/arch/arm/mach-s3c2440/Kconfig
> > @@ -30,7 +30,7 @@ config CPU_S3C2442
> >
> >  config CPU_S3C244X
> >  	bool
> > -	depends on ARCH_S3C2410 && (CPU_S3C2440 || CPU_S3C2442)
> > +	depends on (CPU_S3C2440 || CPU_S3C2442)
> >  	help
> >  	  Support for S3C2440 and S3C2442 Samsung Mobile CPU based
> systems.
> >
> > @@ -72,7 +72,7 @@ config S3C2440_PLL_16934400
> >
> >  config S3C2440_DMA
> >  	bool
> > -	depends on ARCH_S3C2410 && CPU_S3C24405B
> > +	depends on (ARCH_S3C2410 || CPU_S3C24405B)
> >  	help
> >  	  Support for S3C2440 specific DMA code5A
> all parenthesis in your +lines are superflous.
>=20
Yeah, you're right.
=46ixed. Thanks. :-)

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 8/9] Input: s3c24xx_ts - Adds TYPE_S5PV210 into	Samsung
 touchscreen driver
Date: Fri, 14 May 2010 16:09:15 +0900
Message-ID: <00a801caf334$60bae330$2230a990$%kim@samsung.com>
References: <1273756048-3263-1-git-send-email-kgene.kim@samsung.com>
 <20100514005518.GL26401@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:57952 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754988Ab0ENHJW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 May 2010 03:09:22 -0400
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2E00E9MEJKQN@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 May 2010 16:09:20 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L2E00GZGEJJLP@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 May 2010 16:09:20 +0900 (KST)
In-reply-to: <20100514005518.GL26401@trinity.fluff.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Naveen Krishna' <ch.naveen@samsung.com>

Ben Dooks wrote:
> 
> On Thu, May 13, 2010 at 10:07:28PM +0900, Kukjin Kim wrote:
> > From: Naveen Krishna <ch.naveen@samsung.com>
> >
> > This patch adds TYPE_S5PV210 to the ID table in Samsung touchscreen
driver.
> > So, we can configure the driver based on the IP level changes.
> 
> Hmm, what changes are those? Would much prefer to see the changes
> with these additions.
> 
> Also, how about the 'FEAT' flags idea that was floated, it may help
> with adding future SoCs.

The coming 2 patches would fix these changes.

> 
> > Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> >  drivers/input/touchscreen/Kconfig      |    2 +-
> >  drivers/input/touchscreen/s3c2410_ts.c |    2 ++
> >  2 files changed, 3 insertions(+), 1 deletions(-)
> >
> > diff --git a/drivers/input/touchscreen/Kconfig
b/drivers/input/touchscreen/Kconfig
> > index c82c1e1..a90a5bb 100644
> > --- a/drivers/input/touchscreen/Kconfig
> > +++ b/drivers/input/touchscreen/Kconfig
> > @@ -159,7 +159,7 @@ config TOUCHSCREEN_FUJITSU
> >
> >  config TOUCHSCREEN_S3C2410
> >  	tristate "Samsung S3C2410 touchscreen input driver"
> > -	depends on ARCH_S3C2410 || ARCH_S3C64XX || ARCH_S5P6440
> > +	depends on ARCH_S3C2410 || ARCH_S3C64XX || ARCH_S5P6440 ||
> ARCH_S5PV210
> >  	select S3C_ADC
> >  	help
> >  	  Say Y here if you have the s3c2410 touchscreen.
> > diff --git a/drivers/input/touchscreen/s3c2410_ts.c
> b/drivers/input/touchscreen/s3c2410_ts.c
> > index 7e7d368..8a970ea 100644
> > --- a/drivers/input/touchscreen/s3c2410_ts.c
> > +++ b/drivers/input/touchscreen/s3c2410_ts.c
> > @@ -89,6 +89,7 @@ enum s3c_cpu_type {
> >  	TYPE_S3C2410,
> >  	TYPE_S3C2440,
> >  	TYPE_S3C64XX,	/* S3C64XX, S5P64XX Series */
> > +	TYPE_S5PV210,	/* S5PV210 */
> >  };
> >
> >  /**
> > @@ -418,6 +419,7 @@ static struct platform_device_id s3cts_driver_ids[] =
{
> >  	{ "s3c2410-ts", TYPE_S3C2410 },
> >  	{ "s3c2440-ts", TYPE_S3C2440 },
> >  	{ "s3c64xx-ts", TYPE_S3C64XX },
> > +	{ "s5pv210-ts", TYPE_S5PV210 },
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(platform, s3cts_driver_ids);
> > --


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

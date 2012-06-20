From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C64XX: Add IRQ mapping for wm0010 on Cragganmore
Date: Wed, 20 Jun 2012 13:28:06 +0900
Message-ID: <028c01cd4e9d$16c0f9b0$4442ed10$%kim@samsung.com>
References: <1339775065-13211-1-git-send-email-dp@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:41184 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751169Ab2FTE2Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jun 2012 00:28:16 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5W00KBKF0M9RI0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Jun 2012 13:28:06 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5W0036PF2URS00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Jun 2012 13:28:06 +0900 (KST)
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Dimitris Papastamos' <dp@opensource.wolfsonmicro.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

Kukjin Kim wrote:
> 
> Dimitris Papastamos wrote:
> >
> > Signed-off-by: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
> > ---
> >  arch/arm/mach-s3c64xx/mach-crag6410-module.c |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> b/arch/arm/mach-
> > s3c64xx/mach-crag6410-module.c
> > index f347336..7c8ea3c 100644
> > --- a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> > +++ b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
> > @@ -47,6 +47,7 @@ static struct spi_board_info wm1253_devs[] = {
> >  		.bus_num	= 0,
> >  		.chip_select	= 0,
> >  		.mode		= SPI_MODE_0,
> > +		.irq            = S3C_EINT(5),
                    ^^^^^^^^^^^^
If there is no reason, using tab is better at the mark ^

> >  		.controller_data = &wm0010_spi_csinfo,
> >  		.platform_data = &wm0010_crag_pdata,

I can't find platform_data in my tree (just v3.5-rc3), there is another
patch?

Now, just applying this patch is ok?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

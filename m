From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/7] DMA: PL330: Update PL330 DMA API driver
Date: Fri, 08 Jul 2011 16:57:27 +0900
Message-ID: <003301cc3d44$b0fccdd0$12f66970$%kim@samsung.com>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com>
 <1309781915-31549-3-git-send-email-kgene.kim@samsung.com>
 <20110705073629.GM8286@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:61220 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751378Ab1GHH5e (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Jul 2011 03:57:34 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LO0008IG8RKO300@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Jul 2011 16:57:33 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LO000NDF8RW2C@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Jul 2011 16:57:32 +0900 (KST)
In-reply-to: <20110705073629.GM8286@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Boojin Kim' <boojin.kim@samsung.com>, 'Vinod Koul' <vinod.koul@intel.com>, 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Dan Williams' <dan.j.williams@intel.com>, 'Liam Girdwood' <lrg@ti.com>

Russell King - ARM Linux wrote:
> 
> On Mon, Jul 04, 2011 at 09:18:30PM +0900, Kukjin Kim wrote:
> > diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> > index 25cf327..9b7f15a 100644
> > --- a/drivers/dma/Kconfig
> > +++ b/drivers/dma/Kconfig
> > @@ -193,7 +193,8 @@ config ARCH_HAS_ASYNC_TX_FIND_CHANNEL
> >  config PL330_DMA
> >  	tristate "DMA API Driver for PL330"
> >  	select DMA_ENGINE
> > -	depends on PL330
> > +	select ARM_AMBA
> 
> This is the wrong way around.  If your SoC supports Primecells, then you
are
> supposed to select ARM_AMBA from the SoC to allow the Primecell drivers to
be
> enabled.  Primecell drivers should then depend on ARM_AMBA.

OK, will address comments.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

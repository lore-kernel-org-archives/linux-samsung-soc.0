From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v8 00/16] To use DMA generic APIs for Samsung DMA
Date: Wed, 14 Sep 2011 20:29:59 +0900
Message-ID: <007601cc72d1$a3356aa0$e9a03fe0$%kim@samsung.com>
References: <1314924284-25554-1-git-send-email-boojin.kim@samsung.com>
 <1315980099.26251.498.camel@vkoul-udesk3>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:37768 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756495Ab1INLaC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Sep 2011 07:30:02 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRI0096AFY01690@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Sep 2011 20:30:00 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LRI005G1FXZ5K80@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 14 Sep 2011 20:29:59 +0900 (KST)
In-reply-to: <1315980099.26251.498.camel@vkoul-udesk3>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vinod Koul' <vinod.koul@intel.com>, 'Boojin Kim' <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Russell King' <linux@arm.linux.org.uk>, 'Linus Walleij' <linus.walleij@linaro.org>, 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Dan Williams' <dan.j.williams@intel.com>

Vinod Koul wrote:
> 
> On Fri, 2011-09-02 at 09:44 +0900, Boojin Kim wrote:
> > This patchset adds support DMA generic APIs for samsung DMA.
> >
> > The changes from V7 is following:
> > - Divides patch file.
> >   : The 03 patch on V7 patchset is divided into the 03 and 04 patch on V8
> patchset.
> >     The O3 patch is only for DMA_SLAVE_CONFIG command.
> >     The 04 patch is only for DMA_TERMINATE_ALL command.
> > - Code clean-up
> >   : Remove unnecessary code on 05 patch.
> >
> > [PATCH v8 01/16] DMA: PL330: Add support runtime PM for PL330 DMAC
> > [PATCH v8 02/16] DMA: PL330: Update PL330 DMA API driver
> > [PATCH v8 03/16] DMA: PL330: Support DMA_SLAVE_CONFIG command
> > [PATCH v8 04/16] DMA: PL330: Remove the start operation for handling
> DMA_TERMINATE_ALL command
> > [PATCH v8 05/16] DMA: PL330: Add DMA_CYCLIC capability
> > [PATCH v8 06/16] ARM: SAMSUNG: Update to use PL330-DMA driver
> > [PATCH v8 07/16] ARM: SAMSUNG: Add common DMA operations
> > [PATCH v8 08/16] ARM: EXYNOS4: Use generic DMA PL330 driver
> > [PATCH v8 09/16] ARM: S5PV210: Use generic DMA PL330 driver
> > [PATCH v8 10/16] ARM: S5PC100: Use generic DMA PL330 driver
> > [PATCH v8 11/16] ARM: S5P64X0: Use generic DMA PL330 driver
> > [PATCH v8 12/16] ARM: SAMSUNG: Remove S3C-PL330-DMA driver
> > [PATCH v8 13/16] spi/s3c64xx: Add support DMA engine API
> > [PATCH v8 14/16] spi/s3c64xx: Merge dma control code
> > [PATCH v8 15/16] ASoC: Samsung: Update DMA interface
> > [PATCH v8 16/16] ARM: SAMSUNG: Remove Samsung specific enum type for
> dma direction
> Thanks,
> 
> I have pushed these into my samsung-dma branch, Fixed the typos in the
> changelog of patch 4.
> 
> Please check and let me know if all are fine, I will push them to my
> next tomorrow
> 
Hi Vinod,

Thanks for your applying.

When you push them to your next, I will merge samsung-dma branch to my -next to avoid conflicts.

If any problems, please let me know.

> If anyone has concerns on this series please let me know by tomorrow

Thanks again.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung devel-dma ops for v3.6
Date: Wed, 11 Jul 2012 16:08:41 +0900
Message-ID: <0e1301cd5f34$008fe1e0$01afa5a0$%kim@samsung.com>
References: <0c5001cd5e41$87daa1b0$978fe510$%kim@samsung.com>
 <201207101242.41867.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34212 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756314Ab2GKHIo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jul 2012 03:08:44 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M6Z0009YIGTFX30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jul 2012 16:08:42 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M6Z00MQBIIHN8L0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jul 2012 16:08:41 +0900 (KST)
In-reply-to: <201207101242.41867.arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Grant Likely' <grant.likely@secretlab.ca>, w.sang@pengutronix.de, 'Boojin Kim' <boojin.kim@samsung.com>, 'Kyoungil Kim' <ki0351.kim@samsung.com>, 'Vinod Koul' <vinod.koul@intel.com>, 'Dan Williams' <dan.j.williams@intel.com>, 'Ben Dooks' <ben@simtec.co.uk>

Arnd Bergmann wrote:
> 
> On Tuesday 10 July 2012, Kukjin Kim wrote:
> > Hi Arnd, Olof,
> >
> > Here is updating DMA common operation for Samsung SoCs.
> >
> > Since some DMA client driver such as spi needs to change the
> configuration
> > after dma_request() so this branch adds dma_config() can configure DMA
> > transmit option which is included in dma_request() after that.
> >
> > Note, according to the changes, needs to update spi and ASoC drivers for
> > Samsung SoCs and only got the ack from Mark Brown not Grant Likely and
> as I
> > know, he is busy for moving. But I think, the spi change has no problem
> and
> > it is simple.
> >
> > If any problems, please kindly let me know.
> 
> > git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> next/devel-dma-ops
> 
> I've applied this to a new next/dma branch for now, as it sounds that you
> need these changes.
> 
Arnd, thanks.

> However, my feeling is that the s3c-dma-ops support is moving in the wrong
> direction, or at least I do not see where you're heading with it.
> 
> From what I see, there is the
> 
> * arch/arm/plat-s3c24xx/dma.c driver with a proprietary s3c2410_dma_*
>   interface, used by s3cmci and some asoc drivers.
> * arch/arm/mach-s3c64xx/dma.c implementing the same interface and
> exporting
>   the same symbols.
> * The arch/arm/plat-samsung/dma-ops.c which is a wrapper around the
> generic
>   dmaengine API, hardcoding the pl330 DMA driver
> * The arch/arm/plat-samsung/include/plat/dma-ops.h interface abstraction
>   that gets used to pick between the two at compile time, and being used
> by
>   the spi driver and again other asoc drivers
> 
> Can you (or someone on the Cc list) explain what the plan is for this?
> Are you moving over the s3c2410_dma*() function to a dmaengine driver
> eventually? Do you expect to see more users of the nonstandard intefaces
> in the samsung code, or are they going away?
> 
Yeah, let me explain the status for Samsung SoCs' DMA. There are 3 different
DMA IPs, samsung specific s3c24xx dma, pl080 and pl330. As you know, pl330
already moved in drivers/dma for using common DMA engine and Alim is
re-working on pl080
(http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg10954.html
) and let me check its progress. But s3c24xx dma is not ready yet. When
pl330 was moving, my colleague, Boojin Kim posted to use common DMA APIs for
Samsung drivers which are using DMA such as spi and ASoC. But it was
including too many ifdef for checking which DMA is used and it can occur
breakage for multiplatform
(http://www.spinics.net/lists/arm-kernel/msg131137.html). So we implemented
to use some dma_ops after discussing with Grant Likely
(http://lists.infradead.org/pipermail/linux-arm-kernel/2011-July/058171.html
).

Anyway, we will try to use common DMA APIs for all Samsung SoCs. But need
more time ;)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

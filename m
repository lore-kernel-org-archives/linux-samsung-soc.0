From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 6/7] spi/s3c64xx: Add support DMA engine API
Date: Fri, 08 Jul 2011 18:26:45 +0900
Message-ID: <001101cc3d51$29b40250$7d1c06f0$%kim@samsung.com>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com>
 <201107041859.11548.heiko@sntech.de>
 <20110704170217.GH28042@ponder.secretlab.ca>
 <201107042151.44075.heiko@sntech.de>
 <20110704232758.GB12824@ponder.secretlab.ca>
 <00bd01cc3ae1$f1dbfac0$d593f040$%kim@samsung.com>
 <CABb+yY3UqrbBNS1J1X1gCxPLp8Kv8JSe92Pnb7JpE9x9kqTPiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:62904 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751848Ab1GHJ0u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Jul 2011 05:26:50 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LO000LK4CW5O4S0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Jul 2011 18:26:49 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LO000FPWCWOAE@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Jul 2011 18:26:48 +0900 (KST)
In-reply-to: <CABb+yY3UqrbBNS1J1X1gCxPLp8Kv8JSe92Pnb7JpE9x9kqTPiA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jassi Brar' <jassisinghbrar@gmail.com>
Cc: 'Grant Likely' <grant.likely@secretlab.ca>, =?UTF-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Vinod Koul' <vinod.koul@intel.com>, 'Dan Williams' <dan.j.williams@intel.com>, 'Liam Girdwood' <lrg@ti.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Boojin Kim' <boojin.kim@samsung.com>

Jassi Brar wrote:
> 
> > As you saw, the S3C_DMA_API is still used for PL080 DMA for compatibilities
> > with this patches in each driver, e.g., spi and audio. As a note, S3C24XX
> > and S3C64XX include PL080 DMAC not PL330.
> Not exactly.
> S3C24XX  use 2-3 different versions of Samsung's DMA implementations.
> S3C6400/10  use PL080
> S5P and later series use PL330

Your information is correct, I was confused.

> > Of course, if we can remove every S3C_DMA_API, that can be the best solution
> > but it needs more time. I'd like to go to our goal step by step.
> >
> Ideally, like PL330 for S5Pxxxx, drivers/dma/pl080 should be enabled for s3c64xx
> And new generic dma api drivers written for S3C24xx in drivers/dma/
> 
We're thinking about this :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM:SAMSUNG: DMA Cleanup as per sparse [re-submit]
Date: Sat, 16 Jul 2011 16:06:16 +0900
Message-ID: <037901cc4386$dab51180$901f3480$%kim@samsung.com>
References: <1310401398-21104-1-git-send-email-sangwook.lee@linaro.org>
 <4E1BE8A5.1010304@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35707 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751110Ab1GPHGR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 16 Jul 2011 03:06:17 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOE00HRTZQCJS30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 16 Jul 2011 16:06:16 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOE00LOGZQGCQ@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 16 Jul 2011 16:06:16 +0900 (KST)
In-reply-to: <4E1BE8A5.1010304@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, 'Sangwook Lee' <sangwook.lee@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jassisinghbrar@gmail.com, ben-linux@fluff.org

Tushar Behera wrote:
> 
> On Monday 11 July 2011 09:53 PM, Sangwook Lee wrote:
> > Function declaration differs between file: dma.c and file:dma.h
> > and SPARSE (Documentation/sparse.txt) gives error messages
> >
> > All dma channels are members of 'enum dma_ch' and not 'unsigned int'
> > Please have a look at channel definitions in:
> > arch/arm/mach-s3c64xx/include/mach/dma.h
> > arch/arm/plat-samsung/include/plat/s3c-dma-pl330.h
> > arch/arm/mach-s3c2410/include/mach/dma.h
> > So all arguments should be of type 'enum dma_ch'
> >
> > Signed-off-by: Sangwook Lee<sangwook.lee@linaro.org>
> > ---
> >   arch/arm/mach-s3c64xx/dma.c              |   14 +++++++-------
> >   arch/arm/plat-s3c24xx/dma.c              |   12 ++++++------
> >   arch/arm/plat-samsung/dma.c              |    6 +++---
> >   arch/arm/plat-samsung/include/plat/dma.h |   21 +++++++++++----------
> >   4 files changed, 27 insertions(+), 26 deletions(-)
> >
> 
> Compilation is ok for following default configs.
> 
> s3c2410_defconfig
> s3c6400_defconfig
> s5p64x0_defconfig
> s5pc100_defconfig
> s5pv210_defconfig
> exynos4_defconfig
> 

Tushar, Thanks :)

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

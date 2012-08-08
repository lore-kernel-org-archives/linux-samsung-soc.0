From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/1] ARM: SAMSUNG: Fix compilation error
Date: Wed, 08 Aug 2012 13:56:19 +0900
Message-ID: <0a5301cd7522$260e6d70$722b4850$%kim@samsung.com>
References: <1340165950-8996-1-git-send-email-sachin.kamat@linaro.org>
 <0a1e01cd74fe$14ecc970$3ec65c50$%kim@samsung.com>
 <CAK9yfHx7tC4e0dvyeaMs8J6JJfjZGvvnZoyyc_0JgpOLohPZEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:48007 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751109Ab2HHE4U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Aug 2012 00:56:20 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M8F00KZO70YWGI0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 08 Aug 2012 13:56:19 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M8F00AD971VY8J0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 08 Aug 2012 13:56:19 +0900 (KST)
In-reply-to: <CAK9yfHx7tC4e0dvyeaMs8J6JJfjZGvvnZoyyc_0JgpOLohPZEA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, patches@linaro.org

Sachin Kamat wrote:
> 
> On 8 August 2012 06:08, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > Kukjin Kim wrote:
> >>
> >> Sachin Kamat wrote:
> >> >
> >> > Fixes the following build error:
> >> > In file included from arch/arm/mach-exynos/include/mach/dma.h:24:0,
> >> >                  from
arch/arm/plat-samsung/include/plat/dma-ops.h:17,
> >> >                  from arch/arm/plat-samsung/include/plat/dma.h:128,
> >> >                  from sound/soc/samsung/pcm.c:23:
> >> > arch/arm/plat-samsung/include/plat/dma-pl330.h:106:8: error:
> >> redefinition
> >> > of 'struct s3c2410_dma_client'
> >> > arch/arm/plat-samsung/include/plat/dma.h:40:8: note: originally
> defined
> >> > here
> >> >
> >> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> >> > ---
> >> >  arch/arm/plat-samsung/include/plat/dma.h |    5 +----
> >> >  1 files changed, 1 insertions(+), 4 deletions(-)
> >> >
> >> > diff --git a/arch/arm/plat-samsung/include/plat/dma.h
> b/arch/arm/plat-
> >> > samsung/include/plat/dma.h
> >> > index 7b02143..fdf34bc 100644
> >> > --- a/arch/arm/plat-samsung/include/plat/dma.h
> >> > +++ b/arch/arm/plat-samsung/include/plat/dma.h
> >> > @@ -37,10 +37,7 @@ enum s3c2410_chan_op {
> >> >     S3C2410_DMAOP_STARTED,          /* indicate channel started */
> >> >  };
> >> >
> >> > -struct s3c2410_dma_client {
> >> > -   char                *name;
> >> > -};
> >> > -
> >> > +struct s3c2410_dma_client;
> >> >  struct s3c2410_dma_chan;
> >> >  enum dma_ch;
> >> >
> >> > --
> >> > 1.7.4.1
> >>
> >> Applied, thanks.
> >>
> > Oops, this brings following error :(
> >
> > drivers/spi/spi-s3c64xx.c:205: error: variable 's3c64xx_spi_dma_client'
> has initializer but incomplete type
> > drivers/spi/spi-s3c64xx.c:206: error: unknown field 'name' specified in
> initializer
> > drivers/spi/spi-s3c64xx.c:206: warning: excess elements in struct
> initializer
> > drivers/spi/spi-s3c64xx.c:206: warning: (near initialization for
> 's3c64xx_spi_dma_client')
> >
> > As you know, the 'struct s3c2410_dma_client' is defined at the
> <plat/dma-pl330.h>  after applying this patch but S3C24XX and S3C64XX are
> not including 'plat/dma-pl330.h' so above error happened.
> 
> So in that case, can we include this header in those files?
> 
No, the <plat/dma-pl330.h> is only for PL330 not S3C24XX/S3C64XX and it
means above build error you reported should be fixed with another way.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

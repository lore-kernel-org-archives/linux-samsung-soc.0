From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH v2] ARM: Samsung: s5p-fimc: fix dma coherent mask
Date: Tue, 14 Sep 2010 11:27:01 +0200
Message-ID: <004201cb53ee$ff8e2a60$feaa7f20$%szyprowski@samsung.com>
References: <000301cb4fb7$b4448530$1ccd8f90$%kim@samsung.com>
 <1283998673-14899-1-git-send-email-m.szyprowski@samsung.com>
 <011101cb5010$fdb1d520$f9157f60$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:14713 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752605Ab0INJ1J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Sep 2010 05:27:09 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L8Q00CB2CX7C470@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Sep 2010 18:27:07 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L8Q000N9CX328@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Sep 2010 18:27:07 +0900 (KST)
In-reply-to: <011101cb5010$fdb1d520$f9157f60$%kim@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Hello,

On Thursday, September 09, 2010 1:20 PM Kukjin Kim wrote:

> Marek Szyprowski wrote:
> >
> > FIMC driver uses DMA_coherent allocator, which requires proper dma mask
> > to be set.
> >
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >
> > Chnages since v1:
> > - use DMA_BIT_MASK() macro, minor coding style change
> >
> > ---
> >  arch/arm/plat-s5p/dev-fimc0.c |    7 +++++++
> >  arch/arm/plat-s5p/dev-fimc1.c |    7 +++++++
> >  arch/arm/plat-s5p/dev-fimc2.c |    7 +++++++
> >  3 files changed, 21 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm/plat-s5p/dev-fimc0.c b/arch/arm/plat-s5p/dev-
> fimc0.c
> > index d3f1a9b..f9203fa 100644
> > --- a/arch/arm/plat-s5p/dev-fimc0.c
> > +++ b/arch/arm/plat-s5p/dev-fimc0.c
> > @@ -10,6 +10,7 @@
> >   */
> >
> >  #include <linux/kernel.h>
> > +#include <linux/dma-mapping.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/ioport.h>
> > @@ -28,9 +29,15 @@ static struct resource s5p_fimc0_resource[] = {
> >  	},
> >  };
> >
> > +static u64 s5p_fimc0_dma_mask = DMA_BIT_MASK(32);
> > +
> >  struct platform_device s5p_device_fimc0 = {
> >  	.name		= "s5p-fimc",
> >  	.id		= 0,
> >  	.num_resources	= ARRAY_SIZE(s5p_fimc0_resource),
> >  	.resource	= s5p_fimc0_resource,
> > +	.dev		= {
> > +		.dma_mask		= &s5p_fimc0_dma_mask,
> > +		.coherent_dma_mask	= DMA_BIT_MASK(32),
> > +	},
> >  };
> > diff --git a/arch/arm/plat-s5p/dev-fimc1.c b/arch/arm/plat-s5p/dev-
> fimc1.c
> > index 41bd698..7ed91a3 100644
> > --- a/arch/arm/plat-s5p/dev-fimc1.c
> > +++ b/arch/arm/plat-s5p/dev-fimc1.c
> > @@ -10,6 +10,7 @@
> >   */
> >
> >  #include <linux/kernel.h>
> > +#include <linux/dma-mapping.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/ioport.h>
> > @@ -28,9 +29,15 @@ static struct resource s5p_fimc1_resource[] = {
> >  	},
> >  };
> >
> > +static u64 s5p_fimc1_dma_mask = DMA_BIT_MASK(32);
> > +
> >  struct platform_device s5p_device_fimc1 = {
> >  	.name		= "s5p-fimc",
> >  	.id		= 1,
> >  	.num_resources	= ARRAY_SIZE(s5p_fimc1_resource),
> >  	.resource	= s5p_fimc1_resource,
> > +	.dev		= {
> > +		.dma_mask		= &s5p_fimc1_dma_mask,
> > +		.coherent_dma_mask	= DMA_BIT_MASK(32),
> > +	},
> >  };
> > diff --git a/arch/arm/plat-s5p/dev-fimc2.c b/arch/arm/plat-s5p/dev-
> fimc2.c
> > index dfddeda..5543d6373 100644
> > --- a/arch/arm/plat-s5p/dev-fimc2.c
> > +++ b/arch/arm/plat-s5p/dev-fimc2.c
> > @@ -10,6 +10,7 @@
> >   */
> >
> >  #include <linux/kernel.h>
> > +#include <linux/dma-mapping.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/ioport.h>
> > @@ -28,9 +29,15 @@ static struct resource s5p_fimc2_resource[] = {
> >  	},
> >  };
> >
> > +static u64 s5p_fimc2_dma_mask = DMA_BIT_MASK(32);
> > +
> >  struct platform_device s5p_device_fimc2 = {
> >  	.name		= "s5p-fimc",
> >  	.id		= 2,
> >  	.num_resources	= ARRAY_SIZE(s5p_fimc2_resource),
> >  	.resource	= s5p_fimc2_resource,
> > +	.dev		= {
> > +		.dma_mask		= &s5p_fimc2_dma_mask,
> > +		.coherent_dma_mask	= DMA_BIT_MASK(32),
> > +	},
> >  };
> > --
> > 1.7.2.2
> 
> looks good to me..will apply :-)

What about merging this patch also to the kgene/s5p-fixes-for-linus branch?
IMHO this and the fimc clocks patch are pure bug fixes that should be merged
into final 2.6.36 kernel. Without these two patches fimc driver is useless.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center

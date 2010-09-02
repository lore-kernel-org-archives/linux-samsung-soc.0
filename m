From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 08/13] ARM: S5P64X0: Move DMA support for S5P64X0
Date: Thu, 02 Sep 2010 16:32:19 +0900
Message-ID: <004701cb4a70$fc807260$f5815720$%kim@samsung.com>
References: <1283324960-21629-1-git-send-email-kgene.kim@samsung.com>
 <1283324960-21629-9-git-send-email-kgene.kim@samsung.com>
 <AANLkTi=1tJ-EnDmiossRWVPkumubicqXzqvXSrWQMqQ=@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60052 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751131Ab0IBHcb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Sep 2010 03:32:31 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L8300DWTZLJAU60@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Sep 2010 16:32:07 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L830008UZLJ3C@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Sep 2010 16:32:07 +0900 (KST)
In-reply-to: <AANLkTi=1tJ-EnDmiossRWVPkumubicqXzqvXSrWQMqQ=@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jassi Brar' <jassisinghbrar@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Jassi Brar' <jassi.brar@samsung.com>, ben-linux@fluff.org

Jassi Brar wrote:
> 
> On Wed, Sep 1, 2010 at 4:09 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > This patch moves DMA support files in the mach-s5p64x0
> > for S5P6440 and S5P6450 SoCs.
> >
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > Cc: Jassi Brar <jassi.brar@samsung.com>
> > ---
> >  arch/arm/{mach-s5p6440 => mach-s5p64x0}/dma.c      |   75
> ++++++++++++++++---
> >  .../include/mach/dma.h                             |    0
> >  arch/arm/plat-samsung/include/plat/s3c-dma-pl330.h |   28 +++++++
> >  3 files changed, 91 insertions(+), 12 deletions(-)
> >  rename arch/arm/{mach-s5p6440 => mach-s5p64x0}/dma.c (56%)
> >  rename arch/arm/{mach-s5p6440 => mach-s5p64x0}/include/mach/dma.h (100%)
> >

(snip)

> > +
> >  static struct platform_device s5p6440_device_pdma = {
> >        .name           = "s3c-pl330",
> >        .id             = 1,
> 
> While at it, please make id 0  as well.
> 
Ok..will fix it.

> 
> > -       .num_resources  = ARRAY_SIZE(s5p6440_pdma_resource),
> > -       .resource       = s5p6440_pdma_resource,
> > +       .num_resources  = ARRAY_SIZE(s5p64x0_pdma_resource),
> > +       .resource       = s5p64x0_pdma_resource,
> >        .dev            = {
> >                .dma_mask = &dma_dmamask,
> >                .coherent_dma_mask = DMA_BIT_MASK(32),
> > @@ -92,14 +130,27 @@ static struct platform_device s5p6440_device_pdma = {
> >        },
> >  };
> >
> > -static struct platform_device *s5p6440_dmacs[] __initdata = {
> > +static struct platform_device s5p6450_device_pdma = {
> > +       .name           = "s3c-pl330",
> > +       .id             = 0,
> > +       .num_resources  = ARRAY_SIZE(s5p64x0_pdma_resource),
> > +       .resource       = s5p64x0_pdma_resource,
> > +       .dev            = {
> > +               .dma_mask = &dma_dmamask,
> > +               .coherent_dma_mask = DMA_BIT_MASK(32),
> > +               .platform_data = &s5p6450_pdma_pdata,
> > +       },
> > +};
> > +
> > +static struct platform_device *s5p64x0_dmacs[] __initdata = {
> >        &s5p6440_device_pdma,
> > +       /* &s5p6450_device_pdma will be added */
> >  };
> Let us simply call the DMAC as s5p64x0_device_pdma and use some
> CPU detection method in s5p64x0_dma_init to assign either of
> s5p6440_pdma_pdata and s5p6450_pdma_pdata to the platform_data
> 
Ok.

> ........
> 
> > +       DMACH_MTOM_0,
> > +       DMACH_MTOM_1,
> > +       DMACH_MTOM_2,
> > +       DMACH_MTOM_3,
> > +       DMACH_MTOM_4,
> > +       DMACH_MTOM_5,
> > +       DMACH_MTOM_6,
> > +       DMACH_MTOM_7,
> 
> oops ... Mainline s3c dma api doesn't yet support Mem->Mem transfers.
> You need to drop it.

Oh, you're right. it's my mistake.
Will fix it. :-)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

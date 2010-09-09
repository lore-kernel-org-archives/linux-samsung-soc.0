From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/4] ARM: Samsung: s5p-fimc: fix dma coherent mask
Date: Thu, 09 Sep 2010 09:41:08 +0900
Message-ID: <000301cb4fb7$b4448530$1ccd8f90$%kim@samsung.com>
References: <1283745044-15514-1-git-send-email-m.szyprowski@samsung.com>
 <1283745044-15514-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:24814 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751342Ab0IIAk4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Sep 2010 20:40:56 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L8G005MQF87KQ70@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Sep 2010 09:40:55 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L8G004L0F87BK@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Sep 2010 09:40:55 +0900 (KST)
In-reply-to: <1283745044-15514-3-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Marek Szyprowski wrote:
> 
> FIMC driver uses DMA_coherent allocator, which requires proper dma mask
> to be set.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/plat-s5p/dev-fimc0.c |    2 ++
>  arch/arm/plat-s5p/dev-fimc1.c |    2 ++
>  arch/arm/plat-s5p/dev-fimc2.c |    2 ++
>  3 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-s5p/dev-fimc0.c b/arch/arm/plat-s5p/dev-fimc0.c
> index d3f1a9b..9f26096 100644
> --- a/arch/arm/plat-s5p/dev-fimc0.c
> +++ b/arch/arm/plat-s5p/dev-fimc0.c
> @@ -33,4 +33,6 @@ struct platform_device s5p_device_fimc0 = {
>  	.id		= 0,
>  	.num_resources	= ARRAY_SIZE(s5p_fimc0_resource),
>  	.resource	= s5p_fimc0_resource,
> +	.dev.dma_mask	  = &s5p_device_fimc0.dev.coherent_dma_mask,
> +	.dev.coherent_dma_mask = 0xffffffffUL,

Ok...but I prefer following style :-)
Could you please re-submit your this patch?

diff --git a/arch/arm/plat-s5p/dev-fimc0.c b/arch/arm/plat-s5p/dev-fimc0.c
index d3f1a9b..cb1ff4d 100644
--- a/arch/arm/plat-s5p/dev-fimc0.c
+++ b/arch/arm/plat-s5p/dev-fimc0.c
@@ -28,9 +28,15 @@ static struct resource s5p_fimc0_resource[] = {
        },
 };

+static u64 s5p_fimc_dma_mask = DMA_BIT_MASK(32);
+
 struct platform_device s5p_device_fimc0 = {
 	.name		= "s5p-fimc",
 	.id		= 0,
 	.num_resources	= ARRAY_SIZE(s5p_fimc0_resource),
 	.resource	= s5p_fimc0_resource,
+	.dev		= {
+		.dma_mask		= &s5p_fimc_dma_mask,
+		.coherent_dma_mask	= DMA_BIT_MASK(32),
+	},
 };

>  };
> diff --git a/arch/arm/plat-s5p/dev-fimc1.c b/arch/arm/plat-s5p/dev-fimc1.c
> index 41bd698..4149c49 100644
> --- a/arch/arm/plat-s5p/dev-fimc1.c
> +++ b/arch/arm/plat-s5p/dev-fimc1.c
> @@ -33,4 +33,6 @@ struct platform_device s5p_device_fimc1 = {
>  	.id		= 1,
>  	.num_resources	= ARRAY_SIZE(s5p_fimc1_resource),
>  	.resource	= s5p_fimc1_resource,
> +	.dev.dma_mask	  = &s5p_device_fimc1.dev.coherent_dma_mask,
> +	.dev.coherent_dma_mask = 0xffffffffUL,
>  };
> diff --git a/arch/arm/plat-s5p/dev-fimc2.c b/arch/arm/plat-s5p/dev-fimc2.c
> index dfddeda..ced9097 100644
> --- a/arch/arm/plat-s5p/dev-fimc2.c
> +++ b/arch/arm/plat-s5p/dev-fimc2.c
> @@ -33,4 +33,6 @@ struct platform_device s5p_device_fimc2 = {
>  	.id		= 2,
>  	.num_resources	= ARRAY_SIZE(s5p_fimc2_resource),
>  	.resource	= s5p_fimc2_resource,
> +	.dev.dma_mask	  = &s5p_device_fimc2.dev.coherent_dma_mask,
> +	.dev.coherent_dma_mask = 0xffffffffUL,
>  };
> --
> 1.7.2.2

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

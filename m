From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/4] ARM: EXYNOS: PL330 MDMA1 fix for revision 0 of
 Exynos4210 SOC
Date: Fri, 09 Nov 2012 19:19:58 +0900
Message-ID: <0e8801cdbe63$c52b6e50$4f824af0$%kim@samsung.com>
References: <1351504796-24788-1-git-send-email-b.zolnierkie@samsung.com>
 <201210300956.23102.b.zolnierkie@samsung.com>
 <0cea01cdbd6c$7ace7200$706b5600$%kim@samsung.com>
 <201211081054.41649.b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:18715 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751235Ab2KIKUA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Nov 2012 05:20:00 -0500
In-reply-to: <201211081054.41649.b.zolnierkie@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, jassisinghbrar@gmail.com, vinod.koul@intel.com, rob.herring@calxeda.com, dinguyen@altera.com, pawel.moll@arm.com, t.figa@samsung.com, kyungmin.park@samsung.com

Bartlomiej Zolnierkiewicz wrote:
> 
> Ah, okay.  Here is full simplified patch.
> 
> From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Subject: [PATCH v2] ARM: EXYNOS: PL330 MDMA1 fix for revision 0 of
> Exynos4210 SOC
> 
> Commit 8214513 ("ARM: EXYNOS: fix address for EXYNOS4 MDMA1")
> changed EXYNOS specific setup of PL330 DMA engine to use 'non-secure'
> mdma1 address instead of 'secure' one (from 0x12840000 to 0x12850000)
> to fix issue with some Exynos4212 SOCs.  Unfortunately it brakes
> PL330 setup for revision 0 of Exynos4210 SOC (mdma1 device cannot
> be found at 'non-secure' address):
> 
> [    0.566245] dma-pl330 dma-pl330.2: PERIPH_ID 0x0, PCELL_ID 0x0 !
> [    0.566278] dma-pl330: probe of dma-pl330.2 failed with error -22
> 
> Fix it by using 'secure' mdma1 address on Exynos4210 revision 0 SOC.
> 
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/dma.c              |    3 +++
>  arch/arm/mach-exynos/include/mach/map.h |    1 +
>  2 files changed, 4 insertions(+)
> 
> Index: b/arch/arm/mach-exynos/dma.c
> ===================================================================
> --- a/arch/arm/mach-exynos/dma.c	2012-11-07 18:20:36.561743865 +0100
> +++ b/arch/arm/mach-exynos/dma.c	2012-11-08 10:48:23.445067606 +0100
> @@ -275,6 +275,9 @@ static int __init exynos_dma_init(void)
>  		exynos_pdma1_pdata.nr_valid_peri =
>  			ARRAY_SIZE(exynos4210_pdma1_peri);
>  		exynos_pdma1_pdata.peri_id = exynos4210_pdma1_peri;
> +
> +		if (samsung_rev() == EXYNOS4210_REV_0)
> +			exynos_mdma1_device.res.start = EXYNOS4_PA_S_MDMA1;
>  	} else if (soc_is_exynos4212() || soc_is_exynos4412()) {
>  		exynos_pdma0_pdata.nr_valid_peri =
>  			ARRAY_SIZE(exynos4212_pdma0_peri);
> Index: b/arch/arm/mach-exynos/include/mach/map.h
> ===================================================================
> --- a/arch/arm/mach-exynos/include/mach/map.h	2012-11-07
> 18:20:44.801743862 +0100
> +++ b/arch/arm/mach-exynos/include/mach/map.h	2012-11-08
> 10:48:40.597067605 +0100
> @@ -92,6 +92,7 @@
> 
>  #define EXYNOS4_PA_MDMA0		0x10810000
>  #define EXYNOS4_PA_MDMA1		0x12850000
> +#define EXYNOS4_PA_S_MDMA1		0x12840000
>  #define EXYNOS4_PA_PDMA0		0x12680000
>  #define EXYNOS4_PA_PDMA1		0x12690000
>  #define EXYNOS5_PA_MDMA0		0x10800000

Looks good to me, and I think, this can be handled separate from this
series.

Vinod, if you're ok, let me pick this up into Samsung tree.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

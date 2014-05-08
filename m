From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH V3 2/3] ARM: EXYNOS5: Add Suspend-to-RAM support for 5420
Date: Thu, 08 May 2014 14:24:39 +0200
Message-ID: <8537431.uXYiuaPHBe@amdc1032>
References: <1399546368-30537-1-git-send-email-vikas.sajjan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:23093 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753343AbaEHMYw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 08:24:52 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5900J3N95FD900@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 May 2014 21:24:51 +0900 (KST)
In-reply-to: <1399546368-30537-1-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, pankaj.dubey@samsung.com, Abhilash Kesavan <a.kesavan@samsung.com>


Hi,

On Thursday, May 08, 2014 04:22:48 PM Vikas Sajjan wrote:
> Adds Suspend-to-RAM support for EXYNOS5420
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
> ---
>  arch/arm/mach-exynos/pm.c       |  163 ++++++++++++++++++++++++++++++++++-----
>  arch/arm/mach-exynos/regs-pmu.h |    2 +
>  2 files changed, 146 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
> index a7a1b7f..87ccac7 100644
> --- a/arch/arm/mach-exynos/pm.c
> +++ b/arch/arm/mach-exynos/pm.c

[...]

> @@ -280,33 +352,80 @@ static int exynos_pm_central_resume(void)
>  
>  static void exynos_pm_resume(void)
>  {
> +	unsigned int tmp;
> +	if (soc_is_exynos5420()) {
> +		/* Restore the IRAM register cpu state */
> +		s3c_pm_do_restore(exynos5420_cpustate_save,
> +			ARRAY_SIZE(exynos5420_cpustate_save));
> +
> +		regmap_write(pmu_regmap, S5P_CENTRAL_SEQ_OPTION,
> +				EXYNOS5420_USE_STANDBY_WFI_ALL);
> +	}
> +
>  	if (exynos_pm_central_resume())
>  		goto early_wakeup;
>  
> -	if (!soc_is_exynos5250())
> +	if (!(soc_is_exynos5250() || soc_is_exynos5420()))
>  		exynos_cpu_restore_register();
>  
>  	/* For release retention */
>  
> -	regmap_write(pmu_regmap, S5P_PAD_RET_MAUDIO_OPTION, (1 << 28));
> -	regmap_write(pmu_regmap, S5P_PAD_RET_GPIO_OPTION, (1 << 28));
> -	regmap_write(pmu_regmap, S5P_PAD_RET_UART_OPTION, (1 << 28));
> -	regmap_write(pmu_regmap, S5P_PAD_RET_MMCA_OPTION, (1 << 28));
> -	regmap_write(pmu_regmap, S5P_PAD_RET_MMCB_OPTION, (1 << 28));
> -	regmap_write(pmu_regmap, S5P_PAD_RET_EBIA_OPTION, (1 << 28));
> -	regmap_write(pmu_regmap, S5P_PAD_RET_EBIB_OPTION, (1 << 28));
> +	if (soc_is_exynos5250()) {

Adding a check here for EXYNOS5250 doesn't look correct (the old code
behavior for older EXYNOS SoCs should be preserved).

> +		regmap_write(pmu_regmap, S5P_PAD_RET_MAUDIO_OPTION, (1 << 28));
> +		regmap_write(pmu_regmap, S5P_PAD_RET_GPIO_OPTION, (1 << 28));
> +		regmap_write(pmu_regmap, S5P_PAD_RET_UART_OPTION, (1 << 28));
> +		regmap_write(pmu_regmap, S5P_PAD_RET_MMCA_OPTION, (1 << 28));
> +		regmap_write(pmu_regmap, S5P_PAD_RET_MMCB_OPTION, (1 << 28));
> +		regmap_write(pmu_regmap, S5P_PAD_RET_EBIA_OPTION, (1 << 28));
> +		regmap_write(pmu_regmap, S5P_PAD_RET_EBIB_OPTION, (1 << 28));
> +	} else if (soc_is_exynos5420()) {
> +		regmap_write(pmu_regmap, EXYNOS_PAD_RET_DRAM_OPTION, (1 << 28));
> +		regmap_write(pmu_regmap, EXYNOS_PAD_RET_MAUDIO_OPTION, (1 << 28));
> +		regmap_write(pmu_regmap, EXYNOS_PAD_RET_JTAG_OPTION,  (1 << 28));
> +		regmap_write(pmu_regmap, EXYNOS5420_PAD_RET_GPIO_OPTION, (1 << 28));
> +		regmap_write(pmu_regmap, EXYNOS5420_PAD_RET_UART_OPTION, (1 << 28));
> +		regmap_write(pmu_regmap, EXYNOS5420_PAD_RET_MMCA_OPTION, (1 << 28));
> +		regmap_write(pmu_regmap, EXYNOS5420_PAD_RET_MMCB_OPTION, (1 << 28));
> +		regmap_write(pmu_regmap, EXYNOS5420_PAD_RET_MMCC_OPTION, (1 << 28));
> +		regmap_write(pmu_regmap, EXYNOS5420_PAD_RET_HSI_OPTION, (1 << 28));
> +		regmap_write(pmu_regmap, EXYNOS_PAD_RET_EBIA_OPTION, (1 << 28));
> +		regmap_write(pmu_regmap, EXYNOS_PAD_RET_EBIB_OPTION, (1 << 28));
> +		regmap_write(pmu_regmap, EXYNOS5420_PAD_RET_SPI_OPTION, (1 << 28));
> +		regmap_write(pmu_regmap, EXYNOS5420_PAD_RET_DRAM_COREBLK_OPTION, (1 << 28));
> +	}

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

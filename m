From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Fix card insert/removal event detection on
 smdkv310 board
Date: Thu, 16 Jun 2011 18:46:45 +0900
Message-ID: <000101cc2c0a$51efd8f0$f5cf8ad0$%kim@samsung.com>
References: <1305836690-890-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40804 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754684Ab1FPJqx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jun 2011 05:46:53 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LMV00IO7N5YNZB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 16 Jun 2011 18:46:52 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LMV0035LN64J6@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 16 Jun 2011 18:46:52 +0900 (KST)
In-reply-to: <1305836690-890-1-git-send-email-thomas.ab@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.ab@samsung.com>, linux-samsung-soc@vger.kernel.org

Thomas Abraham wrote:
> 
> On SMDKV310 board, a card detect gpio pin is available that is directly
> connected to the io pad of the sdhci controller. Fix incorrect value
> of cd_type field in platform data for sdhci instance 0 and 2.
> 
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> ---
>  arch/arm/mach-exynos4/mach-smdkv310.c |    8 ++------
>  1 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-
> exynos4/mach-smdkv310.c
> index 1526764..edd8141 100644
> --- a/arch/arm/mach-exynos4/mach-smdkv310.c
> +++ b/arch/arm/mach-exynos4/mach-smdkv310.c
> @@ -78,9 +78,7 @@ static struct s3c2410_uartcfg smdkv310_uartcfgs[]
__initdata
> = {
>  };
> 
>  static struct s3c_sdhci_platdata smdkv310_hsmmc0_pdata __initdata = {
> -	.cd_type		= S3C_SDHCI_CD_GPIO,
> -	.ext_cd_gpio		= EXYNOS4_GPK0(2),
> -	.ext_cd_gpio_invert	= 1,
> +	.cd_type		= S3C_SDHCI_CD_INTERNAL,
>  	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
>  #ifdef CONFIG_EXYNOS4_SDHCI_CH0_8BIT
>  	.max_width		= 8,
> @@ -96,9 +94,7 @@ static struct s3c_sdhci_platdata smdkv310_hsmmc1_pdata
> __initdata = {
>  };
> 
>  static struct s3c_sdhci_platdata smdkv310_hsmmc2_pdata __initdata = {
> -	.cd_type		= S3C_SDHCI_CD_GPIO,
> -	.ext_cd_gpio		= EXYNOS4_GPK2(2),
> -	.ext_cd_gpio_invert	= 1,
> +	.cd_type		= S3C_SDHCI_CD_INTERNAL,
>  	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
>  #ifdef CONFIG_EXYNOS4_SDHCI_CH2_8BIT
>  	.max_width		= 8,
> --

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

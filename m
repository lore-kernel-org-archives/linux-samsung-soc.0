From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Fix card insert/removal event detection on
	smdkv310 board
Date: Mon, 16 May 2011 18:57:08 +0200
Message-ID: <000a01cc13ea$4afb9b20$e0f2d160$%szyprowski@samsung.com>
References: <1305554761-2954-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:28240 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751959Ab1EPQ5O (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 May 2011 12:57:14 -0400
Received: from eu_spt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LLA00K5GSFDXI@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 May 2011 17:57:13 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LLA00EHVSFC9L@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 May 2011 17:57:12 +0100 (BST)
In-reply-to: <1305554761-2954-1-git-send-email-thomas.ab@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.ab@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Hello,

On Monday, May 16, 2011 4:06 PM Thomas Abraham wrote:

> On SMDKV310 board, a card detect gpio pin is available that is directly
> connected to the io pad of the sdhci controller. Fix incorrect value
> of cd_type field in platform data for sdhci instance 0 and 2.
> 
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> ---
>  arch/arm/mach-exynos4/mach-smdkv310.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-
> exynos4/mach-smdkv310.c
> index 1526764..f6b1c7e 100644
> --- a/arch/arm/mach-exynos4/mach-smdkv310.c
> +++ b/arch/arm/mach-exynos4/mach-smdkv310.c
> @@ -78,7 +78,7 @@ static struct s3c2410_uartcfg smdkv310_uartcfgs[]
> __initdata = {
>  };
> 
>  static struct s3c_sdhci_platdata smdkv310_hsmmc0_pdata __initdata = {
> -	.cd_type		= S3C_SDHCI_CD_GPIO,
> +	.cd_type		= S3C_SDHCI_CD_INTERNAL,
>  	.ext_cd_gpio		= EXYNOS4_GPK0(2),
>  	.ext_cd_gpio_invert	= 1,

When you are changing the card detection type from GPIO to INTERNAL you should
also remove 'ext_cd_gpio' and 'ext_cd_gpio_invert' definitions.

>  	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
> @@ -96,7 +96,7 @@ static struct s3c_sdhci_platdata smdkv310_hsmmc1_pdata
> __initdata = {
>  };
> 
>  static struct s3c_sdhci_platdata smdkv310_hsmmc2_pdata __initdata = {
> -	.cd_type		= S3C_SDHCI_CD_GPIO,
> +	.cd_type		= S3C_SDHCI_CD_INTERNAL,
>  	.ext_cd_gpio		= EXYNOS4_GPK2(2),
>  	.ext_cd_gpio_invert	= 1,

The same as with hsmmc0.

>  	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
> --

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: convert boot_params to atag_offset
Date: Wed, 14 Sep 2011 21:48:47 +0900
Message-ID: <008601cc72dc$a5879700$f096c500$%kim@samsung.com>
References: <1315802349-3892-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:21279 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932381Ab1INMsu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Sep 2011 08:48:50 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRI00H7XJL0UQ50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Sep 2011 21:48:48 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LRI00IDOJLC4I@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Sep 2011 21:48:48 +0900 (KST)
In-reply-to: <1315802349-3892-1-git-send-email-tushar.behera@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linaro-dev@lists.linaro.org, patches@linaro.org, 'Nicolas Pitre' <nicolas.pitre@linaro.org>

Tushar Behera wrote:
> 
> Based on "ARM: introduce atag_offset to replace boot_params"
> by Nicolas Pitre (2bb9839e312ed55a6d5824ffa6077ce3d7d63b1e).
> 
> Since boot_params variable is deleted from machine_desc, the variable
> is modified in the newer board files.
> 
> CC: Nicolas Pitre <nicolas.pitre@linaro.org>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
> This is required when Kukjin's for-next branch is merged with
> Russell's devel-stable branch.
> 
> Nicolas's patchset already has changes for other EXYNSO4 based boards.
> 
>  arch/arm/mach-exynos4/mach-origen.c   |    2 +-
>  arch/arm/mach-exynos4/mach-smdk4212.c |    2 +-
>  arch/arm/mach-exynos4/mach-smdkv310.c |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/mach-origen.c
b/arch/arm/mach-exynos4/mach-
> origen.c
> index ed59f86..b5f6f38 100644
> --- a/arch/arm/mach-exynos4/mach-origen.c
> +++ b/arch/arm/mach-exynos4/mach-origen.c
> @@ -100,7 +100,7 @@ static void __init origen_machine_init(void)
> 
>  MACHINE_START(ORIGEN, "ORIGEN")
>  	/* Maintainer: JeongHyeon Kim <jhkim@insignal.co.kr> */
> -	.boot_params	= S5P_PA_SDRAM + 0x100,
> +	.atag_offset	= 0x100,
>  	.init_irq	= exynos4_init_irq,
>  	.map_io		= origen_map_io,
>  	.init_machine	= origen_machine_init,
> diff --git a/arch/arm/mach-exynos4/mach-smdk4212.c b/arch/arm/mach-
> exynos4/mach-smdk4212.c
> index 3479a93..8c41ae1 100644
> --- a/arch/arm/mach-exynos4/mach-smdk4212.c
> +++ b/arch/arm/mach-exynos4/mach-smdk4212.c
> @@ -284,7 +284,7 @@ static void __init smdk4212_machine_init(void)
> 
>  MACHINE_START(SMDK4212, "SMDK4212")
>  	/* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
> -	.boot_params	= S5P_PA_SDRAM + 0x100,
> +	.atag_offset	= 0x100,
>  	.init_irq	= exynos4_init_irq,
>  	.map_io		= smdk4212_map_io,
>  	.init_machine	= smdk4212_machine_init,
> diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-
> exynos4/mach-smdkv310.c
> index 57cf632..7ce4d8b 100644
> --- a/arch/arm/mach-exynos4/mach-smdkv310.c
> +++ b/arch/arm/mach-exynos4/mach-smdkv310.c
> @@ -344,7 +344,7 @@ MACHINE_END
> 
>  MACHINE_START(SMDKC210, "SMDKC210")
>  	/* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
> -	.boot_params	= S5P_PA_SDRAM + 0x100,
> +	.atag_offset	= 0x100,
>  	.init_irq	= exynos4_init_irq,
>  	.map_io		= smdkv310_map_io,
>  	.init_machine	= smdkv310_machine_init,
> --
> 1.7.4.1

Hi Tushar,

Yes you're right and actually, I received the same information from Stephen
when he merges my -next the end of last month.

Anyway, if above fixing is required on my -next, will apply this.

Thanks :)

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

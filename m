From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/3] ARM: EXYNOS4: Fix sdhci card detection for ORIGEN
Date: Wed, 31 Aug 2011 09:53:35 +0900
Message-ID: <000301cc6778$69bd1e80$3d375b80$%kim@samsung.com>
References: <1314351524-10942-1-git-send-email-tushar.behera@linaro.org>
 <1314351524-10942-2-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:54978 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754352Ab1HaAxg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Aug 2011 20:53:36 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQR00GVZP334SK0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Aug 2011 09:53:35 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQR0086CP5BH6@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Aug 2011 09:53:35 +0900 (KST)
In-reply-to: <1314351524-10942-2-git-send-email-tushar.behera@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linaro-dev@lists.linaro.org, patches@linaro.org

Tushar Behera wrote:
> 
> Fix incorrect value of cd_type field in platform data for sdhci
> device.
> 
> Based on "ARM: EXYNOS4: Fix card detection for sdhci 0 and 2".
> commit a0d8efedb203b5b908dd46cea38201761e2380f9
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
>  arch/arm/mach-exynos4/mach-origen.c |    4 +---
>  1 files changed, 1 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/mach-origen.c
b/arch/arm/mach-exynos4/mach-
> origen.c
> index ed59f86..e280270 100644
> --- a/arch/arm/mach-exynos4/mach-origen.c
> +++ b/arch/arm/mach-exynos4/mach-origen.c
> @@ -73,9 +73,7 @@ static struct s3c2410_uartcfg origen_uartcfgs[]
__initdata = {
>  };
> 
>  static struct s3c_sdhci_platdata origen_hsmmc2_pdata __initdata = {
> -	.cd_type		= S3C_SDHCI_CD_GPIO,
> -	.ext_cd_gpio		= EXYNOS4_GPK2(2),
> -	.ext_cd_gpio_invert	= 1,
> +	.cd_type		= S3C_SDHCI_CD_INTERNAL,
>  	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
>  };
> 
> --
> 1.7.4.1

OK, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

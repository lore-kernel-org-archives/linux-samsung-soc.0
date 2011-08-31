From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/3] ARM: EXYNOS4: Add support for 8-bit bus width in SDHCI
 for ORIGEN
Date: Wed, 31 Aug 2011 10:01:21 +0900
Message-ID: <000601cc6779$7fe130b0$7fa39210$%kim@samsung.com>
References: <1314351524-10942-1-git-send-email-tushar.behera@linaro.org>
 <1314351524-10942-4-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57794 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754479Ab1HaBBX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Aug 2011 21:01:23 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQR00JV9PI90E00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Aug 2011 10:01:22 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQR005RSPIACD@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Aug 2011 10:01:22 +0900 (KST)
In-reply-to: <1314351524-10942-4-git-send-email-tushar.behera@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linaro-dev@lists.linaro.org, patches@linaro.org

Tushar Behera wrote:
> 
> Platform data for SDHCI controller on ORIGEN board is missing the
> support for 8-bit bus width. The platform data is extended in sync
> with other EXYNOS4 machines.
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
>  arch/arm/mach-exynos4/mach-origen.c |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/mach-origen.c
b/arch/arm/mach-exynos4/mach-
> origen.c
> index ae18812..6b6cd77 100644
> --- a/arch/arm/mach-exynos4/mach-origen.c
> +++ b/arch/arm/mach-exynos4/mach-origen.c
> @@ -75,11 +75,19 @@ static struct s3c2410_uartcfg origen_uartcfgs[]
__initdata =
> {
>  static struct s3c_sdhci_platdata origen_hsmmc0_pdata __initdata = {
>  	.cd_type		= S3C_SDHCI_CD_INTERNAL,
>  	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
> +#ifdef CONFIG_EXYNOS4_SDHCI_CH0_8BIT
> +	.max_width		= 8,
> +	.host_caps		= MMC_CAP_8_BIT_DATA,
> +#endif
>  };
> 
>  static struct s3c_sdhci_platdata origen_hsmmc2_pdata __initdata = {
>  	.cd_type		= S3C_SDHCI_CD_INTERNAL,
>  	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
> +#ifdef CONFIG_EXYNOS4_SDHCI_CH2_8BIT
> +	.max_width		= 8,
> +	.host_caps		= MMC_CAP_8_BIT_DATA,
> +#endif
>  };
> 
>  static struct platform_device *origen_devices[] __initdata = {
> --
> 1.7.4.1

Hi Tushar,

I wonder the bus width of SDHCI controller can be changed manually on ORIGEN
like SMDK board.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

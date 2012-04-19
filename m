From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 12/12] ARM: Exynos5: Update device tree enabled machine
 file
Date: Wed, 18 Apr 2012 17:23:50 -0700
Message-ID: <4F8F5B16.7000501@samsung.com>
References: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org> <1334641595-25301-13-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:50379 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751125Ab2DSAXv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Apr 2012 20:23:51 -0400
Received: by pbcun15 with SMTP id un15so9563076pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Apr 2012 17:23:51 -0700 (PDT)
In-Reply-To: <1334641595-25301-13-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

Thomas Abraham wrote:
> Add AUXDATA for i2c and MDMA controllers of Exynos5.
> 
> Signed-off-by: Thomas Abraham<thomas.abraham@linaro.org>
> ---
>   arch/arm/mach-exynos/mach-exynos5-dt.c |    7 ++++++-
>   1 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
> index 4711c89..8adc061 100644
> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
> @@ -43,9 +43,14 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
>   				"exynos4210-uart.2", NULL),
>   	OF_DEV_AUXDATA("samsung,exynos4210-uart", EXYNOS5_PA_UART3,
>   				"exynos4210-uart.3", NULL),
> +	OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS5_PA_IIC(0),
> +				"s3c2440-i2c.0", NULL),
> +	OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS5_PA_IIC(1),
> +				"s3c2440-i2c.1", NULL),
>   	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA0, "dma-pl330.0", NULL),
>   	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA1, "dma-pl330.1", NULL),
> -	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_MDMA1, "dma-pl330.2", NULL),
> +	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_MDMA0, "dma-pl330.2", NULL),
> +	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_MDMA1, "dma-pl330.3", NULL),

Probably, you missed my comments on your previous patches. Fixed on rc3.

So just need to update i2c stuff now.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

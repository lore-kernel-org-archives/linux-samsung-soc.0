From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Enable HS-I2C
Date: Thu, 24 Apr 2014 13:32:41 +0530
Message-ID: <5358C521.9060103@linaro.org>
References: <1393935776-22657-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:57068 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751363AbaDXICq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 04:02:46 -0400
Received: by mail-pb0-f48.google.com with SMTP id md12so1696388pbc.35
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2014 01:02:45 -0700 (PDT)
In-Reply-To: <1393935776-22657-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com
Cc: Sachin Kamat <sachin.kamat@linaro.org>

On 03/04/2014 05:52 PM, Sachin Kamat wrote:
> High speed I2C is used on Exynos5 based SoCs. Enable it.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/configs/exynos_defconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index 4ce7b70ea901..e07a227ec0db 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -65,6 +65,7 @@ CONFIG_TCG_TIS_I2C_INFINEON=y
>  CONFIG_I2C=y
>  CONFIG_I2C_MUX=y
>  CONFIG_I2C_ARB_GPIO_CHALLENGE=y
> +CONFIG_I2C_EXYNOS5=y
>  CONFIG_I2C_S3C2410=y
>  CONFIG_DEBUG_GPIO=y
>  # CONFIG_HWMON is not set
> 
Kukjin,

Please consider picking this patch when you plan to update
exynos_defconfig. With this change on upstream kernel, we are able to
get Arndale_Octa board to boot and mount an MMC partition successfully.

-- 
Tushar Behera

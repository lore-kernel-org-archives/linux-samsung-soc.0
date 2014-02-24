From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Fix a config option
Date: Mon, 24 Feb 2014 09:21:17 +0900
Message-ID: <530A907D.6080901@samsung.com>
References: <1388140690-30668-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:34691 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750976AbaBXAVX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 23 Feb 2014 19:21:23 -0500
Received: by mail-pb0-f48.google.com with SMTP id md12so1591696pbc.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Feb 2014 16:21:23 -0800 (PST)
In-Reply-To: <1388140690-30668-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

On 12/27/13 19:38, Sachin Kamat wrote:
> CONFIG_MACH_EXYNOS4_DT does not exist. Use ARCH_EXYNOS4 instead.
>
> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> ---
>   arch/arm/configs/exynos_defconfig |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index dbe1f1c47bb0..dff01ecf78cc 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -10,8 +10,8 @@ CONFIG_PARTITION_ADVANCED=y
>   CONFIG_ARCH_EXYNOS=y
>   CONFIG_S3C_LOWLEVEL_UART_PORT=3
>   CONFIG_S3C24XX_PWM=y
> +CONFIG_ARCH_EXYNOS4=y
>   CONFIG_ARCH_EXYNOS5=y
> -CONFIG_MACH_EXYNOS4_DT=y
>   CONFIG_SMP=y
>   CONFIG_NR_CPUS=8
>   CONFIG_PREEMPT=y

Well, this is not required because it should be fine without this 
change. ARCH_EXYNOS4 will be selected when ARCH_EXYNOS is enabled and 
non-exist CONFIG (MACH_EXYNOS4_DT) will be ignored.

Thanks,
Kukjin

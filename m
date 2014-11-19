From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: fix failure setting CPU voltage
 by enabling dependent I2C controller
Date: Wed, 19 Nov 2014 16:49:53 +0900
Message-ID: <546C4BA1.6090701@samsung.com>
References: <1416337853-1558-1-git-send-email-tyler.baker@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:35336 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755171AbaKSHuA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 02:50:00 -0500
Received: by mail-pa0-f41.google.com with SMTP id rd3so62604pab.14
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2014 23:49:59 -0800 (PST)
In-Reply-To: <1416337853-1558-1-git-send-email-tyler.baker@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tyler Baker <tyler.baker@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>

On 11/19/14 04:10, Tyler Baker wrote:

Hi,

+ Arnd, Olof and Kevin

> This patch fixes a long standing issue introduced during the 3.16 merge window.
> Shortly after the merge, exynos5250-based arndale boards began to produce the 
> following errors:
> 
> kern.err kernel:  exynos-cpufreq exynos-cpufreq: failed to set cpu voltage
> kern.err kernel:  cpufreq: __target_index: Failed to change cpu frequency: -22
> 
> Further analysis revealed that the S5M8767 voltage regulator used on the 
> exynos5250-based arndale board utilizes the S3C2410 I2C controller. If the 
> S3C2410 I2C controller driver is not enabled, the S5M8767 voltage regulator 
> fails to probe. Therefore a dependency exists between these two drivers. 
> In the exynos_defconfig both CONFIG_REGULATOR_S5M8767 and CONFIG_I2C_S3C2410 
> options are enabled, and no errors are produced. However, in the 
> multi_v7_defconfig only the CONFIG_REGULATOR_S5M8767 option is enabled and the 
> errors are present. So let's enable the CONFIG_I2C_S3C2410 option in the 
> multi_v7_defconfig to allow the S5M8767 voltage regulator to probe.
> 
> Signed-off-by: Tyler Baker <tyler.baker@linaro.org>

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks,
Kukjin

> ---
> This issue was reported [1]. I've also confirmed this fix on two different 
> arndale boards.
> 
> [1] https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg38765.html
> 
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 3487046..9d7a32f 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -217,6 +217,7 @@ CONFIG_I2C_CADENCE=y
>  CONFIG_I2C_DESIGNWARE_PLATFORM=y
>  CONFIG_I2C_EXYNOS5=y
>  CONFIG_I2C_MV64XXX=y
> +CONFIG_I2C_S3C2410=y
>  CONFIG_I2C_SIRF=y
>  CONFIG_I2C_TEGRA=y
>  CONFIG_I2C_ST=y

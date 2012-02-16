From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Enable G2D on SMDKV310
Date: Thu, 16 Feb 2012 22:06:54 +0900
Message-ID: <4F3CFF6E.9010404@samsung.com>
References: <1325492711-15012-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f66.google.com ([209.85.160.66]:45302 "EHLO
	mail-pw0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751513Ab2BPNH5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Feb 2012 08:07:57 -0500
Received: by pbcwz12 with SMTP id wz12so1371313pbc.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Feb 2012 05:07:57 -0800 (PST)
In-Reply-To: <1325492711-15012-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

On 01/02/12 17:25, Sachin Kamat wrote:
> This patch enables G2D support on SMDKV310 board.
>
> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> ---
>   arch/arm/mach-exynos/Kconfig         |    1 +
>   arch/arm/mach-exynos/mach-smdkv310.c |    1 +
>   2 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index bd4600e..a673d0d 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -183,6 +183,7 @@ config MACH_SMDKV310
>   	select S5P_DEV_FIMC1
>   	select S5P_DEV_FIMC2
>   	select S5P_DEV_FIMC3
> +	select S5P_DEV_G2D
>   	select S5P_DEV_I2C_HDMIPHY
>   	select S5P_DEV_MFC
>   	select S5P_DEV_TV
> diff --git a/arch/arm/mach-exynos/mach-smdkv310.c b/arch/arm/mach-exynos/mach-smdkv310.c
> index b2c5557..8a5c23b 100644
> --- a/arch/arm/mach-exynos/mach-smdkv310.c
> +++ b/arch/arm/mach-exynos/mach-smdkv310.c
> @@ -270,6 +270,7 @@ static struct platform_device *smdkv310_devices[] __initdata = {
>   	&s5p_device_fimc1,
>   	&s5p_device_fimc2,
>   	&s5p_device_fimc3,
> +	&s5p_device_g2d,
>   	&exynos4_device_ac97,
>   	&exynos4_device_i2s0,
>   	&exynos4_device_ohci,

Looks ok, will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

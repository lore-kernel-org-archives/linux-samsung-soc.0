From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Enable G2D on Origen
Date: Thu, 29 Dec 2011 12:30:30 +0900
Message-ID: <028801ccc5da$375fcf30$a61f6d90$%kim@samsung.com>
References: <1325068774-26334-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:9882 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751336Ab1L2Dab (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Dec 2011 22:30:31 -0500
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWY00H7E4EJ5K80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Dec 2011 12:30:31 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWY00C1X4EUNH40@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 29 Dec 2011 12:30:30 +0900 (KST)
In-reply-to: <1325068774-26334-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: k.debski@samsung.com

Sachin Kamat wrote:
> 
> This patch enables G2D support on Origen board.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos/Kconfig       |    1 +
>  arch/arm/mach-exynos/mach-origen.c |    1 +
>  2 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index e931924..febfd53 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -303,6 +303,7 @@ config MACH_ORIGEN
>  	select S5P_DEV_FIMC2
>  	select S5P_DEV_FIMC3
>  	select S5P_DEV_FIMD0
> +	select S5P_DEV_G2D
>  	select S5P_DEV_I2C_HDMIPHY
>  	select S5P_DEV_MFC
>  	select S5P_DEV_TV
> diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-
> exynos/mach-origen.c
> index a0116036..0ec2a63 100644
> --- a/arch/arm/mach-exynos/mach-origen.c
> +++ b/arch/arm/mach-exynos/mach-origen.c
> @@ -632,6 +632,7 @@ static struct platform_device *origen_devices[]
> __initdata = {
>  	&s5p_device_fimc2,
>  	&s5p_device_fimc3,
>  	&s5p_device_fimd0,
> +	&s5p_device_g2d,
>  	&s5p_device_hdmi,
>  	&s5p_device_i2c_hdmiphy,
>  	&s5p_device_mfc,
> --
> 1.7.4.1

OK, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

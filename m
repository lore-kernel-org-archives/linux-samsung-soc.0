From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCHv5] ARM: Exynos: Register JPEG on nuri
Date: Fri, 09 Mar 2012 08:26:23 -0800
Message-ID: <4F5A2F2F.4080008@samsung.com>
References: <1330083894-18769-1-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:43476 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751365Ab2CIQ02 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Mar 2012 11:26:28 -0500
Received: by ghrr11 with SMTP id r11so941202ghr.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Mar 2012 08:26:28 -0800 (PST)
In-Reply-To: <1330083894-18769-1-git-send-email-andrzej.p@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>

On 02/24/12 03:44, Andrzej Pietrasiewicz wrote:
> ARM: Exynos: Register JPEG on nuri
>
> Signed-off-by: Andrzej Pietrasiewicz<andrzej.p@samsung.com>
> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
> ---
>
> This is in response to:
> http://www.spinics.net/lists/linux-samsung-soc/msg09530.html
>
> Now it should apply cleanly.
>
> @Sachin: Thank you for spotting the problem.
>
>   arch/arm/mach-exynos/Kconfig     |    1 +
>   arch/arm/mach-exynos/mach-nuri.c |    1 +
>   2 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index a95146b..6db7dd2 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -265,6 +265,7 @@ config MACH_NURI
>   	select S3C_DEV_I2C5
>   	select S3C_DEV_I2C6
>   	select S5P_DEV_CSIS0
> +	select S5P_DEV_JPEG
>   	select S5P_DEV_FIMC0
>   	select S5P_DEV_FIMC1
>   	select S5P_DEV_FIMC2
> diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
> index a6b9162..8016649 100644
> --- a/arch/arm/mach-exynos/mach-nuri.c
> +++ b/arch/arm/mach-exynos/mach-nuri.c
> @@ -1320,6 +1320,7 @@ static struct platform_device *nuri_devices[] __initdata = {
>   	&i2c9_gpio,
>   	&s3c_device_adc,
>   	&s5p_device_g2d,
> +	&s5p_device_jpeg,
>   	&s3c_device_rtc,
>   	&s5p_device_mfc,
>   	&s5p_device_mfc_l,

OK, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/2] ARM: Exynos: Register JPEG on universal_c210
Date: Fri, 09 Mar 2012 08:26:39 -0800
Message-ID: <4F5A2F3F.2020209@samsung.com>
References: <1329818688-27337-1-git-send-email-andrzej.p@samsung.com> <1329818688-27337-2-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:43476 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751365Ab2CIQ0n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Mar 2012 11:26:43 -0500
Received: by mail-gy0-f174.google.com with SMTP id r11so941202ghr.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Mar 2012 08:26:42 -0800 (PST)
In-Reply-To: <1329818688-27337-2-git-send-email-andrzej.p@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On 02/21/12 02:04, Andrzej Pietrasiewicz wrote:
> ARM: Exynos: Register JPEG on universal_c210
>
> Signed-off-by: Andrzej Pietrasiewicz<andrzej.p@samsung.com>
> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
> ---
>   arch/arm/mach-exynos/Kconfig               |    1 +
>   arch/arm/mach-exynos/mach-universal_c210.c |    1 +
>   2 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index cf29c35..23b6971 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -235,6 +235,7 @@ config MACH_UNIVERSAL_C210
>   	select S5P_DEV_FIMC3
>   	select S5P_DEV_G2D
>   	select S5P_DEV_CSIS0
> +	select S5P_DEV_JPEG
>   	select S5P_DEV_FIMD0
>   	select S3C_DEV_HSMMC
>   	select S3C_DEV_HSMMC2
> diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
> index 220de1c..c525f42 100644
> --- a/arch/arm/mach-exynos/mach-universal_c210.c
> +++ b/arch/arm/mach-exynos/mach-universal_c210.c
> @@ -981,6 +981,7 @@ static struct platform_device *universal_devices[] __initdata = {
>   	&universal_gpio_keys,
>   	&s5p_device_onenand,
>   	&s5p_device_fimd0,
> +	&s5p_device_jpeg,
>   	&s5p_device_mfc,
>   	&s5p_device_mfc_l,
>   	&s5p_device_mfc_r,

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

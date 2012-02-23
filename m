From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 2/2] ARM: Exynos: Register JPEG on nuri
Date: Thu, 23 Feb 2012 15:00:06 +0530
Message-ID: <CAK9yfHyGU9sBNzxSD6Gmpo7T8rT7Qc4YfFqLN1aqmYW8=VBaVg@mail.gmail.com>
References: <1329818688-27337-1-git-send-email-andrzej.p@samsung.com>
	<1329818688-27337-3-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f53.google.com ([209.85.216.53]:46336 "EHLO
	mail-qw0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753763Ab2BWJaI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Feb 2012 04:30:08 -0500
Received: by qafk1 with SMTP id k1so1178039qaf.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Feb 2012 01:30:07 -0800 (PST)
In-Reply-To: <1329818688-27337-3-git-send-email-andrzej.p@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Andrzej,

Tried applying this patch on the for-next branch of Kukjin Kim's tree [1].
It fails to apply
"error: patch failed: arch/arm/mach-exynos/Kconfig:274"

[Patch 1/2] applies cleanly though.

[1] git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

Regards
Sachin


On 21/02/2012, Andrzej Pietrasiewicz <andrzej.p@samsung.com> wrote:
> ARM: Exynos: Register JPEG on nuri
>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig     |    1 +
>  arch/arm/mach-exynos/mach-nuri.c |    1 +
>  2 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 23b6971..189a212 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -274,6 +274,7 @@ config MACH_NURI
>  	select S3C_DEV_I2C3
>  	select S3C_DEV_I2C5
>  	select S5P_DEV_CSIS0
> +	select S5P_DEV_JPEG
>  	select S5P_DEV_FIMC0
>  	select S5P_DEV_FIMC1
>  	select S5P_DEV_FIMC2
> diff --git a/arch/arm/mach-exynos/mach-nuri.c
> b/arch/arm/mach-exynos/mach-nuri.c
> index b62e02b..be7bfd2 100644
> --- a/arch/arm/mach-exynos/mach-nuri.c
> +++ b/arch/arm/mach-exynos/mach-nuri.c
> @@ -1260,6 +1260,7 @@ static struct platform_device *nuri_devices[]
> __initdata = {
>  	&i2c9_gpio,
>  	&s3c_device_adc,
>  	&s5p_device_g2d,
> +	&s5p_device_jpeg,
>  	&s3c_device_rtc,
>  	&s5p_device_mfc,
>  	&s5p_device_mfc_l,
> --
> 1.7.0.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
With warm regards,
Sachin

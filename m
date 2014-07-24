From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Enable SBS battery support
Date: Fri, 25 Jul 2014 08:36:19 +0900
Message-ID: <53D19873.3040806@samsung.com>
References: <1406227380-3569-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:49320 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932131AbaGXXgZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Jul 2014 19:36:25 -0400
Received: by mail-pd0-f173.google.com with SMTP id w10so4441613pde.18
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jul 2014 16:36:24 -0700 (PDT)
In-Reply-To: <1406227380-3569-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Sachin Kamat <sachin.kamat@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

On 07/25/14 03:43, Javier Martinez Canillas wrote:
> Many Exynos5 boards (e.g: Snow, Peach Pit and Pi) have
> a SBS-compliant gas gauge battery. Enable it as module
> so the needed support is available for these boards.
>
> Suggested-by: Doug Anderson<dianders@chromium.org>
> Signed-off-by: Javier Martinez Canillas<javier.martinez@collabora.co.uk>
> ---
>   arch/arm/configs/exynos_defconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index fc7d168..c390bb9 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -77,6 +77,7 @@ CONFIG_SPI_S3C64XX=y
>   CONFIG_I2C_S3C2410=y
>   CONFIG_DEBUG_GPIO=y
>   CONFIG_POWER_SUPPLY=y
> +CONFIG_BATTERY_SBS=m
>   CONFIG_CHARGER_TPS65090=y
>   # CONFIG_HWMON is not set
>   CONFIG_THERMAL=y

Looks good to me.

Olof, since previous exynos_defconfig has been updated in arm-soc and no 
branch for it in my tree at this time, picking this into arm-soc 
directly would be better and you may add my ack on this.

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks,
Kukjin

From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [RESEND PATCH 1/1] ARM: exynos_defconfig: Enable SBS battery
 support
Date: Mon, 11 Aug 2014 14:40:38 +0200
Message-ID: <1761549.yKSqfXafKr@amdc1032>
References: <1407755198-17568-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:61059 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753263AbaHKMkq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Aug 2014 08:40:46 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NA5002NZ77WV810@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Aug 2014 21:40:44 +0900 (KST)
In-reply-to: <1407755198-17568-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sachin Kamat <sachin.kamat@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org


Hi,

On Monday, August 11, 2014 01:06:38 PM Javier Martinez Canillas wrote:
> Many Exynos5 boards (e.g: Snow, Peach Pit and Pi) have
> a SBS-compliant gas gauge battery. Enable it as module
> so the needed support is available for these boards.
> 
> Suggested-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> Acked-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index fc7d168..c390bb9 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -77,6 +77,7 @@ CONFIG_SPI_S3C64XX=y
>  CONFIG_I2C_S3C2410=y
>  CONFIG_DEBUG_GPIO=y
>  CONFIG_POWER_SUPPLY=y
> +CONFIG_BATTERY_SBS=m

Why not make it "=y"?

Rationale:
- currently no hardware related option uses "=m" in exynos_defconfig
- it would match the SBS option usage in multi_v7_defconfig

>  CONFIG_CHARGER_TPS65090=y
>  # CONFIG_HWMON is not set
>  CONFIG_THERMAL=y

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

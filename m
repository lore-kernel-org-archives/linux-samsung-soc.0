From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: enable Exynos DRM Mixer driver
Date: Fri, 30 Oct 2015 09:47:37 +0900
Message-ID: <5632BE29.5030009@samsung.com>
References: <563063C8.2040202@samsung.com>
 <1446128706-27750-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43985 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756629AbbJ3Arm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Oct 2015 20:47:42 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NX0001C9CVG5780@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 Oct 2015 00:47:40 +0000 (GMT)
In-reply-to: <1446128706-27750-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>

On 29.10.2015 23:25, Andrzej Hajda wrote:
> Mixer driver is selected by CONFIG_DRM_EXYNOS_HDMI option. Since Exynos5433
> HDMI does not require Mixer and there are separate options to select Mixer
> and HDMI.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)

+Cc Arnd, Kevin, Kukjin and Olof,

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

The patch should go with (or before) patchset:
 - add atomic_check callback to exynos_crtc
   http://www.spinics.net/lists/dri-devel/msg93137.html
to avoid loosing the HDMI support in multi_v7.

Best regards,
Krzysztof


> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 03deb7f..ca5e928 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -449,6 +449,7 @@ CONFIG_DRM_NOUVEAU=m
>  CONFIG_DRM_EXYNOS=m
>  CONFIG_DRM_EXYNOS_DSI=y
>  CONFIG_DRM_EXYNOS_FIMD=y
> +CONFIG_DRM_EXYNOS_MIXER=y
>  CONFIG_DRM_EXYNOS_HDMI=y
>  CONFIG_DRM_RCAR_DU=m
>  CONFIG_DRM_TEGRA=y
> 

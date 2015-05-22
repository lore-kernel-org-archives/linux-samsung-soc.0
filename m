From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 2/2] ARM: multi_v7_defconfig: Enable display on Trats2
 board
Date: Fri, 22 May 2015 11:11:17 +0200
Message-ID: <555EF2B5.1000504@collabora.co.uk>
References: <1432255718-11695-1-git-send-email-k.kozlowski@samsung.com> <1432255718-11695-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:56572 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1946153AbbEVJLX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 May 2015 05:11:23 -0400
In-Reply-To: <1432255718-11695-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Krzysztof,

On 05/22/2015 02:48 AM, Krzysztof Kozlowski wrote:
> Enable the Exynos DSI and S6E8AA0 panel for full X11 display on Trats2.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 0848337a2a01..e9785020aab1 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -413,10 +413,12 @@ CONFIG_DRM=y
>  CONFIG_DRM_PTN3460=m
>  CONFIG_DRM_PS8622=m
>  CONFIG_DRM_EXYNOS=m
> +CONFIG_DRM_EXYNOS_DSI=y
>  CONFIG_DRM_EXYNOS_FIMD=y
>  CONFIG_DRM_EXYNOS_HDMI=y
>  CONFIG_DRM_RCAR_DU=m
>  CONFIG_DRM_TEGRA=y
> +CONFIG_DRM_PANEL_S6E8AA0=m
>  CONFIG_DRM_PANEL_SIMPLE=y
>  CONFIG_FB_ARMCLCD=y
>  CONFIG_FB_WM8505=y
> 

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier

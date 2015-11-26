From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v8 02/17] drm: bridge: analogix/dp: split exynos dp driver to bridge directory
Date: Thu, 26 Nov 2015 18:30:52 +0100
Message-ID: <1812354.kkj0DGG9mi@diego>
References: <1446020143-32645-1-git-send-email-ykk@rock-chips.com> <1446020519-625-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:46821 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752664AbbKZRb0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Nov 2015 12:31:26 -0500
In-Reply-To: <1446020519-625-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Yao <mark.yao@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, dianders@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, javier@osg.samsung.com, Andy Yan <andy.yan@rock-chips.com>, dri-deve

Hi Yakir,

Am Mittwoch, 28. Oktober 2015, 16:21:59 schrieb Yakir Yang:
> Split the dp core driver from exynos directory to bridge directory,
> and rename the core driver to analogix_dp_*, rename the platform
> code to exynos_dp.
> 
> Beside the new analogix_dp driver would export four hooks.
> "analogix_dp_bind()" and "analogix_dp_unbind()"
> "analogix_dp_detect()" and "analogix_dp_get_modes()"
> 
> The bind/unbind symbols is used for analogix platform driver to connect
> with analogix_dp core driver. And the detect/get_modes is used for analogix
> platform driver to init the connector.
> 
> They reason why connector need register in helper driver is rockchip drm
> haven't implement the atomic API, but Exynos drm have implement it, so
> there would need two different connector helper functions, that's why we
> leave the connector register in helper driver.
> 
> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>

[...]

> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
> index bd1a415..5f74f80 100644
> --- a/drivers/gpu/drm/exynos/Kconfig
> +++ b/drivers/gpu/drm/exynos/Kconfig
> @@ -55,8 +55,9 @@ config DRM_EXYNOS_DSI
>  	  This enables support for Exynos MIPI-DSI device.
> 
>  config DRM_EXYNOS_DP
> -	bool "EXYNOS DRM DP driver support"
> +	bool "EXYNOS specific extensions for Analogix DP driver"
>  	depends on DRM_EXYNOS && (DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON)
> +	select DRM_ANALOGIX_DP
>  	default DRM_EXYNOS
>  	select DRM_PANEL
>  	help

This doesn't apply anymore to 4.4-rc due to other changes in there. The 
exynos/Makefile is affected as well.

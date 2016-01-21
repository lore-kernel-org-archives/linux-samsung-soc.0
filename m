From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v12.1 07/17] drm: rockchip: dp: add rockchip platform dp driver
Date: Thu, 21 Jan 2016 20:11:45 +0100
Message-ID: <7132332.jmLRiUjx3U@phil>
References: <1450873538-18304-1-git-send-email-ykk@rock-chips.com> <1453197893-13413-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:56416 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752770AbcAUTMO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jan 2016 14:12:14 -0500
In-Reply-To: <1453197893-13413-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Yao <mark.yao@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, javier@osg.samsung.com, Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org

Hi Yakir,

Am Dienstag, 19. Januar 2016, 18:04:53 schrieb Yakir Yang:
> Rockchip have three clocks for dp controller, we leave pclk_edp
> to analogix_dp driver control, and keep the sclk_edp_24m and
> sclk_edp in platform driver.
> 
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---

[...]

> +static int rockchip_dp_drm_create_encoder(struct rockchip_dp_device *dp)
> +{
> +	struct drm_encoder *encoder = &dp->encoder;
> +	struct drm_device *drm_dev = dp->drm_dev;
> +	struct device *dev = dp->dev;
> +	int ret;
> +
> +	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
> +							     dev->of_node);
> +	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
> +
> +	ret = drm_encoder_init(drm_dev, encoder, &rockchip_dp_encoder_funcs,
> +			       DRM_MODE_ENCODER_TMDS);

should be
+			       DRM_MODE_ENCODER_TMDS, NULL);

Exynos-side seems to be ok though.

With the adapted v12.1 patches it applies cleanly and display is working as 
well. So with the thing above fixed, you could resubmit a full v13, 
especially as you want to drop patch 16 as discussed there.


Heiko

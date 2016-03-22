From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v8 01/17] drm: exynos: dp: convert to drm bridge mode
Date: Wed, 23 Mar 2016 07:22:42 +0900
Message-ID: <56F1C5B2.8020104@samsung.com>
References: <1446020143-32645-1-git-send-email-ykk@rock-chips.com>
 <1446020345-7388-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:43537 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751213AbcCVWWp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Mar 2016 18:22:45 -0400
In-reply-to: <1446020345-7388-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>
Cc: Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, dianders@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, javier@osg.samsung.com, Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org



2015=EB=85=84 10=EC=9B=94 28=EC=9D=BC 17:19=EC=97=90 Yakir Yang =EC=9D=B4=
(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> In order to move exynos dp code to bridge directory,
> we need to convert driver drm bridge mode first. As
> dp driver already have a ptn3460 bridge, so we need
> to move ptn bridge to the next bridge of dp bridge.
>=20
> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>

Acked-by: Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae

> ---
> Changes in v8: None
> Changes in v7: None
> Changes in v6:
> - Fix the wrong code in previous series, and test on Samsung snow Chr=
omebook
>   successfully, here are the detail changes:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>
> -       if (!dp->panel && !dp->bridge) {
> +       if (!dp->panel && !dp->ptn_bridge) {
>                 ret =3D exynos_dp_dt_parse_panel(dp);
>                 if (ret)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>
> +       encoder->bridge =3D bridge;
> 	bridge->driver_private =3D dp;
>         bridge->encoder =3D encoder;
>         bridge->funcs =3D &exynos_dp_bridge_funcs;
>         ret =3D drm_bridge_attach(drm_dev, bridge);
>=20
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
> - Keep author name list no changed (Jingoo)
>=20
>  drivers/gpu/drm/exynos/exynos_dp_core.c | 103 ++++++++++++++++++++++=
++--------
>  drivers/gpu/drm/exynos/exynos_dp_core.h |   1 +
>  2 files changed, 78 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/dr=
m/exynos/exynos_dp_core.c
> index 124fb9a..aedd074 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> @@ -1009,9 +1009,9 @@ static int exynos_drm_attach_lcd_bridge(struct =
exynos_dp_device *dp,
>  {
>  	int ret;
> =20
> -	encoder->bridge =3D dp->bridge;
> -	dp->bridge->encoder =3D encoder;
> -	ret =3D drm_bridge_attach(encoder->dev, dp->bridge);
> +	encoder->bridge->next =3D dp->ptn_bridge;
> +	dp->ptn_bridge->encoder =3D encoder;
> +	ret =3D drm_bridge_attach(encoder->dev, dp->ptn_bridge);
>  	if (ret) {
>  		DRM_ERROR("Failed to attach bridge to drm\n");
>  		return ret;
> @@ -1020,14 +1020,15 @@ static int exynos_drm_attach_lcd_bridge(struc=
t exynos_dp_device *dp,
>  	return 0;
>  }
> =20
> -static int exynos_dp_create_connector(struct drm_encoder *encoder)
> +static int exynos_dp_bridge_attach(struct drm_bridge *bridge)
>  {
> -	struct exynos_dp_device *dp =3D encoder_to_dp(encoder);
> +	struct exynos_dp_device *dp =3D bridge->driver_private;
> +	struct drm_encoder *encoder =3D &dp->encoder;
>  	struct drm_connector *connector =3D &dp->connector;
>  	int ret;
> =20
>  	/* Pre-empt DP connector creation if there's a bridge */
> -	if (dp->bridge) {
> +	if (dp->ptn_bridge) {
>  		ret =3D exynos_drm_attach_lcd_bridge(dp, encoder);
>  		if (!ret)
>  			return 0;
> @@ -1052,22 +1053,9 @@ static int exynos_dp_create_connector(struct d=
rm_encoder *encoder)
>  	return ret;
>  }
> =20
> -static bool exynos_dp_mode_fixup(struct drm_encoder *encoder,
> -				 const struct drm_display_mode *mode,
> -				 struct drm_display_mode *adjusted_mode)
> -{
> -	return true;
> -}
> -
> -static void exynos_dp_mode_set(struct drm_encoder *encoder,
> -			       struct drm_display_mode *mode,
> -			       struct drm_display_mode *adjusted_mode)
> -{
> -}
> -
> -static void exynos_dp_enable(struct drm_encoder *encoder)
> +static void exynos_dp_bridge_enable(struct drm_bridge *bridge)
>  {
> -	struct exynos_dp_device *dp =3D encoder_to_dp(encoder);
> +	struct exynos_dp_device *dp =3D bridge->driver_private;
>  	struct exynos_drm_crtc *crtc =3D dp_to_crtc(dp);
> =20
>  	if (dp->dpms_mode =3D=3D DRM_MODE_DPMS_ON)
> @@ -1092,9 +1080,9 @@ static void exynos_dp_enable(struct drm_encoder=
 *encoder)
>  	dp->dpms_mode =3D DRM_MODE_DPMS_ON;
>  }
> =20
> -static void exynos_dp_disable(struct drm_encoder *encoder)
> +static void exynos_dp_bridge_disable(struct drm_bridge *bridge)
>  {
> -	struct exynos_dp_device *dp =3D encoder_to_dp(encoder);
> +	struct exynos_dp_device *dp =3D bridge->driver_private;
>  	struct exynos_drm_crtc *crtc =3D dp_to_crtc(dp);
> =20
>  	if (dp->dpms_mode !=3D DRM_MODE_DPMS_ON)
> @@ -1123,6 +1111,69 @@ static void exynos_dp_disable(struct drm_encod=
er *encoder)
>  	dp->dpms_mode =3D DRM_MODE_DPMS_OFF;
>  }
> =20
> +static void exynos_dp_bridge_nop(struct drm_bridge *bridge)
> +{
> +	/* do nothing */
> +}
> +
> +static const struct drm_bridge_funcs exynos_dp_bridge_funcs =3D {
> +	.enable =3D exynos_dp_bridge_enable,
> +	.disable =3D exynos_dp_bridge_disable,
> +	.pre_enable =3D exynos_dp_bridge_nop,
> +	.post_disable =3D exynos_dp_bridge_nop,
> +	.attach =3D exynos_dp_bridge_attach,
> +};
> +
> +static int exynos_dp_create_connector(struct drm_encoder *encoder)
> +{
> +	struct exynos_dp_device *dp =3D encoder_to_dp(encoder);
> +	struct drm_device *drm_dev =3D dp->drm_dev;
> +	struct drm_bridge *bridge;
> +	int ret;
> +
> +	bridge =3D devm_kzalloc(drm_dev->dev, sizeof(*bridge), GFP_KERNEL);
> +	if (!bridge) {
> +		DRM_ERROR("failed to allocate for drm bridge\n");
> +		return -ENOMEM;
> +	}
> +
> +	dp->bridge =3D bridge;
> +
> +	encoder->bridge =3D bridge;
> +	bridge->driver_private =3D dp;
> +	bridge->encoder =3D encoder;
> +	bridge->funcs =3D &exynos_dp_bridge_funcs;
> +
> +	ret =3D drm_bridge_attach(drm_dev, bridge);
> +	if (ret) {
> +		DRM_ERROR("failed to attach drm bridge\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static bool exynos_dp_mode_fixup(struct drm_encoder *encoder,
> +				 const struct drm_display_mode *mode,
> +				 struct drm_display_mode *adjusted_mode)
> +{
> +	return true;
> +}
> +
> +static void exynos_dp_mode_set(struct drm_encoder *encoder,
> +			       struct drm_display_mode *mode,
> +			       struct drm_display_mode *adjusted_mode)
> +{
> +}
> +
> +static void exynos_dp_enable(struct drm_encoder *encoder)
> +{
> +}
> +
> +static void exynos_dp_disable(struct drm_encoder *encoder)
> +{
> +}
> +
>  static struct drm_encoder_helper_funcs exynos_dp_encoder_helper_func=
s =3D {
>  	.mode_fixup =3D exynos_dp_mode_fixup,
>  	.mode_set =3D exynos_dp_mode_set,
> @@ -1238,7 +1289,7 @@ static int exynos_dp_bind(struct device *dev, s=
truct device *master, void *data)
>  		}
>  	}
> =20
> -	if (!dp->panel && !dp->bridge) {
> +	if (!dp->panel && !dp->ptn_bridge) {
>  		ret =3D exynos_dp_dt_parse_panel(dp);
>  		if (ret)
>  			return ret;
> @@ -1365,9 +1416,9 @@ static int exynos_dp_probe(struct platform_devi=
ce *pdev)
>  	if (endpoint) {
>  		bridge_node =3D of_graph_get_remote_port_parent(endpoint);
>  		if (bridge_node) {
> -			dp->bridge =3D of_drm_find_bridge(bridge_node);
> +			dp->ptn_bridge =3D of_drm_find_bridge(bridge_node);
>  			of_node_put(bridge_node);
> -			if (!dp->bridge)
> +			if (!dp->ptn_bridge)
>  				return -EPROBE_DEFER;
>  		} else
>  			return -EPROBE_DEFER;
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.h b/drivers/gpu/dr=
m/exynos/exynos_dp_core.h
> index e413b6f..66eec4b 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.h
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.h
> @@ -153,6 +153,7 @@ struct exynos_dp_device {
>  	struct drm_connector	connector;
>  	struct drm_panel	*panel;
>  	struct drm_bridge	*bridge;
> +	struct drm_bridge	*ptn_bridge;
>  	struct clk		*clock;
>  	unsigned int		irq;
>  	void __iomem		*reg_base;
>=20

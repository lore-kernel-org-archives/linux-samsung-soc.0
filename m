From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 1/2] drm/exynos: dp: add of_graph dt binding support for
 panel
Date: Thu, 03 Dec 2015 16:11:11 +0900
Message-ID: <565FEB0F.4010900@samsung.com>
References: <1449057472-4389-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:36017 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750897AbbLCHLS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Dec 2015 02:11:18 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NYR01P3ATASOZ10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Dec 2015 16:11:16 +0900 (KST)
In-reply-to: <1449057472-4389-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, javier@osg.samsung.com


It seems that below patch should be modifed for only one of two outboun=
d nodes - panel
and bridge - to be bound because in case of using bridge device, the br=
idge driver will
bind the panel. I will fix and post it again.

Thanks,
Inki Dae

2015=EB=85=84 12=EC=9B=94 02=EC=9D=BC 20:57=EC=97=90 Inki Dae =EC=9D=B4=
(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> This patch adds of_graph dt binding support for panel device
> and also keeps the backward compatibility.
>=20
> i.e.,
> The dts file for Exynos5800 based peach pi board
> has a panel property so we need to keep the backward compatibility.
>=20
> Changelog v2:
> - return -EINVAL if getting a port node failed.
>=20
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_dp_core.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/dr=
m/exynos/exynos_dp_core.c
> index 94f02a0..0b53045 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> @@ -1392,7 +1392,7 @@ static const struct component_ops exynos_dp_ops=
 =3D {
>  static int exynos_dp_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> -	struct device_node *panel_node, *bridge_node, *endpoint;
> +	struct device_node *panel_node =3D NULL, *bridge_node, *endpoint =3D=
 NULL;
>  	struct exynos_dp_device *dp;
>  	int ret;
> =20
> @@ -1403,15 +1403,32 @@ static int exynos_dp_probe(struct platform_de=
vice *pdev)
> =20
>  	platform_set_drvdata(pdev, dp);
> =20
> +	/* This is for the backward compatibility. */
>  	panel_node =3D of_parse_phandle(dev->of_node, "panel", 0);
>  	if (panel_node) {
>  		dp->panel =3D of_drm_find_panel(panel_node);
>  		of_node_put(panel_node);
>  		if (!dp->panel)
>  			return -EPROBE_DEFER;
> +	} else {
> +		endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
> +		if (endpoint) {
> +			panel_node =3D of_graph_get_remote_port_parent(endpoint);
> +			if (panel_node) {
> +				dp->panel =3D of_drm_find_panel(panel_node);
> +				of_node_put(panel_node);
> +				if (!dp->panel)
> +					return -EPROBE_DEFER;
> +			} else {
> +				DRM_ERROR("no port node for panel device.\n");
> +				return -EINVAL;
> +			}
> +		}
>  	}
> =20
> -	endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
> +	panel_node =3D !endpoint ? NULL : panel_node;
> +
> +	endpoint =3D of_graph_get_next_endpoint(dev->of_node, panel_node);
>  	if (endpoint) {
>  		bridge_node =3D of_graph_get_remote_port_parent(endpoint);
>  		if (bridge_node) {
>=20

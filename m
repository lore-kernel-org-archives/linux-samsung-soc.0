From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v8 14/17] drm: bridge: analogix/dp: add max link rate and lane count limit for RK3288
Date: Fri, 27 Nov 2015 14:32:26 +0100
Message-ID: <2807882.UeSPH80il3@diego>
References: <1446020143-32645-1-git-send-email-ykk@rock-chips.com> <1446022561-16870-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:50497 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750978AbbK0Ncy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Nov 2015 08:32:54 -0500
In-Reply-To: <1446022561-16870-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Yao <mark.yao@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, dianders@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, javier@osg.samsung.com, Andy Yan <andy.yan@rock-chips.com>, dri-deve

Am Mittwoch, 28. Oktober 2015, 16:56:01 schrieb Yakir Yang:
> There are some IP limit on rk3288 that only support 4 physical lanes
> of 2.7/1.6 Gbps/lane, so seprate them out by device_type flag.
>=20
> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> ---

[...]

> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c index
> 6307060..563ffb1d 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -890,8 +890,8 @@ static void analogix_dp_commit(struct analogix_dp=
_device
> *dp) return;
>  	}
>=20
> -	ret =3D analogix_dp_set_link_train(dp, dp->video_info.lane_count,
> -					 dp->video_info.link_rate);
> +	ret =3D analogix_dp_set_link_train(dp, dp->video_info.max_lane_coun=
t,
> +					 dp->video_info.max_link_rate);
>  	if (ret) {
>  		dev_err(dp->dev, "unable to do link train\n");
>  		return;
> @@ -1156,16 +1156,25 @@ static int analogix_dp_dt_parse_pdata(struct
> analogix_dp_device *dp) struct device_node *dp_node =3D dp->dev->of_n=
ode;
>  	struct video_info *video_info =3D &dp->video_info;
>=20
> -	if (of_property_read_u32(dp_node, "samsung,link-rate",
> -				 &video_info->link_rate)) {
> -		dev_err(dp->dev, "failed to get link-rate\n");
> -		return -EINVAL;
> -	}
> -
> -	if (of_property_read_u32(dp_node, "samsung,lane-count",
> -				 &video_info->lane_count)) {
> -		dev_err(dp->dev, "failed to get lane-count\n");
> -		return -EINVAL;
> +	switch (dp->plat_data && dp->plat_data->dev_type) {

drivers/gpu/drm/bridge/analogix/analogix_dp_core.c: In function =E2=80=98=
analogix_dp_dt_parse_pdata=E2=80=99:
drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1191:10: warning: sw=
itch condition has boolean value [-Wswitch-bool]
  switch (dp->plat_data && dp->plat_data->dev_type) {
          ^

As I think we always will need to distinguish between implementations,
I guess it should be safe to exit with an error, it that implementation=
-data
is not available, like just doing before the switch a:

if (!dp->plat_data)
	return -EINVAL;


Heiko

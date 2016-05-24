From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 05/10] drm/rockchip: analogix_dp: add rk3399 eDP support
Date: Tue, 24 May 2016 12:17:12 +0200
Message-ID: <6183955.XzKjc41sjW@phil>
References: <1464066147-22734-1-git-send-email-ykk@rock-chips.com> <1464073043-4931-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:49067 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753730AbcEXKRi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 May 2016 06:17:38 -0400
In-Reply-To: <1464073043-4931-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>, Mark Yao <yzq@rock-chips.com>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Javier Martinez Canillas <javier@osg.samsung.com>, emil.l.velikov@gmail.com, Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org

Am Dienstag, 24. Mai 2016, 14:57:23 schrieb Yakir Yang:
> RK3399 and RK3288 shared the same eDP IP controller, only some light
> difference with VOP configure and GRF configure.
>=20
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> ---
> Changes in v2:
> - rebase with drm-next, fix some conflicts
>=20
>  .../bindings/display/bridge/analogix_dp.txt        |  1 +
>  .../display/rockchip/analogix_dp-rockchip.txt      |  2 +-
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 36
> ++++++++++++++++++++-- include/drm/bridge/analogix_dp.h              =
   =20
> |  1 +
>  4 files changed, 37 insertions(+), 3 deletions(-)
>=20
> diff --git
> a/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
> b/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt in=
dex
> 4f2ba8c..4a0f4f7 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix_dp.tx=
t
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix_dp.tx=
t
> @@ -5,6 +5,7 @@ Required properties for dp-controller:
>  		platform specific such as:
>  		 * "samsung,exynos5-dp"
>  		 * "rockchip,rk3288-dp"
> +		 * "rockchip,rk3399-edp"

the cleanlines-freak in my likes to know if there is a difference betwe=
en=20
the rk3399 being called -edp here and -dp on the rk3288 :-)

[...]

> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c index 29c4105..d5d4=
e04
> 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -148,6 +148,10 @@ rockchip_dp_drm_encoder_atomic_check(struct
> drm_encoder *encoder, struct drm_connector_state *conn_state)
>  {
>  	struct rockchip_crtc_state *s =3D to_rockchip_crtc_state(crtc_state=
);
> +	struct rockchip_dp_device *dp =3D to_dp(encoder);
> +	int ret;
> +
> +	s->output_type =3D DRM_MODE_CONNECTOR_eDP;
>=20
>  	/*
>  	 * FIXME(Yakir): driver should configure the CRTC output video
> @@ -162,8 +166,27 @@ rockchip_dp_drm_encoder_atomic_check(struct
> drm_encoder *encoder, * But if I configure CTRC to RGBaaa, and eDP dr=
iver
> still keep * RGB666 input video mode, then screen would works prefect=
=2E
>  	 */
> -	s->output_mode =3D ROCKCHIP_OUT_MODE_AAAA;
> -	s->output_type =3D DRM_MODE_CONNECTOR_eDP;
> +
> +	ret =3D drm_of_encoder_active_endpoint_id(dp->dev->of_node, encoder=
);
> +	if (ret < 0)
> +		return;

this needs a value returned (probably ret), otherwise you create a=20
warning: =E2=80=98return=E2=80=99 with no value, in function returning =
non-void

drm_of_encoder_active_endpoint_id also always returns -EINVAL on rk3288=
-
veyron-jerry because encoder->crtc is unset in=20
drm_of_encoder_active_endpoint and that breaks display output right now=
=2E

Looking through drm code it seems only two functions would set encoder-=
>crtc
- drm_atomic_helper_update_legacy_modeset_state
- drm_crtc_helper_set_config

drm_crtc_helper_set_config callback got dropped in the atomic-conversio=
n and=20
the other sounds to be somewhat in the legacy area.

After that drm-internals get a bit confusing.


Heiko

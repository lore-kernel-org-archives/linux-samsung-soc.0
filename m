From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [RESEND PATCH V5 08/12] drm/bridge: ptn3460: Support bridge
 chaining
Date: Mon, 21 Jul 2014 16:55:15 +0900
Message-ID: <53CCC763.30607@samsung.com>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
 <1405629839-12086-9-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:11173 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752766AbaGUHzS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jul 2014 03:55:18 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N9100JIXY04R820@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 21 Jul 2014 16:55:16 +0900 (KST)
In-reply-to: <1405629839-12086-9-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, robdclark@gmail.com, daniel.vetter@ffwll.ch, thierry.reding@gmail.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, javier@dowhile0.org, cpgs@samsung.com

On 2014=EB=85=84 07=EC=9B=94 18=EC=9D=BC 05:43, Ajay Kumar wrote:
> Modify the driver to invoke callbacks for the next bridge
> in the bridge chain.
> Also, remove the drm_connector implementation from ptn3460,
> since the same is implemented using panel_binder.
>=20
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  drivers/gpu/drm/bridge/ptn3460.c        |  137 +++++----------------=
----------
>  drivers/gpu/drm/exynos/exynos_dp_core.c |   16 ++--
>  include/drm/bridge/ptn3460.h            |   15 ++--
>  3 files changed, 39 insertions(+), 129 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/ptn3460.c b/drivers/gpu/drm/bridg=
e/ptn3460.c
> index d466696..5fe16c6 100644
> --- a/drivers/gpu/drm/bridge/ptn3460.c
> +++ b/drivers/gpu/drm/bridge/ptn3460.c
> @@ -34,37 +34,15 @@
>  #define PTN3460_EDID_SRAM_LOAD_ADDR		0x85
> =20
>  struct ptn3460_bridge {
> -	struct drm_connector connector;
>  	struct i2c_client *client;
>  	struct drm_encoder *encoder;
>  	struct drm_bridge *bridge;
> -	struct edid *edid;
>  	int gpio_pd_n;
>  	int gpio_rst_n;
>  	u32 edid_emulation;
>  	bool enabled;
>  };
> =20
> -static int ptn3460_read_bytes(struct ptn3460_bridge *ptn_bridge, cha=
r addr,
> -		u8 *buf, int len)
> -{
> -	int ret;
> -
> -	ret =3D i2c_master_send(ptn_bridge->client, &addr, 1);
> -	if (ret <=3D 0) {
> -		DRM_ERROR("Failed to send i2c command, ret=3D%d\n", ret);
> -		return ret;
> -	}
> -
> -	ret =3D i2c_master_recv(ptn_bridge->client, buf, len);
> -	if (ret <=3D 0) {
> -		DRM_ERROR("Failed to recv i2c data, ret=3D%d\n", ret);
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
>  static int ptn3460_write_byte(struct ptn3460_bridge *ptn_bridge, cha=
r addr,
>  		char val)
>  {
> @@ -126,6 +104,8 @@ static void ptn3460_pre_enable(struct drm_bridge =
*bridge)
>  		gpio_set_value(ptn_bridge->gpio_rst_n, 1);
>  	}
> =20
> +	drm_next_bridge_pre_enable(bridge);
> +
>  	/*
>  	 * There's a bug in the PTN chip where it falsely asserts hotplug b=
efore
>  	 * it is fully functional. We're forced to wait for the maximum sta=
rt up
> @@ -142,6 +122,7 @@ static void ptn3460_pre_enable(struct drm_bridge =
*bridge)
> =20
>  static void ptn3460_enable(struct drm_bridge *bridge)
>  {
> +	drm_next_bridge_enable(bridge);
>  }
> =20
>  static void ptn3460_disable(struct drm_bridge *bridge)
> @@ -153,6 +134,8 @@ static void ptn3460_disable(struct drm_bridge *br=
idge)
> =20
>  	ptn_bridge->enabled =3D false;
> =20
> +	drm_next_bridge_disable(bridge);
> +
>  	if (gpio_is_valid(ptn_bridge->gpio_rst_n))
>  		gpio_set_value(ptn_bridge->gpio_rst_n, 1);
> =20
> @@ -162,6 +145,7 @@ static void ptn3460_disable(struct drm_bridge *br=
idge)
> =20
>  static void ptn3460_post_disable(struct drm_bridge *bridge)
>  {
> +	drm_next_bridge_post_disable(bridge);
>  }
> =20
>  void ptn3460_bridge_destroy(struct drm_bridge *bridge)
> @@ -173,6 +157,9 @@ void ptn3460_bridge_destroy(struct drm_bridge *br=
idge)
>  		gpio_free(ptn_bridge->gpio_pd_n);
>  	if (gpio_is_valid(ptn_bridge->gpio_rst_n))
>  		gpio_free(ptn_bridge->gpio_rst_n);
> +
> +	drm_next_bridge_destroy(bridge);
> +
>  	/* Nothing else to free, we've got devm allocated memory */
>  }
> =20
> @@ -184,81 +171,10 @@ struct drm_bridge_funcs ptn3460_bridge_funcs =3D=
 {
>  	.destroy =3D ptn3460_bridge_destroy,
>  };
> =20
> -int ptn3460_get_modes(struct drm_connector *connector)
> -{
> -	struct ptn3460_bridge *ptn_bridge;
> -	u8 *edid;
> -	int ret, num_modes;
> -	bool power_off;
> -
> -	ptn_bridge =3D container_of(connector, struct ptn3460_bridge, conne=
ctor);
> -
> -	if (ptn_bridge->edid)
> -		return drm_add_edid_modes(connector, ptn_bridge->edid);
> -
> -	power_off =3D !ptn_bridge->enabled;
> -	ptn3460_pre_enable(ptn_bridge->bridge);
> -
> -	edid =3D kmalloc(EDID_LENGTH, GFP_KERNEL);
> -	if (!edid) {
> -		DRM_ERROR("Failed to allocate edid\n");
> -		return 0;
> -	}
> -
> -	ret =3D ptn3460_read_bytes(ptn_bridge, PTN3460_EDID_ADDR, edid,
> -			EDID_LENGTH);
> -	if (ret) {
> -		kfree(edid);
> -		num_modes =3D 0;
> -		goto out;
> -	}
> -
> -	ptn_bridge->edid =3D (struct edid *)edid;
> -	drm_mode_connector_update_edid_property(connector, ptn_bridge->edid=
);
> -
> -	num_modes =3D drm_add_edid_modes(connector, ptn_bridge->edid);
> -
> -out:
> -	if (power_off)
> -		ptn3460_disable(ptn_bridge->bridge);
> -
> -	return num_modes;
> -}
> -
> -struct drm_encoder *ptn3460_best_encoder(struct drm_connector *conne=
ctor)
> -{
> -	struct ptn3460_bridge *ptn_bridge;
> -
> -	ptn_bridge =3D container_of(connector, struct ptn3460_bridge, conne=
ctor);
> -
> -	return ptn_bridge->encoder;
> -}
> -
> -struct drm_connector_helper_funcs ptn3460_connector_helper_funcs =3D=
 {
> -	.get_modes =3D ptn3460_get_modes,
> -	.best_encoder =3D ptn3460_best_encoder,
> -};
> -
> -enum drm_connector_status ptn3460_detect(struct drm_connector *conne=
ctor,
> -		bool force)
> -{
> -	return connector_status_connected;
> -}
> -
> -void ptn3460_connector_destroy(struct drm_connector *connector)
> -{
> -	drm_connector_cleanup(connector);
> -}
> -
> -struct drm_connector_funcs ptn3460_connector_funcs =3D {
> -	.dpms =3D drm_helper_connector_dpms,
> -	.fill_modes =3D drm_helper_probe_single_connector_modes,
> -	.detect =3D ptn3460_detect,
> -	.destroy =3D ptn3460_connector_destroy,
> -};
> -
> -int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder=
,
> -		struct i2c_client *client, struct device_node *node)
> +struct drm_bridge *ptn3460_init(struct drm_device *dev,
> +				struct drm_encoder *encoder,
> +				struct i2c_client *client,
> +				struct device_node *node)
>  {
>  	int ret;
>  	struct drm_bridge *bridge;
> @@ -267,13 +183,13 @@ int ptn3460_init(struct drm_device *dev, struct=
 drm_encoder *encoder,
>  	bridge =3D devm_kzalloc(dev->dev, sizeof(*bridge), GFP_KERNEL);
>  	if (!bridge) {
>  		DRM_ERROR("Failed to allocate drm bridge\n");
> -		return -ENOMEM;
> +		return NULL;

I think you could handle error case correctly. Please return
ERR_PTR(-ENOMEM) instead of NULL, and below codes also.

Thanks,
Inki Dae

>  	}
> =20
>  	ptn_bridge =3D devm_kzalloc(dev->dev, sizeof(*ptn_bridge), GFP_KERN=
EL);
>  	if (!ptn_bridge) {
>  		DRM_ERROR("Failed to allocate ptn bridge\n");
> -		return -ENOMEM;
> +		return NULL;
>  	}
> =20
>  	ptn_bridge->client =3D client;
> @@ -285,7 +201,7 @@ int ptn3460_init(struct drm_device *dev, struct d=
rm_encoder *encoder,
>  				GPIOF_OUT_INIT_HIGH, "PTN3460_PD_N");
>  		if (ret) {
>  			DRM_ERROR("Request powerdown-gpio failed (%d)\n", ret);
> -			return ret;
> +			return NULL;
>  		}
>  	}
> =20
> @@ -300,7 +216,7 @@ int ptn3460_init(struct drm_device *dev, struct d=
rm_encoder *encoder,
>  		if (ret) {
>  			DRM_ERROR("Request reset-gpio failed (%d)\n", ret);
>  			gpio_free(ptn_bridge->gpio_pd_n);
> -			return ret;
> +			return NULL;
>  		}
>  	}
> =20

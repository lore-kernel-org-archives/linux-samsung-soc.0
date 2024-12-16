Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079B9175BF;
	Mon, 16 Dec 2024 17:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734369286; cv=none; b=bbOHjvp1CDtwr1TMyJRDFR6D6j5uft3PkMbcJxHXnIDHePc62OXRYDECZYG9/6z8iQttt0nl6+B2EQtMmKFuFYuMCx0c6Ay72i0Gcx2fN70fKQKWRI0fHSsGNNN0EkS8DnXkCMCrgbsidMoTj3WRUhoGOxBf6wNDNT5DLwlrV2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734369286; c=relaxed/simple;
	bh=gSmxdiZIDJu8BiwcPOPmdFwY35K+Q89CNQo+hWjcaBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9Rm5jRj08iW8tM/7Bd22ruJ566XhDI8U284XxnkZwsboh048qkUYZGJv4SGF3yVblEhY2nPcav/Gw+/UHgLqgAY4ruO5v04h3LSfwxKwYskwtw32cJeFLZFqDj6bM761hiWPDgoOKeFAWOvTa+QU5Wtx8axYB1X4iaaNT5bK88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQHCHQzd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQHCHQzd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C81C4CED0;
	Mon, 16 Dec 2024 17:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734369285;
	bh=gSmxdiZIDJu8BiwcPOPmdFwY35K+Q89CNQo+hWjcaBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hQHCHQzd7ZPIab39Ofnd+yXIC4ls5Sg800JevG7+xsIAlI5/TSS8iZD8gBLSm+9C2
	 JYycOcmN5xNLB6YWaiULVIf49/1INTM9Yy3QYPrJ0f2XaiRWXOJtBeHR96T7ar1k9m
	 MQTAKU0UkGhpNiwmODYRvxOxjF0c7YdtvUSpMtswW0Ap4N3E0Gb02OS0ftC986pvEM
	 gT6r2hlcQQWyNBsLSkCXJMIsUlm7UEoD2d+l8a8zVS2NlhjBa0Tr087/RROUBQRtp6
	 j8cO5tnt5lwpEAfKOGfC2QNiqlfdta5JMk/eS/+3crxOYye9wiuiNZ5M896vJYb1+M
	 qumZBJPpZFwmA==
Date: Mon, 16 Dec 2024 18:14:43 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Phong LE <ple@baylibre.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 04/10] drm/bridge: connector: add support for HDMI
 codec framework
Message-ID: <20241216-benign-amiable-grebe-e0b3e1@houat>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
 <20241206-drm-bridge-hdmi-connector-v6-4-50dc145a9c06@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="h3bq7alicyplnrqd"
Content-Disposition: inline
In-Reply-To: <20241206-drm-bridge-hdmi-connector-v6-4-50dc145a9c06@linaro.org>


--h3bq7alicyplnrqd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 04/10] drm/bridge: connector: add support for HDMI
 codec framework
MIME-Version: 1.0

On Fri, Dec 06, 2024 at 12:15:58PM +0200, Dmitry Baryshkov wrote:
> Add necessary glue code to be able to use new HDMI codec framework from
> the DRM bridge drivers. The drm_bridge implements a limited set of the
> hdmi_codec_ops interface, with the functions accepting both
> drm_connector and drm_bridge instead of just a generic void pointer.
>=20
> This framework is integrated with the DRM HDMI Connector framework, but
> can also be used for DisplayPort connectors.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 100 +++++++++++++++++++=
+++++-
>  include/drm/drm_bridge.h                       |  38 ++++++++++
>  2 files changed, 134 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu=
/drm/display/drm_bridge_connector.c
> index 512ced87ea18c74e182a558a686ddd83de891814..4fa1bb73d430d02d5b79a1a18=
4c203ec9e9c66e7 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -21,6 +21,8 @@
>  #include <drm/display/drm_hdmi_helper.h>
>  #include <drm/display/drm_hdmi_state_helper.h>
> =20
> +#include <sound/hdmi-codec.h>
> +
>  /**
>   * DOC: overview
>   *
> @@ -368,10 +370,80 @@ static int drm_bridge_connector_write_infoframe(str=
uct drm_connector *connector,
>  	return bridge->funcs->hdmi_write_infoframe(bridge, type, buffer, len);
>  }
> =20
> +static int drm_bridge_connector_audio_startup(struct drm_connector *conn=
ector)
> +{
> +	struct drm_bridge_connector *bridge_connector =3D
> +		to_drm_bridge_connector(connector);
> +	struct drm_bridge *bridge;
> +
> +	bridge =3D bridge_connector->bridge_hdmi;
> +	if (!bridge)
> +		return -EINVAL;
> +
> +	if (bridge->funcs->hdmi_codec_audio_startup)
> +		return bridge->funcs->hdmi_codec_audio_startup(connector, bridge);
> +	else
> +		return 0;
> +}

Nit: it looks like you return in other cases, and there's no need for
that else.

I'd remove the else.

Looks good otherwise, once fixed
Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--h3bq7alicyplnrqd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2BgAgAKCRAnX84Zoj2+
diFoAYCKbrWMG5n+5jqP+LBnOpHQztpGr0fb/9SiSABc8x5qqhuNZ2mnrkin14cR
DBnqLSoBgLO7VEPgbZZDR4NjbELbuh+1PGlUqiaaajox0mSG5OXJFXoEo+liaS9G
zmiTmODHlw==
=LiWN
-----END PGP SIGNATURE-----

--h3bq7alicyplnrqd--

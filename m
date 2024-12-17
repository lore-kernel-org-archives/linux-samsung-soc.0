Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE04537F8;
	Tue, 17 Dec 2024 07:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734421393; cv=none; b=q4Y5Xbbob3w8m8T4jxPMgU2fKDx/OPrdLsmlP1SjIghRJe6RrrsQImgi8yTxobqdDKsU9rTMneeV+3LNw4t4DwOrn7K/buO+orTLmZYf60+/NhPZYqpoFf4sXbacmBrHZz++Xr8Xz4abrB9ZYjm/MjYIeVcY6JYOFK4OuNx5MTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734421393; c=relaxed/simple;
	bh=SFEB+1CioxLc5lMZKoURIeOpaioyZPe04X8yK/3CHYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mx0HlrovxHRuoaKNgrmNoljpVPAFP7zPqnWy80I0iGKwmeGGXCC+WMOB/sKarDUUmF9MaFwWs6CIQfRjh2bWqqG8vp0ItKpn82+48ZqwMcJBMMfz1NGu+Ccrr2R4yXiJg1FLtaICQ2fAlX2+jC+7Z6Ypn7smeaxHNYMuaq/LPo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qgygh1jB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qgygh1jB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A648EC4CED3;
	Tue, 17 Dec 2024 07:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734421393;
	bh=SFEB+1CioxLc5lMZKoURIeOpaioyZPe04X8yK/3CHYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qgygh1jBZx5lw8SjMJZ9Rn89E9kJt7oapQfMySMCzPSBHCgBuwR0KzOWAzB51uN3c
	 DFJJcdWpUijv2S9WKbhoJTLFMnw/TcqLsu5f+u/7yuUVgx8eq6k1P3RVktd6ksDe9r
	 3KznClF/Fti3bWkP8h+V0dhDiQ7Kmfn+uvsey1jDZE5nv2DuAeGCNztZP5D18mHk93
	 EE6lfm4G8EkU3pUWUW93gmUoHmLrgxokZ7oLJWxRvx1PCwHnSvvTJa1WsGv2sBnKJ3
	 Di+eL1PIokZY3FnyLKS0DJF1ewNV7svRLMJRIZn0urB0dqfOOOgE7vxYn2sCjTERi+
	 5SngBCjqBp21A==
Date: Tue, 17 Dec 2024 08:43:10 +0100
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
Subject: Re: [PATCH v6 03/10] drm/connector: implement generic HDMI codec
 helpers
Message-ID: <20241217-heretic-hopeful-jaguar-aeabec@houat>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
 <20241206-drm-bridge-hdmi-connector-v6-3-50dc145a9c06@linaro.org>
 <20241216-heretic-mackerel-of-wholeness-fcfed7@houat>
 <exocd3b65cy6cy5w47cwx3ykn54ncf34hwyj7ffihs5jjzean5@y677uywnlah2>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="c4s3lijvuloytprp"
Content-Disposition: inline
In-Reply-To: <exocd3b65cy6cy5w47cwx3ykn54ncf34hwyj7ffihs5jjzean5@y677uywnlah2>


--c4s3lijvuloytprp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 03/10] drm/connector: implement generic HDMI codec
 helpers
MIME-Version: 1.0

Hi,

On Mon, Dec 16, 2024 at 07:47:32PM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 16, 2024 at 06:04:41PM +0100, Maxime Ripard wrote:
> > > +struct drm_connector_hdmi_codec_funcs {
> > > +	/**
> > > +	 * @audio_startup:
> > > +	 *
> > > +	 * Called when ASoC starts an audio stream setup. The
> > > +	 * @hdmi_audio_startup is optional.
> > > +	 *
> > > +	 * Returns:
> > > +	 * 0 on success, a negative error code otherwise
> > > +	 */
> > > +	int (*audio_startup)(struct drm_connector *connector);
> > > +
> > > +	/**
> > > +	 * @prepare:
> > > +	 * Configures HDMI-encoder for audio stream. Can be called
> > > +	 * multiple times for each setup. Mandatory.
> > > +	 *
> > > +	 * Returns:
> > > +	 * 0 on success, a negative error code otherwise
> > > +	 */
> > > +	int (*prepare)(struct drm_connector *connector,
> > > +		       struct hdmi_codec_daifmt *fmt,
> > > +		       struct hdmi_codec_params *hparms);
> >=20
> > Missing newline
> >=20
> > > +	/**
> > > +	 * @audio_shutdown:
> > > +	 *
> > > +	 * Shut down the audio stream. Mandatory.
> > > +	 *
> > > +	 * Returns:
> > > +	 * 0 on success, a negative error code otherwise
> > > +	 */
> > > +	void (*audio_shutdown)(struct drm_connector *connector);
> >=20
> > And thus we can probably just call that one shutdown?
>=20
> It should be called automatically by the sound system. I'd rather not
> call items directly that we are not supposed to call.

I meant that with my suggestion to call the function
drm_connector_hdmi_audio_init, that structure would be called
drm_connector_hdmi_audio_funcs, and thus the audio prefix in
audio_shutdown is redundant.

Maxime

--c4s3lijvuloytprp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2EriQAKCRAnX84Zoj2+
dn+KAXsHF1Me3a69DjYay1zSH0/PHfBLCaIV8MGlbctx2pAUq5SnrvsJZ2avXBJl
7I+LlxABewcJcOkSen/hN0RxUNmpQaMQSHXReIonARDyzvaXra1BL1nAga4/ubzn
jeARugW3sQ==
=pdll
-----END PGP SIGNATURE-----

--c4s3lijvuloytprp--

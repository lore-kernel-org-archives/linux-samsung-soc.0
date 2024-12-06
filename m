Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B35F201001;
	Fri,  6 Dec 2024 14:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733494320; cv=none; b=PvIa+ZgY9MpvrJHsSHhYoPJoF9Z+csBTPoHGGtx3tsVkN1qN1MBmBB5NGjk5mju2PKI1oiNSnRXiRDsTSh95IiW6mRoYGOG5m9rsNRJuWlJeWTn2TV0wE3jUCAAqQ9HO1Vg/5FrdZOmyesvFJ5Ktv8/s0Q6NfxOURfVctjUXyMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733494320; c=relaxed/simple;
	bh=8FH5lBgWNIAEjsKX33NT40twbgY4YS5QRxCuJsZyGS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2zLeicA/UUm4J3biXNOiQ8/Btn/B7M+wIn2sw4LxQmn/OrX8FUeh7XtOY6CRLiEqQ1Xo4aJJUOdfdE2VVVjqWee54uQQ/njo718PpiIuG4uficxAkqWFL32A545xqmKh+SwtRZWzLseyWxHzyL0EtiyDpfs5xakRew2fPRDYnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBuKNaNZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBuKNaNZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B15C4CED1;
	Fri,  6 Dec 2024 14:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733494320;
	bh=8FH5lBgWNIAEjsKX33NT40twbgY4YS5QRxCuJsZyGS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SBuKNaNZWbu26ObvbPG20Bv759vrpLQnlotkOFx+diGx23XzE1XB2okn3vzE/iq9x
	 8ZbsrDjAeiCs4pj4wMrB9ir/qWrSVOPrxDMYhDGoVOOD0W44IFlWaKAWduj1GrD+0L
	 dSgOX/UY09zzMCI/xwoXBk+D3A+UZzLtomTwDhjfaK/rd0gjQa+ZS2+z1H00S1mE5U
	 3HxhJtM6GL7MnpkwbiqEM7ctI62Oxq+93wd8Q+If5EkjWpr83Km+TDB+DQhteklwnc
	 UDExjGvZYIKU+mtsTtt2/tG7abNwP/dqU2Z7gEojfnnxbolV13Z4We2lmldrp6jsso
	 5KGUQ7bUcvhow==
Date: Fri, 6 Dec 2024 15:11:57 +0100
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
Subject: Re: [PATCH v5 8/9] drm/vc4: hdmi: switch to using generic HDMI Codec
 infrastructure
Message-ID: <20241206-agile-tidy-avocet-c69bff@houat>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-8-b5316e82f61a@linaro.org>
 <20241202-industrious-unnatural-beagle-7da5d4@houat>
 <e7jngrc4nljdsksekinbkir2h76ztsth2xj4yqcyapfv43uryh@356yrxv3j4x6>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="zlmn4u42a2hgjiwb"
Content-Disposition: inline
In-Reply-To: <e7jngrc4nljdsksekinbkir2h76ztsth2xj4yqcyapfv43uryh@356yrxv3j4x6>


--zlmn4u42a2hgjiwb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 8/9] drm/vc4: hdmi: switch to using generic HDMI Codec
 infrastructure
MIME-Version: 1.0

On Tue, Dec 03, 2024 at 02:19:41PM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 02, 2024 at 02:20:04PM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > Sorry, I've been drowning under work and couldn't review that series be=
fore.
>=20
> No worries, at this point I'm more concerned about my IGT series rather
> than this one.
>=20
> >=20
> > I'll review the driver API for now, and we can focus on the exact
> > implementation later on.
> >=20
> > On Sun, Dec 01, 2024 at 02:44:12AM +0200, Dmitry Baryshkov wrote:
> > > Drop driver-specific implementation and use the generic HDMI Codec
> > > framework in order to implement the HDMI audio support.
> > >=20
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 68 ++++++++++----------------------=
----------
> > >  drivers/gpu/drm/vc4/vc4_hdmi.h |  2 --
> > >  2 files changed, 15 insertions(+), 55 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4=
_hdmi.c
> > > index 7295834e75fb1ab0cd241ed274e675567e66870b..d0a9aff7ad43016647493=
263c00d593296a1e3ad 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > @@ -595,6 +595,9 @@ static int vc4_hdmi_connector_init(struct drm_dev=
ice *dev,
> > >  	if (vc4_hdmi->variant->supports_hdr)
> > >  		max_bpc =3D 12;
> > > =20
> > > +	connector->hdmi_codec.max_i2s_channels =3D 8;
> > > +	connector->hdmi_codec.i2s =3D 1;
> > > +
> >=20
> > I guess it's a similar discussion than we had with HDMI2.0+ earlier
> > today, but I don't really like initializing by structs. Struct fields
> > are easy to miss, and can be easily uninitialized by mistake.
> >=20
> > I think I'd prefer to have them as argument to the init function. And if
> > they are optional, we can explicitly mark them as unused.
>=20
> Do you mean drm_connector_hdmi_init()? I think it's overloaded already,
> but I defintely can think about:
>=20
> drmm_connector_hdmi_init(..., max_bpc, HDMI_CODEC_I2S_PLAYBACK(8) |
> HDMI_CODEC_NO_CAPTURE | HDMI_CODEC_DAI_ID(4));
>=20
> or
>=20
> ... | HDMI_CODEC_NO_DAI_ID)
>=20
> The default (0) being equivalent to:
>=20
> HDMI_CODEC_NO_I2S | HDMI_CODEC_NO_SPDIF | HDMI_CODEC_NO_CAPTURE | HDMI_CO=
DEC_NO_DAI_ID
>=20
> WDYT?

I know it's kind of contradictory, but it definitely looks overcrowded.

A bit after we merged the HDMI infrastructure, Thomas commented that it
might have been better to have a secondary init function instead of an
alloc/init function.

https://lore.kernel.org/all/5934b4b2-3a99-4b6b-b3e3-e57eb82b9b16@suse.de/

It's still sitting in my inbox and haven't had the time to work on that,
but maybe that's how we should deal with this?

Switch to using drm_connector_init, then drm_connector_hdmi_init would
only take care of the video stuff, and we could have an additional
drm_connector_hdmi_audio_init?

That way, we could have both explicit stuff, and yet not overcrowd the
arguments list too much?

Maxime

--zlmn4u42a2hgjiwb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ1MGKAAKCRAnX84Zoj2+
dsbFAYD9a9CbKAF5U+/Xm3fLE7a14J/XPBbuz9EMu0GYhSCDU8jSH+AV+9KU2ocR
VKqXE0sBf3bndpAJ89NpeYGjJK6VbFoQ356f4QDu++x8FSywdfvKoLqiFOIjJWpk
49TswdgyBg==
=ehcm
-----END PGP SIGNATURE-----

--zlmn4u42a2hgjiwb--

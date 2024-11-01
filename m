Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D101DDC10;
	Fri,  1 Nov 2024 19:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730489211; cv=none; b=PdfHUMDZpyWeX3fYOdgkye9fftdXqME9d0eT+KCWENdSAwypRcTPfpWtar96kYKc9+BBNvBA+JunF9EotPQpr0Vh6ijJBChAET2ocuqB2QbSdWSeXZPLjGWKm65YTU4y4NED/OEDAR0piSGisdkrOdoF/iGTeiqocL+n0GMoN58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730489211; c=relaxed/simple;
	bh=Sa/HhTUDVpk4NXfCGGmyvJmpwzaluhlGU0TChrjB+bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mt6idbueTOxpOdLtPOvTuKOA0Y7ihJBXkfclL05J+O+zLcRO/bUGejkgGnrjMUfQ9GoMcigEY6NWvOSer8+PlZR6zhNTml+BoWDMMzkGW8PMGIkpUrluGX3Ut/vB51jThUM+PJdD8OI5Gk/UzsdeJZgTC+SN8swkN705dfXo6Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SaFXkfUu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SaFXkfUu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691F2C4CED1;
	Fri,  1 Nov 2024 19:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730489211;
	bh=Sa/HhTUDVpk4NXfCGGmyvJmpwzaluhlGU0TChrjB+bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SaFXkfUuVpXBA4XRS/CsNDgnVARbi2alUSb+Hi/XtJC1GKki1zmHwC/kEqPNARka3
	 9A8fYPfozklJGgLPZ2Dk7KQbLBQTUftc76f5NWJF8nfXehWeNU8NtYmxAWbSXJfFWi
	 H/KN35oAasjjbOuYK9HMZI3TK6h68sKN2QJJNH1ZIgJWT9oyLceeERvCkBX+JFo5ji
	 QUPRvx+waOf0+Gs6+GQQQ0LNiCHD6GdNfjU15c0Hd2Tx4CgIis6LL4602aCUmdOyy4
	 GuJcEublpLssP2OKfyLFXaTvkVpaAza+PmxCx0JeSEftPfqu8JO5YyRy2y0y005DDz
	 HIHZCCTxXvtEg==
Date: Fri, 1 Nov 2024 19:26:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Phong LE <ple@baylibre.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH RFC v2 2/7] ASoC: hdmi-codec: move no_capture_mute to
 struct hdmi_codec_pdata
Message-ID: <e57aa9c7-1a35-4ed3-94c7-f3acd3293b6d@sirena.org.uk>
References: <20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org>
 <20241101-drm-bridge-hdmi-connector-v2-2-739ef9addf9e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xe2LhHWxNYWP+TP/"
Content-Disposition: inline
In-Reply-To: <20241101-drm-bridge-hdmi-connector-v2-2-739ef9addf9e@linaro.org>
X-Cookie: We read to say that we have read.


--Xe2LhHWxNYWP+TP/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 01, 2024 at 12:19:03PM +0200, Dmitry Baryshkov wrote:
> The no_capture_mute flag might differ from platform to platform,
> especially in the case of the wrapping implementations, like the
> upcoming DRM HDMI Codec framework. Move the flag next to all other flags
> in struct hdmi_codec_pdata.

Acked-by: Mark Brown <broonie@kernel.org>

--Xe2LhHWxNYWP+TP/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmclK3AACgkQJNaLcl1U
h9AmVwf/dWfRKRI7gD3AqmFK1DexdVqm2bNZhFPhh2L1LOQy2vXI7nvVt/2acOos
2JHf3BYuLSIWMThTjkBKh173OCY3MTjzfkZIXRpsK6c7DuqPKLvJSakMt7/bWzvI
fb7j49YV7k/kD7rEZBGA6cm4UTMLe9STpUG3fyNqIBBWEtnxZmGLR99iBXiM+m5R
PoqILxDPVsroDHtz5xX/rUOxM6Fj9vG8TRgkfdHLvRdOjmYQxDD67WiUJKH8RSJ+
li+pH4COp9QU4likh9C3pYaLUEZ4s8Jm9boYt2IZtt66rnGl8vsAjoSW8LOnKlQM
3gmYAtofdaWiOHyS73Z1FO3Eu1quBw==
=ZSKp
-----END PGP SIGNATURE-----

--Xe2LhHWxNYWP+TP/--

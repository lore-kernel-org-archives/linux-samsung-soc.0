Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC9814A4E7;
	Tue, 17 Dec 2024 17:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734456448; cv=none; b=H5myURkLLi+YlsjOzOqO0f2VWVLCfEQzU0xiDXqWaAWxpFz74JVnzuocwbT/CzxlPXe6x1+MOQUju/+zdj0DWUDhfcSnUrUizhcyogTcWYi+k3nQPUwU2sULySPzVCyNeQNLxD0VFUKNA6pb7mBb9lfPP7GhfCwwNO8f5zYt53E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734456448; c=relaxed/simple;
	bh=iPh3bDLKCd3CwOEnfbm4kNHSWlJXwl8A/vYjvWiuNaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gxyd3VdxT6N6p8dmEMIsZ89IY26pX6tnfXmKSA/BIlXtgTSoxZg9XxBaBflCZcmRJG9U9rVjnxk9iWW2+YUjuF65u3NhF5SS+aCyy0c03vofZKaJ+Bpg7qZNXo/29VC0s8xxv1+MRT6pyUdAT3sqKJ9v2SKF52CA4SGlosChn/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GqalVv8V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GqalVv8V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1D81C4CED7;
	Tue, 17 Dec 2024 17:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734456448;
	bh=iPh3bDLKCd3CwOEnfbm4kNHSWlJXwl8A/vYjvWiuNaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GqalVv8V8WTuhVZNoLhPXj3loQeVBzSc+U5TcAOvvvPtpSKywwVXm/jf/OCHy9N2I
	 neDPij5Ptbas6UsTfsyIofUiBwFlRg9Kaz4ME0oTKREkOMdA8uDrw4ePfNhfxUJTKu
	 bZKG61sGGTpVheD+m72JLp30zCerDQ4EcPJZc8PBzKFDwfJQJhy+Ns7vNDSwct23P6
	 uz4bht/SiWbDiQQAV9+Jw8c4QhEaH6p5JKIRheNAXUyQ+oq50Ao78Z2IWZJzFk38hu
	 P6fkD8+9i8tQpB/VVM/ibaAiePsr805ROpVExCluLCXHHp7I11Rd/UjQ7XO5SgrInz
	 XFRFPgNOtqJdQ==
Date: Tue, 17 Dec 2024 18:27:26 +0100
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
Subject: Re: [PATCH v7 09/10] drm/vc4: hdmi: stop rereading EDID in
 get_modes()
Message-ID: <20241217-optimal-chocolate-magpie-6c15c7@houat>
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
 <20241217-drm-bridge-hdmi-connector-v7-9-cb9df2b6a515@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="us4lrt7kgpq6yuvg"
Content-Disposition: inline
In-Reply-To: <20241217-drm-bridge-hdmi-connector-v7-9-cb9df2b6a515@linaro.org>


--us4lrt7kgpq6yuvg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 09/10] drm/vc4: hdmi: stop rereading EDID in
 get_modes()
MIME-Version: 1.0

On Tue, Dec 17, 2024 at 02:40:31AM +0200, Dmitry Baryshkov wrote:
> The vc4_hdmi_connector_detect_ctx() via vc4_hdmi_handle_hotplug()
> already reads EDID and propagates it to the drm_connector. Stop
> rereading EDID as a part of the .get_modes() callback and just update
> the list of modes. This matches the behaviour of the i915 driver.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Assuming it's been tested:
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--us4lrt7kgpq6yuvg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2G0fQAKCRAnX84Zoj2+
dtYOAYDsscBf1VymuKUKPXMg2jxd76zkmI1EvLAV2oFzvON39HTs+cmD2jdtY8LU
FIqA5YkBf0y6io4X/GuAou0bsQ0KiKro88Y/SCgAhaFfWI1UC0TBzqGkU4zzSw/i
66lAU01B9Q==
=+nB7
-----END PGP SIGNATURE-----

--us4lrt7kgpq6yuvg--

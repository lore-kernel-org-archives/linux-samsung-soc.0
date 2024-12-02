Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BA6487A7;
	Mon,  2 Dec 2024 13:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733146809; cv=none; b=B7jbuMF5LS9JfX8wSugFoXbVzYkH+SpCUD1thD0ZKf/ak7n6OtRObmd3TLOajsqWlUAuvIQBHoK9e21lrO+2Ci/Z5k+GW6YjZlUUH7va7cwri9Ea9noY+6pXFMeuLTBb+xiGegIHN72JMygVg3RwAfSZbKYokQzWBycMaFUMzwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733146809; c=relaxed/simple;
	bh=LPw13BPxd7XHqSIBSbW2aDnWNRRtsfeLNYIXzAdMOso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qr0EblNL1AxAds3dcvhDJMJL1MRv2zT+baslXi8wPxynTWXiwmUaII1609yYPNLb5TQVXjX1Sd3lLkQ3XVGh46VzXQTvbH4KMWmGZ2S3hKujRv8OtOmJFW1CqWtX/N1+03URF8/N86epDN3Nw9SGsO6267DcyLA1KXqOf5rO/k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tdXrnYBH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tdXrnYBH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB0F6C4CED1;
	Mon,  2 Dec 2024 13:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733146808;
	bh=LPw13BPxd7XHqSIBSbW2aDnWNRRtsfeLNYIXzAdMOso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tdXrnYBH6FFjeIjzud5NsZpdsNDvf7MHSH5RpHzOAo2l3Mjux9miEWAJjdlNOMpo2
	 1Kz7jRB+lhXqqrQCQETXJ4wusDkwMnM1PEka/yW3pYyw/1ddv7bbFmcvG3eltuk9Oc
	 yW7oa8jioaRh6pIHhtQe7Z8bZJYdZrlQajiBlZcX3O6oyBcaCu/Is5cyi6EYA2h+7a
	 hMURtU/5Wn3d1sNE5u+EAcsjTBNoab74/oioao/sc3Yxlsartyy5U4xOPTSjAOf9X8
	 Yw1H3dyhAX1iLPR+q+Qzgi+2dnmLyR32975lUXdVlES7g0MSsrbG+AHLlgXGNV5KVc
	 cfuo68OLMh9ZA==
Date: Mon, 2 Dec 2024 13:39:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 2/9] ASoC: hdmi-codec: move no_capture_mute to struct
 hdmi_codec_pdata
Message-ID: <8a6bb3c4-73ee-4608-a59f-1590f52b8db4@sirena.org.uk>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-2-b5316e82f61a@linaro.org>
 <20241202-bald-just-guan-c5d41b@houat>
 <0d4dfb60-e2e6-484a-993a-41d1229c62fb@sirena.org.uk>
 <20241202-daft-fervent-grouse-2c0cf7@houat>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3+lNg7eZO9lVqR5n"
Content-Disposition: inline
In-Reply-To: <20241202-daft-fervent-grouse-2c0cf7@houat>
X-Cookie: (null cookie


--3+lNg7eZO9lVqR5n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 02, 2024 at 02:29:55PM +0100, Maxime Ripard wrote:
> On Mon, Dec 02, 2024 at 12:59:22PM +0000, Mark Brown wrote:
> > On Mon, Dec 02, 2024 at 01:06:09PM +0100, Maxime Ripard wrote:
> > > On Sun, Dec 01, 2024 at 02:44:06AM +0200, Dmitry Baryshkov wrote:

> > > > The no_capture_mute flag might differ from platform to platform,
> > > > especially in the case of the wrapping implementations, like the

> > > I appreciate it might be a dumb question, but I never really understood
> > > what no_capture_mute was all about. And in that context, why some
> > > drivers would need / use it, and some won't.

> > It's just what it says, it's a flag saying the device doesn't support
> > muting the capture side.

> Right, but then HDMI is output only, so it still doesn't really make
> sense to me why we'd want to mute the capture side?

This is an ASoC patch and you didn't mention where the flag was...
there's going to be HDMI capture hardware I guess?

--3+lNg7eZO9lVqR5n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdNuK0ACgkQJNaLcl1U
h9BdEAf9HK4EDgrVNfcv0E00Pk4tgBmushLydSQ4M197p6K6qrBg9uVaMSpUWEP3
haScBykJfEBLMuyzWn5Pt5DIQSL1snfw1LKSZcLI6rmjXj3gi2RR9as/xrdlqJzF
omrNsbXdAPCQtKk+HU4NAnhiARLKDFJ/SSF6J3exNcwro7WQl6+5BWF7ZOGr04GU
eGf8TTSw4whQBQQuDh287WvJNCPYNtptohaiFFAtxozv+gwI9ik6dE1el/l/3dAl
iO8/iyIxmHO32eJ4oRf2h5sExtYG36AdN96q9JnEGs712ZK+nX5tWeW0BGFqnict
SsAH3aFhLULXn2ijgLvXrqaH4A3kMA==
=HKwN
-----END PGP SIGNATURE-----

--3+lNg7eZO9lVqR5n--

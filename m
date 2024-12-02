Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B034F1FF7A0;
	Mon,  2 Dec 2024 12:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733144373; cv=none; b=stHtJKaif1U3NnMalJ+e1yMzKma5Jj8dHQKveGwgCgNctPwJftF0Q0cur5gJI6amZZa3uHRNyMW1zh+25Ce1dFHoRcOUV+hVLoUSsK8LK/BYs2m0sAlQrZOrhohTtMGMlsdL2BneOyLJ4Hg+EIXFIvQvPALxrzTig8qJePziky0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733144373; c=relaxed/simple;
	bh=VkSc1OtoaIn5i9sUO8D5w8KXAZHM0RoZXTyJeEmffRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bL0SsrOC25eQbjtgvS/azDPqw0ocb4NMLXVhKHpSJ5AHEa0VIK13M1k/ppo+PHQk3wAfZf+teL6uAwJeQUBhDXyQBlQV3/9UsizS7nwSM2AabRYf1HYI/8N0C/BPKfpis3T9Jm3EOdnF+tKFeOXiECuFf/+OOPdJJnMB0sJzMzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DuPBiKxE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DuPBiKxE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B027C4CED1;
	Mon,  2 Dec 2024 12:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733144373;
	bh=VkSc1OtoaIn5i9sUO8D5w8KXAZHM0RoZXTyJeEmffRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DuPBiKxEPZ8hNvu7XY/JeqC22rHjoWHz8J4L9ZjAqJtP/ZLUdfnH0N2+6JuEuZYNS
	 gjprWPIBrGlbdvouN6ch2AhZJMsdRbpxm/XHYH7Ho2mFhiflGP5NqBIWRyRQr63KY2
	 dyNZ68wkucnwrhDO/niHJsWMeQYK/FBimmPHVagPS++j3LqGQLD84gN2MFTKCcmPvF
	 SULgGPyKftHpxm0Puw/mC6m8e4zYDC68fIdm+wmU0/Zy+PXryK15FE7G1HF7Mzv9Dr
	 DsaxcNzS0UEF+9JnnxJwAPupFgzMBwuSdklY8POOK9d0BHjmTUZCn3XBYh6+RBj7nK
	 kPkHTUy0duybg==
Date: Mon, 2 Dec 2024 12:59:22 +0000
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
Message-ID: <0d4dfb60-e2e6-484a-993a-41d1229c62fb@sirena.org.uk>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-2-b5316e82f61a@linaro.org>
 <20241202-bald-just-guan-c5d41b@houat>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="26+IIHuKp7C8Awjo"
Content-Disposition: inline
In-Reply-To: <20241202-bald-just-guan-c5d41b@houat>
X-Cookie: (null cookie


--26+IIHuKp7C8Awjo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 02, 2024 at 01:06:09PM +0100, Maxime Ripard wrote:
> On Sun, Dec 01, 2024 at 02:44:06AM +0200, Dmitry Baryshkov wrote:

> > The no_capture_mute flag might differ from platform to platform,
> > especially in the case of the wrapping implementations, like the

> I appreciate it might be a dumb question, but I never really understood
> what no_capture_mute was all about. And in that context, why some
> drivers would need / use it, and some won't.

It's just what it says, it's a flag saying the device doesn't support
muting the capture side.

--26+IIHuKp7C8Awjo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdNrykACgkQJNaLcl1U
h9BXlAf/b2RCOldUO9D2uv21dvLwptK8t/qpPmm6L0SGtwbwCyejExyCcRcXDK2J
6VM6BCDUGEH5VIKVo2XFEHzhQi8F4jLnCmdzgwi2kI4Lca8lWjQq/4OwiLPalaeg
0TNUGBy91LjyXlGGoUoweRt8oc0VbsYIr0gEQayLOLfYujv4RiiWYEyIcw1OPDf1
9MigRjCV1msQQXnBP2qTdZ1FrZQlZGD+syITQuFbYrmy+sqwEPxbY9/RYtHo4HBV
A8CBOIE2YuK7W8Dk9VXSPQsN1sSwT3Hj8xvMO0Ka3mK/WjSVva2P8/K3wnBXj9nC
6yKMam1wXDa8AU52tCUq2bS1snS2yA==
=5ZI+
-----END PGP SIGNATURE-----

--26+IIHuKp7C8Awjo--

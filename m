Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235B77D3FB;
	Mon, 20 May 2024 14:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716216084; cv=none; b=HHgsFpyEcr+3PfDjvubYyhknJrwn2K95OIDoRBkTHKAZZf41NZyEjFf/es4XPoPWKmUXktfdeVh3Jj/VIGvnbwc9SW9lBJIIxN4HwxKpQNG4FmusuQK0a2+Bc84hbfmKK0tpDXQlwYp/qx1kPmeKaVitEwsjM63efKHW/MV1Hxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716216084; c=relaxed/simple;
	bh=619Z6jy0Nar5HnINkMj+OqkRlvVm8QNHCVeJy2e8Qus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cpxr8JxNTw23d3kiL9Kwl54VqUOAYzHBD7z5F2T1V3l/WIrLPf6UNDWZ/vvvkZx8Kkjef5CuvAzGflJSTOrGfXvV6Aawh7yT6OhSjkPiaQ9oJmz2IURh+V3he/qPCpO/n3F0d42+QstCLtr2ZUzfJo95nHx+DfiSoGFHA4FU4+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uFJ6jtkj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uFJ6jtkj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A25C2BD10;
	Mon, 20 May 2024 14:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716216083;
	bh=619Z6jy0Nar5HnINkMj+OqkRlvVm8QNHCVeJy2e8Qus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFJ6jtkjLSCdTwIjLDYa5L963tzFoaUCzXZoLvXojXsEzX3rq4zqiEoKSb989dzzn
	 OMNPSzJtGW4QGIoQjqNh14Y0j0jAg2qRYHXaYBX8u3Ryd73zrixwepaDGhD3xTh6LV
	 p7MinFwEhedpSYyWxmZHCZlLtCYlhYjrnGrBwwW1NSfGK3V3h3thQ0dMbKWnIMd9u/
	 IIEa3DMLhD3fAD3fGFrGzd8w8JWZTH8VqItKNzg75AHRslBCQ80N4gWTClRvCHswyX
	 hQyieUmwjPZbnRGnNciIXQkTXaBhvSK2p2jduQLg9aVUY8VXO0Canm4CtQ2hkQyWel
	 oA1uGVgq5faDQ==
Date: Mon, 20 May 2024 15:41:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Alim Akhtar <alim.akhtar@samsung.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 4/8] ASoC: samsung: midas_wm1811: Add GPIO-based
 headset jack detection
Message-ID: <2c4c0aeb-2870-4905-bcfc-642ae40c87f1@sirena.org.uk>
References: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
 <20240519-midas-wm1811-gpio-jack-v3-4-0c1736144c0e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lfTGNXXe0eUJp9Hl"
Content-Disposition: inline
In-Reply-To: <20240519-midas-wm1811-gpio-jack-v3-4-0c1736144c0e@gmail.com>
X-Cookie: We are what we are.


--lfTGNXXe0eUJp9Hl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 19, 2024 at 10:17:50AM +0200, Artur Weber wrote:

> +	if (priv->reg_headset_mic_bias) {
> +		/*
> +		 * Get state of Headset Mic switch by checking the headset mic
> +		 * bias regulator
> +		 */
> +		bias_already_on = \
> +			regulator_is_enabled(priv->reg_headset_mic_bias);

If you're going to do this you need to use regulator_get_exclusive() to
ensure that nothing else can enable the regulator, otherwise you should
just unconditionally enable the regulator.

> +	/*
> +	 * Revert the headset mic bias supply to its previous state
> +	 * (i.e. if it was disabled before the check, disable it again)
> +	 */
> +	if (priv->reg_headset_mic_bias && bias_already_on == 0) {
> +		ret = regulator_disable(priv->reg_headset_mic_bias);
> +		if (ret)
> +			pr_err("%s: Failed to disable micbias: %d\n",
> +			       __func__, ret);
> +	}

Given that you're just briefly bouncing the regulator on and off it'd be
best to just unconditionally enable and disable here, I can't see what
the enable check gains you other than possible race conditions.

--lfTGNXXe0eUJp9Hl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZLYQwACgkQJNaLcl1U
h9Dwjgf/WnkaIdmy+K4GxTBYERrrATUvQAIiQ6PjAPC/Gf9ZYNuIgC/EEe6k4Nlw
WkBAfRhzMebnNCagnadq8ZyPNKp5zUVpGo2/r0QOvrJ3Ajk3RD7e18nKipsWpb7D
DFrusOYqlUdIRUjWCPn/u6WWRojAH9UhnF7XiuL/NSnz9F/g0xvd8wyWa2a5+LjK
NrAKc2Xd0jpBvcTGmTzS+hgFW+xr10HGoG6nutfh9Gm3hi7b9WQ2dl5eo5rGzMqO
kJNvPmQA6kFPcJkCtkLFSgEARq7edL6c+l3rIr42nORS6PtmclS/vRVlkIvXBHyZ
CtJveZ2pcrft4S204mzZk+4vNymYzg==
=EEPv
-----END PGP SIGNATURE-----

--lfTGNXXe0eUJp9Hl--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F10F182DF;
	Mon, 20 May 2024 14:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716215745; cv=none; b=suSQuaczdiOP14Y/n6swZL2rYIww+t21734B5cY5trFy264/1c/Lgz0eQWz3ZRfa7+yVY2ORpGbmJZHKmk9julSgDyGgqLCdVkHLQtiNxCT80OldAS70ufT6ehHdObVjpiYNkfsbml9U0pUzf7slMHo2kkg0A1Qgy8c7P/mmb6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716215745; c=relaxed/simple;
	bh=uSKePMg68VHTXgwYY757U7QjRjNo5hrsfRcyRwpLxfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0HWKLmYd+KQbY5qmxVjBelUdghqQzJDKZNsL0TwmNZBsbCxIiIXD/4kwjF2FUk5JlBA9YMPLiAHMvDwQljRCX1jGnBgE+AyxtdcAlnSiayvzJBwNVfQY34cyFC+3xEMJ2MQlvnWi6EHA4kjzNGe1UjhHwwhs9SRRJCt8RZS1Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FyTqSGz/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyTqSGz/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43DAC2BD10;
	Mon, 20 May 2024 14:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716215745;
	bh=uSKePMg68VHTXgwYY757U7QjRjNo5hrsfRcyRwpLxfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FyTqSGz/Is1DZZJFNqP/b4Jk32a1bzHgOfe3VALEG1QyaujqN4mnQoNIGEf3E8DFV
	 t6U4XsM8T9SCiuud31ZqmvDSwHC70rcdUmh6y1DkKXaeMyKUcfUmIOHWI3/FXWcRo2
	 Zj/QIQM8Fv9KJI4M+4Ca6uMTjElqkhWNe2MOOdyYQlkQRuiuzAIEZIJp3XQlB6FGvc
	 ooaBUiLxH/coetBrCjC1ZU+gpEGmBtAOaidl+g5sw0vAW32yAEy61aHjX4f78gZoaG
	 RadZ3is985KiHJbZYfdbMyqcXY/+4/cDcgcES93ulI3RnalcfaGLXuF0rVBRu81wR7
	 ++ajJ7TE2BqAQ==
Date: Mon, 20 May 2024 15:35:38 +0100
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
Subject: Re: [PATCH v3 3/8] ASoC: samsung: midas_wm1811: Add headset mic bias
 supply support
Message-ID: <1aed24a7-ab2a-4c2b-a3bc-2b907e091624@sirena.org.uk>
References: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
 <20240519-midas-wm1811-gpio-jack-v3-3-0c1736144c0e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pxaZ0LKbE08JUaU/"
Content-Disposition: inline
In-Reply-To: <20240519-midas-wm1811-gpio-jack-v3-3-0c1736144c0e@gmail.com>
X-Cookie: We are what we are.


--pxaZ0LKbE08JUaU/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 19, 2024 at 10:17:49AM +0200, Artur Weber wrote:

> +static int midas_headset_mic_bias(struct snd_soc_dapm_widget *w,
> +			     struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_card *card = w->dapm->card;
> +	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
> +
> +	if (!priv->reg_headset_mic_bias)
> +		return 0;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		return regulator_enable(priv->reg_headset_mic_bias);
> +	case SND_SOC_DAPM_POST_PMD:
> +		return regulator_disable(priv->reg_headset_mic_bias);
> +	}

We have SND_SOC_DAPM_REGULATOR_SUPPLY?

--pxaZ0LKbE08JUaU/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZLX7oACgkQJNaLcl1U
h9B+pQf/bj3bL8onTU8c2fQX8+h6MTpaxgO+m8QtLrABywDZfmRF/bCC0d/FGzGT
2dAn3CMy8ZhJo65ELhLPkBHKRypcILUsxzjTOL6ddyek3cwtaomzLKt/5BPO6zDn
XCygGXgK3NXCDSM4ldhW+N7x5n/i3j6ZCZfAxmYtrxpbEeTxRUbBBYfh20/cSEsa
hhd0GxkGdUdG3ylpnA5n/hi+eMWlGHHB+OxXVJfv/iDrXF8hjOHUbaf82ZR9xwrJ
2wP4BQNUowOuMBQ84h8zzBYOKtvtWUlig2y4ppzeMFeFw4MhYeeQzp/fz5COeKO+
7+EiuORd1ry9xIRankV9nGs7JgiAHQ==
=JVQ0
-----END PGP SIGNATURE-----

--pxaZ0LKbE08JUaU/--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF91542AB9;
	Wed, 22 May 2024 16:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716394942; cv=none; b=ChRFLcX3AHtLB4Wrm/qXDLiiTZU12+vIozwBd1CQ1uqErO6I7pzQjYpdiSAMS2JNIWojk/aW0c8P0EKd8aOCot4qzTljK7jCbJfMkCbqLLbn8azDGSunKvSdYfiwv/VI8/PibHiDNfSB+la+ygPBxlItXADnoOCQ0vhiF7BUw1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716394942; c=relaxed/simple;
	bh=AWTKHb0bmoEcBitaeZqYTd0+23qEPVjE572slrya0ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwBk1X5zSTUE2MmwHi3bc/hM/qK+FcGPB7i8z3KNg9xHbY7zMj+gPHcbbnWGwAty8wBF1r8jBXZd2YFqVGGujtcanpdfkKJOmFpK6XfBBoMNcV6HuDAKKBV7fh0l6k0H9xX9EvvXEqKH6eCC7YP6Agb34HRv6nGeb0R+xAcdHOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fky4eMAs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fky4eMAs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5C0C2BBFC;
	Wed, 22 May 2024 16:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716394942;
	bh=AWTKHb0bmoEcBitaeZqYTd0+23qEPVjE572slrya0ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fky4eMAsBLnUS+z0kupJjk+N+lm7BPyuPATy7PrnPDc6XufE0Gn+auAfTvhCwPmfl
	 avvetGb85fhHXdyDoZooW49ws3OQBB4mKM4tM6ql7fynuLgM8uD7NfESRNb3YFEtRg
	 e1GLPba1O4ykrm3HMSYFYYwIJACKyE47Jwde7y17wRGRjAaoYBYuQHetb166tZpCEg
	 UVoQiPuFJTim0WPru6wl/d6xdzKQVtc6ixII07M7yNSfqLgXjM7OymfVpW0yreMP6V
	 w9Lg5C3jVNs0I8zxj5Y9z/1AUPXAZM0SvGnALDzGsnk9KqOEtX6jcSA2QNGlL0fcES
	 K4+fxL9I5ollQ==
Date: Wed, 22 May 2024 17:22:15 +0100
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
Message-ID: <d64991ee-e125-4497-8030-6ca64fbe35e6@sirena.org.uk>
References: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
 <20240519-midas-wm1811-gpio-jack-v3-3-0c1736144c0e@gmail.com>
 <1aed24a7-ab2a-4c2b-a3bc-2b907e091624@sirena.org.uk>
 <52428c0d-4b18-4707-9cda-4e6a11e256bc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EL4i+puPElguxjip"
Content-Disposition: inline
In-Reply-To: <52428c0d-4b18-4707-9cda-4e6a11e256bc@gmail.com>
X-Cookie: Bridge ahead.  Pay troll.


--EL4i+puPElguxjip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 22, 2024 at 06:20:14PM +0200, Artur Weber wrote:

> What would be the correct thing to do here - add a secondary DAPM widget
> of type REGULATOR_SUPPLY and connect it to the MIC widget via audio-
> routing, or replace the entire MIC widget with a REGULATOR_SUPPLY (or
> something else entirely)?

The microphone is getting a supply so the first option seems better.

> And should this be done with the Main Mic and Sub Mic as well?

Probably yes.

--EL4i+puPElguxjip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZOG7cACgkQJNaLcl1U
h9Da9Af/YiLFo0ws5uTputzZ9Vnnzu51OTlsLRlk/AI4srvbo/yePNM+Zsxysdsm
cM6zex9GmD0DJCYpHAS6sCwGT11nGDlfAUrxi1D/xZYURxArtojJbBztByv7Y2QM
NBjQJcKcvvwtmIG4NT6YS46w2jUBfq7j8LbqMxkby62KiWPe5t1tILfeyv9qHIay
QuR6ILhS093P1LaNp/gM1u6d+usQTb7ymCMWhZWk3ODj23x2VdCSQ94DvUjIlGYV
P4rIzntrO9jzQw3NgEJBLuAhIt6VQmk7Cg04H5ElZlgT7pmbr9cWiLRnepe2uR7g
oQLU9FWtULGu/9PXCdtk2Jj3T61Liw==
=NRmF
-----END PGP SIGNATURE-----

--EL4i+puPElguxjip--

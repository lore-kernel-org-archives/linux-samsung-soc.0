Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA618215189;
	Tue,  4 Feb 2025 16:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738685404; cv=none; b=AD1CVqenGaI3eJYfCLlkpqbuAvxt7VocnhrYLPnKJV9a4Wj0ZaIWLAyoUJN7QdQYNXqVfFnZq58G+CfGKF9hIbIK/TKNMiaa7tezjQ28TyP5hXCHzyt0Viv8xuVuZ7khFornP03gAJYfmorfyBF437fE0LfxqntpG68BjXV1mAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738685404; c=relaxed/simple;
	bh=ELajsPV2LXskLg3ijvM3SEKLjNHIlY+Soc/3SasaL4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PppVdmb1m2YVa5am5nTUHXzAnpxsp426/5YFFnwToU81/X9W3LJL1q6OV76ueSD2tm4NqGdZjRcVFDaRhqZC/m7lHM4q5iK8QqQtsM+P2as8u90moe9T1+30Y7VmMi0yec3vjFALDfq40Ug6DidnQ+X4gXPxNCRnkPqXNlJd+AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3gKozyH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3gKozyH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320C1C4CEDF;
	Tue,  4 Feb 2025 16:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738685403;
	bh=ELajsPV2LXskLg3ijvM3SEKLjNHIlY+Soc/3SasaL4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3gKozyHz31z4VEOF4Xz1GJBSPJbBkNFlWNWsuhXA1QWDAZYPB797h08VEvIXHsm/
	 AA2vGjux30D4zxw2KBkFkYTiSBjfyNYEgQyH+UnBAwDFMPpy7Kzbf0cS6xoQVXoo4b
	 RIdn5ySgRreuALhibtRCvHGjvcYCo5HoIlEv/k/nBWPf5TnGeQhny/OYlVmURBKbW3
	 GFMXxJghqj/yD1i3sbK5jzGwCzaHwSfwoIzSSzCkxTQCHYQPmFxl7f08ma2YGsp5Sc
	 gkywbgoPirdl3c3WVgqzn13OAiszZJsQKmKW0hbFicoCj8Zylm2AXxRRsvSKlJJGik
	 9TKegdIlKaFVA==
Date: Tue, 4 Feb 2025 16:09:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor@kernel.org>, Lee Jones <lee@kernel.org>,
	Sergey Lisov <sleirsgoevy@gmail.com>, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] regulator: s2mps11: Add support for S2MPU05
 regulators
Message-ID: <acedf791-7a02-48ff-ba54-0ee3bc968898@sirena.org.uk>
References: <20250204-exynos7870-pmic-regulators-v1-0-05adad38102c@disroot.org>
 <20250204-exynos7870-pmic-regulators-v1-4-05adad38102c@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="syGCxsIM1euqyJkp"
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-pmic-regulators-v1-4-05adad38102c@disroot.org>
X-Cookie: Spelling is a lossed art.


--syGCxsIM1euqyJkp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04, 2025 at 02:06:29AM +0530, Kaustabh Chakraborty wrote:
> From: Sergey Lisov <sleirsgoevy@gmail.com>
>=20
> S2MPU05 is a PMIC by manufactured by Samsung, particularly used in
> Exynos7870 based devices. Add driver support for controlling its 21 LDO
> and 5 BUCK regulators.

Acked-by: Mark Brown <broonie@kernel.org>

--syGCxsIM1euqyJkp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeiO9UACgkQJNaLcl1U
h9C6fgf/fTuT4f3PspGTjHE/HU/2Aa4qvAhE3QWsvnSgH5CPHD/Dp2zdcOxeyPng
W2KBHtJHVW7S2vZRV64CuosKqp/iyASfX9IBapxFJW4IiPrN1EbKKn/BcWUAjAmC
jXU9/gZfrzbSGBP4BQ+u3vwk6vocZMl6K9xfINUHnAvYBFH6YkSS0Y0DxfJFTB2o
amywOZU14HXJnHM5HJcVeIWrkycfyLMlbR4wP5+h2GYkmvqQAncEHzSig7WYrPv1
CuRsaaMPzOkc7/6nWTLraHRZCu9WvjdtKo69tE1UMgde7ho6DPy9yacLNHR3vyZu
1YDkxr8pupPbrkpJZlwOAE+1uq4u8Q==
=Hoxf
-----END PGP SIGNATURE-----

--syGCxsIM1euqyJkp--

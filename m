Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D8E1F9AB1;
	Wed, 27 Nov 2024 16:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732725253; cv=none; b=iINMnGptFysfxBS3SjQeDjIXRSbo/OGhQhSOmis112dgeNA+FY01B0BdkGQwfFkY5FjIMm8DILbgEeIB3OGBwihMNgztExiQMoFOQMCGXWyKixog4WXhDVM64BduFiMwkiTi5AmLcWk8Mxnq9+8GwC/wBHJTVJx5XhHrRk030XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732725253; c=relaxed/simple;
	bh=hDuzp2NmlbEoolqNz7tS5zWguegqWZEB4qmgDT93Sh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHXFI2buNt+9iqlLqu4RHfyw8Q+3Bii2Xn7vyR9iknd216Wo+f3Uod2AlxPU5TB6iTqwYTRuVPkAx2G6RfRYEpyg4k9C/uMvv1gDQ5PU6Aji87VpvMtjyoph4v6QbDGy8UnP5MSyzfeNXsNL/75KAKivhyolha1KpNIEsaWPmXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VaoZ2EHA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VaoZ2EHA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F29C4CECC;
	Wed, 27 Nov 2024 16:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732725252;
	bh=hDuzp2NmlbEoolqNz7tS5zWguegqWZEB4qmgDT93Sh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VaoZ2EHAt7Qfxz1Jd4yaT56/sHHn+ppPf00joDkMgjcCFy/VVPPWQFaaWf80Xrrph
	 YfiT77Eojcg/c3bu6R6UvPzjx0DoF+4qzrrxKcWDBaZo+5pMpDyO4sGa2DR3RblziL
	 Dfa6Q3d97VURedCKP079RJrBUfzOzqBDMQwRy6Uej2W5+LfPSJpesmMxgQKUNz7N74
	 LzP0dYYP4Pb6SfsT6U9dykZHOonswPV546D+CoIoB2fFkrgKLmeOj23encHDacywML
	 nVmI0iW0gfu3r01jeDQT+q+mobkGvfW0rKZtB+SJFF5IbmcjDezPd57+aG3mEXq6rJ
	 itSiSD04kiSBA==
Date: Wed, 27 Nov 2024 16:34:06 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Roy Luo <royluo@google.com>, kernel-team@android.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 3/9] dt-bindings: phy: samsung,usb3-drd-phy: gs101:
 require Type-C properties
Message-ID: <20241127-hazily-shininess-263835b86a76@spud>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
 <20241127-gs101-phy-lanes-orientation-phy-v1-3-1b7fce24960b@linaro.org>
 <20241127-majorette-decorated-44dc1e7dd121@spud>
 <813713d8ac62be0782bcf36d1d23bec5f4a3c08e.camel@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c8M+h+w9DKAEhDaA"
Content-Disposition: inline
In-Reply-To: <813713d8ac62be0782bcf36d1d23bec5f4a3c08e.camel@linaro.org>


--c8M+h+w9DKAEhDaA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 04:24:08PM +0000, Andr=E9 Draszik wrote:
> Hi Conor,
>=20
> On Wed, 2024-11-27 at 16:00 +0000, Conor Dooley wrote:
> > On Wed, Nov 27, 2024 at 10:58:13AM +0000, Andr=E9 Draszik wrote:
> > > The USB PHY on gs101 needs to be configured based on the orientation =
of
> > > the connector. For that the DTS needs a link between the phy's port a=
nd
> > > a TCPCi, and we'll need to inform the phy driver that it should handle
> > > the orientation (register a handler).
> > >=20
> > > Update the schema to enforce that by requiring the orientation-switch
> > > and port properties (on gs101 only).
> > >=20
> > > Signed-off-by: Andr=E9 Draszik <andre.draszik@linaro.org>
> >=20
> > What is your driver doing if these are not provided? New required
> > properties are an ABI break after all and I don't see a mention of how
> > you're handling it here.
>=20
> This is hooked-in in patch 8 of this series in
> exynos5_usbdrd_setup_notifiers(). The new behaviour is gated off
>=20
>     if (device_property_present(phy_drd->dev, "orientation-switch")) {
>         ...
>=20
> Without that property (i.e. old DTS or !gs101), the driver will behave as
> before (meaning for gs101 it will work in SS mode in one orientation only=
).
>=20
> Does that address your concern?

Aye, but it'd be good to call that out in your commit message.

--c8M+h+w9DKAEhDaA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0dJ/gAKCRB4tDGHoIJi
0uE8AP4xieE2w7MVLlioQY/EzB7WNxxZkSBijdbdgKHeVBmpCAEAvg0mUlHd9e5B
HhD6UoGTOBy3QKdFgrcuKRKcPf5nAgg=
=ZhMC
-----END PGP SIGNATURE-----

--c8M+h+w9DKAEhDaA--

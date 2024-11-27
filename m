Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71981FC105;
	Wed, 27 Nov 2024 16:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732723245; cv=none; b=mRyqveUt4roVuYgUPvjTw+8dVvBdLXasTPlrKw00Sdfs85EVgSc/jnaqZbYcAKoET87TQyV9/Y4orL0NSlgoZ5xJ2eoP5H9Me46a5vhjfCSvjZYUfWxKdzaR/BRcmpId44SHBojdA9GT7bUY8BkPj51aZrb99t+b1WXuHG6GvCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732723245; c=relaxed/simple;
	bh=yF7xcJbfXxYMQO5rvQ21+IZrDicfnlmOQqUSNtru+hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFmSsyJNtlpiTBaR8eMeUvO0j7McWIng44S6aj0N2c9J2b9s9oak9iod3Ln6/fzc1CCX2c+N2vLOB6PyDUeHx6kN5FWXY8LyDmPrPZkBMvpx8+PQ5L6haTRvPyC65gz7/pxdL4c0d/UrxL4V0dxyTH5XkvoxrpextraynlCbfFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+Nuv89m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+Nuv89m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0396C4CECC;
	Wed, 27 Nov 2024 16:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732723245;
	bh=yF7xcJbfXxYMQO5rvQ21+IZrDicfnlmOQqUSNtru+hc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i+Nuv89mAx90D/dR6NKNX+bQsT0PIlhoudP/UkDzMlNdtL17CPv9n0j5J5kuPL7OQ
	 CVQIP36y+FGKuuosv74aKMTFUbGp7cKuEyX0vjxise9gNVIY25pPPnSRYrv7BYhO+0
	 L2UXVgZc1xEsnbwiVEYrZgJJ9Sa0qv4oHREY/OhU8X+/4rJZ/stleNW1TMoUA/GyeH
	 vEODU7eQXIohQ6bRj8ilMbbQf2ndl8vyNMbGW3xmBwmwlqTLDtdvtt2a4kjQoJB45v
	 hfZEGcyH3lJqn9coQUm/IGOR6EFnySTcqCnEH0xF73BbXAYrWFcv/qDEfJhfneiQB0
	 ibET4vMft5e4g==
Date: Wed, 27 Nov 2024 16:00:39 +0000
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
Message-ID: <20241127-majorette-decorated-44dc1e7dd121@spud>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
 <20241127-gs101-phy-lanes-orientation-phy-v1-3-1b7fce24960b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YfeHRpG0fb111QcS"
Content-Disposition: inline
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-3-1b7fce24960b@linaro.org>


--YfeHRpG0fb111QcS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 10:58:13AM +0000, Andr=E9 Draszik wrote:
> The USB PHY on gs101 needs to be configured based on the orientation of
> the connector. For that the DTS needs a link between the phy's port and
> a TCPCi, and we'll need to inform the phy driver that it should handle
> the orientation (register a handler).
>=20
> Update the schema to enforce that by requiring the orientation-switch
> and port properties (on gs101 only).
>=20
> Signed-off-by: Andr=E9 Draszik <andre.draszik@linaro.org>

What is your driver doing if these are not provided? New required
properties are an ABI break after all and I don't see a mention of how
you're handling it here.

> ---
>  Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.y=
aml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> index 6c17a44718aa..0659fc1ce13e 100644
> --- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> @@ -142,6 +142,8 @@ allOf:
> =20
>        required:
>          - reg-names
> +        - orientation-switch
> +        - port
>          - pll-supply
>          - dvdd-usb20-supply
>          - vddh-usb20-supply
>=20
> --=20
> 2.47.0.338.g60cca15819-goog
>=20

--YfeHRpG0fb111QcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0dCJwAKCRB4tDGHoIJi
0lp7AP9eJ/6d5zdEWP9v2k55ubqTTtGLXjJ3y2n5cdYQK3npIgEA/QzZvHonPznn
Q7ozX444DBEExV0qrgNhQZkg5Szw5QQ=
=Pect
-----END PGP SIGNATURE-----

--YfeHRpG0fb111QcS--

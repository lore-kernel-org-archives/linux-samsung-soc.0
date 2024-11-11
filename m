Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDC41BC4E;
	Mon, 11 Nov 2024 20:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731356329; cv=none; b=JpP+lNumWBxMxvSCnqeEJsKEdsuS4rSMjFKdy1FCKHtBvf3x6bI0FfucooUfbtkjHMrk9IZMT4VsPl7a/Gdj9hTJJfbNcU6GhG9tsZ+OJQNuxSFUbr653oHqpTFry+GmHb8w314zuo6wR8TwnT7UzpNWK9N9zGdkKQ9Rdtk0Heg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731356329; c=relaxed/simple;
	bh=t5DsLHsfXVJLaZWit2f4WmFMkD0tUkZhk7FpjCALETo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oTevicbxBOAmWracM6uXHtVMXwXmoLUZ0YHqQDZ782X94ctUXmbWy/sbHqayohP0H2exbLmsxK44ffJMk/Y+6/QkB6pfWS8B2zs1AY34IUMq/v3z97ekJ8islIZxD+QbB4FAyDN994UwabHwlrrbh3r8NlDMdQFH8NH4o0oAtok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqxqfibK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqxqfibK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B07C4CECF;
	Mon, 11 Nov 2024 20:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731356328;
	bh=t5DsLHsfXVJLaZWit2f4WmFMkD0tUkZhk7FpjCALETo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gqxqfibKGViofJ8HKYz5PSJPB7/H6OvWWhJ/kb7COtar9EoQ1MgLDvNlR1bmXyw5h
	 EfYGFIq0amhZd+Ig3cP4u4pSXVCWFo85owkKMFuAjzwS6En24XVQzwpQ38m3qpdOny
	 FecvGyxmlWvNZNaZXaNvj60n4qs8+PkYOPfxh9GiSAC+D0qFhXsgMkz42TOspX0Zlb
	 M6YZRSzEDvNA6GIY6QdVdW2a3VHf7GkDMWWkQ96jwp0jPXwyBEOC7GdQ6V5kW+orht
	 iA+5UA5Nz7BCL5j4f69dTYmc3A1GQxLXj7Wqdsc9/PLNtaADoBXVpzIWJz+51Iejqc
	 IQLLGUsjqZ8uw==
Date: Mon, 11 Nov 2024 20:18:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Sota4Ever <wachiturroxd150@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: samsung: Add compatible for
 Samsung Galaxy S20 FE (SM-G780F)
Message-ID: <20241111-dreadlock-anaconda-e164c85d1ae7@spud>
References: <20241109230402.831-1-wachiturroxd150@gmail.com>
 <20241109230402.831-2-wachiturroxd150@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MPVSYDEanEQ+DG5z"
Content-Disposition: inline
In-Reply-To: <20241109230402.831-2-wachiturroxd150@gmail.com>


--MPVSYDEanEQ+DG5z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 09, 2024 at 11:04:01PM +0000, Sota4Ever wrote:
> Add binding for the Samsung Galaxy S20 FE (SM-G780F) board, which is
> based on the Samsung Exynos990 SoC.
>=20
> Signed-off-by: Sota4Ever <wachiturroxd150@gmail.com>

I doubt "sota4ever" is an known alias, can you use your name here
please?

> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards=
=2Eyaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index b5ba5ffc3..168e77375 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -240,6 +240,7 @@ properties:
>          items:
>            - enum:
>                - samsung,c1s                     # Samsung Galaxy Note20 =
5G (SM-N981B)
> +              - samsung,r8s                     # Samsung Galaxy S20 FE =
(SM-G780F)
>            - const: samsung,exynos990
> =20
>        - description: Exynos Auto v9 based boards
> --=20
> 2.34.1
>=20

--MPVSYDEanEQ+DG5z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJmpAAKCRB4tDGHoIJi
0rizAP42h+6ryK5OuKYwHGBlhnYmZRsNL+6V9i7RBw14mZ5NXAD/WnsmQirug9Uy
IvnvhlHbzmHxe/KvQJfQvQfNxwJr/wU=
=oo5p
-----END PGP SIGNATURE-----

--MPVSYDEanEQ+DG5z--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAA038F9C;
	Fri, 31 Oct 2025 15:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761922927; cv=none; b=r/4aSeQ8AL2ywvQ3YzbdQFvF4cILzd4vFZmtzVA0N2+yCmlGjApoDk1SUpqlOI9KBA01UnskH0d1gAjB8hYBnN4AldWWpRl+B0TajBEwU2l1oDlmuzvDJNyWnASImW9Ct4bFl+31Mc8M9TGfSJyNE2lM6G3oawbu96u3368Ow44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761922927; c=relaxed/simple;
	bh=A6j+79ZaDyl14b4czHD2Hz3q07hKaC3/PBYZxWZEW7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+BYYd3UzvH9CkuqYZWSx/kmUN+i3bBoWK+e3TXjFzPx8s54C4YSCmu5uHAKvtMtMX/dkTUAa2fgVLg+yJs02VC1zTvZG+QGldK/eBQqT/lY4HoanBJnxlXR3D7NB8t7Z++hCFi6SyO4EY4QS56dgZ0qXrqrDBVArI/7IFsxI3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TX0Ut3TQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TX0Ut3TQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2191BC4CEE7;
	Fri, 31 Oct 2025 15:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761922927;
	bh=A6j+79ZaDyl14b4czHD2Hz3q07hKaC3/PBYZxWZEW7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TX0Ut3TQ6crDZ0ZG/j7ordqRhLzS6QiXiKwdM5uYEBLnnXofofePNUeKEQFyaUG+Z
	 wKJTnF4KNl+HDA7LQjO2y4SNWDYBFrt2GEFNTmf69bECZFtZLryn62jfhqiXNGnATu
	 EQ2spNcNXRC4+3pSdUQhbYZtGypQKGI39vnMMLfND/yIX3M4LvGAoB0guqcXw/AO/l
	 rUMXZBC7JVTrwlJ/Qcr0pIS10UsS/7gGascLkyC0MUz9t3wU6bVBmiO/OLfCplhuZn
	 5cHSA7HV9zzc6j0ETSvLv4DvPZ1DiZjIPAJx97pHDvJhfFOZGqjYnYOuqa+t+btqhF
	 H2J4KqgXgacaA==
Date: Fri, 31 Oct 2025 15:02:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	semen.protsenko@linaro.org, willmcvicker@google.com,
	kernel-team@android.com, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: nvmem: add google,gs101-otp
Message-ID: <20251031-seltzer-briskness-6f223654c993@spud>
References: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
 <20251031-gs101-otp-v1-1-2a54f6c4e7b6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="usvtYDXm1VC9pvha"
Content-Disposition: inline
In-Reply-To: <20251031-gs101-otp-v1-1-2a54f6c4e7b6@linaro.org>


--usvtYDXm1VC9pvha
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 12:45:09PM +0000, Tudor Ambarus wrote:
> Add binding for the OTP controller found on Google GS101.
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/nvmem/google,gs101-otp.yaml           | 68 ++++++++++++++++=
++++++
>  1 file changed, 68 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yam=
l b/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..2144911297beb89337b0389b3=
0fe6609db4156ea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/google,gs101-otp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google GS101 OTP Controller
> +
> +maintainers:
> +  - Tudor Ambarus <tudor.ambarus@linaro.org>
> +
> +description: |
> +  OTP controller drives a NVMEM memory where system or user specific data
> +  can be stored. The OTP controller register space if of interest as well
> +  because it contains dedicated registers where it stores the Product ID
> +  and the Chip ID (apart other things like TMU or ASV info).
> +
> +allOf:
> +  - $ref: nvmem.yaml#
> +  - $ref: nvmem-deprecated-cells.yaml

Why are the deprecated cells needed here?
|  Before introducing NVMEM layouts all NVMEM (fixed) cells were defined
|  as direct device subnodes. That syntax was replaced by "fixed-layout"
|  and is deprecated now. No new bindings should use it.

> +
> +properties:
> +  compatible:
> +    items:
> +      - const: google,gs101-otp
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: pclk

Why bother with clock-names when you only have one clock? Are you
anticipating a variant with more?

> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - clock-names
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/google,gs101.h>
> +
> +    otp: efuse@10000000 {
> +        compatible =3D "google,gs101-otp";
> +        reg =3D <0x10000000 0xf084>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +        clocks =3D <&cmu_misc CLK_GOUT_MISC_OTP_CON_TOP_PCLK>;
> +        clock-names =3D "pclk";
> +
> +        product_id: product_id@0 {

Why does this node name have an underscore?

Additionally, all nodes here should lose their labels.

pw-bot: changes-requested

> +            reg =3D <0x0 0x4>;
> +        };
> +
> +        chip_id: chip-id@4 {
> +            reg =3D <0x4 0x10>;
> +        };
> +    };
>=20
> --=20
> 2.51.1.930.gacf6e81ea2-goog
>=20

--usvtYDXm1VC9pvha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQTPaQAKCRB4tDGHoIJi
0o2cAP9I0IfVYwrgz4yBIgFzfJebObNu1sDfp54Jot15zJ20yQEAy6bLbD/bixRO
unoT5rHftBNPQEVc7PZ4SzaJ+kmQoQE=
=2JhO
-----END PGP SIGNATURE-----

--usvtYDXm1VC9pvha--

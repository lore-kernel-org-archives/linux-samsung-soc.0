Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC301519B4
	for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Feb 2025 09:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739697305; cv=none; b=forWqA+Ex6We3Va6dpc7O77qP6wzEzTwq0TBAEXQPjus7Kxc0vOja9y32Mr0pZpo6mDRz6ORxEe48YfqfU0zQiZglFwMo9UDiS9EKZ57IYEXKlVeNPURiRSRtJpzPONJ1kp7cpeCWeahAdeoiTT8q0awACKwFC1P15F1mtn9Qis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739697305; c=relaxed/simple;
	bh=PxYmHzX6Vea9psEbnwUgV8Ka+0cOnKnaPVob6sHO1F8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=KuPRzyJkczDOvf46cGJgG3f+P5yZbW7tiX/gXXaWvTPC3DwvyglS3iFTHb8qEOLpLBJwg/gyA7SUu5KONEv16kcVlKHUh3KKH2SNytfZMySOz1m8fnUHih6EX+Xlq3WeTPMqW/qG/H/Jr1c0jn6doe3Vh2DNunknIVZHmhjgmZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=v15MyCK5; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="v15MyCK5"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1739697294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rt5BxxZTV58xNDbNgF1327IOm+eImblrMkl1NBTJjbU=;
	b=v15MyCK5VSdUac9qEUd85mvpHjw/ERNDvC8jyAnhFW4zew4w21adQpj3/P92SrQYd1kn0y
	jnOKakNZqFiXmeBcBRE7fS/5f2ziYRGsaYJufmuoGYHaVoJegCLYDNOv5aVFXunU907H2k
	VdIhzB7Vb4+DF8Jqghfrdfe5QQMAAQttkA/yUHZkhUEoNd2mlrynfR/tIlZR1L2SyKEo7u
	ftai2xalUGo5519NOkkwyeW5Fs+UMGAYa7woGgZkts2cRZk7d1RLfVzbGymyE/qzpkhIBy
	xkCS3BIawEmDQuuMVLIGDtcdjHDh/LP54/ZWiOiN39FPk506Bl9PEi9P9ZyVPA==
Content-Type: multipart/signed;
 boundary=d97e42a6c6353b7a4f9cd5bcce86d935721f1028ac7c8ebefddaa40ab478;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Sun, 16 Feb 2025 10:14:45 +0100
Message-Id: <D7TR7VP9UPQA.2U5BL328HNSXU@cknow.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/4] dt-bindings: phy: add
 samsung,exynos2200-snps-eusb2-phy schema file
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Ivaylo Ivanov" <ivo.ivanov.ivanov1@gmail.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Kishon Vijay Abraham I" <kishon@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Philipp Zabel" <p.zabel@pengutronix.de>
References: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
 <20250215122409.162810-2-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250215122409.162810-2-ivo.ivanov.ivanov1@gmail.com>
X-Migadu-Flow: FLOW_OUT

--d97e42a6c6353b7a4f9cd5bcce86d935721f1028ac7c8ebefddaa40ab478
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Feb 15, 2025 at 1:24 PM CET, Ivaylo Ivanov wrote:
> The Exynos2200 SoC uses Synopsis eUSB2 PHY. Add a dt-binding schema
> for the new driver.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../samsung,exynos2200-snps-eusb2-phy.yaml    | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2=
200-snps-eusb2-phy.yaml
>
> diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-snp=
s-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200=
-snps-eusb2-phy.yaml
> new file mode 100644
> index 000000000..d69a10f00
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-snps-eusb2=
-phy.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/samsung,exynos2200-snps-eusb2-phy=
.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung SNPS eUSB2 phy controller
> +
> +maintainers:
> +  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> +
> +description:
> +  eUSB2 controller supports LS/FS/HS usb connectivity on Exynos chipsets=
.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,exynos2200-snps-eusb2-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: Reference clock
> +      - description: APB clock
> +      - description: Control PCLK
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: apb
> +      - const: ctrl
> +
> +  phys:
> +    maxItems: 1
> +    description:
> +      Phandle to USBCON phy
> +
> +  vdd-supply:
> +    description:
> +      Phandle to 0.88V regulator supply
> +
> +  vdda12-supply:
> +    description:
> +      Phandle to 1.2V regulator supply
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - clocks
> +  - clock-names
> +  - vdd-supply
> +  - vdda12-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/samsung,exynos2200.h>
> +
> +    usb_hsphy: phy@10ab0000 {
> +        compatible =3D "samsung,exynos2200-snps-eusb2-phy";
> +        reg =3D <0 0x10ab0000 0 0x10000>;
> +        clocks =3D <&cmu_hsi0 CLK_MOUT_HSI0_USB32DRD>,
> +                 <&cmu_hsi0 CLK_MOUT_HSI0_NOC>,
> +                 <&cmu_hsi0 CLK_DOUT_DIV_CLK_HSI0_EUSB>;
> +        clock-names =3D "ref", "apb", "ctrl";
> +        #phy-cells =3D <0>;
> +        phys =3D <&usbcon_phy>;
> +    };

Shouldn't the example have at least all the *required* properties?
Same for patch 2 of this series.

Cheers,
  Diederik


--d97e42a6c6353b7a4f9cd5bcce86d935721f1028ac7c8ebefddaa40ab478
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ7GshwAKCRDXblvOeH7b
bkU8AQCibICp1eXeMpoYosoeOHqF70rWCWBxmLXFVyJRfJNcqAEAjc2hyFVdJERG
U1ReV+OtGUBaTo1Ha+wF3AZwDhfJlwE=
=3NNk
-----END PGP SIGNATURE-----

--d97e42a6c6353b7a4f9cd5bcce86d935721f1028ac7c8ebefddaa40ab478--

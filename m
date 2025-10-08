Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92BD1E7C12;
	Wed,  8 Oct 2025 20:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759957125; cv=none; b=Fxbtyo2mQfvC8rkaS9QWxwrskiXS3quXpGx2X2LCtFHoi/SAhl4ugY4NKi+BDURDuH6xqaI0CKpqphblNFR8ZvxUPINCP2NpHVCeaMKH+XMWOYgjAKDiLVtu7pC1gzpnpHi2woN0Po8fhrKDleM0blbxXLqPSo68kqnbFEdB9Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759957125; c=relaxed/simple;
	bh=u+7t08X/+SbXaDtAVRzGtlvNbiihuB51BPXTkQ6Q1NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhwcDrQ4rXQ+jJY6ifm3/kKsw2mGUzsjWe7JO2Gz0f1jNtzrWVhXMhG88XZ31CTGQIVNrjWAltHKj4/65Sb7NzCCQPLJWL6eWEAoInRjYvP4fspw4yKyT1qnxC6ehm4hzAu0eHai7jYs3gh+enjPcXEA5XdtX8Sf+/xNixWV7+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYiBhD9n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYiBhD9n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE588C4CEE7;
	Wed,  8 Oct 2025 20:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759957124;
	bh=u+7t08X/+SbXaDtAVRzGtlvNbiihuB51BPXTkQ6Q1NQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CYiBhD9nU7UHGrRGOhKpxtOeu42UNvpeEXnvJKO1AnKCri3uTHSCori2F/6oV6Ao/
	 uuJokJ8HQ08GhcO0eTjQALWfr1p6RAayHNshP7rPXMZGXaJPYImHTQVl9jLOpFgYOh
	 FA94dHDio0zVtvWA55xRllxDJKRTjgnx6lZKjicRCev47oZHY6UsXym1Tg2qO2y02R
	 7N5TFRQk4qL72c3x0zMX3G/Nqr0xQP09nlSvOIXT8uMWF91fMJukIu0h0FIMjlPTzq
	 hHHkTXlTOVVOOzW5mY7EOaTpZGvjM0M0+a1RftrIMGUKeTkxcSUlAyY60AejzPWlrt
	 RbDZyraGvszpA==
Date: Wed, 8 Oct 2025 21:58:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Joy Chakraborty <joychakr@google.com>,
	Naveen Kumar <mnkumar@google.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
Message-ID: <20251008-slider-uncombed-66790ea92ea0@spud>
References: <20251008060000.3136021-1-royluo@google.com>
 <20251008060000.3136021-2-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H4E5skbR47wtHuC7"
Content-Disposition: inline
In-Reply-To: <20251008060000.3136021-2-royluo@google.com>


--H4E5skbR47wtHuC7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 05:59:57AM +0000, Roy Luo wrote:
> Document the device tree bindings for the DWC3 USB controller found in
> Google Tensor SoCs, starting with the G5 generation.
>=20
> The Tensor G5 silicon represents a complete architectural departure from
> previous generations (like gs101), including entirely new clock/reset
> schemes, top-level wrapper and register interface. Consequently,
> existing Samsung/Exynos DWC3 USB bindings and drivers are incompatible,
> necessitating this new device tree binding.
>=20
> The USB controller on Tensor G5 is based on Synopsys DWC3 IP and features
> Dual-Role Device single port with hibernation support.
>=20
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  .../bindings/usb/google,gs-dwc3.yaml          | 145 ++++++++++++++++++
>  1 file changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/google,gs-dwc3.=
yaml
>=20
> diff --git a/Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml b/=
Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml
> new file mode 100644
> index 000000000000..9eb0bf726e8d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml

filename matching the compatible please.

> @@ -0,0 +1,145 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2025, Google LLC
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/google,gs-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Tensor Series (G5+) DWC3 USB SoC Controller
> +
> +maintainers:
> +  - Roy Luo <royluo@google.com>
> +
> +description: |
> +  Describes the DWC3 USB controller block implemented on Google Tensor S=
oCs,
> +  starting with the G5 generation. Based on Synopsys DWC3 IP, the contro=
ller
> +  features Dual-Role Device single port with hibernation add-on.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - google,gs5-dwc3

items is redundant here.

> +
> +  reg:
> +    minItems: 3
> +    maxItems: 3
> +
> +  reg-names:
> +    description: |
> +      The following memory regions must present:
> +        - dwc3_core: Core DWC3 IP registers.
> +        - host_cfg_csr: Hibernation control registers.
> +        - usbint_csr: Hibernation interrupt registers.

Put this into reg as an items list, and you can drop the min/max items
=66rom there.
Same applies to interrupts and power-domains.

> +    items:
> +      - const: dwc3_core
> +      - const: host_cfg_csr
> +      - const: usbint_csr
> +
> +  interrupts:
> +    minItems: 3
> +    maxItems: 3
> +
> +  interrupt-names:
> +    description: |
> +      The following interrupts must present:
> +        - dwc_usb3: Core DWC3 interrupt.
> +        - hs_pme_irq: High speed remote wakeup interrupt for hibernation.
> +        - ss_pme_irq: Super speed remote wakeup interrupt for hibernatio=
n.
> +    items:
> +      - const: dwc_usb3
> +      - const: hs_pme_irq
> +      - const: ss_pme_irq

s/_irq//

> +
> +  clocks:
> +    minItems: 3
> +    maxItems: 3
> +
> +  clock-names:
> +    minItems: 3
> +    maxItems: 3
> +
> +  resets:
> +    minItems: 5
> +    maxItems: 5

For clocks and resets, please provide descriptions. For clock-names, you
provided no names and therefore cannot use the property since anything
is valid!

> +
> +  reset-names:
> +    items:
> +      - const: usbc_non_sticky
> +      - const: usbc_sticky
> +      - const: usb_drd_bus
> +      - const: u2phy_apb
> +      - const: usb_top_csr

"csr" is an odd thing to have in a reset name, since it usually means
"control and status register". Why is it here.

> +
> +  power-domains:
> +    minItems: 2
> +    maxItems: 2
> +
> +  power-domain-names:
> +    description: |
> +      The following power domain must present:
> +          - usb_psw_pd: The child power domain of usb_top_pd. Turning it=
 on puts the controller
> +                         into full power state, turning it off puts the =
controller into power
> +                         gated state.
> +          - usb_top_pd: The parent power domain of usb_psw_pd. Turning i=
t on puts the controller
> +                         into power gated state, turning it off complete=
ly shuts off the
> +                         controller.
> +    items:
> +      - const: usb_psw_pd
> +      - const: usb_top_pd

s/_pd// at the very least, but I would question the need to put "usb" in
any of the names given that this is a usb device.

> +
> +  iommus:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - resets
> +  - reset-names
> +  - power-domains
> +  - power-domain-names
> +
> +allOf:
> +  - $ref: snps,dwc3-common.yaml#
> +
> +unevaluatedProperties: false

So every property from snps,dwc3-common.yaml is valid here, with any of
the permitted values?

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        usb@c400000 {
> +            compatible =3D "google,gs5-dwc3";
> +            reg =3D <0 0x0c400000  0 0xd060>, <0 0x0c450000 0 0x14>, <0 =
0x0c450020 0 0x8>;
> +            reg-names =3D "dwc3_core", "host_cfg_csr", "usbint_csr";
> +            interrupts =3D <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH 0>,
> +                         <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH 0>,
> +                         <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH 0>;
> +            interrupt-names =3D "dwc_usb3", "hs_pme_irq", "ss_pme_irq";
> +            clocks =3D <&hsion_usbc_non_sticky_clk>,  <&hsion_usbc_stick=
y_clk>,
> +                     <&hsion_u2phy_apb_clk>;
> +            clock-names =3D "usbc_non_sticky", "usbc_sticky", "u2phy_apb=
";
> +            resets =3D <&hsion_resets_usbc_non_sticky>, <&hsion_resets_u=
sbc_sticky>,
> +                     <&hsion_resets_usb_drd_bus>, <&hsion_resets_u2phy_a=
pb>,
> +                     <&hsion_resets_usb_top_csr>;
> +            reset-names =3D "usbc_non_sticky", "usbc_sticky",
> +                     "usb_drd_bus", "u2phy_apb",
> +                     "usb_top_csr";
> +            power-domains =3D <&hsio_n_usb_psw_pd>, <&hsio_n_usb_pd>;
> +            power-domain-names =3D "usb_psw_pd", "usb_top_pd";
> +            phys =3D <&usb_phy 0>;
> +            phy-names =3D "usb2-phy";
> +            snps,quirk-frame-length-adjustment =3D <0x20>;
> +            snps,gfladj-refclk-lpm-sel-quirk;
> +            snps,incr-burst-type-adjustment =3D <4>;
> +        };
> +    };
> +...

pw-bot: cr

--H4E5skbR47wtHuC7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaObQfgAKCRB4tDGHoIJi
0oWjAP9YqWk7a/FyW8foR/yT+VNOq+XI66exHNNQBPvOdVgC9AEArKBNkcUi0g8z
w38R4cEA+3VrU78OnQDQNAfK5wcUdg8=
=Lg9K
-----END PGP SIGNATURE-----

--H4E5skbR47wtHuC7--

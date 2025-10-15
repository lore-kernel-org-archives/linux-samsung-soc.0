Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031FD319861;
	Wed, 15 Oct 2025 08:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760518789; cv=none; b=rL++zSMu2VT5IZEumrVbNrfj1iv/eDzu/+KBdZ03j7vb5Cge7pEkqx3cgx/AZzRJtLcnZfDnXWHxWhotYQljiCnu1INX9UOwK8TlKrVnr1CNuki3ewh7mfxl7dLAGD8Vulzd+45IzRbcuoAOKkTk/drpP4828Y6NV/CNZqe523o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760518789; c=relaxed/simple;
	bh=b72yY1PK+jIL1N/cKVYxRui1EV7j6kK8mEYVXgh6uVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJR8louMsYtV7nxyJH6AWtMRS8F5FhZbJSNaUu4ThAAVrE3UdnTQ1z3AgNdB5chkdCnvfQNinQzlplIlunYe+ADfDw2W3vvp3XBir3Sk8jfWjJi1Eao1HizM/CZYT8Xfrzr1cHJc2N2CLwSAODj8/PCxzXiPNV/hgAdpXc7OI8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TjjiJX89; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TjjiJX89"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76509C4CEF8;
	Wed, 15 Oct 2025 08:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760518788;
	bh=b72yY1PK+jIL1N/cKVYxRui1EV7j6kK8mEYVXgh6uVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TjjiJX898s20GcskSIqZJfXo95ZoDiXORjsJRp4b2UqJKaNt6jPmyVFCWZS0d6hF6
	 msHBUbbO6aJvxjUvCHYBOGy1JYPT39S51lFIozEWtGRKONLjj9dOnUglWZX9rfUFqi
	 //1OdMoA+rKOQkFnAfPtBvSkCqXS0Tfr0L2mqrtmZAujWpOQkHuWd78SjQCRVh2f81
	 wQuEr+dU9M33ddnZVtrV4CIANa189VxaTvxC8/dlPV4uFQrAB/cyaz1A5Ye0YLDOZd
	 YDZh6FlAQ/EzCS/lv8dSQanRNVphn4i6CPNpuxcCxXM1fkuoX7cFlLhdI959KmjN9T
	 SOLvLrKGNTDNg==
Date: Wed, 15 Oct 2025 09:59:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
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
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
Message-ID: <20251015-backlash-overtime-4c636f12b165@spud>
References: <20251010201607.1190967-1-royluo@google.com>
 <20251010201607.1190967-2-royluo@google.com>
 <066a9598-ad30-4327-be68-87299bba6fda@kernel.org>
 <CA+zupgwc7b51pNRLWRy2CX=n4=FTm=AP7J0dRP2RLjyK5LxGtw@mail.gmail.com>
 <b7b3de64-c656-4a84-8ba4-2d5c7eda9783@kernel.org>
 <CA+zupgzo9zRO2GHR2Np0Tm4M5_h8y0GF2JGGqE_S0BxSR_ZbqQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GW92FK5a5G6ntc0U"
Content-Disposition: inline
In-Reply-To: <CA+zupgzo9zRO2GHR2Np0Tm4M5_h8y0GF2JGGqE_S0BxSR_ZbqQ@mail.gmail.com>


--GW92FK5a5G6ntc0U
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 05:50:17PM -0700, Roy Luo wrote:
> On Tue, Oct 14, 2025 at 1:22=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > On 14/10/2025 03:40, Roy Luo wrote:
> > > On Fri, Oct 10, 2025 at 5:09=E2=80=AFPM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> > >>
> > >> On 10/10/2025 22:16, Roy Luo wrote:
> > >>> Document the device tree bindings for the DWC3 USB controller found=
 in
> > >>> Google Tensor SoCs, starting with the G5 generation.
> > >>>
> > >>> The Tensor G5 silicon represents a complete architectural departure=
 from
> > >>> previous generations (like gs101), including entirely new clock/res=
et
> > >>> schemes, top-level wrapper and register interface. Consequently,
> > >>> existing Samsung/Exynos DWC3 USB bindings are incompatible, necessi=
tating
> > >>> this new device tree binding.
> > >>>
> > >>> The USB controller on Tensor G5 is based on Synopsys DWC3 IP and fe=
atures
> > >>> Dual-Role Device single port with hibernation support.
> > >>
> > >> You still mix, completely unnecessarily, subsystems. For Greg this is
> > >> actually even undesired, but regardless don't do this for any cases
> > >> because it just makes everything slower or more difficult to apply.
> > >>
> > >> Really, think how maintainers should deal with your patches.
> > >>
> > >
> > > Understood, I will separate the patches into two distinct series: one=
 for
> > > the controller and one for the PHY.
> > > Appreciate the feedback and the explanation.
> > >
> > >>>
> > >>> Signed-off-by: Roy Luo <royluo@google.com>
> > >>> ---
> > >>>  .../bindings/usb/google,gs5-dwc3.yaml         | 141 ++++++++++++++=
++++
> > >>>  1 file changed, 141 insertions(+)
> > >>>  create mode 100644 Documentation/devicetree/bindings/usb/google,gs=
5-dwc3.yaml
> > >>>
> > >>> diff --git a/Documentation/devicetree/bindings/usb/google,gs5-dwc3.=
yaml b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> > >>> new file mode 100644
> > >>> index 000000000000..6fadea7f41e8
> > >>> --- /dev/null
> > >>> +++ b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> > >>> @@ -0,0 +1,141 @@
> > >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > >>> +# Copyright (c) 2025, Google LLC
> > >>> +%YAML 1.2
> > >>> +---
> > >>> +$id: http://devicetree.org/schemas/usb/google,gs5-dwc3.yaml#
> > >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >>> +
> > >>> +title: Google Tensor Series (G5+) DWC3 USB SoC Controller
> > >>> +
> > >>> +maintainers:
> > >>> +  - Roy Luo <royluo@google.com>
> > >>> +
> > >>> +description:
> > >>> +  Describes the DWC3 USB controller block implemented on Google Te=
nsor SoCs,
> > >>> +  starting with the G5 generation. Based on Synopsys DWC3 IP, the =
controller
> > >>> +  features Dual-Role Device single port with hibernation add-on.
> > >>> +
> > >>> +properties:
> > >>> +  compatible:
> > >>> +    const: google,gs5-dwc3
> > >>> +
> > >>> +  reg:
> > >>> +    items:
> > >>> +      - description: Core DWC3 IP registers.
> > >>> +      - description: USB host controller configuration registers.
> > >>> +      - description: USB custom interrrupts control registers.
> > >>> +
> > >>> +  reg-names:
> > >>> +    items:
> > >>> +      - const: dwc3_core
> > >>> +      - const: host_cfg
> > >>> +      - const: usbint_cfg
> > >>> +
> > >>> +  interrupts:
> > >>> +    items:
> > >>> +      - description: Core DWC3 interrupt.
> > >>> +      - description: High speed power management event for remote =
wakeup from hibernation.
> > >>> +      - description: Super speed power management event for remote=
 wakeup from hibernation.
> > >>
> > >> Wrap at 80 (see coding style) or just shorten these.
> > >
> > > Ack, will fix it in the next patch.
> > >
> > >>
> > >>> +
> > >>> +  interrupt-names:
> > >>> +    items:
> > >>> +      - const: dwc_usb3
> > >>
> > >> So just "core"?
> > >
> > > I'd prefer to stick to "dwc_usb3" as that's
> > > 1. more expressive by referring to the underlying IP name,
> >
> >
> > But that's completely redundant name.
> >
> > > 2. consistent with established dwc3 bindings such as
> > >     Documentation/devicetree/bindings/usb/snps,dwc3.yaml,
> >
> > If you use only one interrupt. You don't use one interrupt here.
>=20
> After looking into it further, I found that the interrupt name "dwc_usb3"
> must be used here to adhere to the interrupt naming defined in
> "snps,dwc3.yaml".

Did you just chose to not read what Krzysztof said here? It must be used
only when that's the sole interrupt, which he stated is not the case for
your platform.

> This requirement stems from the device's corresponding glue driver
> utilizing a so-called "flattened" model (see [1] for context). This model
> causes the glue driver to probe an underlying "snps,dwc3" device.
> Consequently, the core DWC3 interrupt defined here is consumed by
> the driver handling the "snps,dwc3" device, making it mandatory to
> follow the interrupt naming established in "snps,dwc3.yaml".

I look at the binding and noticed that interrupt-names isn't even a
required property by snps,dwc3.yaml, and this comment about driver
behaviour likely isn't accurate given that the code in for host mode
(and the others are identical) is written so that it will grab the first
interrupt if the specific names it looks for are absent:
| static int dwc3_host_get_irq(struct dwc3 *dwc)
| {
| 	struct platform_device	*dwc3_pdev =3D to_platform_device(dwc->dev);
| 	int irq;
|=20
| 	irq =3D platform_get_irq_byname_optional(dwc3_pdev, "host");
| 	if (irq > 0) {
| 		dwc3_host_fill_xhci_irq_res(dwc, irq, "host");
| 		goto out;
| 	}
|=20
| 	if (irq =3D=3D -EPROBE_DEFER)
| 		goto out;
|=20
| 	irq =3D platform_get_irq_byname_optional(dwc3_pdev, "dwc_usb3");
| 	if (irq > 0) {
| 		dwc3_host_fill_xhci_irq_res(dwc, irq, "dwc_usb3");
| 		goto out;
| 	}
|=20
| 	if (irq =3D=3D -EPROBE_DEFER)
| 		goto out;
|=20
| 	irq =3D platform_get_irq(dwc3_pdev, 0);
| 	if (irq > 0)
| 		dwc3_host_fill_xhci_irq_res(dwc, irq, NULL);
|=20
| out:
| 	return irq;
| }

Since it grabs the first interrupt, as a fallback, in order to support
not having the interrupt-names property, the name of the first interrupt
ultimately doesn't matter at all to this driver (and likely any other
driver written in compliance with the bindings for the dwc3 core).

I'm not here to argue about what the name for the single interrupt
should be (keeping consistency with other devices might actually be
good), but ignoring what a maintainer says and the seemingly providing
an incorrect analysis is annoying. Did you perform the analysis on this
yourself, or did it perhaps come from Gemini?

Thanks,
Conor.

> Essentially, the interrupts defined here are a mix of vendor specific
> implementation (like "hs_pme", "ss_pme") and the DWC3 core in
> "snps,dwc3.yaml" ("dwc_usb3").
>=20
> I don't know if there's a better way to express this implicit dependency
> of the core DWC3 interrupt except for documenting it in the binding
> description. Any advice would be welcome.
>=20
> [1] https://lore.kernel.org/all/20250414-dwc3-refactor-v7-0-f015b358722d@=
oss.qualcomm.com/
>=20
> Thanks,
> Roy Luo
>=20
> >
> > >     Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml,
> > > unless you have a strong preference for the alternative naming.
> >
> > Such namings are discouraged, because they tell absolutely nothing.
> > Also, schematics or datasheets usually do not use them, either.
> >
> >
> > Best regards,
> > Krzysztof

--GW92FK5a5G6ntc0U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO9ifQAKCRB4tDGHoIJi
0i2hAP0TeU5yK0ZKtGdyM4A4+ajUuovxmP76kUHcH5gsiw86HgD9F18E184P1/vt
6JU4iU71rnWcvBNCCfV+EKIyRKVw9wM=
=0mtw
-----END PGP SIGNATURE-----

--GW92FK5a5G6ntc0U--

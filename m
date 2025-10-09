Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C641259CB2
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Oct 2025 04:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759984896; cv=none; b=dXwVZVYRO5lwM7GaxWlLqVfkEUlgrSbQAhn5oF405evMeBjivAdzmg57hVFke4MWps78ugwLqq8M1MS7oif0CJ3NBnqq6sj5txto7RTTVNIeBk3MQLOLFZzSa1OpoJleD1R2/Q29yeZoNgLtuTOcZcjA9tyhazWsAvqSW1h1NBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759984896; c=relaxed/simple;
	bh=JSx+GA5ZXRbiW2N5KmdbA/YFhbngtu5rtQbXWzmld/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iN1LnM1Wk9u9us7eCmGId6KSQVm2YkRmLAYMyOgqW77ujYHYL3Ml4koWcc/c1FzJo9A5Pzt+9JYtP4l88CKt0uUEW8WHe7wjK1fkHqDENUki619yfH1ygmbD8aUzWF6yWN8dxRFhLr8rvzx34Ek8VRVTevhrTkFqxYUuX64KQvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0Kd3yZLW; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0Kd3yZLW"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-28e8c5d64d8so4789135ad.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Oct 2025 21:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759984894; x=1760589694; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qfg2KUrH0ld2loH5dM6+owKjkO3ztYQAbVtuXjduw8k=;
        b=0Kd3yZLWRkcI6RhWR7P/x98nLJ98OFi8ZKJwjF5yxxCeCglXq1kopgT3Ahm/pMpB/P
         u/x+bDOKBe7sWrXMUa3B3C2Ru2hxMuHTi8JTE2h/KuIBrtezQpYhI1zEz+m/eiP0XIG1
         eqh4ooq/pKTnjDv23i+HDhpszMEPLNPGGt1VCzUBgZI61WREsY2Psqu/1HUOOpLlCmn9
         Me4/7Hp+Heo4e+xJV7lGF+ObvAKFjhfO+4JNN9kJDXLNd5BWDXvJyJOcyE6WgJly7ef+
         koCDlgnGy8sUv1nK9miY/VXX7aR0s7WkU3WBiw4KqT8L/SgvrX06oeuM6+HqCbvt5sJI
         bICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759984894; x=1760589694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qfg2KUrH0ld2loH5dM6+owKjkO3ztYQAbVtuXjduw8k=;
        b=s/v3qBampCfz8iWNjBg+xUBdU5IVwK2tQx+uvjHcoj4nYqFEWLbaEgqx0zI/eD8Wz1
         +Qg+Z2Mul3fQxzs65UtrVAXsOfUNIswE0Jw63GFSVBrCgyh3TLt6u58sY8ABtWK9JPmD
         mvWYzEHkHwuL0on/ohF2F4iMlLcM+kuwhNq/73W4WlgZKzH0E3E381XVXnaHrRZ37OrM
         9M2OXOJLBbgi/ybpyWP9H7TCYFtvLCJ+0SOmsJQf3Q6fLDmhGhTPZYEmvcAo50qxg527
         +/8F88UWS4QQay7K0bnxXVriFcnVzTVr3yXcB4mpbBZdpF8PLH/juw6a8pRJB4oxenem
         qbKg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ8NRacj/N8wAh0dvmeR9SS7dwPNf2ZNhXDSfjd0CF64Xdp8/5TBP3nwVcOlCCAd3osnDyGXmZ6Pqz7RmRZnfenw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1BbiGbL8VmvhSUjkVEuExI3U0CFZSlX0FcQDE502b6ynqkBhT
	E/jIPUtKu+R5xw9KzF+lXQ/geIu9/gPVz1+Wk/3wDOPvLaIKIfwi5c3Fbt0Vbxgd1dhKW/VNpzc
	3v7Ruicg8Ok0CMdYKBohhUAwlrZcn3o7N9pP4VRUg
X-Gm-Gg: ASbGnctbhjKpgJ6AvQygDXXU2VPdeo5TEBi36+Shug+JZ2R9HY2GTmWgqSW1V1X4h/P
	eOQz/08Y5slWc7438Pzv+gSbsMd6wdpabstrFBRzv3J6+eiaRcLjnC+8XSR16QVGISGiBYmLaLS
	9OZ1M8znCZan/MANpPP5dtf7mATgfDbm4eswXcirOum3c3Liq41bGrXv+65tttehKANTWFIJcxa
	6AEAPQfp13eKy5X2xCZm8B2V6safvXeaXBlNI1wl1atHMxPkR5jo+xswGDSAu1YOSAJwqA=
X-Google-Smtp-Source: AGHT+IHq7WMGknZC9D22TiuSJobcSs2r+0inHJ0URZqm945Ibpmj/rMeznufzslM6ZAVx62ePKO1/By8R2qOoulx2p4=
X-Received: by 2002:a17:903:240e:b0:25c:b1d6:c41a with SMTP id
 d9443c01a7336-290273568efmr77605215ad.11.1759984894045; Wed, 08 Oct 2025
 21:41:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008060000.3136021-1-royluo@google.com> <20251008060000.3136021-2-royluo@google.com>
 <20251008-slider-uncombed-66790ea92ea0@spud>
In-Reply-To: <20251008-slider-uncombed-66790ea92ea0@spud>
From: Roy Luo <royluo@google.com>
Date: Wed, 8 Oct 2025 21:40:57 -0700
X-Gm-Features: AS18NWDwvHFFVwwFF0xyUsh6hOplsl-LTeW3KNkkNIVFS6G7WbYp6KqWo-pnIz8
Message-ID: <CA+zupgxnBK_k2X0_KKX9pUMMTwY4VhsyTEEVz6v+__u=2xR8Ow@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
To: Conor Dooley <conor@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 1:58=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Wed, Oct 08, 2025 at 05:59:57AM +0000, Roy Luo wrote:
> > Document the device tree bindings for the DWC3 USB controller found in
> > Google Tensor SoCs, starting with the G5 generation.
> >
> > The Tensor G5 silicon represents a complete architectural departure fro=
m
> > previous generations (like gs101), including entirely new clock/reset
> > schemes, top-level wrapper and register interface. Consequently,
> > existing Samsung/Exynos DWC3 USB bindings and drivers are incompatible,
> > necessitating this new device tree binding.
> >
> > The USB controller on Tensor G5 is based on Synopsys DWC3 IP and featur=
es
> > Dual-Role Device single port with hibernation support.
> >
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  .../bindings/usb/google,gs-dwc3.yaml          | 145 ++++++++++++++++++
> >  1 file changed, 145 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/google,gs-dwc=
3.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml =
b/Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml
> > new file mode 100644
> > index 000000000000..9eb0bf726e8d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml
>
> filename matching the compatible please.
>
> > @@ -0,0 +1,145 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright (c) 2025, Google LLC
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/google,gs-dwc3.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google Tensor Series (G5+) DWC3 USB SoC Controller
> > +
> > +maintainers:
> > +  - Roy Luo <royluo@google.com>
> > +
> > +description: |
> > +  Describes the DWC3 USB controller block implemented on Google Tensor=
 SoCs,
> > +  starting with the G5 generation. Based on Synopsys DWC3 IP, the cont=
roller
> > +  features Dual-Role Device single port with hibernation add-on.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - google,gs5-dwc3
>
> items is redundant here.
>
> > +
> > +  reg:
> > +    minItems: 3
> > +    maxItems: 3
> > +
> > +  reg-names:
> > +    description: |
> > +      The following memory regions must present:
> > +        - dwc3_core: Core DWC3 IP registers.
> > +        - host_cfg_csr: Hibernation control registers.
> > +        - usbint_csr: Hibernation interrupt registers.
>
> Put this into reg as an items list, and you can drop the min/max items
> from there.
> Same applies to interrupts and power-domains.
>
> > +    items:
> > +      - const: dwc3_core
> > +      - const: host_cfg_csr
> > +      - const: usbint_csr
> > +
> > +  interrupts:
> > +    minItems: 3
> > +    maxItems: 3
> > +
> > +  interrupt-names:
> > +    description: |
> > +      The following interrupts must present:
> > +        - dwc_usb3: Core DWC3 interrupt.
> > +        - hs_pme_irq: High speed remote wakeup interrupt for hibernati=
on.
> > +        - ss_pme_irq: Super speed remote wakeup interrupt for hibernat=
ion.
> > +    items:
> > +      - const: dwc_usb3
> > +      - const: hs_pme_irq
> > +      - const: ss_pme_irq
>
> s/_irq//
>
> > +
> > +  clocks:
> > +    minItems: 3
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    minItems: 3
> > +    maxItems: 3
> > +
> > +  resets:
> > +    minItems: 5
> > +    maxItems: 5
>
> For clocks and resets, please provide descriptions. For clock-names, you
> provided no names and therefore cannot use the property since anything
> is valid!
>
> > +
> > +  reset-names:
> > +    items:
> > +      - const: usbc_non_sticky
> > +      - const: usbc_sticky
> > +      - const: usb_drd_bus
> > +      - const: u2phy_apb
> > +      - const: usb_top_csr
>
> "csr" is an odd thing to have in a reset name, since it usually means
> "control and status register". Why is it here.
>
> > +
> > +  power-domains:
> > +    minItems: 2
> > +    maxItems: 2
> > +
> > +  power-domain-names:
> > +    description: |
> > +      The following power domain must present:
> > +          - usb_psw_pd: The child power domain of usb_top_pd. Turning =
it on puts the controller
> > +                         into full power state, turning it off puts th=
e controller into power
> > +                         gated state.
> > +          - usb_top_pd: The parent power domain of usb_psw_pd. Turning=
 it on puts the controller
> > +                         into power gated state, turning it off comple=
tely shuts off the
> > +                         controller.
> > +    items:
> > +      - const: usb_psw_pd
> > +      - const: usb_top_pd
>
> s/_pd// at the very least, but I would question the need to put "usb" in
> any of the names given that this is a usb device.
>
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - interrupt-names
> > +  - clocks
> > +  - resets
> > +  - reset-names
> > +  - power-domains
> > +  - power-domain-names
> > +
> > +allOf:
> > +  - $ref: snps,dwc3-common.yaml#
> > +
> > +unevaluatedProperties: false
>
> So every property from snps,dwc3-common.yaml is valid here, with any of
> the permitted values?

Conor,

Appreciate the review.
Ack to all the comments, will fix them in the next patch.
And yes, every property from snps,dwc3-common.yaml is valid here.
You can find more context here [1], essentially the dwc3 glue would be
operating on the same platform device as the dwc3 core, hence all
properties are allowed.

[1] https://lore.kernel.org/all/20250414-dwc3-refactor-v7-0-f015b358722d@os=
s.qualcomm.com/

Thanks,
Roy Luo

> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    soc {
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        usb@c400000 {
> > +            compatible =3D "google,gs5-dwc3";
> > +            reg =3D <0 0x0c400000  0 0xd060>, <0 0x0c450000 0 0x14>, <=
0 0x0c450020 0 0x8>;
> > +            reg-names =3D "dwc3_core", "host_cfg_csr", "usbint_csr";
> > +            interrupts =3D <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH 0>,
> > +                         <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH 0>,
> > +                         <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH 0>;
> > +            interrupt-names =3D "dwc_usb3", "hs_pme_irq", "ss_pme_irq"=
;
> > +            clocks =3D <&hsion_usbc_non_sticky_clk>,  <&hsion_usbc_sti=
cky_clk>,
> > +                     <&hsion_u2phy_apb_clk>;
> > +            clock-names =3D "usbc_non_sticky", "usbc_sticky", "u2phy_a=
pb";
> > +            resets =3D <&hsion_resets_usbc_non_sticky>, <&hsion_resets=
_usbc_sticky>,
> > +                     <&hsion_resets_usb_drd_bus>, <&hsion_resets_u2phy=
_apb>,
> > +                     <&hsion_resets_usb_top_csr>;
> > +            reset-names =3D "usbc_non_sticky", "usbc_sticky",
> > +                     "usb_drd_bus", "u2phy_apb",
> > +                     "usb_top_csr";
> > +            power-domains =3D <&hsio_n_usb_psw_pd>, <&hsio_n_usb_pd>;
> > +            power-domain-names =3D "usb_psw_pd", "usb_top_pd";
> > +            phys =3D <&usb_phy 0>;
> > +            phy-names =3D "usb2-phy";
> > +            snps,quirk-frame-length-adjustment =3D <0x20>;
> > +            snps,gfladj-refclk-lpm-sel-quirk;
> > +            snps,incr-burst-type-adjustment =3D <4>;
> > +        };
> > +    };
> > +...
>
> pw-bot: cr

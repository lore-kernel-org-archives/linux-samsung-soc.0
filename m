Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2C423816C
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Oct 2025 05:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759986806; cv=none; b=fxXx60JGUeWRoNc1QizLOr2mWjNZNcw6rSu6cTwMg5osig/0BVv+v3zyTVdOBZss3QoyXc1MqbEMlmAmnLw9nmp1ivcicsY4goggvsT43iIIZDOA3Rrw/h5RcGZnPZh11dfwKReovudb4BwZZjbIeozp798o+7pWZ6WZZ/g3et8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759986806; c=relaxed/simple;
	bh=XgKEUUpBVyKhaDmSmOHwqctzZ1yn4T/HwN7blucyAv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hihvEbAQVc0ZIyKt9rtyDEOP2gAUosJSRyDcUZViWsB000qHQjdD6ucNUhawiSa0nzqmijgDorDcZLhKYRpOyPx21G1lygChimJQvl2HUc9MUBufVO+tB+ayorWzVfp2HD6I7pph/WZj2/EvSn21IdrFAspqvNwVMrj1ZjEK6/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D6wOMeSF; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D6wOMeSF"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b554bb615dcso322791a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Oct 2025 22:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759986804; x=1760591604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWewaHokP8ZtNf5xV3DaenIr+l1N9Mpv+SreL8jsLig=;
        b=D6wOMeSFlP1ic+i3VxQcP88RlxlHsDH/F8OBgITJvOe3Zfmf9X3mUXJb+FbM9DeSvb
         WPnxgW+MJbksEM95TtJG/MQ9ZWV1UtETpKv8FzqhcRE3nycad3LiXxszbjhpCHf4W1km
         /HAl66md19HaAOxX+ixLviKEjRp9rwz34RuefqWQ7yCKhbq8bX0XPSPLegm5mWH6qXfN
         WYPhQR73gS22CbasH9pO7nJeRBKcrHBU8GFqtr3AakFoW8OJdEOcrI+UM32h0We5xmA9
         4PxOIbKUKU1lq5BHP5j5bJK3uGkTwuaBvNM7P9nWNXBbc8+yPN3fiplisiadwPwxsNn5
         y2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759986804; x=1760591604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWewaHokP8ZtNf5xV3DaenIr+l1N9Mpv+SreL8jsLig=;
        b=H3PMB7BYeAknYUfGdf5V/RIdGcHLTTUmGaplu2pfPc3TwTu9GKkDoHdx5zi+xFGCjW
         z/GEQn0pXfuCM8IzGx+VH8k73lWTqdvErKNcxgaH2lzySzmJcjBVGiBCLnNJ7XbfvRNZ
         h55VCvnQhfqxoAWVaQ529HIvaY0kU2vG1OQKYBYNOT09ytDWxAgTBnwjFZfqSNv1rmGE
         v0mMK4GfecD8u/C3hfY7PmXQc5DjNpFiPevyP1vmIM3sNhGG8a4VFBhm+GKD/13HC2ET
         H9mvWoZHIqdfXsFGAdgCu/qj+J44a0QomCVThPBLNDVtazBR0MubquRZvdbES9cu78R6
         BdwA==
X-Forwarded-Encrypted: i=1; AJvYcCXeAnJnD+c+ctCkhHkD5GW5tTkgcOs/HuE5NTmaZBnSnDngTnc4e/Ulvpb2ikVwrlMjh3VKLXyGspHD49iE16jSUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzagRxFgL/0MwPtL3en1OdilI02cPElg6fdv56xkBaf0xC52i0A
	YIY6k/zwlajlmNCsc0ckoVcEXyG0V0qeYj89nTA2Id++cKnOYDqqeQ+WIo+cXqIiOSmo8tt/EUE
	p86t6A7j8WFDmZ/hT/bFBDE8AJA9NqYoMP//QV3uz
X-Gm-Gg: ASbGncueBM31n7FuX3bfoEq3BnvpQgdC0VrK6fQTNH3NhuBaW+UeNxVcFmvACLFmAGy
	9VPfcPVsCZapgkxXcRi+G3rq+425KpSMpsp/HywwOSSEFYPbGItbLX+JS/HFytvEJSOcHioaw0s
	bqgBJx5Vz2bvAuzFkln5MkbqtjLykk95A+yD9nzrgTaiYniUIwdXZSviyyt174tepSwh2zYQE/F
	nnK1CKfVjYuxPZdJODupweCeiTF85SDM95dJ5NyQN55G1Twpc7KXCj1LtJCHbDOge60NctxmV+4
	V80RaQ==
X-Google-Smtp-Source: AGHT+IHftw1sTR4jx+skzjrqSGdfm/Q0+OudIaUszRZ3Jo7Mtg1ENnay4Sa6Pgawbis09A4Kl1WSaKxYdl0Pty1Yfo8=
X-Received: by 2002:a17:903:1b46:b0:269:b65a:cbb2 with SMTP id
 d9443c01a7336-2902738685emr79503305ad.47.1759986803355; Wed, 08 Oct 2025
 22:13:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008060000.3136021-1-royluo@google.com> <20251008060000.3136021-2-royluo@google.com>
 <8966b6a9-ff70-4833-a5c7-c6d6c13c6c8b@kernel.org>
In-Reply-To: <8966b6a9-ff70-4833-a5c7-c6d6c13c6c8b@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Wed, 8 Oct 2025 22:12:46 -0700
X-Gm-Features: AS18NWAeUlPdfPhpwSxxFxgtGGF4Sy9E3bq34jSmHpsPo17xNshrcbYfSpJ1QNc
Message-ID: <CA+zupgwLu-y26X9eiENyC28i9ZxCkuhb0X8X9H6HBpqkqJ7O3w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
To: Krzysztof Kozlowski <krzk@kernel.org>
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

On Wed, Oct 8, 2025 at 4:56=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 08/10/2025 14:59, Roy Luo wrote:
> > Document the device tree bindings for the DWC3 USB controller found in
> > Google Tensor SoCs, starting with the G5 generation.
> >
> > The Tensor G5 silicon represents a complete architectural departure fro=
m
>
>
> G5 does not have a model number like G1-G4?

There's no model number for G5, I'm sticking to the existing "gs" prefix
as they're still in the same SoC family.  Please let me know if you have an=
y
concerns.

>
> > previous generations (like gs101), including entirely new clock/reset
> > schemes, top-level wrapper and register interface. Consequently,
> > existing Samsung/Exynos DWC3 USB bindings and drivers are incompatible,
>
> Do not reference drivers. Explain the hardware.

Ack, all mentions of "driver" will be removed in the next patch.

>
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
>
>
> Do not need '|' unless you need to preserve formatting.

Ack, will fix this in the next patch.

>
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
> > +
> > +  reg:
> > +    minItems: 3
>
> Drop
>
> > +    maxItems: 3
> > +
> > +  reg-names:
> > +    description: |
> > +      The following memory regions must present:
> > +        - dwc3_core: Core DWC3 IP registers.
> > +        - host_cfg_csr: Hibernation control registers.
> > +        - usbint_csr: Hibernation interrupt registers.
>
> Drop description or move it to items in reg. See other bindings.

Ack, will use an item list in reg instead.

>
> > +    items:
> > +      - const: dwc3_core
> > +      - const: host_cfg_csr
> > +      - const: usbint_csr
> > +
> > +  interrupts:
> > +    minItems: 3
>
> Drop

Ack, will use an item list instead.

>
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
>
> From where did you get this style? Don't write bindings with chat gpt or
> whatever other tool. it is a waste of our time.

I referenced the style from a recent dt binding change [1] that adds
"Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml".
I thought it would be a good reference because it's relatively new
and is also a binding for SNPS dwc3 glue logic. Perhaps that style
doesn't apply here because qcom,snps-dwc3.yaml supports
multiple compatible and here we have only one?

Just to clarify, I'm a Gemini user and this patch is 100% organic,
hand-crafted by a living human brain :)

[1] https://lore.kernel.org/all/20250414-dwc3-refactor-v7-2-f015b358722d@os=
s.qualcomm.com/

Thanks,
Roy Luo

>
> > +    items:
> > +      - const: dwc_usb3
> > +      - const: hs_pme_irq
> > +      - const: ss_pme_irq
> > +
> > +  clocks:
> > +    minItems: 3
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    minItems: 3
> > +    maxItems: 3
>
> From where did you get such syntax?
>
> > +
> > +  resets:
> > +    minItems: 5
> > +    maxItems: 5
> > +
> > +  reset-names:
> > +    items:
> > +      - const: usbc_non_sticky
> > +      - const: usbc_sticky
> > +      - const: usb_drd_bus
> > +      - const: u2phy_apb
> > +      - const: usb_top_csr
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
>
> Same comments.
>
>
> > +    items:
> > +      - const: usb_psw_pd
> > +      - const: usb_top_pd
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> Best regards,
> Krzysztof

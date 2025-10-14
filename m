Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5445826CE37
	for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Oct 2025 01:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760406049; cv=none; b=sPSuKowJd1gXbJ5SiqN5PNvEa0TcZygrUF16nOByAusU1GEnvOXi3+1vuAN8wroj0TJuhIL+8qmCvCf00FacdERC4R7RNh3LeIeTEMEetgeYNXAIf7PLPvBhmyFbj3WF74dPIORbkV9PzmGRCNRUAl+cxHvQRlDSIK5gULu88Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760406049; c=relaxed/simple;
	bh=SvUOg+GhCiLgOKSplnIErGjUnl2M+DDGuRcUuzNrrSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vy+nn+xJnpt/7eGrJUX7zlrM5Y12/goxaSGAwz8cokkM1Xb4fjyioH2HQzr30A/fBJJHOOxrdGBfSRfHP+Wfs9XA2Z5fyYRVrERSI+HmuFVDk0GtWzN/S8Kv5P1jbd9UMP38lFxY0vLZQ0+1Ya2YsOo5WFBs8KZSVh3wm+VEhUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wgUc0p+h; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wgUc0p+h"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-782a77b5ec7so4267267b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 18:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760406045; x=1761010845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0HrrIP4IFVgvTei6bJGzfuFKTrJwkNbVYBJNZOs3MY=;
        b=wgUc0p+hwwd1D0aTTBPxPMJllxgGhuBtnQDHVXcBypuMeyptP9JJQRupKvw/Qxu4nM
         6JozLu7q+eFMKFm9ifD9Fwx9WNsqR/bonN6BA2EvXxCTxwwufzkuTu+Vkv8e1UY6Hu9+
         SZpRiUUpcVKDCMi8HRkn3AE9Wo/ykM+/12AO/1v3rxf3AS34kAxFhjnhW0LfyFYmVDTz
         BS1cSC6gDUNEr+cqml4hpndYc/vqil1Gds0soQpTv7yenNjI3l0RGmrS/7iSSfU6Ja6n
         gaihr7TLLzo66MI+3rUt+HKjptAJcr3mdOkIhNivPufamL/5Ybr+YpCG1o3paIkk76BC
         HSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760406045; x=1761010845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0HrrIP4IFVgvTei6bJGzfuFKTrJwkNbVYBJNZOs3MY=;
        b=ffsR0Z+7LOcner0prTMPLVE1zxLqDCX6uETJZkOPjyZuJEUEOejjEU4tg/yiwxYgV/
         MH4hrcA0Rt3UJ5qxMpTMugSv7YwS0IYKF1TOZCnW8tH+vyDvcbjsRkN3GpRLqnsUSra7
         fwiDNVCge/zH9+NLSVybpuIOQc/4rZ6EwOetN8v9wqz3KL2UskanHQdUw6cdPPg5DjlY
         noJ1e44kLW3v08Nx9fR4J1i0HnzYCVs4TatETNBv1pGb6+LmQV4WPTm6BaGoqxZngrnN
         IHgUm7gz21FAXjfeLhnEMM+QtSXhpsv5A/iv1bW7kcGFEx2xMngmrxTJKm7wUShNf7bV
         RMaA==
X-Forwarded-Encrypted: i=1; AJvYcCVzm9eSjpIg15PHn1mmdL8sOhL9i5KRMLGpe47GOz2K/ffrdDBqj1ofLG8tUVH7GZt1Jqw1GebKzAaf7MuHqEXnkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrZaUEPtk9nmXyyUiVmwVDBYO2fQgyLhB1y//a458eIKL3GdCo
	P70WJ7nC9CxR+m+hH/cgCMk511u3PjY4HyVI3DioRWkXF+f8tdrYAtTI79O465hfObrfLfaEY+8
	qCFJePTnfknaG0tCpkgRwmQvfg0jj1O5TgFhkI6+x
X-Gm-Gg: ASbGnctQWzezkUdWQehcRyPeyRKeindEDL67IDOwVWfcFc5eydxSr6YLsX5nbqSuq9h
	K0LbGxa4mvUooUnR2IsjxQ0L88bLL16LuyTJOyowHGaeU+NNC/fa+oUmmZVQGr/6veqUYrh6N9h
	OgmHPvPi2/p9plV9DY6nZC/Nh9H5vCAm5UB9dmQzLfEZ6h2qY1nJKsaw6KHefeV5zhEOFHHL9DV
	mxcfGKfVSJEGB+H4M+3y34/JsM92Z7nRLln9eliugR0FG/r8i3QDd5pR3bN425jeV6QefZy7/GU
X-Google-Smtp-Source: AGHT+IH/gaVhehz3sRp9VrrzaU79D/o/NZJP8CN7/dl/fC68uxDpeqnl6j3qA8EnLxqoVUctH31vKw6FBzQox/YYs6w=
X-Received: by 2002:a17:903:2408:b0:28e:7fce:667e with SMTP id
 d9443c01a7336-2902723f51emr324260245ad.17.1760406045183; Mon, 13 Oct 2025
 18:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010201607.1190967-1-royluo@google.com> <20251010201607.1190967-2-royluo@google.com>
 <066a9598-ad30-4327-be68-87299bba6fda@kernel.org>
In-Reply-To: <066a9598-ad30-4327-be68-87299bba6fda@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Mon, 13 Oct 2025 18:40:08 -0700
X-Gm-Features: AS18NWCf063mHzWv1lf5a6FraaWgtqWiANzRpv6KaU2cy8h_cSvnS3pGamEVoLc
Message-ID: <CA+zupgwc7b51pNRLWRy2CX=n4=FTm=AP7J0dRP2RLjyK5LxGtw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
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

On Fri, Oct 10, 2025 at 5:09=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 10/10/2025 22:16, Roy Luo wrote:
> > Document the device tree bindings for the DWC3 USB controller found in
> > Google Tensor SoCs, starting with the G5 generation.
> >
> > The Tensor G5 silicon represents a complete architectural departure fro=
m
> > previous generations (like gs101), including entirely new clock/reset
> > schemes, top-level wrapper and register interface. Consequently,
> > existing Samsung/Exynos DWC3 USB bindings are incompatible, necessitati=
ng
> > this new device tree binding.
> >
> > The USB controller on Tensor G5 is based on Synopsys DWC3 IP and featur=
es
> > Dual-Role Device single port with hibernation support.
>
> You still mix, completely unnecessarily, subsystems. For Greg this is
> actually even undesired, but regardless don't do this for any cases
> because it just makes everything slower or more difficult to apply.
>
> Really, think how maintainers should deal with your patches.
>

Understood, I will separate the patches into two distinct series: one for
the controller and one for the PHY.
Appreciate the feedback and the explanation.

> >
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  .../bindings/usb/google,gs5-dwc3.yaml         | 141 ++++++++++++++++++
> >  1 file changed, 141 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/google,gs5-dw=
c3.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml=
 b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> > new file mode 100644
> > index 000000000000..6fadea7f41e8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> > @@ -0,0 +1,141 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright (c) 2025, Google LLC
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/google,gs5-dwc3.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google Tensor Series (G5+) DWC3 USB SoC Controller
> > +
> > +maintainers:
> > +  - Roy Luo <royluo@google.com>
> > +
> > +description:
> > +  Describes the DWC3 USB controller block implemented on Google Tensor=
 SoCs,
> > +  starting with the G5 generation. Based on Synopsys DWC3 IP, the cont=
roller
> > +  features Dual-Role Device single port with hibernation add-on.
> > +
> > +properties:
> > +  compatible:
> > +    const: google,gs5-dwc3
> > +
> > +  reg:
> > +    items:
> > +      - description: Core DWC3 IP registers.
> > +      - description: USB host controller configuration registers.
> > +      - description: USB custom interrrupts control registers.
> > +
> > +  reg-names:
> > +    items:
> > +      - const: dwc3_core
> > +      - const: host_cfg
> > +      - const: usbint_cfg
> > +
> > +  interrupts:
> > +    items:
> > +      - description: Core DWC3 interrupt.
> > +      - description: High speed power management event for remote wake=
up from hibernation.
> > +      - description: Super speed power management event for remote wak=
eup from hibernation.
>
> Wrap at 80 (see coding style) or just shorten these.

Ack, will fix it in the next patch.

>
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: dwc_usb3
>
> So just "core"?

I'd prefer to stick to "dwc_usb3" as that's
1. more expressive by referring to the underlying IP name,
2. consistent with established dwc3 bindings such as
    Documentation/devicetree/bindings/usb/snps,dwc3.yaml,
    Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml,
unless you have a strong preference for the alternative naming.

>
> > +      - const: hs_pme
> > +      - const: ss_pme
> > +
> > +  clocks:
> > +    items:
> > +      - description: Non-sticky module clock.
> > +      - description: Sticky module clock.
> > +      - description: USB2 PHY APB clock.
>
> This looks wrong. This is not the USB2 phy, so how can it consume APB clo=
ck?

That's a fair point, I'll look into the necessity and placement of this spe=
cific
clk/reset and get back.

Thanks,
Roy Luo

>
> > +
> > +  clock-names:
> > +    items:
> > +      - const: non_sticky
> > +      - const: sticky
> > +      - const: u2phy_apb
> > +
> > +  resets:
> > +    items:
> > +      - description: Non-sticky module reset.
> > +      - description: Sticky module reset.
> > +      - description: USB2 PHY APB reset.
>
> This as well.
>
> > +      - description: DRD bus reset.
> > +      - description: Top-level reset.
> > +
> > +  reset-names:
> > +    items:
> > +      - const: non_sticky
> > +      - const: sticky
> > +      - const: u2phy_apb
> > +      - const: drd_bus
> > +      - const: top
>
>
> Best regards,
> Krzysztof

Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E43429B766
	for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Oct 2025 17:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760548432; cv=none; b=nJmML06esKINnFIp4RehgdBILdwnuHjr5ilKhF5nCnnQQA0YYZBu6phA9pHS3DiFOHXmA1O+LA0H2JzyPrKHl7qK2kcuJJPkvR5367Lc7MumvqP3atQk/VTgtRBSKFHRWPYyC3AfTrUIGxa/ENNpZXBStcCDvQHihT0P6g8Lgmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760548432; c=relaxed/simple;
	bh=RuwwVGH6iji/5MFR99uLIc4nUmvenw/jgigS717qaCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nmZFSKoXwo71Xpa4CfrvmUlYUKPwgSA4x2B9sxesVaQrSFXDDWvmgoqcAlXq6mjplWawGEQck3eFVDifEzJtZHL2SFRGwoS1brRmqCl8Vi051TloN6smKAnxKNKSKQoKYCNE3P+YmXqbfEJfqbkBfZonGZm8Zptlk1DCfvtkwQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XBN4M+l9; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XBN4M+l9"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b67684e2904so4160927a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Oct 2025 10:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760548430; x=1761153230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTmCve7ow8KUe86m2S+D+TMV8DrrT745aVc8Mr0EBG4=;
        b=XBN4M+l9zAHG5a/Ihj79peQVyAZSRsuzWwMdF2tmdlwAACQpCikspfoW073uKLG71M
         kN0z6haR7u4k1oPAA/R92FS5PZM3qK6zfwBE1qMsOfSfgnn1MT1ZQudaAy8mz6sIsfBM
         xHrM1vmCgLhK1gOLGO0b0uR7RMWXC2UeEheIIn5OPsE3Sq/a6mfmHybUx1xixkGw5KjL
         iKvYGAh63fFkd0DKpimr8IBVQfTtnjgvQkXwUri3GHa4yg3kvLUl/qYqD3qQTwKJ639I
         gc1zlr3qUJCxK2GNweXYO7P6P7A3AEwVgdTeiot8ny9Ltp3+FX2ktL6YD10VMYOFWQf5
         E2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760548430; x=1761153230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTmCve7ow8KUe86m2S+D+TMV8DrrT745aVc8Mr0EBG4=;
        b=RLnNOLJcTWz+OzQQQ8xKlY+Vhc6mA51Ypx9L9lUicDyq8zu2ZUYcicFAQH7oYVs/uv
         pQnv3t0xZL2zAvhRpIzNAcpRKNRbhTMSCCJlzGh9eXzsg8UG4OJpnLWeDs4/N1CR7Csl
         y57xhfSGXHEiZ323PAZKrzvJGLKM2vNNutYahreltpsDQPE7uhzx+dg1lEWgfFhvplRj
         gcGUbBrWsHOQIZadF1LrewvwjhpqUseMSSnLgndevxMZmOVXBLfQ1/Gn2ua8PdCvoA/f
         nM/0DlAs9sNMUMUQ7g3GFqRN+XePPRhiJO6W05wCG/USdMXief/cKAtoYHrSg5fR6Qwj
         WD9w==
X-Forwarded-Encrypted: i=1; AJvYcCVyfFZQYMMkpUh6tE5UVwHOuZgPaE70rjZl6iLb5di/OSoZXtmeFs8TDAjQ2PJd+CNn7AfvZzeqkpW0lEONTdIujA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYm5Gd9sPl5swfuBMrqxAlpasqDml58gfG5evyKkPTCUqHZZK2
	yvxYmk6dj8H3Y7ChznHYqQVBvyuGYtwbltpZwEnWDLngoWkIRlfc3cD7LK1s9VbQnrmXAe8B3tE
	+RtTnEEv2p8pI8mng0grSpF8vleFqgYNdV3qUxNjr
X-Gm-Gg: ASbGncuMUrTAejXgqcWarz/VS8I9P9NrHwSe8TfLCjRzfT0ewmFly3HCV9LWuJQpyIA
	td8BRSY0fHTeHDnTYjMEvPNBrqnQmoFov7ffetmIUN1tvNEdigqtHrDFsU5jSKjDt+dUExi1ubo
	431Wz/ZinCiYcdx/4lcvrZLYxeeEPEviz7ebuhr8lbBjnQ/cUbe4pGdr5uy3yERbaRLwX9sOeUJ
	Hb2PAxpxRNkj5bFcylTa+k08aQQSCyoAa319j60QhmMFfDUbKK6xP3GDcv0ShRC4ZALlvsoqG33
X-Google-Smtp-Source: AGHT+IG7xm/DEDbS/nNDrpe7ReteweNLIKFfyokAzWV7zMp350kRJ3eICS85Rhzn8PDxA9SglM5C/lh1HX9E/pJg4Bg=
X-Received: by 2002:a17:902:f650:b0:276:305b:14a7 with SMTP id
 d9443c01a7336-290273ef0ebmr363338475ad.33.1760548429863; Wed, 15 Oct 2025
 10:13:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010201607.1190967-1-royluo@google.com> <20251010201607.1190967-2-royluo@google.com>
 <066a9598-ad30-4327-be68-87299bba6fda@kernel.org> <CA+zupgwc7b51pNRLWRy2CX=n4=FTm=AP7J0dRP2RLjyK5LxGtw@mail.gmail.com>
 <b7b3de64-c656-4a84-8ba4-2d5c7eda9783@kernel.org> <CA+zupgzo9zRO2GHR2Np0Tm4M5_h8y0GF2JGGqE_S0BxSR_ZbqQ@mail.gmail.com>
 <20251015-backlash-overtime-4c636f12b165@spud>
In-Reply-To: <20251015-backlash-overtime-4c636f12b165@spud>
From: Roy Luo <royluo@google.com>
Date: Wed, 15 Oct 2025 10:13:13 -0700
X-Gm-Features: AS18NWCEm2YS-Sip7tv4iMJuDS6bNEhHmOhmHYieVj8y_mcbM2tH_CjtqCUTPM4
Message-ID: <CA+zupgyKsnp5D9kW-AeoAsweODXx4BXLr7fVnB+J9tzYRbM_fg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
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

On Wed, Oct 15, 2025 at 1:59=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Oct 14, 2025 at 05:50:17PM -0700, Roy Luo wrote:
> > On Tue, Oct 14, 2025 at 1:22=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> > >
> > > On 14/10/2025 03:40, Roy Luo wrote:
> > > > On Fri, Oct 10, 2025 at 5:09=E2=80=AFPM Krzysztof Kozlowski <krzk@k=
ernel.org> wrote:
> > > >>
> > > >> On 10/10/2025 22:16, Roy Luo wrote:
> > > >>> Document the device tree bindings for the DWC3 USB controller fou=
nd in
> > > >>> Google Tensor SoCs, starting with the G5 generation.
> > > >>>
> > > >>> The Tensor G5 silicon represents a complete architectural departu=
re from
> > > >>> previous generations (like gs101), including entirely new clock/r=
eset
> > > >>> schemes, top-level wrapper and register interface. Consequently,
> > > >>> existing Samsung/Exynos DWC3 USB bindings are incompatible, neces=
sitating
> > > >>> this new device tree binding.
> > > >>>
> > > >>> The USB controller on Tensor G5 is based on Synopsys DWC3 IP and =
features
> > > >>> Dual-Role Device single port with hibernation support.
> > > >>
> > > >> You still mix, completely unnecessarily, subsystems. For Greg this=
 is
> > > >> actually even undesired, but regardless don't do this for any case=
s
> > > >> because it just makes everything slower or more difficult to apply=
.
> > > >>
> > > >> Really, think how maintainers should deal with your patches.
> > > >>
> > > >
> > > > Understood, I will separate the patches into two distinct series: o=
ne for
> > > > the controller and one for the PHY.
> > > > Appreciate the feedback and the explanation.
> > > >
> > > >>>
> > > >>> Signed-off-by: Roy Luo <royluo@google.com>
> > > >>> ---
> > > >>>  .../bindings/usb/google,gs5-dwc3.yaml         | 141 ++++++++++++=
++++++
> > > >>>  1 file changed, 141 insertions(+)
> > > >>>  create mode 100644 Documentation/devicetree/bindings/usb/google,=
gs5-dwc3.yaml
> > > >>>
> > > >>> diff --git a/Documentation/devicetree/bindings/usb/google,gs5-dwc=
3.yaml b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> > > >>> new file mode 100644
> > > >>> index 000000000000..6fadea7f41e8
> > > >>> --- /dev/null
> > > >>> +++ b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> > > >>> @@ -0,0 +1,141 @@
> > > >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > >>> +# Copyright (c) 2025, Google LLC
> > > >>> +%YAML 1.2
> > > >>> +---
> > > >>> +$id: http://devicetree.org/schemas/usb/google,gs5-dwc3.yaml#
> > > >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > >>> +
> > > >>> +title: Google Tensor Series (G5+) DWC3 USB SoC Controller
> > > >>> +
> > > >>> +maintainers:
> > > >>> +  - Roy Luo <royluo@google.com>
> > > >>> +
> > > >>> +description:
> > > >>> +  Describes the DWC3 USB controller block implemented on Google =
Tensor SoCs,
> > > >>> +  starting with the G5 generation. Based on Synopsys DWC3 IP, th=
e controller
> > > >>> +  features Dual-Role Device single port with hibernation add-on.
> > > >>> +
> > > >>> +properties:
> > > >>> +  compatible:
> > > >>> +    const: google,gs5-dwc3
> > > >>> +
> > > >>> +  reg:
> > > >>> +    items:
> > > >>> +      - description: Core DWC3 IP registers.
> > > >>> +      - description: USB host controller configuration registers=
.
> > > >>> +      - description: USB custom interrrupts control registers.
> > > >>> +
> > > >>> +  reg-names:
> > > >>> +    items:
> > > >>> +      - const: dwc3_core
> > > >>> +      - const: host_cfg
> > > >>> +      - const: usbint_cfg
> > > >>> +
> > > >>> +  interrupts:
> > > >>> +    items:
> > > >>> +      - description: Core DWC3 interrupt.
> > > >>> +      - description: High speed power management event for remot=
e wakeup from hibernation.
> > > >>> +      - description: Super speed power management event for remo=
te wakeup from hibernation.
> > > >>
> > > >> Wrap at 80 (see coding style) or just shorten these.
> > > >
> > > > Ack, will fix it in the next patch.
> > > >
> > > >>
> > > >>> +
> > > >>> +  interrupt-names:
> > > >>> +    items:
> > > >>> +      - const: dwc_usb3
> > > >>
> > > >> So just "core"?
> > > >
> > > > I'd prefer to stick to "dwc_usb3" as that's
> > > > 1. more expressive by referring to the underlying IP name,
> > >
> > >
> > > But that's completely redundant name.
> > >
> > > > 2. consistent with established dwc3 bindings such as
> > > >     Documentation/devicetree/bindings/usb/snps,dwc3.yaml,
> > >
> > > If you use only one interrupt. You don't use one interrupt here.
> >
> > After looking into it further, I found that the interrupt name "dwc_usb=
3"
> > must be used here to adhere to the interrupt naming defined in
> > "snps,dwc3.yaml".
>
> Did you just chose to not read what Krzysztof said here? It must be used
> only when that's the sole interrupt, which he stated is not the case for
> your platform.
>
> > This requirement stems from the device's corresponding glue driver
> > utilizing a so-called "flattened" model (see [1] for context). This mod=
el
> > causes the glue driver to probe an underlying "snps,dwc3" device.
> > Consequently, the core DWC3 interrupt defined here is consumed by
> > the driver handling the "snps,dwc3" device, making it mandatory to
> > follow the interrupt naming established in "snps,dwc3.yaml".
>
> I look at the binding and noticed that interrupt-names isn't even a
> required property by snps,dwc3.yaml, and this comment about driver
> behaviour likely isn't accurate given that the code in for host mode
> (and the others are identical) is written so that it will grab the first
> interrupt if the specific names it looks for are absent:
> | static int dwc3_host_get_irq(struct dwc3 *dwc)
> | {
> |       struct platform_device  *dwc3_pdev =3D to_platform_device(dwc->de=
v);
> |       int irq;
> |
> |       irq =3D platform_get_irq_byname_optional(dwc3_pdev, "host");
> |       if (irq > 0) {
> |               dwc3_host_fill_xhci_irq_res(dwc, irq, "host");
> |               goto out;
> |       }
> |
> |       if (irq =3D=3D -EPROBE_DEFER)
> |               goto out;
> |
> |       irq =3D platform_get_irq_byname_optional(dwc3_pdev, "dwc_usb3");
> |       if (irq > 0) {
> |               dwc3_host_fill_xhci_irq_res(dwc, irq, "dwc_usb3");
> |               goto out;
> |       }
> |
> |       if (irq =3D=3D -EPROBE_DEFER)
> |               goto out;
> |
> |       irq =3D platform_get_irq(dwc3_pdev, 0);
> |       if (irq > 0)
> |               dwc3_host_fill_xhci_irq_res(dwc, irq, NULL);
> |
> | out:
> |       return irq;
> | }
>
> Since it grabs the first interrupt, as a fallback, in order to support
> not having the interrupt-names property, the name of the first interrupt
> ultimately doesn't matter at all to this driver (and likely any other
> driver written in compliance with the bindings for the dwc3 core).
>
> I'm not here to argue about what the name for the single interrupt
> should be (keeping consistency with other devices might actually be
> good), but ignoring what a maintainer says and the seemingly providing
> an incorrect analysis is annoying. Did you perform the analysis on this
> yourself, or did it perhaps come from Gemini?
>
> Thanks,
> Conor.

Hi Conor,

My apologies for the incorrect analysis. I misinterpreted the code,
which was a big mistake. I can assure you that I do value your
feedback and take every comment seriously.
Thanks for pointing out the error and raising your concern.
This won't happen again.

Thanks,
Roy Luo

>
> > Essentially, the interrupts defined here are a mix of vendor specific
> > implementation (like "hs_pme", "ss_pme") and the DWC3 core in
> > "snps,dwc3.yaml" ("dwc_usb3").
> >
> > I don't know if there's a better way to express this implicit dependenc=
y
> > of the core DWC3 interrupt except for documenting it in the binding
> > description. Any advice would be welcome.
> >
> > [1] https://lore.kernel.org/all/20250414-dwc3-refactor-v7-0-f015b358722=
d@oss.qualcomm.com/
> >
> > Thanks,
> > Roy Luo
> >
> > >
> > > >     Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml,
> > > > unless you have a strong preference for the alternative naming.
> > >
> > > Such namings are discouraged, because they tell absolutely nothing.
> > > Also, schematics or datasheets usually do not use them, either.
> > >
> > >
> > > Best regards,
> > > Krzysztof

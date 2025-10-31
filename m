Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B9417A2F0
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 23:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761954356; cv=none; b=AL8CM2Tw1Thobcel95QTC6pk5n94Qcu9AdjSryssw3ivcjw0JZRgb5l1rJewe+Nct2xCkcqNASZEmv1FxeOcCeMl6UyzBtLXA7oOJk7SlXhX7jRUy84JlvH4K7J9VFkjDDGD4gRW8+w4w2UrVGCN9TH1npfh9AaJib5Xt5y/M28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761954356; c=relaxed/simple;
	bh=LfBu4uLxRbeleeRHsvF5DjXOwBmxpyTMCk/7ScFYLvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YMsVynPPeuu1fZWiGPL9L5ms7A3CgI23+LNhv6q2kA63vt5wrdUemijNC+ZKoJVB67b3nNji94jI5fIUm+DCq5P4mNyZoEQirS0dC/SbWs+mi1WZ7KcPnfkhb1Ujy2JT3YLNvCIrWWCq2gV9hR3HZkSvpUXNKzDRMW8/1XWnVCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3TS22OsL; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3TS22OsL"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7a28c7e3577so2864093b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 16:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761954354; x=1762559154; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfR9l6DRduOmqk2saCjRPV+UB+Qm0nERAOdlSE0n2ok=;
        b=3TS22OsLcBoFGxZGEvkx25lpBPlMGE+h7Pd8+q9D5ukA765dziC158BCDdqVSBEZ+P
         QQFRTp0yjJp0IllgymhIwoeJQZFJ1EgzvJTyrDERqNWyMn8APHb5aicjQGNnGXhGc3Yg
         JNd6cdlCRdMtVEF72jfe/sRIEbyUS08yMt5n5C5g8NIfYAvh3rCgXJC1g83IY1G49+0I
         iRzfdeoF3B8NFiMK/NlSHwZebLF/NUcRuaIk3qpkIBalnvcJPPvDcM1MVSanWVi3eqXM
         1I/MmrgIfKOqkhqVxMIFur5pqPTRlQb/ATYqNTyaRAZWvAZfLA7ZsfEPm5odyPIGRGaY
         mAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761954354; x=1762559154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SfR9l6DRduOmqk2saCjRPV+UB+Qm0nERAOdlSE0n2ok=;
        b=mNdScySyrKaOD8p3V9IOFh1tfiXiCsNHldHwDAEH0gUuG6OJRfrskknOWY4yRhNHgM
         d2cc3Z70rZVDSW0E+OJPIrlD4pxw0wFcITHo3h5gra/MH1OsdrBNGoPHRMrlQdIrv+8x
         Z/P4SqmASAReVZd7pSnxV3FHSK2uKtnR8+5sE000GG5RtuSCD8racb9xvv+0cqKEAWmM
         Fsfz33xdyY3LazttX/xGg0GLVPot5cp/CkBnZXUMaClZCcISAFLZ+bBhSik3q3oxWf/r
         ajWqXYleDL5Ys+43AUsHqelN/VLG838bDw2rt1LhFS05bP9D8Yll65IJDR6xszFGisBh
         Ih6g==
X-Forwarded-Encrypted: i=1; AJvYcCX3zx6iWTyvhMIu/vBqBeduVwVmE6FRppzv5p2ApvH3Nv7IDC6w2IHiZJTUVZfri/xuYu7mFe/159F+FPIlJmJuDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpZ2TXPbmcoD8gl0URZxD7Es7YBOAZDylHiRE5KLbNZ6EZrcEy
	13WsKGEwhdc2rffiHsyrKFbs0Ze6XQAKwx+WRDg1jwKhPmkNSYWrkJ/pDncp9BwlZV8kHGNmqI5
	cA6dvID37WoVEM8VE72hNwR1CqBEseUMVp9IR2eYE
X-Gm-Gg: ASbGnctwb/Ot81LV4GJsIBl18hjllLCR5Vy/J9DodeOZS60k9q4QtNdEu251dyZ+Ccq
	RfEBWppmyxs40ctvtUBO4yNCzoTISaXi2/7cN+v5WGRzGlIeccQC8yhf6v6/9MEFX91sBLVotsJ
	eSe78y1SS6fbrTNZQK92GMLtujXCfunEUNzCUL47awcaOJPunGA4/1JB1fNiSYrQfsRpVQAMIPT
	N/hKzjtQpxfzPOv5iPhDEvCszpTutSvWsp3MdqKA9FP4oHWXWTx1B3pcR9l2MaFCGwd4EXb118Q
	/wO7yjtHWZiZUkB4
X-Google-Smtp-Source: AGHT+IFPdvFe/pMPUJplv+X0Jq5mOmKEcydS82p+NTasUHTcfiqahbrVRLGJQ3FKbcWUmKbkOdLRKW3c4LwYcpzwoXQ=
X-Received: by 2002:a17:902:d2cd:b0:290:b92d:907 with SMTP id
 d9443c01a7336-2951a511475mr66921545ad.53.1761954353589; Fri, 31 Oct 2025
 16:45:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029214032.3175261-1-royluo@google.com> <20251029214032.3175261-2-royluo@google.com>
 <20251030-cunning-copper-jellyfish-1b5f3b@kuoka>
In-Reply-To: <20251030-cunning-copper-jellyfish-1b5f3b@kuoka>
From: Roy Luo <royluo@google.com>
Date: Fri, 31 Oct 2025 16:45:15 -0700
X-Gm-Features: AWmQ_bmO0vWs_gLnS0Ww23izAMQNvvQgDrOF0xipRHiQf9rQ8XlagmQ9EzJ_9xY
Message-ID: <CA+zupgxV7SH8Jmghg7HUkWi63dN3m6KLQNBbf+BOQPFbRsiKiw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Doug Anderson <dianders@google.com>, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 12:37=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Wed, Oct 29, 2025 at 09:40:31PM +0000, Roy Luo wrote:
> > Document the device tree bindings for the USB PHY interfaces integrated
> > with the DWC3 controller on Google Tensor SoCs, starting with G5
> > generation. The USB PHY on Tensor G5 includes two integrated Synopsys
> > PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort combo PHY IP.
> >
> > Due to a complete architectural overhaul in the Google Tensor G5, the
> > existing Samsung/Exynos USB PHY binding for older generations of Google
> > silicons such as gs101 are no longer compatible, necessitating this new
> > device tree binding.
> >
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  .../bindings/phy/google,gs5-usb-phy.yaml      | 127 ++++++++++++++++++
> >  1 file changed, 127 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/google,gs5-us=
b-phy.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.y=
aml b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> > new file mode 100644
> > index 000000000000..8a590036fbac
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> > @@ -0,0 +1,127 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (C) 2025, Google LLC
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/google,gs5-usb-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google Tensor Series (G5+) USB PHY
> > +
> > +maintainers:
> > +  - Roy Luo <royluo@google.com>
> > +
> > +description: |
> > +  Describes the USB PHY interfaces integrated with the DWC3 USB contro=
ller on
> > +  Google Tensor SoCs, starting with the G5 generation.
> > +  Two specific PHY IPs from Synopsys are integrated, including eUSB 2.=
0 PHY IP
> > +  and USB 3.2/DisplayPort combo PHY IP.
> > +
> > +properties:
> > +  compatible:
> > +    const: google,gs5-usb-phy
> > +
> > +  reg:
> > +    items:
> > +      - description: USB3.2/DisplayPort combo PHY core registers.
> > +      - description: USB3.2/DisplayPort combo PHY Type-C Assist regist=
ers.
> > +      - description: USB2 PHY configuration registers.
> > +      - description: USB3.2/DisplayPort combo PHY top-level registers.
> > +
> > +  reg-names:
> > +    items:
> > +      - const: usb3_core
> > +      - const: usb3_tca
> > +      - const: usb2_cfg
> > +      - const: usb3_top
>
> These prefixes are redundant. Also, you are still referencing here
> completely different devices. MMIO of IP blocks do not have size of 0xc
> and they do not span over other blocks (0x0c410000 and then next one is
> 0x0c637000).

I'd like to explain why MMIO of IP blocks looks discontinuous.
As outlined in the description, this device contains two SNPS PHY IPs
including eUSB2 PHY and USB3.2/DP combo PHY, and is integrated
with the SNPS DWC3 USB controller. A top-level subsystem wrapper
sits above the PHYs and controller. This wrapper integrates these IPs
and is where the Tensor-specific implementation resides. It's essential
to touch these wrapper registers to control the underlying SNSP IPs.
Unfortunately, the top-level wrapper's MMIO space lacks a clear
boundary between these IPs. Specifically, the registers required to
configure a particular IP are not always adjacent to that IP, and in
some cases, multiple IPs may even share the same address space.

The following is the register layout overview:
- 0xc400000: Dedicated address space for DWC3 controller IP.
- 0xc410000: Dedicated address space for USB3.2/DP combo PHY IP.
- 0cc440000: Dedicated address space for the eUSB2 PHY IP.
                      While this is not in use, it should perhaps be
called out in
                      the binding for completeness.
- 0xc450000: This address range contains top-level wrapper registers
                      and its space is shared by two devices: the DWC3
                      controller and the eUSB2 PHY.
                      It includes control registers for the DWC3 controller
                      (e.g. hibernation control and interrupt registers) an=
d
                      the eUSB2 PHY (e.g. registers for USB2 PHY
                      frequency configuration).
                      Because the space is shared, the MMIO range for the
                      PHY becomes fragmented and is only allocated a size
                      of 0xc, as the remaining registers in this range are
                      assigned to the DWC3 controller.
- 0xc460000: This address range contains registers for other blocks
                      within the same top-level wrapper (such as PCIe PHY
                      and DP controller) which are not relevant to USB.
- 0xc637000: Another region of top-level wrapper registers.
                      This area is relevant to both the eUSB2 PHY IP
                      (e.g. control register for vbus valid) and USB3.2/DP
                      combo PHY (e.g. registers relevant to PHY firmware).

Thanks for taking the time to go through this wall of text.
This is definitely not an ideal register layout, but I'm open
to any suggestions on how best to address this fragmentation.
If discontinuous MMIO space is a concern, does it make sense to
make the wrapper registers a syscon node so that it can be
shared by multiple devices?

>
>
> > +            reg =3D <0 0x0c410000 0 0x20000>,
> > +                  <0 0x0c430000 0 0x1000>,
> > +                  <0 0x0c450014 0 0xc>,
> > +                  <0 0x0c637000 0 0xa0>;
> > +
> > +  "#phy-cells":
> > +    description: |
> > +      The phandle's argument in the PHY specifier selects one of the t=
hree
> > +      following PHY interfaces.
> > +      - 0 for USB high-speed.
> > +      - 1 for USB super-speed.
> > +      - 2 for DisplayPort.
> > +    const: 1
> > +
> > +  clocks:
> > +    minItems: 2
> > +    items:
> > +      - description: USB2 PHY clock.
> > +      - description: USB2 PHY APB clock.
> > +      - description: USB3.2/DisplayPort combo PHY clock.
> > +      - description: USB3.2/DisplayPort combo PHY firmware clock.
> > +    description:
> > +      USB3 clocks are optional if the device is intended for USB2-only
> > +      operation.
>
> No, they are not. SoCs are not made that internal wires are being
> disconnected when you solder it to a different board.
>
> I stopped reviewing here.
>
> You are making unusual, unexpected big changes after v4. At v4 you
> received only few nits because the review process was about to finish.
>
> Now you rewrite everything so you ask me to re-review from scratch.

Apologies for the trouble, my intent was to address your feedback on v4
by describing the USB3/DP PHY block for completeness.
Like mentioned earlier, this device contains two underlying IPs: eUSB2
PHY and USB3.2/DP combo PHY. The device can operate in USB2-only
mode by initializing just the eUSB2 block without touching the USB3
PHY block - but not the other way around. The v4 patch reflected this
USB2-only configuration.
I tried to support the USB 2.0-only configuration in the binding by
making the USB 3.0 clocks and resets optional. However, if I
understand your comment correctly, the binding should describe
FULL hardware capability. I will make USB3 resources mandatory
in the next version, please let me know if I've misunderstood it.

>
> > +
> > +  clock-names:
> > +    minItems: 2
> > +    items:
> > +      - const: usb2
> > +      - const: usb2_apb
> > +      - const: usb3
> > +      - const: usb3_fw
>
> Again, what's with the prefixes? apb is bus clock, so how you could have
> bus clock for usb2 and usb3? This means you have two busses, so two
> devices.

The prefixes are to differentiate the clocks and resets for the
underlying two SNPS IP as outlined in the device description.
- eUSB2 PHY IP needs clocks and resets for the phy itself
  and its apb bus.
- USB3.2/DP combo PHY has its own clocks and resets for
  the phy, plus it needs a clock for its PHY firmware.
Technically these are two separate IPs, but they're deeply
integrated together so that they share top-level wrapper
register space (see the register layout above), and they
have implicit hardware dependency like mentioned earlier
(USB2 PHY can work without USB3 PHY, but not vice-versa),
hence I'm describing them in the same device.

Thanks,
Roy Luo

>
> > +
> > +  resets:
> > +    minItems: 2
> > +    items:
> > +      - description: USB2 PHY reset.
> > +      - description: USB2 PHY APB reset.
> > +      - description: USB3.2/DisplayPort combo PHY reset.
> > +    description:
> > +      USB3 clocks are optional if the device is intended for USB2-only
> > +      operation.
> > +
> > +  reset-names:
> > +    minItems: 2
> > +    items:
> > +      - const: usb2
> > +      - const: usb2_apb
> > +      - const: usb3
>
> And here?
>
> This all looks like downstream code.
>
> Best regards,
> Krzysztof
>

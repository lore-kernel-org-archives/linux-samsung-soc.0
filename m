Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82EB86340
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 22:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761258191; cv=none; b=k7BNjQMX1yPz2SEF529kTotPAL6IAsaGqUgB8cw0UQESDoa5prbCoyInXLkVTEralmpT0l0tAW3Vw98ciDGBgPCfU2vR4oPnC5TV046FIQkUYWz9Istx3GAv6otRUgGMLd5wjPW943/pucWNMhdlWmx2wU6vNmG1TSN9y0scAig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761258191; c=relaxed/simple;
	bh=MVe+v9KcwNtkJuqhP8yhYRz/ezPwcZFtou635fuXLm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KMRvL32dwqZtO3VKvabvncXsasjNyso/wgpt2VwE68JhKOE2AeceAca2cZTvp4kviIo/pHWkoN5t8iGlZPyNp7qf4r6TTEw2iQvSEs7E2Xc0pZ9f75g/oeD2ph1y5qaHWY0qh9Ds9EYiw22Z7nLTc7CJaOkRfpq0RNIJii8DrT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2SbePHD9; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2SbePHD9"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-87de60d0e3eso13358136d6.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2025 15:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761258189; x=1761862989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+oAqH47cRsHD+glZ5Q5KatVvZ4QYYjYdLprWcY98JU=;
        b=2SbePHD9MK4625pBVlDRRqQLLVmlle4EuuSU7pOpOxgnHApbO0fe56Fan10aOPouph
         nt4EdYXjVixN3IxJZeBeR9SRUJJaYNLxj87H4BVM7V3E8qr/pLmfgk8JUAbZJSSvuv/H
         dX7NQIH1kcrFB/+7+kz19/eZ0J3UJDjXdYpHlw26PafS6FQ2yzAWFCfGYTfqvjsAkf0Q
         m4EgnV5Kz4xtJmk44cMuUutEsS/oIboidavTswSjg0kGyjudoLXrjNJeUE56mAXiGp8h
         KxeLtyd/ELzGs0Q9ITCBmFIrEP/x2VOcKUWs5tq3jORpp0uz+gvDp20MCPoMcqvQXF5w
         KGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761258189; x=1761862989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+oAqH47cRsHD+glZ5Q5KatVvZ4QYYjYdLprWcY98JU=;
        b=KOgJEra7fkTh8QVN60JOB28MXMKlImO4T7berDZivgpfwGGb2pqhOEL4FzGLJVFI57
         Er8uwhiH4BGWSufQLM+K2V/0xPWpib8/70ki5y4C+e14wRGN9AOUoDo0KONNICAmuR2U
         x8yN3JvLfaCo3i5qAA4u7zH6ZSqLwGd3McUgRyCpWLW+NsNzVpOTAa8Yb4JVvb8yB12k
         uAd4df4QDjrTWNV29X0Ayhuc4HcaNwrfDhFyqZE4A4C/6CB6y6Trt8vVeQehUSYZbzkx
         SyNaY5o/yPf3ggr8zCXQogAgQ4Covt5AEz58snyFJ97maMELFmPFdiG0lnLY0ng7GCyx
         GTnA==
X-Forwarded-Encrypted: i=1; AJvYcCUtRR03wi6J2Z3+AOuZS+ac+fACki2KSJUcXz+G6FXMpTmM4zDqUJqpXrBuadBj+aMRxynsIhirmspN2kRSt06Ihg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaLUVv6zQJrHERdGi5foRrpZXvecAq9VkFw38gm/UrLtSvst1g
	BsqfPjE1Z5x6OJ4L8mhWgFqh/0+O0Zigm4bzQIXO+sWI8VLQUyb7fvTim59PZsTQRxhgfCg2sAb
	k6cXC/LriOAitonYBF5mbYvBgg45sSi4Z4GBMXD+7
X-Gm-Gg: ASbGncuz2VP/EOxrsG1MKEudKZb83rgr1dsdmST6Fy0lwGdGJCm4xQrydoDeVi8iQE/
	NFo/q6/NnLq6i8V0HlI6VHSNqdTG9UNWgnQ5efBKK29GDc8iCGs3vLMN6q64OlCGM1H8PL4oAnL
	LZuZgYm4sgiUcQivi6oborQAdkFU5WYl/wqBJJNSB1GZJImKdA/9DloGJvP3iH7zeHi40LfoIl/
	/jQiqrJZcTvBuRYlwkVnRnaxEkxOHe03mz7acqJWnCt6X3QgmC0q17KZhbguCF+nzFZfKRdl4nk
	cubmwVMtkbC+hxnV4ZkEX1aQ8A==
X-Google-Smtp-Source: AGHT+IGuCtYibPzQqqrjGNwM0zHaChLdpzHrb0geAS9qmAdlqFhgbwbFHzP5YvFRilqFdVAT8PX1Hff+wlSfn57dinQ=
X-Received: by 2002:ad4:4ea4:0:b0:81c:6455:ec77 with SMTP id
 6a1803df08f44-87f9ee7d0f6mr50574026d6.40.1761258188413; Thu, 23 Oct 2025
 15:23:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017235159.2417576-1-royluo@google.com> <20251017235159.2417576-2-royluo@google.com>
 <20251023-collie-of-impossible-plenty-fc9382@kuoka>
In-Reply-To: <20251023-collie-of-impossible-plenty-fc9382@kuoka>
From: Roy Luo <royluo@google.com>
Date: Thu, 23 Oct 2025 15:22:31 -0700
X-Gm-Features: AWmQ_bmWas4lIuJKQxW2zSsbNKRRFte9quUEFbVLot4b-vV1AO7q94wTEgHcExg
Message-ID: <CA+zupgwQTLEs8_7i-VsGbGV7O2Y3XFA1C3aV7iuv2HLOwKns3w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 11:43=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Fri, Oct 17, 2025 at 11:51:58PM +0000, Roy Luo wrote:
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
> >  .../bindings/phy/google,gs5-usb-phy.yaml      | 104 ++++++++++++++++++
> >  1 file changed, 104 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/google,gs5-us=
b-phy.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.y=
aml b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> > new file mode 100644
> > index 000000000000..c92c20eba1ea
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> > @@ -0,0 +1,104 @@
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
> > +  The hardware can support three PHY interfaces, which are selected us=
ing the
> > +  first phandle argument in the PHY specifier::
>
> Just one ':', anyway this sentence and below does not belong to
> description but to phy-cells. You describe the cells.
>
> Or just mention the header with IDs - here or in phy-cells.
>
> > +    0 - USB high-speed.
> > +    1 - USB super-speed.
> > +    2 - DisplayPort
> > +
> > +properties:
> > +  compatible:
> > +    const: google,gs5-usb-phy
> > +
> > +  reg:
> > +    items:
> > +      - description: USB2 PHY configuration registers.
> > +      - description: USB 3.2/DisplayPort combo PHY top-level registers=
.
> > +
> > +  reg-names:
> > +    items:
> > +      - const: u2phy_cfg
> > +      - const: dp_top
> > +
> > +  "#phy-cells":
> > +    const: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: USB2 PHY clock.
> > +      - description: USB2 PHY APB clock.
> > +
> > +  clock-names:
> > +    items:
> > +      - const: usb2_phy
>
> core
>
> > +      - const: u2phy_apb
>
> apb
>

Just to provide the full context, these two clocks/resets
(usb2_phy and u2phy_apb) are specifically for eUSB2 PHY.
USB3/DP combo PHY has its own clock/reset that hasn't
been added yet, we would have to differentiate them once
USB3 support is added in the future.
I'm fine with the suggested name change, and we can
address the naming again when USB3 is ready for
integration.

Regards,
Roy Luo

> > +
> > +  resets:
> > +    items:
> > +      - description: USB2 PHY reset.
> > +      - description: USB2 PHY APB reset.
> > +
> > +  reset-names:
> > +    items:
> > +      - const: usb2_phy
> > +      - const: u2phy_apb
>
> Same here
>
> > +
> > +  power-domains:
> > +    maxItems: 1
>
> Best regards,
> Krzysztof
>

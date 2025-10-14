Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C974C7262F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Oct 2025 01:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760406439; cv=none; b=QwG8B6hY478OZkHiUY9Ut++rLKE0g8fq7qc2c40BmbCvgycV8ZT7NR8nnaz8rv8emi/SysgUS116cXoWL8pwT1qZXmRg+RD8rOZc0QMCjbmrvCxfKUrq9XC/sJQGd/Af1vW8o1zZkb3hV83M3INuq9Om3o/KwJ+vpoXQqH8f8YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760406439; c=relaxed/simple;
	bh=2CsPuuc7sXtpg4PefmMtwBtWIx1LnKQTXPGwO21uvw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kng+ipIkyzZLC4IP9JW+vCJAUARLFc3OeO7OsKDpJNkvfi1T8j95b1Ge/7vZwHi1vpQZN+g0+J/2PsDY+VRIeEU+VDDIT2JYEwt7cEuwYDIMbzOnvGxOz/KDRQ+xKE4cPo8e2uu2DGiIYhaVjYPjnDUUn1K9ZR804jTw9SXMCKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v4wBxSH8; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v4wBxSH8"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-781997d195aso3401815b3a.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 18:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760406437; x=1761011237; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGjEi7N29NLVZhXUSQ4DWylm+1B6zKlX/oEjJXnY15U=;
        b=v4wBxSH84Dw03LmIFtkvaIgk4SZDxJ1Gx1nKsIuoIvhidmL6h0tT8DUYWuLZnuSJyK
         1plIWRwu3Mqh/xfw8G4evCU4exh4xwR11w4gzAwKz/Eu8Lcv+3fY5KV4oO0wbe2vpYSa
         887wCOn5qDkLoUKfTgojP8DntC38AYQqPtEg9/MNZe5ArwRGc6ugv2H2McuaZ6iTOzOT
         nGzyEEFNZobtQaKvmkPE002nEp5kMJyXvCzD6dmZsSbkHedTKTkq915zPRCHlmEvtrKZ
         kjBF7kwfjW7reyNYGwoNzLUq8R6L1oPdGFE6eRXyxugqal9CR9aKhBIB1MYFwcvLYLe2
         umKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760406437; x=1761011237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGjEi7N29NLVZhXUSQ4DWylm+1B6zKlX/oEjJXnY15U=;
        b=GA2g0GDCLnuSieuHzXz745bX4bjoHCkmSdXWVsIyq+z9m7DKcJedyAe8U46xu1Q5R3
         xc+rCO9NAhj7MQI0I237RaKoSyDx8P/kyTfgXfeA+CmHnBH9RsbSMB5RWvwNyEviM1tH
         aXUQh78EQE5gEvFOqgdeXvKGJ9kyh28TAj2JjFVjWaWhlcwFaBijSLFYi4zR71VX7LYt
         fxqLt0gwoOHrZusiA5maI3MGTptaFSpUYw428OsVJdcoRym2J4TUE+TV5SDYvUNNVhO0
         WR4rT5QWChGFsMLhQEShP0HJTh0lQUJlrUnbRP49mDI1WN8DWnX/7D5+l9YcMBPysMkX
         GAJA==
X-Forwarded-Encrypted: i=1; AJvYcCUmtorj3CkdmL0JUhhiabToii7h0gf2h43EH7hxX59uq8HT6dmRVNin7A+8zPKz2IBJTaYzxCdypjvMbXtRIa2QiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh2S3+nybNFyZe8mNKCCL+EtgpFsIfKXT3blHlpE17du5LIH+9
	vCqXuq+BiPB7Fm7WDA8hi51fPghrn5o41S7G/LQcBYaB9Sj3nMiNLkAbF+aikR4fkQZV/98hSIr
	3Ju8xxeMG0/HtpRZijbDXlZEpd/NenscxA/zxJv/a
X-Gm-Gg: ASbGncs9L3PJ4XE2yoFAvLppH2G0O6rZMvZxbN7X4Cza0V1+u2SllWp9bCIHeTnusZp
	Hp2tV7fiv6NuMR9Kisqlzo/0cXlR4xF8iDroeieLbekygUc24Je92FTSUWsMSVuDYD9qeTZ85Hn
	KWQXqgZcCVYNtjixX8cQiO1qyN+nh7Pj7LpVoQb8deSt0x9hfInhmIp/jcbAYEd3NuKy3RsYe5L
	hN/xJ6zzd/J4gc6cImkpZNzpDvRHmcJbARumVuYX++vAkz3VafGmT6hVjGsZs7ug6yVPZzv0Yyv
X-Google-Smtp-Source: AGHT+IFfPTj8w4BDR5D6JCsus2aD4rztuewWvMbCmVCgUqrOKGYsSJJX4teAZRKcnFjdoRF0OnNBqOS96lWMLzstGuY=
X-Received: by 2002:a17:902:e952:b0:262:4878:9dff with SMTP id
 d9443c01a7336-290273567a8mr277763005ad.12.1760406436203; Mon, 13 Oct 2025
 18:47:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010201607.1190967-1-royluo@google.com> <20251010201607.1190967-4-royluo@google.com>
 <75756635-b374-4441-8526-175210e01163@kernel.org>
In-Reply-To: <75756635-b374-4441-8526-175210e01163@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Mon, 13 Oct 2025 18:46:39 -0700
X-Gm-Features: AS18NWCzy6Gx5qemaFGw2t6jXb-2epsDNHczVHslksbyWgF7Radr-Z781gw06UU
Message-ID: <CA+zupgwHFpP5GEwGxOksmLJBU7+Kr_o0p50Pad1NmwNB0AxcGA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
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

On Fri, Oct 10, 2025 at 5:11=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 10/10/2025 22:16, Roy Luo wrote:
> > +  reg:
> > +    items:
> > +      - description: USB2 PHY configuration registers.
> > +      - description: DisplayPort top-level registers.
> > +      - description: USB top-level configuration registers.
> > +
> > +  reg-names:
> > +    items:
> > +      - const: u2phy_cfg
> > +      - const: dp_top
> > +      - const: usb_top_cfg
> > +
> > +  "#phy-cells":
> > +    const: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  orientation-switch:
> > +    type: boolean
> > +    description:
> > +      Indicates the PHY as a handler of USB Type-C orientation changes
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - "#phy-cells"
> > +  - clocks
> > +  - resets
> > +  - power-domains
> > +  - orientation-switch
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    soc {
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        usb_phy: usb_phy@c410000 {
> > +            compatible =3D "google,gs5-usb-phy";
> > +            reg =3D <0 0x0c450014 0 0xc>,
> > +                  <0 0x0c637000 0 0xa0>,
>
> You probably miss DP support and this does not belong here.

This register space isn't solely for DP operation, a significant portion
manages the custom combo PHY. Consequently, this space is essential
even for USB-only operation. We can expect more registers in the space
to be utilized when DP support is added.

While I acknowledge the current name is confusing, it directly reflects
the hardware documentation. We can either adhere to the hardware
documentation's naming or propose a more descriptive alternative.
What's your preference?

>
> > +                  <0 0x0c45002c 0 0x4>;
>
> That's not a separate address space. I really, really doubt that
> hardware engineers came with address spaces of one word long.

I initially created this space to access the usb2only mode register,
which must be programmed when the controller operates in high-speed
only mode without the USB3 PHY initialized. Upon review, I now
believe the controller driver is the better location for this configuration=
,
as the register logically belongs there and the controller can tell
whether usb3 phy is going to be initialized.

That is, I'm removing this register space in the next patch.

Thanks,
Roy Luo
>
> > +            reg-names =3D "u2phy_cfg", "dp_top", "usb_top_cfg";
> > +            #phy-cells =3D <1>;
> > +            clocks =3D <&hsion_usb2_phy_reset_clk>;
> > +            resets =3D <&hsion_resets_usb2_phy>;
> > +            power-domains =3D <&hsio_n_usb_pd>;
> > +            orientation-switch;
> > +        };
> > +    };
> > +...
>
>
> Best regards,
> Krzysztof

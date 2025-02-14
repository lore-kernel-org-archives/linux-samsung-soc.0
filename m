Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BCA266EF6
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Feb 2025 15:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739547606; cv=none; b=LGJO/wI8Eb7RawoMRiiELp9bdTG6z61BcTGNWdRfuWn8O6bvv5KhfkgS4SnPHFUwjbjeBuvpmwcDJVIbs47DQwqrOZ24la1OqmC0iZmokUsC4ydNdd1pGYhei+NRGEEmeNURFM/HvExRSELX41QjCW4+ObnbvMLeA8SjwLf6Sh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739547606; c=relaxed/simple;
	bh=Ur1csxx5e9sT2v6HE7Bvi1Gidx/ecW+iVa1/b716UdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ah1+e82jBcv4BxP19uh3eH1skqMfYySv1QUuEsAWJlxyXaRhJSoUg31eR/1S/nUV92eAPJa0BWXMbyyrPm5VVVMtDstBhATyiDwsxX180WDVzXcO86Y5eWwCqNgiqwA0YXqmWREb4fo9l0d9faWAKGTjOjPT0Ffgtu3PCof2YE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bLW0E1nM; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bLW0E1nM"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e461015fbd4so1679015276.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Feb 2025 07:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739547603; x=1740152403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDlfNVO3NueDu0Qi3f7HcF0fEdO1uHUOCWWSlLIIhqA=;
        b=bLW0E1nMAvMJv7DVSgBs/pbO0Eo91IPzwo+XP6qFqlKS7sDRfHesMHtHo4w4KRuCAV
         qH3nr8wsBMDTS/Fm7xeL7SgCMz4gAq539W8EIbXJvMaKpJ7eynb+3kx+PLr3QOVVR5Hs
         rNZCQ7wioP9rzyB4OstwAh/ECXNgsosdm8i2VbHrGG2O2ockuQkSL0wf7byDfmgGZax8
         7Pc/vykyOHvOX4qYN3zqZQM6Tj4N967NqD+mvHGSVldkTfG317ksIv8bzJW6DGBaK8dh
         57IG1vYnKGWQ01QtJQPsDuhBqGBvveXO6ObSlLtMr2XsUf9luNHHIVl5EfP+jHIVMJE6
         HAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739547603; x=1740152403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDlfNVO3NueDu0Qi3f7HcF0fEdO1uHUOCWWSlLIIhqA=;
        b=N2J+SCQ089j/Rw37UYghRUvDaarhvygzl4XhYrQGiA3395IJYEbbX5Q6nObZLdsZ6J
         o93GgDveiH7MIxKTeOUhVu5AWWnCxk3Fl1qqCwHbNBL7v+cUK18sP+bcD0HKUNQR7SLn
         HYu00qcMRSf+ERldSu0JST2n5Iw66L5iErGlXVgdVI6xhB/UTeK9MBm+xzWw0E0BVBI3
         hYdAM2fp0HR5+X3VWc4f0Yf3SCnaBDBpD/4iczqy+Gwg82P2GZBr0n4p8moRll9frBuB
         arte5/RPZGXO4AwUBodK+eieqFvgqJbKsrgtfTOB/l1PiEfeR+Oqq6GbJWRqZVnunhBB
         d5YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVifiadh8TJbPFxCHacKoZbmbQRnDexZKxjvPgq7NtYE0GDrn+WPLxOSXjbhAax8LG64LlZUc48WEequhySYtrnMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7F25hDAo+wnyMDoeuEZ/ba4LRZpxKsfV8H1y4m+JwFjsJq3FN
	lQTuFUH2nJ4mAwGVhCWiw3mP+IdloWcNNS0kpcHg0GmS0yA66vuWwlF0eF4VC2eHExrPcNikPUr
	13lp2mtzbphfWd0nHbfS+6WgyAQXUwPrucG+hXQ==
X-Gm-Gg: ASbGncvWALyx8jGtl8TcA2ZuhZ4NxT2GlVjP/gaAFroSyRj82s9Y/gcNKCSqODjo8VP
	si3VrXJcSvFL+hApOwPQJ8sx7qqIKO0NqRzV2l5/KOVJvJiqPqAt7GGrDG7Pc7+8cOkjlPj/jwK
	HuLTV2Y8LVU1MLrV1MAM4yynKonCFT2a4=
X-Google-Smtp-Source: AGHT+IH8EDa+4ekuWWbXXBr/riLIN3JlPX6Dn3pM/FPKZAsai8Udd4H0wlop9vjoHOYPmZSk7PdvYO6YAK4exwTSyGU=
X-Received: by 2002:a05:6902:188e:b0:e58:173e:abcc with SMTP id
 3f1490d57ef6-e5da8102d3fmr8204636276.8.1739547603265; Fri, 14 Feb 2025
 07:40:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250212234034.284-1-wachiturroxd150@gmail.com>
 <20250212234034.284-4-wachiturroxd150@gmail.com> <40370a0e-775b-42e3-bb6c-8cacaa0482cf@linaro.org>
 <Z67f+lDxISVubiJJ@droid-r8s> <2ed6c5d8-b559-4ffc-b08e-412bab1f7917@linaro.org>
In-Reply-To: <2ed6c5d8-b559-4ffc-b08e-412bab1f7917@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 14 Feb 2025 09:39:52 -0600
X-Gm-Features: AWEUYZlElBm9hQ_fT18iHek-VpX4yHKDlxdz_rBItX0Tc5O4FlTpOcx5z1N4lMA
Message-ID: <CAPLW+4mbJoLHJ7TDcn9z8-WOEAFSiH7wBMt4Rk3fsw0h1wSSMA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] arm64: dts: exynos990: define all PERIC USI nodes
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>, alim.akhtar@samsung.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-serial@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 12:49=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linar=
o.org> wrote:
>
>
>
> On 2/14/25 6:17 AM, Denzeel Oliva wrote:
> > On Thu, Feb 13, 2025 at 07:38:35AM +0000, Tudor Ambarus wrote:
>
> >> node properties shall be specified in a specific order. Follow similar
> >> nodes that are already accepted, gs101 is one.
> >
> > Not all Exynos SoCs will follow the same order
>
> you an fix them then. Please follow
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-o=
f-properties-in-device-node
>
> >
> >> <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_4>;
> >
> > Is
> >
> > GATE(CLK_GOUT_PERIC0_TOP0_IPCLK_4, "gout_peric0_top0_ipclk_4",
> >      "dout_peric0_uart_dbg",
> >      CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_4,
> >      21, 0, 0), [Mainline CLK]
>
> I don't get this reasoning, sorry.
> >
> > You can find it in the cmucal-node.c driver downstream of the kernel. [=
0]
> >
> >>> +                   };
> >>> +           };
> >>> +
> >>> +           usi0: usi@105500c0 {
>
> cut
>
> >>> +                   serial_2: serial@10550000 {
> >>
> >> why not serial_0 since you're in USI0.
> >
> > Because it is simply displayed in the exynos9830-usi.dtsi [1]
>
> I don't think it matters what downstream specifies for labels. Use what
> common sense says.
>

Yeah, in upstream we don't care about downstream at all. Downstream
code is very often is quite low-quality and doesn't follow mainline
kernel conventions and best practices. Mentioning the downstream code
as an answer to questions like "why it was done this way?" would often
trigger people. In this case I think it should be consecutive
ordering, if there are no very good explanation why it shouldn't be
so. Then aliases can be used in the board dts if you need to keep a
fixed order in the system.

> >
> >>> +           };
> >>> +
> >>> +           usi_i2c_0: usi@105600c0 {
> >>> +                   compatible =3D "samsung,exynos990-usi", "samsung,=
exynos850-usi";
> >>> +                   reg =3D <0x105600c0 0x20>;
> >>> +                   samsung,sysreg =3D <&sysreg_peric0 0x1008>;
> >>> +                   samsung,mode =3D <USI_V2_I2C>;
> >>> +                   #address-cells =3D <1>;
> >>> +                   #size-cells =3D <1>;
> >>> +                   ranges;
> >>> +                   clocks =3D <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK=
_6>,
> >>> +                            <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_=
6>;
> >>> +                   clock-names =3D "pclk", "ipclk";
> >>> +                   status =3D "disabled";
> >>> +
> >>> +                   hsi2c_1: i2c@10560000 {
> >>> +                           compatible =3D "samsung,exynos990-hsi2c",
> >>> +                                        "samsung,exynosautov9-hsi2c"=
;
> >>> +                           reg =3D <0x10560000 0xc0>;
> >>> +                           interrupts =3D <GIC_SPI 398 IRQ_TYPE_LEVE=
L_HIGH>;
> >>> +                           pinctrl-names =3D "default";
> >>> +                           pinctrl-0 =3D <&hsi2c1_bus>;
> >>> +                           clocks =3D <&cmu_peric0 CLK_GOUT_PERIC0_T=
OP0_IPCLK_6>,
> >>> +                                    <&cmu_peric0 CLK_GOUT_PERIC0_TOP=
0_PCLK_6>;
> >>> +                           clock-names =3D "hsi2c", "hsi2c_pclk";
> >>> +                           #address-cells =3D <1>;
> >>> +                           #size-cells =3D <0>;
> >>> +                           status =3D "disabled";
> >>> +                   };
> >>
> >> shouldn't you define serial and SPI too?
> >
> > As shown in the node it only uses i2c which
> > corresponds to the exynos9830-usi.dts. [2]
>
> If you can't specify all the protocol modes for all the USI nodes, then
> make it clear in the commit message.
>

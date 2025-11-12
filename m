Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0886932C93C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 12:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762950394; cv=none; b=bThD3rwvor0FIEOqiexzsHxLhBlERrTdRknhIkDs+mwia05vgfyBYLgLMBCBLLftmf5oIOD74xbSDlseFy0mYpyYiVWb+OY3RRI2Yg0UKsRw0ILIWfm6pvyT/3cD/XrtfHhlpO7Fgd/MvjrHOZODdjgTArhuO/amd+2zvhjXB7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762950394; c=relaxed/simple;
	bh=dDKYGlIJ32m211Bih55y93s3DErpXU3iR5VwKKs6LPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GCml3qnxj08NSudVQcZgOZnOUdLhlF6xc2eEWD3kDtlMxyAK8BBPgXWDajHIAwyAVKhq4mbLz5k0yv4S/5OP9Na3QW7p9wZ0Pn96f+ifDDAH/jU0BSWgPfngzXuZdlo3tO8Qy0cFN1IHmdIyB43Nd+sKR49NTddRyr43LgsBPUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aJ/Z5FWt; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aJ/Z5FWt"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-3d18422565eso463770fac.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 04:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762950392; x=1763555192; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0wFrt/LADXbjn6c8+TuF1xEj034sEsGmUDeod+7NYBo=;
        b=aJ/Z5FWtr5HkyktzhSE9r4ff1yR+FylYC2Mu5zRY+NAhQH3BgrQXdc+Nw5sJhSghGM
         VgAD4ZQz56NPNW9PPmHjVoAzJYK6PoH606ldmXEt25qoR9Ais9w3mWH5446ECbxOjXfH
         rAfYrEZMfbsNqjU6nk0clcv6IiZEICQ3n0XoQMv6UTNlrutJR9tH/SF2oEeKKGV8l9Lm
         k0BTTB77/hJqX+2egOf3iCrTbQ+ilhi9h36UeLQLnVs5qmsnoQbECmKvS8k5EkwNzgki
         /6iWfT0KYGmZdhMFAmZMgntoxUPA6D4y+IerSe3IEBbRG3O5VR9qFqHlRkqWDBtLnqcZ
         emkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762950392; x=1763555192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wFrt/LADXbjn6c8+TuF1xEj034sEsGmUDeod+7NYBo=;
        b=SZ13VmSfJoW5dS5kvE34juCT7XQx/eaFzUUrzDdcsc15txmC8JEI++ExfkbdleDn7k
         4VJOwS1AhAgiqP/fuAPMB71WN26zbjEpy8NJxSoePYqQVM6x3khkbzXj8R1C+rTj7i7f
         3cX7+ZsoFOCEOqYbXmzlGKcclEuEHnq1ylPkAeG96KYUKRPnHDkJ+mAh7HsqwOkLlY+d
         KT5tdFVZtQ4CtHUI5d0dPjC50BjMcKHqghgQGfVVZjp/+uE1zZ3v7D6lMtPgG51wZJg9
         B0kWBvdj7qqD5++FRTfoXngvoMbGPQ7OotHeZ0xmsx3EBwBIRrfDLCZ94ZabaJLJjRu4
         7vOA==
X-Forwarded-Encrypted: i=1; AJvYcCW9cexKJ3lHbgFpLdnoXLyF7YF8yZD9xfLRpk4qugLZ0HPNgXwDEP69f8kprQOwDM5t+LSoDZNxiEZ7HxyEvIAibQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu3CvW0uQ2qE92agsWinZyi7tw7PErB+hrkqz8uLyeTalWZGgt
	HxPdrfpbZw2P6LL8i6/HO6HELFepoYJsoNYB5Au4275kGO/tZEMr+uMFT3P//7x8T1jtgghO6jL
	3xRXEdYASMvxIhx7e4SMrd8GtSV0ISPYZW7NWwijdjA==
X-Gm-Gg: ASbGncv9RKL5JlBanGnyaXRkIRzANSG+TTAtUSoy7J8vgqzt5MBVjbFNudME2mhTz2e
	13gVqxcnxrUHZDZulWTnRXYKz/1CXVqdBpMI69acdnnx/oaLB/Pw/XvKbI6z7P+NDdO+SOepFHR
	l9zNJQOGwdRhn7kkC0aO2mVPMGkoPw3ecGrDdD+zE4U4c3Dzk7hblXRabttn1nDhT2fYgXnzoWY
	TvM5REPa4+iLQzOmsbz9oKJ8QBYB2SohAAIGWy8n1KnCH8xoDkhqU8hrwI2rg==
X-Google-Smtp-Source: AGHT+IE1tLumK4n7DEwiq4S5JSBYPEzwm+BAj2LMCZxL3vQMOt1J1sE0UaE8YVtiqdzAwD2oN7VxHWusv1seYdRsy+g=
X-Received: by 2002:a05:6871:2e8e:b0:3d4:3658:ede0 with SMTP id
 586e51a60fabf-3e83419b8bfmr1247405fac.40.1762950392152; Wed, 12 Nov 2025
 04:26:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.3.I35b9e835ac49ab408e5ca3e0983930a1f1395814@changeid> <b55d94f2-6b79-407f-af58-b9847db3c9a2@kernel.org>
In-Reply-To: <b55d94f2-6b79-407f-af58-b9847db3c9a2@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Nov 2025 12:26:21 +0000
X-Gm-Features: AWmQ_blqp2Ui-ZoVaTdeg2kHQP2n-uxUtRhftLhBrfgQJGuwpcrlRSIvpnI39mE
Message-ID: <CADrjBPpCKfd_0PY=DULnmqfb8veqH-SQ-kr5gC6Y28uBVo8iRA@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: google: Add dts directory for
 Google-designed silicon
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, William McVicker <willmcvicker@google.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Drew Fustini <fustini@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof & Doug,

On Wed, 12 Nov 2025 at 08:10, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 11/11/2025 20:22, Douglas Anderson wrote:
> > The first four Google Tensor SoCs were offshoots of Samsung Exynos
> > SoCs and their device trees were organized under the "exynos/google"
> > directory. Starting with the Google Tensor G5 SoC in Pixel 10 phones,
> > Google Tensor SoCs are now of Google's own design. Add a location in
> > the tree to store these device tree files.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  MAINTAINERS                         | 1 +
> >  arch/arm64/Kconfig.platforms        | 6 ++++++
> >  arch/arm64/boot/dts/Makefile        | 1 +
> >  arch/arm64/boot/dts/google/Makefile | 1 +
> >  4 files changed, 9 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/google/Makefile
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ddecf1ef3bed..f73a247ec61c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10606,6 +10606,7 @@ C:    irc://irc.oftc.net/pixel6-kernel-dev
> >  F:   Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> >  F:   Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
> >  F:   arch/arm64/boot/dts/exynos/google/
> > +F:   arch/arm64/boot/dts/google/
> >  F:   drivers/clk/samsung/clk-gs101.c
> >  F:   drivers/phy/samsung/phy-gs101-ufs.c
> >  F:   include/dt-bindings/clock/google,gs101.h
>
>
> I am fine with this but also please consider having separate maintainers
> entry, because, as you said, this is a completely different SoC.
>
> In any case, up to you folks.

Doug did reach out to me prior to posting. We are OK having it here
(happy to help with Laguna). Most of the exynos specific SoC drivers
are under ARM/SAMSUNG entry anyway. There will be some Laguna SoC
drivers for pinctrl, clocks etc, but many of the IPs are designware so
likely to have existing entries (uart, i2c, spi, i3c, usb etc).

>
> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> > index 13173795c43d..044af9a3b45f 100644
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -138,6 +138,12 @@ config ARCH_EXYNOS
> >       help
> >         This enables support for ARMv8 based Samsung Exynos SoC family.
> >
> > +config ARCH_GOOGLE
> > +     bool "Google-Designed SoC family"
> > +     help
> > +       This enables support for Google Tensor chips starting at the
> > +       Google Tensor G5.

It might be worth adding (Laguna) here

With that addressed:
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter

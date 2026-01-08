Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB0244DB72
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Jan 2026 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767870919; cv=none; b=WsS14BHxT2jEImsx8+IGFOZAP9BaFyfs/W/wPl+FnS1ng1f7OCY9xfQkq+Reyk4ylYPqmxkDC1QES6jEoCxTVuPoyjV9Q42fTzhpzirD/c1XpTNloLNK4MQTupPM3bvV8fZyZChUcV0ZsmVXNB9q/C4jBG+tE2bn02aK4k0VnnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767870919; c=relaxed/simple;
	bh=YXGLziHF6YkCoDlgtESsqmLKcAyUTntv6ubByS7hXLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QgV6cTW/A7vRjjSaf5EL4H9dWjMdNGsgDuPKFT/43j5dp1eAGNlJZGEGsKGddZg+6dKqOh8rz8jViXP/AhKDX81FsdTCf01JGTfastjUxWTnwYWOp3J36+PEC2hpzevl7Itug8NudYIr9mrhPJCQfA4TqVmEFSamIKTvVsR9yfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iWLs0bma; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iWLs0bma"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64b9cb94ff5so4313526a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Jan 2026 03:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767870915; x=1768475715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVxapQmd61w0lGQX8mp2HL79WDJS07jG7jMdrPDktlc=;
        b=iWLs0bma2yM5T8FHtH75OLVNlAQrMc5evfqFCg38iZfPg/ppbupqFwHAKEks8bP5oD
         A+nhUO1gT42WKbo82vZGKPOpDlIxb8ENnD6icWH27ScqSJNsTg6A9Ig9RVMCHlslP7rV
         H1mKcuj+Wl+zK5m3P1Rh1mrPDDYTdSy9bR3mOetY1WV4vnWSCRVwU2W0yJ+cOS7390rb
         ZYBDuMEN6UtSttTgGamcCc842Ok/REzbgK2/lPGYgwfo4FBZRaLMIP9LiyGHuORHVxHK
         MBSQa4/Mpl5nPQPifGbn4VwYTwxOc55/FJweaJ6tH7FwaQnpc1+H3fvXaY91RRrVjN3h
         X4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767870915; x=1768475715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LVxapQmd61w0lGQX8mp2HL79WDJS07jG7jMdrPDktlc=;
        b=MsBmroiVZOLTf6pKfgqWap4DnoViz2BeZXCVVIyTNRV6R4B1uoU8Hy878hRDANPYBF
         FixJYN1qlbvP+r5Esczl8kUfrmHlCX+/tCbNbMU7t5gUHyTdSKRCnnIEi0u3G6Odcpvm
         W8gnuXcvA0POCwGw87TIgS9NRvk70BQpArjO9+ObGI1c47eeBpXM1w0G//rk5Gqwpf5B
         gQ3mpifhyMbqtVjN9nCEawRt3HKtVWB9y4UvGIbe6mKZ3oAs0jpUW34/qkic8lQSPidN
         qXvcxHOKel92GESpqeBGf/xAoIp1ojnPXl/J01TuTv42NXOhMapLKLPZRKJLi3RUiEB8
         28Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVcDHojeZlrfYm/rdRyetqvIwNUPq9vbYwzi3OANAb+Ld+T345S+kfINmj47wDqTRTD9vYJUidAvFaiyyHoE4NXQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6SMqoTIGJd/pPjR5iWcU6Ml7BNifYQkC+YO2qgyB0tXP95qob
	sXle2WXHljvIc1AlfgHidXMc19PZnIdRYI5nizaUfMoOADA0XwiPe6S5sDCIlIl6ySp6cpTseC8
	ptG6gVyrbFfk5liHqLn1H1+xD49ieH7AenP4zidZ2bA==
X-Gm-Gg: AY/fxX77tBG5aSFxKv22msUMXyHRm7Kc9suXPu/7NmTm9ILOwfmyzdJ8YE4tvYJncNr
	1Nv21N4xneT6YlGLZA4aKbcVv3SGoV7OM143DxxpHF5L9hFBFL+RqGruPJd7zTOHpim091mKpjU
	8ElvYopgQqS4VqxxW+D2AwKs+laYWjED3I/fyM6zJOG1Zon9jC59TYD1PgbI/wzo84xOZn+XHjH
	CAToaiL2o7DxZujtMYkv8qO+IifgcA0T/Prx9HUqEKdPGqaI50F5lzc8WS30up+vdfdUa+BkOSV
	Oy9iTqtdMVbNvfgsnXhQJIn9xe9amD8bzdBh1Cw7
X-Google-Smtp-Source: AGHT+IFHAB9Bnp3BB8dMREjQr967gPMG/GGiiGg+amrvJbHn1bFL3BwFrjMhvQJAqE/QddIsZ2qSyWC9FuhApQ/ThSM=
X-Received: by 2002:a05:6402:5201:b0:641:966d:82ba with SMTP id
 4fb4d7f45d1cf-65097dcc536mr4334588a12.1.1767870914919; Thu, 08 Jan 2026
 03:15:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
 <CGME20251222103019eucas1p2c60f033dc02adfef360b4fc69bd4021b@eucas1p2.samsung.com>
 <20251222-automatic-clocks-v7-3-fec86fa89874@linaro.org> <8b2c412d-3e1e-4be0-a9d5-ef67f6f0d409@samsung.com>
 <0c09a8c461db5a09e75de4587eef38bffbccf2d2.camel@linaro.org>
In-Reply-To: <0c09a8c461db5a09e75de4587eef38bffbccf2d2.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 8 Jan 2026 11:15:02 +0000
X-Gm-Features: AQt7F2p5pHWMrlun-9cdijxvvGGa-DUdgXn5dVr-tLvbHmhtbwNPLLjbUDUSQBE
Message-ID: <CADrjBPr6QBbmF9tQP0czRm30d688VtT1g1=tw=bwfYYzKPrPPg@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] clk: samsung: Implement automatic clock gating
 mode for CMUs
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9 & Marek,

On Thu, 8 Jan 2026 at 10:55, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Hi Marek,
>
> On Thu, 2026-01-08 at 00:59 +0100, Marek Szyprowski wrote:
> > > @@ -334,10 +456,20 @@ void samsung_clk_extended_sleep_init(void __iom=
em *reg_base,
> > >     * samsung_cmu_register_clocks() - Register all clocks provided in=
 CMU object
> > >     * @ctx: Clock provider object
> > >     * @cmu: CMU object with clocks to register
> > > + * @np:  CMU device tree node
> > >     */
> > >    void __init samsung_cmu_register_clocks(struct samsung_clk_provide=
r *ctx,
> > > -                                   const struct samsung_cmu_info *cm=
u)
> > > +                                   const struct samsung_cmu_info *cm=
u,
> > > +                                   struct device_node *np)
> > >    {
> > > +   if (samsung_is_auto_capable(np) && cmu->auto_clock_gate)
> > > +           ctx->auto_clock_gate =3D cmu->auto_clock_gate;
> >
> > Do we need to issue "incorrect res size for automatic clocks" warning
> > for every legacy Exynos based board? The check above should be in
> > reverse order:
> >
> > if (cmu->auto_clock_gates && amsung_is_auto_capable(np))
> >       ctx->auto_clock_gate =3D cmu->auto_clock_gate;
>
> Good suggestion. I have one or two cleanups anyway, I'll add that as well=
.
>
> Thanks for spotting this!

Ok great thanks Andr=C3=A9 and Marek!

Peter

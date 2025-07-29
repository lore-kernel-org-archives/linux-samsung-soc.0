Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396EA236431;
	Tue, 29 Jul 2025 05:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753767888; cv=none; b=WGqF75L61wBUO6nvt9cke2Qu6YXpNLy0EsEJeF0dhk8Gw868wBRJyP4RCK4ZeyAvhl8aaR8xPDgJUfA/IDTCux2/vRr+qz6QcC8+XrBT5zeOYrzEyQSBoraXh5EAV1etY3lbqkeXop8cWR9fpqYvIyJDSRswQXcojyjViK1sCDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753767888; c=relaxed/simple;
	bh=yRfdNUT9VwzkThj/UkpLzzB9tOv/w9HNZQG3TB5he5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NexcxW9CGYuMXEeTTw+FESTZ1xpvCrm1ucE8oHLDyGNeoSupgh4Hczq839QVnH0ja9SW1GkuiPyXP7/N5x3Mx94kp/tlw22HkeWrPjWyeHW6AWCbJa/3AYp9RUZF/FH2Pwfeype2uzWOOa3lk853nGtER42EzqrDSHZcUMslds0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSe+pruu; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSe+pruu"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4fa771716aeso416858137.2;
        Mon, 28 Jul 2025 22:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753767886; x=1754372686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KViA9cK2jd0mcOlnHsktz8HBcxRyMOa5DH/RlB6yhTc=;
        b=PSe+pruufiOKZGEvhPzHuYDjsUFnHY/FTa2uHH34FM07P0A+kD3Mk124YyzpiEXloo
         690RgnEUPZWYtkjquPQ4SU4zz5C5jA5pJmiiyu9LPy0QiaKASUPAC8XcQFQA5bsL1cnT
         bgz828rb7nUag/50eGFxjnAEWo6WB0Ij+JKOmSVPq68ncua3q1t8gjPc9eWzPCj9Dk1Q
         lw3Y/RBhaPCvdtlpZ2i9kK7QqodwbQzo7AjvYwqUxmp/UNHQyWoymCkKlMiZwdsmyTm6
         VZR0ZfK3AKuWjHonbPjmETWSGRgYJzJ6YPGL81EdlGchFdFFJ/F9S2VUcydV9rFCpLLU
         4+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753767886; x=1754372686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KViA9cK2jd0mcOlnHsktz8HBcxRyMOa5DH/RlB6yhTc=;
        b=HGtCG8m0SA63S+K1zlibPJuohErgws+lbweeCsNu4znnP/MEzG2HttdjQ0ivSMboDA
         /sFIIjWkLdMds5zgTqt98dzor6z781TiAKAGUnfqOYUMpptXl5m2KpN4l2fUV5K0j8r3
         xM1bq5kY/zPtfdbZMXPoghGVe8MoDastwvgeXplObRDE1mXSzgWm/YlAXXaWZPawWuwy
         PYa0REmvxH2T0rlfwzt05BBjPFL2vpXW6aPkd7KBSvTK6Hx9OfXTBdwnWWGSnveU0iFm
         /nf2lECHXsoQSig8RBVldtYOjualvy3BWEgRt43ti6dxZOXFc2wDYhv9s3l0vlwRZ2X1
         bYGg==
X-Forwarded-Encrypted: i=1; AJvYcCWBgUg2xGKL+tlljEJR9bgX9VDGWglgxIfy+L20gMJPobY5vkOxwwhZXltnhyZNpNLcr2m4JaUAaAvjfFS9@vger.kernel.org, AJvYcCXPkPph11OtNvLzRVdHW9WcZgj0cPYsivIZtSQIAFPYQ3DLU8T0qaCZIg0Egc8M1YSQf8jvsXNtQXX8NY/HLgqCLQQ=@vger.kernel.org, AJvYcCXT9JNV3NzWrF/9UbNoNTLT+OVHS81pIC7JA1ED5DDxdBKkkrjLGFzQjab0F8mlXIdGETcm3dd6vLba@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2O4cS/se71gvu8WnXO8qi67BbK0iospT6Hpi7z91wmffSZcpa
	oPgG2wKP9rQDdwkDzL0kFIx7/AMSShnW+C5o11cuowlodtVK/PKSZwyzTuRLnNnQAUS3Ze6wmiZ
	rmHjb1vZBlXFvWqZiNwfOmNia77dO+sw=
X-Gm-Gg: ASbGncsyv5D3m+MidRYEhhnTZGV8nCsdYpF72aS19prF01WJKDbKpEFLEHYDchmO/QT
	ueg8nZXVZ0Dn8NXKpMmhZQFK8Tthy2zLxmIebxZs7Fw9Un/xirqxHdr6crfciFgtWU1nu9PmK11
	pRbkIthJiESKcargnrduxetqyMYgRcM1vy93SG+bu51TR/gIMPjCNTUaQqVLeqtWVWO9nNJ8w7F
	Rv70Q==
X-Google-Smtp-Source: AGHT+IEsVgJXjoaJJQ1V37M9wx7CFXObKZWA/ky7jPfEPGlwsIppSymEDnwGfyFMHa/pUSY45t6bV5SHcp/btowCI3c=
X-Received: by 2002:a05:6102:648f:10b0:4fb:142:1ff5 with SMTP id
 ada2fe7eead31-4fb01422464mr654319137.26.1753767885910; Mon, 28 Jul 2025
 22:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org> <20250706-exynos7870-dsim-v3-9-9879fb9a644d@disroot.org>
In-Reply-To: <20250706-exynos7870-dsim-v3-9-9879fb9a644d@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 29 Jul 2025 14:44:03 +0900
X-Gm-Features: Ac12FXzAP3fREaTsrBTi2grtepIb_8yjQOzO6O2L5XoQ97YnHsqpGgIB0mEB7O0
Message-ID: <CAAQKjZMLMbwDVZRb5+Xb_5yz3AEP4uuzFJMuuZy9NFDu13VU5w@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] drm/bridge: samsung-dsim: increase timeout value
 for PLL_STABLE
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2025=EB=85=84 7=EC=9B=94 7=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 3:28, Ka=
ustabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> Exynos7870's DSIM requires more time to stabilize its PLL. The current
> timeout value, 1000, doesn't suffice. Increase the value to 3000, which
> is just about enough as observed experimentally.
>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index fb2cb09cfd5a4f2fb50f802dc434c0956107b4e9..4b49707730db76aa8fd3ab973=
b02507436750889 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -755,7 +755,7 @@ static unsigned long samsung_dsim_set_pll(struct sams=
ung_dsim *dsi,
>
>         samsung_dsim_write(dsi, DSIM_PLLCTRL_REG, reg);
>
> -       timeout =3D 1000;
> +       timeout =3D 3000;

Relying on an implicit loop to wait for PLL stabilization is not an
ideal solution.
According to the datasheet, this can be addressed more explicitly by
using the DSIM_PLLTMR (PLL timer) register instead.

By configuring the pll timer field in DSIM_PLLTMR appropriately, we
can avoid arbitrary loops.
For example according to data sheet:
If the APB clock is 80 MHz and the desired delay is 20 =C2=B5s,
the pll timer field should be set to:
delay_time * apb_clock =3D 20 * 80 =3D 1600 (0x3E80)

Once this value is set and the MskPllStable field in the DSIM_INTMSK
register is unmasked,
the pll_stable field in the DSIM_INTSRC register will be set after the
specified delay (20 =C2=B5s in this example).
We can then check this field to determine whether the PLL has stabilized.

While the current patch relies on an implicit method, I=E2=80=99m fine with
merging it as-is for now.
However, since this patch series likely has sufficient time to
mainline, I believe this is a good opportunity to improve the related
logic.

Would you be open to trying the approach described above?

Thanks,
Inki Dae

>         do {
>                 if (timeout-- =3D=3D 0) {
>                         dev_err(dsi->dev, "PLL failed to stabilize\n");
>
> --
> 2.49.0
>
>

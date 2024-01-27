Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5376BE7F
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Jan 2024 03:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706325778; cv=none; b=WNKQXg06eXD5MVfZKYJJjmBuyUYCmrkcX/8o6h1u14Hxj+tNxQDmj7OyRUN0iNHvWuFmjKQ1HZcRPfJxqyedRLu5gXlU78C2Z1ZepqHEuLchImsPLNAdBMILs4/U9wWd+JhgD7a8P/260Vgct3WF4F1qeMDN7oWB2Y0ZF2z8to4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706325778; c=relaxed/simple;
	bh=FrxJXbvKFy9ccwvaK0VXKyIWUFmKqQSsZFadTQHX5ck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s33VvxOkXhbyDdnlB+I/aGSfaOz4CpsoW+jmb50ynjDWB361/q8pMMVWOWZz0CCENFgBbjtivn17VfaJTgCHcA0YBwqyZyhM4Bax/V/9GsmurPG4zEbeIuKQ4RyycnzIqmrkWKUbcn9c9v3openI5juAOzLZ3JXuLJ83IRdPEW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KYkg+QAW; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KYkg+QAW"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-42a8af3c10cso2186001cf.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 19:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706325775; x=1706930575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcjeTVsyelbpdNWxkkCJRWruASpwo+2V+ZzZoZejvEg=;
        b=KYkg+QAW8RlwstPQ79aA90mS/ZG1C3KZ0WfpZLivGNyuIZ2jMrzEAjRlHYcuHpc5TN
         wmiz8HOo2CHjlnc31H1TZqmLjwHcNThx66/bnquHdEgA+TRIVouTDQQpWkOvHyVhIwd3
         bQVoUM2TuCJTLQSE+VZGyJ4wr0OkuUC2+CVowdzjFaWS9MdRP0gWAapesIe3gIVk6qQa
         s/YhmfI0YC1W7RtphBEZKjAl5Xjd/sLjD3Ey58h31T/AeBuLOe3cVoYQ9e2H5qXAMLvP
         kQVKC6mOesY8p6RMRbdltMneWGsQxEgixQSc/7tjzrc/DMSvJhbSmbGlmpY8McFThD0x
         YDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706325775; x=1706930575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PcjeTVsyelbpdNWxkkCJRWruASpwo+2V+ZzZoZejvEg=;
        b=vdrb4EUf3nnrkMGTHv3jVrJ4B1g5WlMIGx+/GU8ktfxiuaNWtB2hzftG5wywoIypBH
         b/8IdUkiK1YoRuDMG4XZrZ1K3sBpGB6XX+rGJH782dmgBTu+KPfbLWs8Z8YiMUCtlH/h
         V3V3zrve48yTjtjKjqkv29N3TsTvCaoew5t1xM5yGaQMDiGVPlXe/Lv30HXm5Ly3/Of0
         3kw5YHv0TGZSLyLpsxOyTEP1ND2XAT9NnCSrmqqIUvNKKJY+5I5AQ1AjLalzypKz5kMV
         yeBSu2ush4XK1jsRT/P3UVJt8dqGHLIvlpozqWIou0/rNm5XXBQp8J91DBSZOLFWdfdA
         ZKjA==
X-Gm-Message-State: AOJu0Yws6TNPP7uMR9KDc9i+qMWJfsGp0rat8s3gmvFHPXS4V+mJ9JoM
	cGHQCsYgNlwn+W1Iyi03uaTvluCbKMRufnqHPdBrg5Rbz3Iy9siy1TMorZtE8E0bODjiM6OBwUx
	aWuzLo9srttERejlSq2ToB8jAN/Nc8cZAdtefTQ==
X-Google-Smtp-Source: AGHT+IGT1tcHzXWpQuUpr34teMAsoMHm7wMrA/pTeMYK1JIOKTxrlhkxw+BjGtDg95Z6kxJE90Y4hGvSoORYAM+Frl0=
X-Received: by 2002:a05:622a:181a:b0:42a:5e22:5322 with SMTP id
 t26-20020a05622a181a00b0042a5e225322mr1144589qtc.21.1706325775572; Fri, 26
 Jan 2024 19:22:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127003607.501086-1-andre.draszik@linaro.org> <20240127003607.501086-4-andre.draszik@linaro.org>
In-Reply-To: <20240127003607.501086-4-andre.draszik@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 26 Jan 2024 21:22:44 -0600
Message-ID: <CAPLW+4m0137jfMROYE_Lv915U+y0CK7M4dieHULOG90Z8XctQQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: exynos: gs101: use correct clocks for usi8
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, alim.akhtar@samsung.com, 
	s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	mturquette@baylibre.com, sboyd@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 6:37=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> Wrong pclk clocks have been used in this usi8 instance here. For USI
> and I2C, we need the ipclk and pclk, where pclk is the bus clock.
> Without it, nothing can work.

Empty line is missing here?

> It is unclear what exactly is using USI8_USI_CLK, but it is not
> required for the IP to be operational at this stage, while pclk is.

From [1] it looks like DIV_CLK_PERIC0_USI8_USI is a common parrent for
these two leaf gate clocks:
  1. GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI8_USI_IPCLKPORT_CLK
  2. GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_7

So IIUC, you replace clock #1 with clock #2 in this patch? If so, I
think that's a right move, because in my experience RSTNSYNC clocks
shouldn't be used at all for consumer IP-cores. That's why I never
added RSTNSYNC clocks in clk-exynos850 driver at all -- I only see
them useful for store/restore ops during suspend/resume.

[1] https://android.googlesource.com/kernel/gs/+/refs/tags/android-12.0.0_r=
0.17/drivers/soc/google/cal-if/gs101/cmucal-node.c#2793

> This also brings the DT in line with the clock names expected by the
> usi and i2c drivers.
>
> Update the DTSI accordingly.
>
> Fixes: 6d44d1a1fb62 ("arm64: dts: exynos: gs101: define USI8 with I2C con=
figuration")
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index bc251e565be6..e5b665be2d62 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -380,7 +380,7 @@ usi8: usi@109700c0 {
>                         ranges;
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
> -                       clocks =3D <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC=
0_USI8_USI_CLK>,
> +                       clocks =3D <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TO=
P0_PCLK_7>,
>                                  <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0=
_IPCLK_7>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x101c>;
> @@ -397,7 +397,7 @@ hsi2c_8: i2c@10970000 {
>                                 pinctrl-names =3D "default";
>                                 pinctrl-0 =3D <&hsi2c8_bus>;
>                                 clocks =3D <&cmu_peric0 CLK_GOUT_PERIC0_P=
ERIC0_TOP0_IPCLK_7>,
> -                                        <&cmu_peric0 CLK_GOUT_PERIC0_CLK=
_PERIC0_USI8_USI_CLK>;
> +                                        <&cmu_peric0 CLK_GOUT_PERIC0_PER=
IC0_TOP0_PCLK_7>;
>                                 clock-names =3D "hsi2c", "hsi2c_pclk";
>                                 status =3D "disabled";
>                         };
> --
> 2.43.0.429.g432eaa2c6b-goog
>

Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F18BBE50
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Jan 2024 03:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706324732; cv=none; b=cOE0ABcG4Vc/Z7NwZxZeBDD2b3anXvbFmZIqTXSQoawsy7LZvAAPW27zIdxiqsUuQZVz/h5ZQToqCbxdGF/Nt9FO1noqWxFXwpW2AsUasDrUwdsZ/i930CO1OszLLP7Y671UrhbnYfySqXs59wxTBxPk2HnWJXJzYzC7fIbUONM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706324732; c=relaxed/simple;
	bh=lc7FeYlV4z3BcyVYSzfO3zj0nT4iy8IxoN8LkfMa5E8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qbk/mlrNUL7mwtlhiIfuanSJFq3zMg/OFN0SVAWLi9BGKFKnZVDnw6DE9MldWD7bVy7Fh5h5qRC7XtITZbkg+xv0VR3yIKeiqweYrQ0uTqvAVgiNegpwIA8AnZPbhhjCBOqSm7jFsTygJNxhq8/HbwgxXQ/yz7xRiPW9Uy1kxvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TZnGwzzs; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TZnGwzzs"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3bba50cd318so875800b6e.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 19:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706324729; x=1706929529; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSpkQ9uw3w15P8Wh34wRGqY3GVlSW5aaOkRWoDT44+4=;
        b=TZnGwzzsC2rgxJwKlrU0SEZ80J5zeJVZmQYTJbxL1Ra07SY7235iIBDyBQcsslygUI
         4N+hK66VQg+Q6HfzpZy7BG0QwCzIQe9rSKAviTTFuXZ2Orx1UUPeRQXucK2tf8PlJvuN
         MATBCcMmKHkyY9XX/RxJTgRVYATnR+pg5qK0o4s6qiC0l6F2N0aHURKRK1TRs7e/FTwH
         ESsKDT53AG33qkMHte/ROHBzcvj8X+yp7RJbp9Qbea9OYtu9VCPGqR/9xpumFyVLnxQE
         GFhPkHwaACQJZwYJAdBecYs++XaGs6NjbUqIF4aUKfWMoJWjuaaYxO1+39WePDKzgZi4
         3aOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706324729; x=1706929529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSpkQ9uw3w15P8Wh34wRGqY3GVlSW5aaOkRWoDT44+4=;
        b=FbGvBqTsRUzA423ApRJn96hAoo9jfUPx9XWoNkRqU7gnDu85xqgAtaSzHOf6mF8W+c
         rW5zERzhOEH/yuDXoXObZLhHfPrbi938btI6yIHkl1ucM3t2FxthWS8YGYfoyY882n8M
         nbYUvOIIpzV7N3A57yFpAhxqLltwrQ4OVepoz4b90flCjHGHqXckQxkJI3bO0t0c7+CC
         s9jiKI86QHtj8FK6mVlD65mlqbdRufrsaiCFBobgnfHk6Ct4ANyVsphKSwR9Qi0uA3VC
         vmIL16tnBAiu4SL280EbCZFI5mOYLCIFyAZJ0E8xmXiK8pryalj0Hh25Vnmnsg4zQ2uH
         PzyA==
X-Gm-Message-State: AOJu0YzqxNzvMtq/UMz570w6o6o9zgTifB44b6fPYl8YtM7qzyaga1UV
	FFCoS9yae0TGqyJDuwelfhz794UOOXQ1udVkqBfKH5LyPzk9kMvAzuLKy8RaXxMWzhkScKt77z8
	u+UobVXGMza2Uh7CPXODeYu89r7MVosB5X5oQyQ==
X-Google-Smtp-Source: AGHT+IGsUGZID5kgruiLndIIWS3pGjmg9mSC9ewXW5aSS0qYxQxRIxSUa9x1jxytvIyrZLaerJaBrFBa17ChPRvDel0=
X-Received: by 2002:a05:6808:1442:b0:3bd:fd95:a603 with SMTP id
 x2-20020a056808144200b003bdfd95a603mr1418833oiv.11.1706324729634; Fri, 26 Jan
 2024 19:05:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127003607.501086-1-andre.draszik@linaro.org> <20240127003607.501086-3-andre.draszik@linaro.org>
In-Reply-To: <20240127003607.501086-3-andre.draszik@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 26 Jan 2024 21:05:18 -0600
Message-ID: <CAPLW+4ka0Wmvt9h=rxxGacoBOCOisF=+p5_xYPmFgSYT0Ndehw@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: exynos: gs101: fix usi8 default mode
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
> While commit 6d44d1a1fb62 ("arm64: dts: exynos: gs101: define USI8 with
> I2C configuration") states that the USI8 CONFIG is 0 at reset, the boot
> loader has configured it by the time Linux runs and it has a different
> value at this stage.
>
> Since we want board DTS files to explicitly select the mode, we should
> set it to none here so as to ensure things don't work by accident and
> to make it clear that board DTS actually need to set the mode based on
> the configuration.
>
> Fixes: 6d44d1a1fb62 ("arm64: dts: exynos: gs101: define USI8 with I2C con=
figuration")
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index aaac04df5e65..bc251e565be6 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -384,6 +384,7 @@ usi8: usi@109700c0 {
>                                  <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0=
_IPCLK_7>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x101c>;
> +                       samsung,mode =3D <USI_V2_NONE>;
>                         status =3D "disabled";
>
>                         hsi2c_8: i2c@10970000 {
> --
> 2.43.0.429.g432eaa2c6b-goog
>

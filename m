Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4BB54FB0
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 09:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706520016; cv=none; b=BCwOMjSOkHGcNQpbglQRDIU6bQI0dgp6lRQ8dpYzNQ4NiWzOl0Xxdlu8RahK1fNc+27bni/qbsiyZEgv/pa1YX4K1JcrI0+qq4RbgJx0o/lKJr9srht2nnwzLEA/b5mDhgOtmK2NgFbjDGs3e6vn5LXB4k1ce7ArqoO+MCwIT2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706520016; c=relaxed/simple;
	bh=eT5M4PGPIMeg2fCeb3Yf5untV7QcKJ3QzLrXE3MWYzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PVLw4AcJJVOvLFckm56majzNOh3r7Yw8QQrZJmYcIPHjZuUNXs9D4tzYpcAvKW+8xwP0v5qN3TS0A9t1zPMU0dShxerdlwZ0lpPzwNc1iWbL6cKhCv4vCT5XkqBBmMT0fs2NGULNzJehdK8Z/Vzmy50IKCy5ujS5ncVUXTd4Ijc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LPW1/iaD; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LPW1/iaD"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-68c495ba558so7978426d6.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 01:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706520013; x=1707124813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5TI2xWX4WSWXGwvH1ONQ6nW9xXje+suf2TwS23YzRU=;
        b=LPW1/iaDTzn1rIddldewPpgEmBxbGqcC/6Qo5JfMGo8JX6T8aDQnj1rIvlMOGxfHsi
         a9nXI+8U+cYpvZm41EpAEIaH9iny0opaw/ufXJ34UJaLCCGy14GBDeq6mO0lDEq7Im+z
         QA0F2qmVuATze4E73sV1j1EoDHOT5U3l1X2x2ya8QkhigTAV0LB9xfXDyBkEdLAH4nVf
         6FP57GlANmc78co/sLwWt1wSp1aeMsHTR5AA+9ct7bhqIyHoe1wkQLMcw1puBiBpUAnP
         tj2a48rM0E343lkn6Mm3rFKtqzEDUr4A6jeGacjMq0wHi0ZxnDuRG4BFjc6S5rQG8Keb
         SCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706520013; x=1707124813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5TI2xWX4WSWXGwvH1ONQ6nW9xXje+suf2TwS23YzRU=;
        b=cHjb3HZ24yU2stgJeAMU28Oh9b6YZHO5z1uxn8Z5EyWHky2/KgCoDJzuXhJOinFugm
         bdna+Ad4fjOccYXw1HQV62+ckosKoNp+sXoMbapvLA3ygDRhFi9ivy3puvPDJFCk6WQu
         fHIm/n76y0o4lvX2z53KxNNZEjqbu3zCuFilX5QCDDeLGJq4QQcaBtTK7LIFyhFnnIx6
         gcbN+WD3ayOwKzx61Fnr4pxtNVlsnpyEA0Dc3WPX9M/Z5naiu2HSmKviA84ePWqjF9mE
         udSQiShDwyoZvgrry36qDXyTadfCWpeTEZmsQk5/xkObi5hoUGTGP75abALyoiLtVXab
         2sQA==
X-Gm-Message-State: AOJu0YxazlM5Yu+bmrlrTeUvXbxQ+NFPRjIiIga/h9LhCb8gm4uPdgO3
	vSLuGvNsrmFdeOpUqF8RIkcdjurU+YvdOE3Ot3UO5MK/UamvQDOJHBeZhBUR9Nod2vtnCxDKWHE
	RVgS3eoQ2DRVXTWc/pPB680xs9Kr2Zq1LM/NO2g==
X-Google-Smtp-Source: AGHT+IFgpJ8Pszt1MimvP0F6oYcpgps7CfEr4UpP5ROpsZKjeuq5nM0vRM/7HXvHUbqgAhUsYY/FjFO0TS7neZFlXRg=
X-Received: by 2002:a05:6214:528d:b0:68c:4f44:159d with SMTP id
 kj13-20020a056214528d00b0068c4f44159dmr1497734qvb.30.1706520012762; Mon, 29
 Jan 2024 01:20:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127001926.495769-1-andre.draszik@linaro.org> <20240127001926.495769-5-andre.draszik@linaro.org>
In-Reply-To: <20240127001926.495769-5-andre.draszik@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 29 Jan 2024 09:20:01 +0000
Message-ID: <CADrjBPrB1asSBxLe9wEfjbaNcEqz_3sXEu_3zfv=fTSk65o2sg@mail.gmail.com>
Subject: Re: [PATCH 4/9] arm64: dts: exynos: gs101: enable cmu-peric1 clock controller
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, semen.protsenko@linaro.org, 
	alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 27 Jan 2024 at 00:19, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Enable the cmu-peric1 clock controller. It feeds additional USI, I3C
> and PWM interfaces / busses.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index aaac04df5e65..5088c81fd6aa 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -429,6 +429,16 @@ serial_0: serial@10a00000 {
>                         };
>                 };
>
> +               cmu_peric1: clock-controller@10c00000 {
> +                       compatible =3D "google,gs101-cmu-peric1";
> +                       reg =3D <0x10c00000 0x4000>;
> +                       #clock-cells =3D <1>;
> +                       clocks =3D <&ext_24_5m>,
> +                                <&cmu_top CLK_DOUT_CMU_PERIC1_BUS>,
> +                                <&cmu_top CLK_DOUT_CMU_PERIC1_IP>;
> +                       clock-names =3D "oscclk", "bus", "ip";
> +               };
> +
>                 sysreg_peric1: syscon@10c20000 {
>                         compatible =3D "google,gs101-peric1-sysreg", "sys=
con";
>                         reg =3D <0x10c20000 0x10000>;
> --
> 2.43.0.429.g432eaa2c6b-goog
>

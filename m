Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18A53B47FB
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Aug 2026 12:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845600; cv=pass; b=M4Zf35QDZ/agEgnW4crwplgSmSHpkTbu/c/m8fe0tMTh+dzgyalX25hXScNqkFpeSXwW5Z7xk5u4+Pb/Np89z5NXpUoYhJXXWZu3pB+xozX2vwpl29AyEZ0K9280JZGsalGlLRPuDL/Hx2NyvPcSBsS3a6Br1ihbTMfrGxtoDM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845600; c=relaxed/simple;
	bh=1jmt5WCmRdYFJEkC9Rif/cfA1XLv5OjEVL2XiuFUUMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Arv+ZB3Zk43XC31cLPnxs+80jp3ewnC/GMtCq4KVaZ2bGapKk+m2cYDB/bE8hnYc0lXI3xomgpMOR1HphEdDD0QGHzhOapAl69j+Vt6E3p2GEkDu9sTOt6AqDxDjQyOPd5HSc4jdAvHGyf6YLPPO8ntiEN7+IxJbnP/jLb9uYV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A541xQpc; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A541xQpc"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a10d02ff43so2563763a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Aug 2026 05:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785845596; cv=none;
        d=google.com; s=arc-20260327;
        b=UuyOS99tv+MWGUVCHafc/oYEF6thy5PkDgrLa3FXiOX2/rhV8/Sz9T3GZIAiJLUrEs
         JuTLWFIDWh7pxJHzIxDgL8YfsqjnMmnSjeHFS1VvOaUVs16PiPHGSNqx8Ovskc2oBWmH
         iI+7P/G6LsIOtyIAtcyiX6Q8R3HNySZyH58ia8XXCMrCCB3kKsvGN2mqj/5xqnxiz8Ou
         iYrbJ/Kn3jFS1KCsKv9HUSiwqeETn1LpN3FJUgRqlgCVwfyDNj0aQk268ihYfpl2gFxw
         bRqwTp8Ey7nQU7d50h39WvqeCLVbZ8zL15sjAh60AO7DMiiXj6oisiMbkn3Z7p909lwr
         RPVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IXbZR8tAcrziDMeRXEJQbq2r3n3VLeqHoVnsKPcZdkM=;
        fh=ywUhfE26KYZBnFsNdNAaip+/Pmmpi4R6heXVaTrFirY=;
        b=VEHXD137jpcxbFTp9rw1O5qf48U34a0JpQseAYaU6axu5JLTzTSQ62bTlp5v40bTSZ
         wITLMivveE8DxVcGagwP3DF8wG1SXoSizq/BTo6a5QxfOIzQPoZYb8f06msN/0fhNX8w
         j/RFTHrWk6wcNnt1l6KmFOqFbqm7zmyjQa2IgbX4ypQpZRUDs+2uT1xj08W80bbj8LJF
         nQ7d/JuzLfd80pZ5EABoGOpdd7Hd1Jc5oSsAPBMVtSlxhaRAOcwjTpWq/L4UN/4kT88f
         3fY7Ai/jBW6rp0Nf2iQr6I/S7vxAun1ASY9PyiqMRU4urtP7ReETVlW+0rGhEJo4C3CB
         FrxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785845596; x=1786450396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IXbZR8tAcrziDMeRXEJQbq2r3n3VLeqHoVnsKPcZdkM=;
        b=A541xQpcY59QDdUBNiR5AzU+FDat0f0C3w6EWdHVaQOcEWsUSiPAMzJiBIxpXKtLsl
         Rqmyuyh+g15mgW0YwefgKOwVe7rH/r8c6nuhrqtPCtYRONtrInDX1tjuJ2ugZ+6UZgVp
         9Lp/QFBYDpNVcqhRygEqhTxNCCznx9TMwZqELpskQ8ykQTJqhre72LcGWLtYRxdN/CuB
         Giw8SfqSz97mt/3Qa+HBKDND85fJ2F5bcqPkn5dSHfNiblbBdrQ5ODWylsizDsnpB7hn
         +Mwsqb8XTrBt/wK3NYvLMR9wrjhyebkJ7bgvqlB0frKStECfqGX3U6xB3boT669IhW3a
         RYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845596; x=1786450396;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IXbZR8tAcrziDMeRXEJQbq2r3n3VLeqHoVnsKPcZdkM=;
        b=pT7PS7Rskt2RA2GruxN0l6vRr1W+v22pomvPSVsPD1tVWQJRSc7ef+pz0VGLY+XGlb
         douxje5CoAAvw7eZfxIx0kTycKSvXy0mqt3ScJ2847t+M6UAlAujK64BSe6b6VBuIGv5
         +KTlHpjrpJNouH1jAXbxxP+AeBtNWNIEWdW+vI/UaH6hRWSOnMt9zl5/5jl5e6oS0SBo
         DvtkUPq93B7pAGGYi4w/kxLFI8PC05OtwlaO8ArCweWGE20OTMPE7Bz5JuUjFrSWEwhJ
         hlB8pLbPa+Y3yrd9YeecSrFnyXCj/YspZyo0Vt/EnuoUZZuwI8iEXbaVpbso/3BASSup
         I2iQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFCaPZsaO0NTWyn7jH3iWt1rLUk+5s//ChwvNbxsPZkN7rOCpBYpHSnyw2XhUSvXFSiwBHbUrEi4kblWfsnmubQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6avH4jHuJIWQcaOCTntxRZJR9Aem9Gzir0y2rfkTqUG8BqePc
	jzmA9zyBfeOQze0AbuVMRXqj+eNZAKh03zt/CEw6iLVg6kG5+23h8/X/4k2EiXk6RZ1B0pAOgIt
	QlC3LkTaXD5JKfWV2LK7VyquX9sKKrtN2zhRSDnHtgw==
X-Gm-Gg: AR+sD11BcKJyOrLU4j4/P+MwCZc4FrbacOfqSUOHCXUsmFn5gvHFYtV4h6tkyEuuA4e
	Yt3X0p1GCSIiozgm2swJGzvEcG1dOOMCgeVIhhkWgJst2c0TR88ddO39jea88TJK1GM35MreXny
	Wo+2B6NI0yA6KfDkj+SBmtFgfO/pwDKku5ssABncoAW0HXtOZPdud9xIys9qCGF4EtQKJhEeWDF
	BlU69YilEblVxMrEAALhkfQbB402RC9m8i/4WCFyjGkt5eiYAbn1IntPB660G/i2s/e/NTlq6db
	HU/0U5v2PHtchwx0j3XD8U2rkTqB6YFH2gYu6kNrvenUbxaNJEhVos6BGqM2VuPCsbMmQdyRvsX
	9B5A=
X-Received: by 2002:a05:6402:210e:b0:6a1:dbd:bfe with SMTP id
 4fb4d7f45d1cf-6a10dbd14d3mr6487020a12.7.1785845595738; Tue, 04 Aug 2026
 05:13:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
 <20260801-b4-dts-coding-style-strict-v2-8-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-8-f09a659ab80d@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Aug 2026 13:13:04 +0100
X-Gm-Features: AUfX_mwc02vgie46TBnIUko-uRbRaYK1so1vlpZtpYgOnY3URFkF56TQorxPBfo
Message-ID: <CADrjBPo0OzJP7UmnW2igYyqhWxbrdF_fmj0xrvX_0N6P3tNoXg@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] arm64: dts: fsd: Align continued properties and
 add missing blank lines
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 1 Aug 2026 at 16:07, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Trivial white-space only changes to adjust to DTS coding style and fix
> dt-check-style strict warnings like:
>
>   [required-blank-lines] child node must be preceded by a blank line
>   [continuation-alignment] continuation should align to column 39 (under =
< or ")
>
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/tesla/fsd-evb.dts |  2 +
>  arch/arm64/boot/dts/tesla/fsd.dtsi    | 97 +++++++++++++++++++----------=
------
>  2 files changed, 55 insertions(+), 44 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/=
tesla/fsd-evb.dts
> index 73b6a25e0e4d..503abe52a81c 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> @@ -53,9 +53,11 @@ simple-audio-card,dai-link@0 {
>                         cpu-0 {
>                                 sound-dai =3D <&i2s_0 0>;
>                         };
> +
>                         cpu-1 {
>                                 sound-dai =3D <&i2s_0 1>;
>                         };
> +
>                         codec {
>                                 sound-dai =3D <&tlv320aic3x>;
>                                 system-clock-frequency =3D <33000000>;
> diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tes=
la/fsd.dtsi
> index 214d33ca7177..6766c78243a3 100644
> --- a/arch/arm64/boot/dts/tesla/fsd.dtsi
> +++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
> @@ -43,12 +43,15 @@ cluster0 {
>                                 core0 {
>                                         cpu =3D <&cpucl0_0>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpucl0_1>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpucl0_2>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpucl0_3>;
>                                 };
> @@ -58,12 +61,15 @@ cluster1 {
>                                 core0 {
>                                         cpu =3D <&cpucl1_0>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpucl1_1>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpucl1_2>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpucl1_3>;
>                                 };
> @@ -73,12 +79,15 @@ cluster2 {
>                                 core0 {
>                                         cpu =3D <&cpucl2_0>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpucl2_1>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpucl2_2>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpucl2_3>;
>                                 };
> @@ -456,13 +465,13 @@ clock_imem: clock-controller@10010000 {
>                         reg =3D <0x0 0x10010000 0x0 0x3000>;
>                         #clock-cells =3D <1>;
>                         clocks =3D <&fin_pll>,
> -                               <&clock_cmu DOUT_CMU_IMEM_TCUCLK>,
> -                               <&clock_cmu DOUT_CMU_IMEM_ACLK>,
> -                               <&clock_cmu DOUT_CMU_IMEM_DMACLK>;
> +                                <&clock_cmu DOUT_CMU_IMEM_TCUCLK>,
> +                                <&clock_cmu DOUT_CMU_IMEM_ACLK>,
> +                                <&clock_cmu DOUT_CMU_IMEM_DMACLK>;
>                         clock-names =3D "fin_pll",
> -                               "dout_cmu_imem_tcuclk",
> -                               "dout_cmu_imem_aclk",
> -                               "dout_cmu_imem_dmaclk";
> +                                     "dout_cmu_imem_tcuclk",
> +                                     "dout_cmu_imem_aclk",
> +                                     "dout_cmu_imem_dmaclk";
>                 };
>
>                 clock_cmu: clock-controller@11c10000 {
> @@ -499,17 +508,17 @@ clock_peric: clock-controller@14010000 {
>                         reg =3D <0x0 0x14010000 0x0 0x3000>;
>                         #clock-cells =3D <1>;
>                         clocks =3D <&fin_pll>,
> -                               <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV4>,
> -                               <&clock_cmu DOUT_CMU_PERIC_SHARED1DIV36>,
> -                               <&clock_cmu DOUT_CMU_PERIC_SHARED0DIV3_TB=
UCLK>,
> -                               <&clock_cmu DOUT_CMU_PERIC_SHARED0DIV20>,
> -                               <&clock_cmu DOUT_CMU_PERIC_SHARED1DIV4_DM=
ACLK>;
> +                                <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV4>,
> +                                <&clock_cmu DOUT_CMU_PERIC_SHARED1DIV36>=
,
> +                                <&clock_cmu DOUT_CMU_PERIC_SHARED0DIV3_T=
BUCLK>,
> +                                <&clock_cmu DOUT_CMU_PERIC_SHARED0DIV20>=
,
> +                                <&clock_cmu DOUT_CMU_PERIC_SHARED1DIV4_D=
MACLK>;
>                         clock-names =3D "fin_pll",
> -                               "dout_cmu_pll_shared0_div4",
> -                               "dout_cmu_peric_shared1div36",
> -                               "dout_cmu_peric_shared0div3_tbuclk",
> -                               "dout_cmu_peric_shared0div20",
> -                               "dout_cmu_peric_shared1div4_dmaclk";
> +                                     "dout_cmu_pll_shared0_div4",
> +                                     "dout_cmu_peric_shared1div36",
> +                                     "dout_cmu_peric_shared0div3_tbuclk"=
,
> +                                     "dout_cmu_peric_shared0div20",
> +                                     "dout_cmu_peric_shared1div4_dmaclk"=
;
>                 };
>
>                 sysreg_peric: system-controller@14030000 {
> @@ -522,13 +531,13 @@ clock_fsys0: clock-controller@15010000 {
>                         reg =3D <0x0 0x15010000 0x0 0x3000>;
>                         #clock-cells =3D <1>;
>                         clocks =3D <&fin_pll>,
> -                               <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV6>,
> -                               <&clock_cmu DOUT_CMU_FSYS0_SHARED1DIV4>,
> -                               <&clock_cmu DOUT_CMU_FSYS0_SHARED0DIV4>;
> +                                <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV6>,
> +                                <&clock_cmu DOUT_CMU_FSYS0_SHARED1DIV4>,
> +                                <&clock_cmu DOUT_CMU_FSYS0_SHARED0DIV4>;
>                         clock-names =3D "fin_pll",
> -                               "dout_cmu_pll_shared0_div6",
> -                               "dout_cmu_fsys0_shared1div4",
> -                               "dout_cmu_fsys0_shared0div4";
> +                                     "dout_cmu_pll_shared0_div6",
> +                                     "dout_cmu_fsys0_shared1div4",
> +                                     "dout_cmu_fsys0_shared0div4";
>                 };
>
>                 sysreg_fsys0: system-controller@15030000 {
> @@ -541,11 +550,11 @@ clock_fsys1: clock-controller@16810000 {
>                         reg =3D <0x0 0x16810000 0x0 0x3000>;
>                         #clock-cells =3D <1>;
>                         clocks =3D <&fin_pll>,
> -                               <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV8>,
> -                               <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV4>;
> +                                <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV8>,
> +                                <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV4>;
>                         clock-names =3D "fin_pll",
> -                               "dout_cmu_fsys1_shared0div8",
> -                               "dout_cmu_fsys1_shared0div4";
> +                                     "dout_cmu_fsys1_shared0div8",
> +                                     "dout_cmu_fsys1_shared0div4";
>                 };
>
>                 sysreg_fsys1: system-controller@16830000 {
> @@ -921,7 +930,7 @@ spi_0: spi@14140000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         clocks =3D <&clock_peric PERIC_PCLK_SPI0>,
> -                               <&clock_peric PERIC_SCLK_SPI0>;
> +                                <&clock_peric PERIC_SCLK_SPI0>;
>                         clock-names =3D "spi", "spi_busclk0";
>                         samsung,spi-src-clk =3D <0>;
>                         pinctrl-names =3D "default";
> @@ -940,7 +949,7 @@ spi_1: spi@14150000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         clocks =3D <&clock_peric PERIC_PCLK_SPI1>,
> -                               <&clock_peric PERIC_SCLK_SPI1>;
> +                                <&clock_peric PERIC_SCLK_SPI1>;
>                         clock-names =3D "spi", "spi_busclk0";
>                         samsung,spi-src-clk =3D <0>;
>                         pinctrl-names =3D "default";
> @@ -959,7 +968,7 @@ spi_2: spi@14160000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         clocks =3D <&clock_peric PERIC_PCLK_SPI2>,
> -                               <&clock_peric PERIC_SCLK_SPI2>;
> +                                <&clock_peric PERIC_SCLK_SPI2>;
>                         clock-names =3D "spi", "spi_busclk0";
>                         samsung,spi-src-clk =3D <0>;
>                         pinctrl-names =3D "default";
> @@ -973,21 +982,21 @@ timer@10040000 {
>                         compatible =3D "tesla,fsd-mct", "samsung,exynos42=
10-mct";
>                         reg =3D <0x0 0x10040000 0x0 0x800>;
>                         interrupts =3D <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
> -                               <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
> +                                    <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks =3D <&fin_pll>, <&clock_imem IMEM_MCT_PCLK=
>;
>                         clock-names =3D "fin_pll", "mct";
>                 };
>
> --
> 2.53.0
>

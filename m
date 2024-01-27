Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9649A67C61
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Jan 2024 02:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706324119; cv=none; b=fSiJigub2+4dbuVJdfsnE/bArCXlKRLMu9ymY7RET3tZ4KqPpgAHahbGue6EF27DPV3nVRz8lQrPCGzVE/ulEdmjDXM2TfDumo6A0tELj7S4iKVyyBkZLAjCtFLbn1hNe2nDhzskTpek8Kvy+cNgR0sjyWLzo3AkajPDgZnpvvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706324119; c=relaxed/simple;
	bh=i311P06eZov7v52pqTZ1nhqFUunMPQzcjsVlFlE9eOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oVndauqhNRiC4BRyn4gxMczBDP1hRq/45Qh8VEMQa4ukHNLk1rlHwsXiwnonMpErkPfsh9/NAB7AjdeNnfzTsIbjRNHvHyz86sNi3Alz1+LkX4ocB+2F7HgCf+AigptH740LBVHPukpd8nGQq5iMfbj6FOKSegy0JySD7VjR/08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SKc7yIMg; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SKc7yIMg"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7838d13395dso72385385a.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 18:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706324115; x=1706928915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksqAgO2RRZiPMGE/C/l2vihk5uqwM1gE4fub4G1W2qo=;
        b=SKc7yIMgKIawyB8yuVdwkfMQpoq22u+CeBGumlJzfAr/q2aojMKju4vzVh8OGP2rAw
         8g922Ddk5y59n62bTf7tryFtlhJLAIVxDmlaXeWEXIvvj6yFhAGVNHZd+IEacTssyCcB
         vIkSHiYgMj6E3+MByij1B/GwNDqYFUtAiF3rye/pJU3A42uTcwaeo7JYYgjYZqWMyrBS
         axszl5LvBJkL+x1tP3Gn1BX/xkooCYyD643/7/V/5VEdYTX7TGZypDFB8s19ovN9kPV4
         ekUoFphnn9tFNQV1pp4u1z5i845GKYG/sJbJf6TXe0/i71YytHBFlxRgz9zTh7NDE3Lb
         F0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706324115; x=1706928915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksqAgO2RRZiPMGE/C/l2vihk5uqwM1gE4fub4G1W2qo=;
        b=fCiSAdg1ggHUYsKHsN5JkFpB/BIHErJi+0vuvm05dlC+0NkMkGlnwZCfN2Y0oIr4ct
         Y712irZpvCfMjW4P+Mot4pI3ej50M4DpaVFSYxiolHYW+9nQ4A9FyHB1WzYY3Ovi7I6w
         Tlh9PdoNZVuEgqXftEw0EK8E4Ybx2Vqky0Z66rWDUaInDUTMDsF+qB1fa8O7PiKTI89M
         HsT6eN9vElVDIPLFUsMFFffKY1lbqPY7y+gS1g1W2yx0d8SEqB5VIgo79ykAPKbizCOP
         pWhUZ84YoyDEmrMvyfbKegqbrI6NXYvvJq9oKXfqCSrknG51hwW4kQfYY7m0tJQ3tI4B
         mWRA==
X-Gm-Message-State: AOJu0Ywp7aNogmtIrZ9yhlPj0s1/2Vp0rCAyYePLBsZpxFlmU2YsuojV
	Y7lgscfq9LGbUf6guMw824mv+r9Os40Bco+2f6ALdUctXfzFYOJIAson6tSEh1UuTNGmBm9hSjw
	3Trzzr5L7u0WNR3JKB7WlItJ4YYbvW2LQ6HDtnQ==
X-Google-Smtp-Source: AGHT+IFDBwyfTlPc8cmG6AXQgmKOxitQON2DOVYvG4Y+djLqXNNTBpvOJZJESMp45x1tITi4s25vBCqDag8Zi9eQsEg=
X-Received: by 2002:a05:620a:6291:b0:783:45ec:c8d6 with SMTP id
 ov17-20020a05620a629100b0078345ecc8d6mr951837qkn.72.1706324115393; Fri, 26
 Jan 2024 18:55:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127001926.495769-1-andre.draszik@linaro.org> <20240127001926.495769-6-andre.draszik@linaro.org>
In-Reply-To: <20240127001926.495769-6-andre.draszik@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 26 Jan 2024 20:55:04 -0600
Message-ID: <CAPLW+4=rgcftDjd-KDg0G8_JYa9XEBdFB+B42o5JSjEXkr7VNw@mail.gmail.com>
Subject: Re: [PATCH 5/9] arm64: dts: exynos: gs101: define USI12 with I2C configuration
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, alim.akhtar@samsung.com, 
	s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 6:19=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> On the gs101-oriole board, i2c bus 12 has various USB-related
> controllers attached to it.
>
> Note the selection of the USI protocol is intentionally left for the
> board dts file.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 30 ++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index 5088c81fd6aa..d66590fa922f 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -450,6 +450,36 @@ pinctrl_peric1: pinctrl@10c40000 {
>                         interrupts =3D <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH 0=
>;
>                 };
>
> +               usi12: usi@10d500c0 {
> +                       compatible =3D "google,gs101-usi",
> +                                    "samsung,exynos850-usi";

It doesn't fit on one line?

> +                       reg =3D <0x10d500c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TO=
P0_PCLK_5>,
> +                                <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0=
_IPCLK_5>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&sysreg_peric1 0x1010>;
> +                       samsung,mode =3D <USI_V2_NONE>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_12: i2c@10d50000 {
> +                               compatible =3D "google,gs101-hsi2c",
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x10d50000 0xc0>;
> +                               interrupts =3D <GIC_SPI 655 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               pinctrl-names =3D "default";
> +                               pinctrl-0 =3D <&hsi2c12_bus>;

I remember Krzysztof asked me to put pinctrl-0 first in my recent
patches. Not sure how important it is, just saying. Other than that,
LGTM:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> +                               clocks =3D <&cmu_peric1 CLK_GOUT_PERIC1_P=
ERIC1_TOP0_IPCLK_5>,
> +                                        <&cmu_peric1 CLK_GOUT_PERIC1_PER=
IC1_TOP0_PCLK_5>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
>                 pinctrl_hsi1: pinctrl@11840000 {
>                         compatible =3D "google,gs101-pinctrl";
>                         reg =3D <0x11840000 0x00001000>;
> --
> 2.43.0.429.g432eaa2c6b-goog
>

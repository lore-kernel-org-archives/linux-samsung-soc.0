Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02613C9454
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Aug 2026 12:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845477; cv=pass; b=WoOnuPhwQkTML8/5CqS5GMik2J827wfj6TMVOoeRn5x4+KtQ2s31cxsk5/g4qVfDuAWb4+BMCuq59nTI9aI5fWuuY542vV/N6Nk5+AuPRS3oOLeJr3dlU7WFLLQuS7irGrJe2HLZg7qb0mazlmum5GfQVJVv6UxvsuMJ7d5LNRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845477; c=relaxed/simple;
	bh=Gr3C9Mq5fizdD4bEhfnqXxFR6nY2tY+5ZhBR7fqzklU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qVMQ3ZYNz7K4dwc0szv3mqD1fUyqUuiuGAc0r8Iz2q40o4/xstGPtIY5j6e6NuVWD7byfochKx80P2DT8VB6v7yHuy2OWfnFUFMu2jXUPlzPcewuUovkiBBq3u/yKrxgTjwa1iY72RaKBRlTKY3dSpIGzklJvbMwbtOliBtsSUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ETFXiHCM; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ETFXiHCM"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so3533575a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Aug 2026 05:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785845471; cv=none;
        d=google.com; s=arc-20260327;
        b=eMWReLkINt6DA9vx5P8egvUwVT7GGS6lUWmpspT4Cf8vDYAVUPolwuKSegLzHGxGzV
         FZ4YJkhv6eqOHbQXiGqrLZpAfZaPgnWzBUGnXfu+AxJV+1z34BxMOR1nkF+Z5sg6T0dU
         j4I493Mdyqy4WEgpC3y2GLYuEBNcbggfY1iQB25UMP9i5iwMSUgcVni1qoi4Z0MnoFRr
         rl+N/vAlMEZ4y4JstFzxVuRlgn7EohCYDjbVJ/lkf/ifdno6k6O8lcxOhgwHv7xZqA1b
         dcL9jutUj7BYVCNytKH5XMCqMMlxHC9QpZgAH3E5ULVCWNxlkBbMNkZBFa3DUA1TpAqF
         2ONw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vsb3Aci/GG0JEhBuZG8dTyz17+bE8CWDjlzeaMl85XE=;
        fh=c0MryEVEPuPLzwjG1ZP4AxKMJ+gb//HnfUc5ePUpkjc=;
        b=YlBhzku4TCr4tJPgFUXM5Y5HuJwi22nIJVc92mq1MHrG1+MQPJ/vwlCtgoJXCcYNNK
         s1HxJoxt+5A8IlHp5aVH47HuIdoYKtiasLabIKIDRMXX1YcQRAgWRGv022L5dCvhOKtK
         r1hAHmEb+gC+JdSHubV1XMWyi2QT23BlZwdKFS3SC6C0HF1ax8BuxIUja5PdO2LOzcw+
         WcVEs6Xy8OjQrLCDvJMbG4UM6VqgGER2080hoxmBrOMghFianMpZYx18g4gbgj7dhqpK
         9GJkvETdVBVCYiemqvQAo64hd728qydr8VrTBIB27kVx88Kjn7YeUgqgfjz8A2fAvYqZ
         QPng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785845471; x=1786450271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vsb3Aci/GG0JEhBuZG8dTyz17+bE8CWDjlzeaMl85XE=;
        b=ETFXiHCMdidCy5TQn/FhOgM8qu8LAEddVdPM0Dksw/Xm8/XsfR/IKaBxzdn3IWlWma
         tfd+GjtCtfHMM1I+7cksOCCDkTOTtIPiruCHlcjiG29uLnAx+cfyE9y8dynThZojSIVh
         3rYJR6OhOpWGG4SnHK9rULV8JqjACyylaHZSM1e5vqiyAaQ84LoRD+8AcnZsRPiczzRo
         Y12s9XUDlNW8gs3FY9JER/KM5IO1YFMiEpVN3i7CqiPOyn/SbqPKxp4Z7Pe5hnP9cZBM
         OZyLSrAOiz/7lo29UqkRi9GHCAgQbJtyKwYuJaTXytdaIiGQJ0ZEprE9MyIPuXwlsLNo
         WK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845471; x=1786450271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vsb3Aci/GG0JEhBuZG8dTyz17+bE8CWDjlzeaMl85XE=;
        b=XAaLa2Xj7UMS1TuRu8LnqKHRl+I5g8yZhdVwKwGcpXzd3adXRjJZZiEMAOooztAzAV
         kaIIeJYSMvYJ0l6xOQtviCaXR+eqH90CVUZ7neCjC4YB0ZMbIWUgO8vCiig2SG8dHf9h
         rZs0lVnzOCkOhcaQIXV5M4/7PtX4BNb313vlVtLi7HQxY4TY5ruCo1huceA32BWYG9Aj
         /Q+taZpv0O2gqz5sMzTXmOe76RLnWYBmi8VEbhR87NwAR/lYxpE6q/kNHpvXXH+zvFwH
         vBuHGBoCHumMxHc2eyenK8ZisaLP4GpfeRCBIKA02fXFB7h8RYkXoyWkdLtHgOe0Hj/b
         JpeQ==
X-Forwarded-Encrypted: i=1; AHgh+Rou7wPM1MG7OhBMUsmTZQ+n7bnYxANKmzksi3ecF3MQ6QNgP9kCdhHdT+8+XuAWWzq7/jxfZ4NJN5aA1ihpW9QyYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmzKJJhQkKnqxZEvgTOBg2PTXaaXz+VFuGlLXpcr1QOZjkm7I2
	RVaqHlMPTeSbX24IqTyRAGb92xKlfv0vWe8fuS5ZV5DoBQfeDXx3RFgArzdLejcbiL3lfyYUYEI
	awRQAuxHsYmeTIhq1IK1SfOCTrGKxMd38sY8WdaWo+61buDdh5vgA3aM=
X-Gm-Gg: AR+sD11uocXsdspSyxlsjTdvlWd0xsfFa89HQ7avClspUFmZIIQZnEalCsUJvEaXdAV
	iS4r6KcL04itZU0wQWx+tn8g0NyDvpkPrwZ8JP3WAIO325GIwEGb6r/743e/cBqvoKhpqmMntYa
	7Ke+1EDExqZJLuXBCLIm7lnWog3yaLRGoy5+lSfUC5mu/WN3sKbcAf/uJFpoRhTm83bFJ0Niqhw
	vqP+22g50I6YI70paN8W6tPzjzTrLJvYi33jcoCqyYCRKqrfPxNabSRE8pUFgNI8yJquh6M1y/B
	LYfZKvtUXZh3I9Cx+xmUwN689buqQDzrQJIR95sbmO9U+/sSJJ38JMUn+q2SZ/+xZ4agfx1MRSb
	BMPkQ
X-Received: by 2002:a05:6402:42c5:b0:698:5f47:1d41 with SMTP id
 4fb4d7f45d1cf-6a0a7cc81e9mr11814433a12.14.1785845470442; Tue, 04 Aug 2026
 05:11:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
 <20260801-b4-dts-coding-style-strict-v2-5-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-5-f09a659ab80d@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Aug 2026 13:10:58 +0100
X-Gm-Features: AUfX_my5weg2jT-uccSdiEFc7BxP_O2P68CgoTH8rcU0z9Km9jZ7ROsAlTYjpo8
Message-ID: <CADrjBPp_m=XSn1rMTbXbRtdCQec8dh8kFnESBHtszs1wvd3TKg@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] arm64: dts: google: Move 'status' to the end to
 match coding style
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
> 'status' property is special, thus DTS coding style expects it to be
> always the last property preceded with a blank line, as reported by
> dt-check-style:
>
>   [required-blank-lines] "status" must be preceded by a blank line
>   [property-order] property 'vcc-supply' out of canonical order (should s=
ort before 'status')
>
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |  2 +
>  .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 12 +++-
>  arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |  2 +
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 70 ++++++++++++++++=
++++++
>  4 files changed, 85 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/ar=
m64/boot/dts/exynos/google/gs101-oriole.dts
> index 36721adcaa23..c5a3958c2320 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> @@ -39,6 +39,7 @@ ldo31m {
>
>  &cont_splash_mem {
>         reg =3D <0x0 0xfac00000 (1080 * 2400 * 4)>;
> +
>         status =3D "okay";
>  };
>
> @@ -47,5 +48,6 @@ &framebuffer0 {
>         height =3D <2400>;
>         stride =3D <(1080 * 4)>;
>         format =3D "a8r8g8b8";
> +
>         status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/=
arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> index 5227cd4e314b..a12f2b88d72d 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> @@ -32,6 +32,7 @@ framebuffer0: framebuffer-0 {
>                         vci-supply =3D <&s2mpg10_ldo22m>;
>                         vddi-supply =3D <&s2mpg11_bucka>;
>                         /* format properties to be added by actual board =
*/
> +
>                         status =3D "disabled";
>                 };
>         };
> @@ -98,6 +99,7 @@ cont_splash_mem: splash@fac00000 {
>                         /* size to be updated by actual board */
>                         reg =3D <0x0 0xfac00000 0x0>;
>                         no-map;
> +
>                         status =3D "disabled";
>                 };
>         };
> @@ -856,8 +858,9 @@ &serial_0 {
>  };
>
>  &ufs_0 {
> -       status =3D "okay";
>         vcc-supply =3D <&ufs_0_fixed_vcc_reg>;
> +
> +       status =3D "okay";
>  };
>
>  &ufs_0_phy {
> @@ -867,6 +870,7 @@ &ufs_0_phy {
>  &usbdrd31 {
>         vdd10-supply =3D <&reg_placeholder>;
>         vdd33-supply =3D <&reg_placeholder>;
> +
>         status =3D "okay";
>  };
>
> @@ -875,6 +879,7 @@ &usbdrd31_dwc3 {
>         usb-role-switch;
>         role-switch-default-mode =3D "peripheral";
>         maximum-speed =3D "super-speed-plus";
> +
>         status =3D "okay";
>
>         port {
> @@ -893,6 +898,7 @@ &usbdrd31_phy {
>         vdd33-usb20-supply =3D <&reg_placeholder>;
>         vdda-usbdp-supply =3D <&reg_placeholder>;
>         vddh-usbdp-supply =3D <&reg_placeholder>;
> +
>         status =3D "okay";
>
>         port {
> @@ -904,20 +910,24 @@ usbdrd31_phy_orien_switch: endpoint {
>
>  &usi_uart {
>         samsung,clkreq-on; /* needed for UART mode */
> +
>         status =3D "okay";
>  };
>
>  &usi8 {
>         samsung,mode =3D <USI_MODE_I2C>;
> +
>         status =3D "okay";
>  };
>
>  &usi12 {
>         samsung,mode =3D <USI_MODE_I2C>;
> +
>         status =3D "okay";
>  };
>
>  &watchdog_cl0 {
>         timeout-sec =3D <30>;
> +
>         status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts b/arch/arm=
64/boot/dts/exynos/google/gs101-raven.dts
> index a422542715f2..7c4273796a22 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
> @@ -35,6 +35,7 @@ ldo14s {
>
>  &cont_splash_mem {
>         reg =3D <0x0 0xfac00000 (1440 * 3120 * 4)>;
> +
>         status =3D "okay";
>  };
>
> @@ -43,5 +44,6 @@ &framebuffer0 {
>         height =3D <3120>;
>         stride =3D <(1440 * 4)>;
>         format =3D "a8r8g8b8";
> +
>         status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index 86933f22647b..edc38f2d1183 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -624,6 +624,7 @@ watchdog_cl0: watchdog@10060000 {
>                         interrupts =3D <GIC_SPI 765 IRQ_TYPE_LEVEL_HIGH 0=
>;
>                         samsung,syscon-phandle =3D <&pmu_system_controlle=
r>;
>                         samsung,cluster-index =3D <0>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -636,6 +637,7 @@ watchdog_cl1: watchdog@10070000 {
>                         interrupts =3D <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH 0=
>;
>                         samsung,syscon-phandle =3D <&pmu_system_controlle=
r>;
>                         samsung,cluster-index =3D <1>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -707,6 +709,7 @@ usi1: usi@109000c0 {
>                                  <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0=
_IPCLK_0>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x1000>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_1: i2c@10900000 {
> @@ -721,6 +724,7 @@ hsi2c_1: i2c@10900000 {
>                                 interrupts =3D <GIC_SPI 635 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c1_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -734,6 +738,7 @@ serial_1: serial@10900000 {
>                                 pinctrl-0 =3D <&uart1_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -748,6 +753,7 @@ spi_1: spi@10900000 {
>                                 interrupts =3D <GIC_SPI 635 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi1_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -762,6 +768,7 @@ usi2: usi@109100c0 {
>                                  <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0=
_IPCLK_1>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x1004>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_2: i2c@10910000 {
> @@ -776,6 +783,7 @@ hsi2c_2: i2c@10910000 {
>                                 interrupts =3D <GIC_SPI 636 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c2_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -789,6 +797,7 @@ serial_2: serial@10910000 {
>                                 pinctrl-0 =3D <&uart2_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -803,6 +812,7 @@ spi_2: spi@10910000 {
>                                 interrupts =3D <GIC_SPI 636 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi2_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -817,6 +827,7 @@ usi3: usi@109200c0 {
>                                  <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0=
_IPCLK_2>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x1008>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_3: i2c@10920000 {
> @@ -831,6 +842,7 @@ hsi2c_3: i2c@10920000 {
>                                 interrupts =3D <GIC_SPI 637 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c3_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -844,6 +856,7 @@ serial_3: serial@10920000 {
>                                 pinctrl-0 =3D <&uart3_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -858,6 +871,7 @@ spi_3: spi@10920000 {
>                                 interrupts =3D <GIC_SPI 637 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi3_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -872,6 +886,7 @@ usi4: usi@109300c0 {
>                                  <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0=
_IPCLK_3>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x100c>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_4: i2c@10930000 {
> @@ -886,6 +901,7 @@ hsi2c_4: i2c@10930000 {
>                                 interrupts =3D <GIC_SPI 638 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c4_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -899,6 +915,7 @@ serial_4: serial@10930000 {
>                                 pinctrl-0 =3D <&uart4_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -913,6 +930,7 @@ spi_4: spi@10930000 {
>                                 interrupts =3D <GIC_SPI 638 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi4_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -927,6 +945,7 @@ usi5: usi@109400c0 {
>                                  <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0=
_IPCLK_4>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x1010>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_5: i2c@10940000 {
> @@ -941,6 +960,7 @@ hsi2c_5: i2c@10940000 {
>                                 interrupts =3D <GIC_SPI 639 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c5_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -954,6 +974,7 @@ serial_5: serial@10940000 {
>                                 pinctrl-0 =3D <&uart5_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -968,6 +989,7 @@ spi_5: spi@10940000 {
>                                 interrupts =3D <GIC_SPI 639 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi5_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -982,6 +1004,7 @@ usi6: usi@109500c0 {
>                                  <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0=
_IPCLK_5>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x1014>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_6: i2c@10950000 {
> @@ -996,6 +1019,7 @@ hsi2c_6: i2c@10950000 {
>                                 interrupts =3D <GIC_SPI 640 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c6_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1009,6 +1033,7 @@ serial_6: serial@10950000 {
>                                 pinctrl-0 =3D <&uart6_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1023,6 +1048,7 @@ spi_6: spi@10950000 {
>                                 interrupts =3D <GIC_SPI 640 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi6_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1037,6 +1063,7 @@ usi7: usi@109600c0 {
>                                  <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0=
_IPCLK_6>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x1018>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_7: i2c@10960000 {
> @@ -1051,6 +1078,7 @@ hsi2c_7: i2c@10960000 {
>                                 interrupts =3D <GIC_SPI 641 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c7_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1064,6 +1092,7 @@ serial_7: serial@10960000 {
>                                 pinctrl-0 =3D <&uart7_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1078,6 +1107,7 @@ spi_7: spi@10960000 {
>                                 interrupts =3D <GIC_SPI 641 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi7_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1092,6 +1122,7 @@ usi8: usi@109700c0 {
>                                  <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0=
_IPCLK_7>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x101c>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_8: i2c@10970000 {
> @@ -1106,6 +1137,7 @@ hsi2c_8: i2c@10970000 {
>                                 interrupts =3D <GIC_SPI 642 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c8_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1119,6 +1151,7 @@ serial_8: serial@10970000 {
>                                 pinctrl-0 =3D <&uart8_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1133,6 +1166,7 @@ spi_8: spi@10970000 {
>                                 interrupts =3D <GIC_SPI 642 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi8_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1148,6 +1182,7 @@ usi_uart: usi@10a000c0 {
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x1020>;
>                         samsung,mode =3D <USI_MODE_UART>;
> +
>                         status =3D "disabled";
>
>                         serial_0: serial@10a00000 {
> @@ -1160,6 +1195,7 @@ serial_0: serial@10a00000 {
>                                 pinctrl-0 =3D <&uart0_bus>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <256>;
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1174,6 +1210,7 @@ usi14: usi@10a200c0 {
>                                  <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1=
_IPCLK_2>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x1028>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_14: i2c@10a20000 {
> @@ -1188,6 +1225,7 @@ hsi2c_14: i2c@10a20000 {
>                                 interrupts =3D <GIC_SPI 643 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c14_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1201,6 +1239,7 @@ serial_14: serial@10a20000 {
>                                 pinctrl-0 =3D <&uart14_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1215,6 +1254,7 @@ spi_14: spi@10a20000 {
>                                 interrupts =3D <GIC_SPI 643 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi14_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1254,6 +1294,7 @@ usi0: usi@10d100c0 {
>                                  <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0=
_IPCLK_1>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric1 0x1000>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_0: i2c@10d10000 {
> @@ -1268,6 +1309,7 @@ hsi2c_0: i2c@10d10000 {
>                                 interrupts =3D <GIC_SPI 651 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c0_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1281,6 +1323,7 @@ serial_usi0: serial@10d10000 {
>                                 pinctrl-0 =3D <&uart0_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1295,6 +1338,7 @@ spi_0: spi@10d10000 {
>                                 interrupts =3D <GIC_SPI 651 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi0_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1309,6 +1353,7 @@ usi9: usi@10d200c0 {
>                                  <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0=
_IPCLK_2>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric1 0x1004>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_9: i2c@10d20000 {
> @@ -1323,6 +1368,7 @@ hsi2c_9: i2c@10d20000 {
>                                 interrupts =3D <GIC_SPI 652 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c9_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1336,6 +1382,7 @@ serial_9: serial@10d20000 {
>                                 pinctrl-0 =3D <&uart9_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1350,6 +1397,7 @@ spi_9: spi@10d20000 {
>                                 interrupts =3D <GIC_SPI 652 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi9_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1364,6 +1412,7 @@ usi10: usi@10d300c0 {
>                                  <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0=
_IPCLK_3>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric1 0x1008>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_10: i2c@10d30000 {
> @@ -1378,6 +1427,7 @@ hsi2c_10: i2c@10d30000 {
>                                 interrupts =3D <GIC_SPI 653 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c10_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1391,6 +1441,7 @@ serial_10: serial@10d30000 {
>                                 pinctrl-0 =3D <&uart10_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1405,6 +1456,7 @@ spi_10: spi@10d30000 {
>                                 interrupts =3D <GIC_SPI 653 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi10_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1419,6 +1471,7 @@ usi11: usi@10d400c0 {
>                                  <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0=
_IPCLK_4>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric1 0x100c>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_11: i2c@10d40000 {
> @@ -1433,6 +1486,7 @@ hsi2c_11: i2c@10d40000 {
>                                 interrupts =3D <GIC_SPI 654 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c11_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1446,6 +1500,7 @@ serial_11: serial@10d40000 {
>                                 pinctrl-0 =3D <&uart11_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1460,6 +1515,7 @@ spi_11: spi@10d40000 {
>                                 interrupts =3D <GIC_SPI 654 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi11_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1474,6 +1530,7 @@ usi12: usi@10d500c0 {
>                                  <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0=
_IPCLK_5>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric1 0x1010>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_12: i2c@10d50000 {
> @@ -1488,6 +1545,7 @@ hsi2c_12: i2c@10d50000 {
>                                 interrupts =3D <GIC_SPI 655 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c12_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1501,6 +1559,7 @@ serial_12: serial@10d50000 {
>                                 pinctrl-0 =3D <&uart12_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1515,6 +1574,7 @@ spi_12: spi@10d50000 {
>                                 interrupts =3D <GIC_SPI 655 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi12_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1529,6 +1589,7 @@ usi13: usi@10d600c0 {
>                                  <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0=
_IPCLK_6>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric1 0x1014>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_13: i2c@10d60000 {
> @@ -1543,6 +1604,7 @@ hsi2c_13: i2c@10d60000 {
>                                 interrupts =3D <GIC_SPI 656 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c13_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1556,6 +1618,7 @@ serial_13: serial@10d60000 {
>                                 pinctrl-0 =3D <&uart13_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1570,6 +1633,7 @@ spi_13: spi@10d60000 {
>                                 interrupts =3D <GIC_SPI 656 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi13_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1609,6 +1673,7 @@ usbdrd31_phy: phy@11100000 {
>                         clock-names =3D "phy", "ref", "ctrl_aclk", "ctrl_=
pclk", "scl_pclk";
>                         #phy-cells =3D <1>;
>                         samsung,pmu-syscon =3D <&pmu_system_controller>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -1622,6 +1687,7 @@ usbdrd31: usb@11110000 {
>                         clock-names =3D "bus_early", "susp_clk", "link_ac=
lk", "link_pclk";
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
> +
>                         status =3D "disabled";
>
>                         usbdrd31_dwc3: usb@0 {
> @@ -1635,6 +1701,7 @@ usbdrd31_dwc3: usb@0 {
>                                 snps,has-lpm-erratum;
>                                 snps,dis_u2_susphy_quirk;
>                                 snps,dis_u3_susphy_quirk;
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1698,6 +1765,7 @@ ufs_0: ufs@14700000 {
>                         phys =3D <&ufs_0_phy>;
>                         phy-names =3D "ufs-phy";
>                         samsung,sysreg =3D <&sysreg_hsi2 0x710>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -1709,6 +1777,7 @@ ufs_0_phy: phy@14704000 {
>                         #phy-cells =3D <0>;
>                         clocks =3D <&ext_24_5m>;
>                         clock-names =3D "ref_clk";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -1812,6 +1881,7 @@ pinctrl_gsacore: pinctrl@17a80000 {
>                         /* TODO: update once support for this CMU exists =
*/
>                         clocks =3D <0>;
>                         clock-names =3D "pclk";
> +
>                         status =3D "disabled";
>                 };
>
>
> --
> 2.53.0
>

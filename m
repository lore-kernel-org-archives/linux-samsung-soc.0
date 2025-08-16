Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B36C70838
	for <linux-samsung-soc@vger.kernel.org>; Sat, 16 Aug 2025 18:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755367242; cv=none; b=Sxb5kTS8IH0Kct8u6LZX0IIcjVBTdq4eZ+OLLl6RtRNBfOkzBAV6mvammHQzPLwbL/+OCjoWOAueRSREhf/XzbLMfCdkjE1vWFlRWqD0CceVPJl52N/iaeafGLl1hGWy7nIEwD1zL+u+Rlv2yV/NTUlv/JUVanQ2+jcmd6AwH9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755367242; c=relaxed/simple;
	bh=64ZSuiq8BqDKxSYcw/UTD4fad9xAPYUaI47WShUJqE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nuEC802Jb6x5stMbj7xLXk+e4hkoWChi6yLr3yWhX8cie8KZlU/gUC4wRifn8eM+rZ/kVup61vLlxEwFkXFOEWBgVbqfRKceEUL2VKwcv+FDfL7L03PQidi8jV8sxUu4M5ZxeVMa0TO8vDJwzz00q3rnty/3Up2jHoPWWR24wIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r46Bn97l; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r46Bn97l"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e934595701eso272637276.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 16 Aug 2025 11:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755367237; x=1755972037; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZCTYq5ZCYwlILfj8f9MuEtT+CI6eklWh8efZur2Hzs=;
        b=r46Bn97lAld9/ggQXh1lusCEhQ+vzmoe1QAHW7x7rjDvhl8AMnVe1Dw7rOafiJ9H1T
         ghdO5DQ2AhkZMvzwXgs1J3cENWUjcR38OvsshkQx4tCaGvEeTBJTTmP1HEeGaEsGpIrg
         IUTcgzV2mztFfpg5m4Bk6lQjhx+C0UO0z4E9bHlZkkJa6+tvVBm1R9iNaNXFl6AfUj2R
         K5tiJw8RLQeVxfCJPEWTVixvqV84dvxXXaAxu7ybNYNiCxMqJRXo/QZ60G7ka8W64zUj
         jqF9rIlihl6kTfnYPcqh8KNUwTrirUF9oqsTe2fxkqzKS6BVyRbannS1kXbcMmhsoNGG
         MwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755367237; x=1755972037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZCTYq5ZCYwlILfj8f9MuEtT+CI6eklWh8efZur2Hzs=;
        b=f3+ZwGeFCPc7L5Bi9MvWbj/CDjeRQ55v1y0LOB3AyLz41bbDIcKTGS0oXRTbhVOjyI
         T2rBUNBS6T+5QgVrnZF49thxn47CbFHRxRbAzglJE1Q3FjgMHlAsA2/6DoYErpZAKUCu
         RzrLeInv9vWULcO0qGM71IaUrWsERF/IiclKx57H88d4RIvOoL4bI5vHgoWDfDZzHJZp
         qxR5Vmm8lK+aRvti6OCkw8/4rMVvIBbbGKV9un6aESqfef3GluKbrQw0ytmV3uQqc6d5
         NUhABhkFVbptcNUSOWxUWJZCLsgmVvp/sN8/DklEeMJpF7wMsxM1ciSx3mFfEU3MhUTd
         L1gw==
X-Forwarded-Encrypted: i=1; AJvYcCWm1O0bQKrTLfpKrWIM+GfLhfnGu6YlxIGHyblA95QUoePynncIaBiw84g+DwyWH96WBVAg9NSSzIsFKmB/UzLFEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwdX8kZPUrUW+P4Eu0LFHyPrmIjD0H4ozfPFzu4Z4IFMmrtfTV
	VJgNkZ8K/6jR7KQa7Y338aO3SDl8q9Fzagp5v8xhPAre8sJcmH8tdTfiNhKsAxaEEu0Xnibhx4C
	asAPUm6oOgPYcAVfG2d3m00YXHJjnj2dhZ1rk/OTY2g==
X-Gm-Gg: ASbGncu2PrLWDvYOAo89PX+u22kRB8+lPJY+NqignCQ0cSvcYr1Ys5rNNQro7rCaEpe
	M1NiIS4/M4AyP1C1QAElhAWj0l+0HBi9sq497Sfb1ihHfuNzg4Dlu4VDPbJb40l+MUqmPaXRQyC
	QvNH3DoNhW9exMb4bbE6tOxZcjvuVFWakFccl6CvQ5ITzMHUIaX4aeiOPATUuWEI+nTt/jsQrow
	tve8Q==
X-Google-Smtp-Source: AGHT+IFCrYlZ9nM9pk6Hld2TWKgIwH3cqoDUJcu0KMWp0zITx7bmxXHsFZGIzT5pT4FH5qhb3XEoRbKe6tgHRORLBn4=
X-Received: by 2002:a05:6902:72a:b0:e8f:caae:d581 with SMTP id
 3f1490d57ef6-e933dea6e18mr3983368276.13.1755367237007; Sat, 16 Aug 2025
 11:00:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com> <20250815070500.3275491-5-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250815070500.3275491-5-ivo.ivanov.ivanov1@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sat, 16 Aug 2025 13:00:26 -0500
X-Gm-Features: Ac12FXyhyzu69YkaGtpygvbnTkQWSXml0riJWIipA0EuTXcHS9_vFSPvxwzTvas
Message-ID: <CAPLW+4nqB=N1Oa=S=24w-EUvpi6YneOrsLdWUei+mynYQ8QVgw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: exynos2200: define all usi nodes
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 2:07=E2=80=AFAM Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
> Universal Serial Interface (USI) supports three types of serial
> interfaces - uart, i2c and spi. Each protocol can work independently
> and configured using external configuration inputs.
>
> As each USI instance has access to 4 pins, there are multiple possible
> configurations:
> - the first 2 and the last 2 pins can be i2c (sda/scl) or uart (rx/tx)
> - the 4 pins can be used for 4 pin uart or spi
>
> For each group of 4 pins, there is one usi instance that can access all
> 4 pins, and a second usi instance that can be used to set the last 2
> pins in i2c mode. Such configuration can be achieved by setting the
> mode property of usiX and usiX_i2c nodes correctly - if usiX is set
> to take up 2 pins, then usiX_i2c can be set to take the other 2.
> If usiX is set for 4 pins, then usiX_i2c should be left disabled.
>
> Define all the USI nodes from peric0 (usi4), peric1 (usi7-10), peric2
> (usi0-6, usi11) and cmgp (usi0-6_cmgp, 2 pin usi7_cmgp) blocks, as well
> as their respective uart and i2c subnodes. Suffix labels for blocks
> in CMGP instances with _cmgpX, and follow the naming conventions from
> the vendor kernel to avoid confusion.
>

Just a note: upstream kernel community usually doesn't care about
downstream/vendor kernel implementations, and such references are
often frowned upon. The reason is that the vendor kernel code often
doesn't meet upstream kernel standards (to put it mildly), so it's
totally fine to re-implement a feature from scratch before upstreaming
it, if its implementation in the downstream kernel is subpar (even if
it's a device tree).

If by saying "to avoid confusion" you mean some ABI can be broken
(e.g. between kernel and user space), please elaborate. Otherwise I
don't see a strong need for someone to be able to cross-reference the
downstream and upstream device trees -- they are usually two
completely different beasts.

> Spi support will be added later on.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---

The whole node naming scheme here still feels a bit of crazy to me,
but I don't have any strong objections, so:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos2200.dtsi | 1361 ++++++++++++++++++++
>  1 file changed, 1361 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot=
/dts/exynos/exynos2200.dtsi
> index b3a8933a4..933ab7818 100644
> --- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> @@ -7,6 +7,7 @@
>
>  #include <dt-bindings/clock/samsung,exynos2200-cmu.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/samsung,exynos-usi.h>
>
>  / {
>         compatible =3D "samsung,exynos2200";
> @@ -314,6 +315,76 @@ pinctrl_peric0: pinctrl@10430000 {
>                         reg =3D <0x10430000 0x1000>;
>                 };
>
> +               usi4: usi@105000c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x105000c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>=
,
> +                                <&cmu_peric0 CLK_DOUT_PERIC0_USI04>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&syscon_peric0 0x1024>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_8: i2c@10500000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x10500000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric0 CLK_DOUT_PERIC0_U=
SI04>,
> +                                        <&cmu_peric0 CLK_MOUT_PERIC0_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 673 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c8_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +
> +                       serial_6: serial@10500000 {
> +                               compatible =3D "samsung,exynos2200-uart",=
 "google,gs101-uart";
> +                               reg =3D <0x10500000 0xc0>;
> +                               clocks =3D <&cmu_peric0 CLK_MOUT_PERIC0_N=
OC_USER>,
> +                                        <&cmu_peric0 CLK_DOUT_PERIC0_USI=
04>;
> +                               clock-names =3D "uart", "clk_uart_baud0";
> +                               interrupts =3D <GIC_SPI 673 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&uart6_bus_single>;
> +                               pinctrl-names =3D "default";
> +                               samsung,uart-fifosize =3D <64>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi4_i2c: usi@105100c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x105100c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>=
,
> +                                <&cmu_peric0 CLK_DOUT_PERIC0_I2C>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,mode =3D <USI_MODE_I2C>;
> +                       samsung,sysreg =3D <&syscon_peric0 0x1024>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_9: i2c@10510000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x10510000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric0 CLK_DOUT_PERIC0_I=
2C>,
> +                                        <&cmu_peric0 CLK_MOUT_PERIC0_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 672 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c9_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
>                 cmu_peric1: clock-controller@10700000 {
>                         compatible =3D "samsung,exynos2200-cmu-peric1";
>                         reg =3D <0x10700000 0x8000>;
> @@ -336,6 +407,287 @@ pinctrl_peric1: pinctrl@10730000 {
>                         reg =3D <0x10730000 0x1000>;
>                 };
>
> +               usi7: usi@109000c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x109000c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>=
,
> +                                <&cmu_peric1 CLK_DOUT_PERIC1_USI07>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&syscon_peric1 0x2030>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_14: i2c@10900000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x10900000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric1 CLK_DOUT_PERIC1_U=
SI07>,
> +                                        <&cmu_peric1 CLK_MOUT_PERIC1_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 680 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c14_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +
> +                       serial_9: serial@10900000 {
> +                               compatible =3D "samsung,exynos2200-uart",=
 "google,gs101-uart";
> +                               reg =3D <0x10900000 0xc0>;
> +                               clocks =3D <&cmu_peric1 CLK_MOUT_PERIC1_N=
OC_USER>,
> +                                        <&cmu_peric1 CLK_DOUT_PERIC1_USI=
07>;
> +                               clock-names =3D "uart", "clk_uart_baud0";
> +                               interrupts =3D <GIC_SPI 680 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&uart9_bus_single>;
> +                               pinctrl-names =3D "default";
> +                               samsung,uart-fifosize =3D <64>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi7_i2c: usi@109100c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x109100c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric1 CLK_MOUT_PERIC0_NOC_USER>=
,
> +                                <&cmu_peric1 CLK_DOUT_PERIC1_USI07_SPI_I=
2C>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,mode =3D <USI_MODE_I2C>;
> +                       samsung,sysreg =3D <&syscon_peric1 0x2034>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_15: i2c@10910000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x10910000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric1 CLK_DOUT_PERIC1_U=
SI07_SPI_I2C>,
> +                                        <&cmu_peric1 CLK_MOUT_PERIC0_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 679 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c15_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi8: usi@109200c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x109200c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>=
,
> +                                <&cmu_peric1 CLK_DOUT_PERIC1_USI08>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&syscon_peric1 0x2038>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_16: i2c@10920000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x10920000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric1 CLK_DOUT_PERIC1_U=
SI08>,
> +                                        <&cmu_peric1 CLK_MOUT_PERIC1_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 682 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c16_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +
> +                       serial_10: serial@10920000 {
> +                               compatible =3D "samsung,exynos2200-uart",=
 "google,gs101-uart";
> +                               reg =3D <0x10920000 0xc0>;
> +                               clocks =3D <&cmu_peric1 CLK_MOUT_PERIC1_N=
OC_USER>,
> +                                        <&cmu_peric1 CLK_DOUT_PERIC1_USI=
08>;
> +                               clock-names =3D "uart", "clk_uart_baud0";
> +                               interrupts =3D <GIC_SPI 682 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&uart10_bus_single>;
> +                               pinctrl-names =3D "default";
> +                               samsung,uart-fifosize =3D <64>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi8_i2c: usi@109300c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x109300c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric1 CLK_MOUT_PERIC0_NOC_USER>=
,
> +                                <&cmu_peric1 CLK_DOUT_PERIC1_USI08_SPI_I=
2C>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,mode =3D <USI_MODE_I2C>;
> +                       samsung,sysreg =3D <&syscon_peric1 0x203c>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_17: i2c@10930000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x10930000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric1 CLK_DOUT_PERIC1_U=
SI08_SPI_I2C>,
> +                                        <&cmu_peric1 CLK_MOUT_PERIC0_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 681 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c17_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi9: usi@109400c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x109400c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>=
,
> +                                <&cmu_peric1 CLK_DOUT_PERIC1_USI09>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&syscon_peric1 0x2040>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_18: i2c@10940000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x10940000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric1 CLK_DOUT_PERIC1_U=
SI09>,
> +                                        <&cmu_peric1 CLK_MOUT_PERIC1_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 684 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c18_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +
> +                       serial_11: serial@10940000 {
> +                               compatible =3D "samsung,exynos2200-uart",=
 "google,gs101-uart";
> +                               reg =3D <0x10940000 0xc0>;
> +                               clocks =3D <&cmu_peric1 CLK_MOUT_PERIC1_N=
OC_USER>,
> +                                        <&cmu_peric1 CLK_DOUT_PERIC1_USI=
09>;
> +                               clock-names =3D "uart", "clk_uart_baud0";
> +                               interrupts =3D <GIC_SPI 684 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&uart11_bus_single>;
> +                               pinctrl-names =3D "default";
> +                               samsung,uart-fifosize =3D <64>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi9_i2c: usi@109500c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x109500c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric1 CLK_MOUT_PERIC0_NOC_USER>=
,
> +                                <&cmu_peric1 CLK_DOUT_PERIC1_I2C>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,mode =3D <USI_MODE_I2C>;
> +                       samsung,sysreg =3D <&syscon_peric1 0x2044>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_19: i2c@10950000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x10950000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric1 CLK_DOUT_PERIC1_I=
2C>,
> +                                        <&cmu_peric1 CLK_MOUT_PERIC0_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 683 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c19_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi10: usi@109600c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x109600c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>=
,
> +                                <&cmu_peric1 CLK_DOUT_PERIC1_USI10>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&syscon_peric1 0x2048>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_20: i2c@10960000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x10960000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric1 CLK_DOUT_PERIC1_U=
SI10>,
> +                                        <&cmu_peric1 CLK_MOUT_PERIC1_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 686 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c20_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +
> +                       serial_12: serial@10960000 {
> +                               compatible =3D "samsung,exynos2200-uart",=
 "google,gs101-uart";
> +                               reg =3D <0x10960000 0xc0>;
> +                               clocks =3D <&cmu_peric1 CLK_MOUT_PERIC1_N=
OC_USER>,
> +                                        <&cmu_peric1 CLK_DOUT_PERIC1_USI=
10>;
> +                               clock-names =3D "uart", "clk_uart_baud0";
> +                               interrupts =3D <GIC_SPI 686 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&uart12_bus_single>;
> +                               pinctrl-names =3D "default";
> +                               samsung,uart-fifosize =3D <64>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi10_i2c: usi@109700c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x109700c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric1 CLK_MOUT_PERIC0_NOC_USER>=
,
> +                                <&cmu_peric1 CLK_DOUT_PERIC1_I2C>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,mode =3D <USI_MODE_I2C>;
> +                       samsung,sysreg =3D <&syscon_peric1 0x204c>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_21: i2c@10970000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x10970000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric1 CLK_DOUT_PERIC1_I=
2C>,
> +                                        <&cmu_peric1 CLK_MOUT_PERIC0_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 685 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c21_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +
> +               };
> +
>                 cmu_hsi0: clock-controller@10a00000 {
>                         compatible =3D "samsung,exynos2200-cmu-hsi0";
>                         reg =3D <0x10a00000 0x8000>;
> @@ -458,6 +810,496 @@ pinctrl_peric2: pinctrl@11c30000 {
>                         reg =3D <0x11c30000 0x1000>;
>                 };
>
> +               usi0: usi@11d000c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x11d000c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>=
,
> +                                <&cmu_peric2 CLK_DOUT_PERIC2_USI00>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&syscon_peric2 0x2000>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_0: i2c@11d00000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x11d00000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric2 CLK_DOUT_PERIC2_U=
SI00>,
> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 704 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c0_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +
> +                       serial_2: serial@11d00000 {
> +                               compatible =3D "samsung,exynos2200-uart",=
 "google,gs101-uart";
> +                               reg =3D <0x11d00000 0xc0>;
> +                               clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_N=
OC_USER>,
> +                                        <&cmu_peric2 CLK_DOUT_PERIC2_USI=
00>;
> +                               clock-names =3D "uart", "clk_uart_baud0";
> +                               interrupts =3D <GIC_SPI 704 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&uart2_bus_single>;
> +                               pinctrl-names =3D "default";
> +                               samsung,uart-fifosize =3D <64>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi0_i2c: usi@11d100c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x11d100c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>=
,
> +                                <&cmu_peric2 CLK_DOUT_PERIC2_USI00_SPI_I=
2C>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,mode =3D <USI_MODE_I2C>;
> +                       samsung,sysreg =3D <&syscon_peric2 0x2004>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_1: i2c@11d10000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x11d10000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric2 CLK_DOUT_PERIC2_U=
SI00_SPI_I2C>,
> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 703 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c1_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi1: usi@11d200c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x11d200c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>=
,
> +                                <&cmu_peric2 CLK_DOUT_PERIC2_USI01>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&syscon_peric2 0x2008>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_2: i2c@11d20000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x11d20000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric2 CLK_DOUT_PERIC2_U=
SI01>,
> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 706 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c2_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +
> +                       serial_3: serial@11d20000 {
> +                               compatible =3D "samsung,exynos2200-uart",=
 "google,gs101-uart";
> +                               reg =3D <0x11d20000 0xc0>;
> +                               clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_N=
OC_USER>,
> +                                        <&cmu_peric2 CLK_DOUT_PERIC2_USI=
01>;
> +                               clock-names =3D "uart", "clk_uart_baud0";
> +                               interrupts =3D <GIC_SPI 706 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&uart3_bus_single>;
> +                               pinctrl-names =3D "default";
> +                               samsung,uart-fifosize =3D <64>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi1_i2c: usi@11d300c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x11d300c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>=
,
> +                                <&cmu_peric2 CLK_DOUT_PERIC2_USI01_SPI_I=
2C>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,mode =3D <USI_MODE_I2C>;
> +                       samsung,sysreg =3D <&syscon_peric2 0x200c>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_3: i2c@11d30000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x11d30000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric2 CLK_DOUT_PERIC2_U=
SI01_SPI_I2C>,
> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 705 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c3_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi2: usi@11d400c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x11d400c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>=
,
> +                                <&cmu_peric2 CLK_DOUT_PERIC2_USI02>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&syscon_peric2 0x2010>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_4: i2c@11d40000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x11d40000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric2 CLK_DOUT_PERIC2_U=
SI02>,
> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 708 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c4_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +
> +                       serial_4: serial@11d40000 {
> +                               compatible =3D "samsung,exynos2200-uart",=
 "google,gs101-uart";
> +                               reg =3D <0x11d40000 0xc0>;
> +                               clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_N=
OC_USER>,
> +                                        <&cmu_peric2 CLK_DOUT_PERIC2_USI=
02>;
> +                               clock-names =3D "uart", "clk_uart_baud0";
> +                               interrupts =3D <GIC_SPI 708 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&uart4_bus_single>;
> +                               pinctrl-names =3D "default";
> +                               samsung,uart-fifosize =3D <256>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi2_i2c: usi@11d500c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x11d500c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>=
,
> +                                <&cmu_peric2 CLK_DOUT_PERIC2_I2C>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,mode =3D <USI_MODE_I2C>;
> +                       samsung,sysreg =3D <&syscon_peric2 0x2014>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_5: i2c@11d50000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x11d50000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric2 CLK_DOUT_PERIC2_I=
2C>,
> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 707 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c5_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi3: usi@11d600c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x11d600c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>=
,
> +                                <&cmu_peric2 CLK_DOUT_PERIC2_USI03>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&syscon_peric2 0x2018>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_6: i2c@11d60000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x11d60000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric2 CLK_DOUT_PERIC2_U=
SI03>,
> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 710 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c6_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +
> +                       serial_5: serial@11d60000 {
> +                               compatible =3D "samsung,exynos2200-uart",=
 "google,gs101-uart";
> +                               reg =3D <0x11d60000 0xc0>;
> +                               clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_N=
OC_USER>,
> +                                        <&cmu_peric2 CLK_DOUT_PERIC2_USI=
03>;
> +                               clock-names =3D "uart", "clk_uart_baud0";
> +                               interrupts =3D <GIC_SPI 710 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&uart5_bus_single>;
> +                               pinctrl-names =3D "default";
> +                               samsung,uart-fifosize =3D <256>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi3_i2c: usi@11d700c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x11d700c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>=
,
> +                                <&cmu_peric2 CLK_DOUT_PERIC2_I2C>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,mode =3D <USI_MODE_I2C>;
> +                       samsung,sysreg =3D <&syscon_peric2 0x201c>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_7: i2c@11d70000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x11d70000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric2 CLK_DOUT_PERIC2_I=
2C>,
> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 709 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c7_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi5_i2c: usi@11d800c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x11d800c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>=
,
> +                                <&cmu_peric2 CLK_DOUT_PERIC2_I2C>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,mode =3D <USI_MODE_I2C>;
> +                       samsung,sysreg =3D <&syscon_peric2 0x102c>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_11: i2c@11d80000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x11d80000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric2 CLK_DOUT_PERIC2_I=
2C>,
> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 711 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c11_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi6_i2c: usi@11d900c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x11d900c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>=
,
> +                                <&cmu_peric2 CLK_DOUT_PERIC2_I2C>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,mode =3D <USI_MODE_I2C>;
> +                       samsung,sysreg =3D <&syscon_peric2 0x1004>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_13: i2c@11d90000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x11d90000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric2 CLK_DOUT_PERIC2_I=
2C>,
> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 713 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c13_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi11: usi@11da00c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x11da00c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>=
,
> +                                <&cmu_peric2 CLK_DOUT_PERIC2_USI11>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&syscon_peric2 0x1058>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_22: i2c@11da0000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x11da0000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric2 CLK_DOUT_PERIC2_U=
SI11>,
> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 716 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c22_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +
> +                       serial_13: serial@11da0000 {
> +                               compatible =3D "samsung,exynos2200-uart",=
 "google,gs101-uart";
> +                               reg =3D <0x11da0000 0xc0>;
> +                               clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_N=
OC_USER>,
> +                                        <&cmu_peric2 CLK_DOUT_PERIC2_USI=
11>;
> +                               clock-names =3D "uart", "clk_uart_baud0";
> +                               interrupts =3D <GIC_SPI 716 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&uart13_bus_single>;
> +                               pinctrl-names =3D "default";
> +                               samsung,uart-fifosize =3D <64>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi11_i2c: usi@11db00c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x11db00c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>=
,
> +                                <&cmu_peric2 CLK_DOUT_PERIC2_I2C>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,mode =3D <USI_MODE_I2C>;
> +                       samsung,sysreg =3D <&syscon_peric2 0x105c>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_23: i2c@11db0000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x11db0000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric2 CLK_DOUT_PERIC2_I=
2C>,
> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 715 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c23_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi5: usi@11dd00c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x11dd00c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>=
,
> +                                <&cmu_peric2 CLK_DOUT_PERIC2_USI05>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&syscon_peric2 0x117c>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_10: i2c@11dd0000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x11dd0000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric2 CLK_DOUT_PERIC2_U=
SI05>,
> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 538 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c10_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +
> +                       serial_7: serial@11dd0000 {
> +                               compatible =3D "samsung,exynos2200-uart",=
 "google,gs101-uart";
> +                               reg =3D <0x11dd0000 0xc0>;
> +                               clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_N=
OC_USER>,
> +                                        <&cmu_peric2 CLK_DOUT_PERIC2_USI=
05>;
> +                               clock-names =3D "uart", "clk_uart_baud0";
> +                               interrupts =3D <GIC_SPI 538 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&uart7_bus_single>;
> +                               pinctrl-names =3D "default";
> +                               samsung,uart-fifosize =3D <256>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi6: usi@11de00c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x11de00c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>=
,
> +                                <&cmu_peric2 CLK_DOUT_PERIC2_USI06>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&syscon_peric2 0x1180>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_12: i2c@11de0000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x11de0000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_peric2 CLK_DOUT_PERIC2_U=
SI06>,
> +                                        <&cmu_peric2 CLK_MOUT_PERIC2_NOC=
_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 539 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c12_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +
> +                       serial_8: serial@11de0000 {
> +                               compatible =3D "samsung,exynos2200-uart",=
 "google,gs101-uart";
> +                               reg =3D <0x11de0000 0xc0>;
> +                               clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_N=
OC_USER>,
> +                                        <&cmu_peric2 CLK_DOUT_PERIC2_USI=
06>;
> +                               clock-names =3D "uart", "clk_uart_baud0";
> +                               interrupts =3D <GIC_SPI 539 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&uart8_bus_single>;
> +                               pinctrl-names =3D "default";
> +                               samsung,uart-fifosize =3D <64>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
>                 cmu_cmgp: clock-controller@14e00000 {
>                         compatible =3D "samsung,exynos2200-cmu-cmgp";
>                         reg =3D <0x14e00000 0x8000>;
> @@ -485,6 +1327,525 @@ wakeup-interrupt-controller {
>                         };
>                 };
>
> +               usi_cmgp0: usi@14f000c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x14f000c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_=
USER>,
> +                                <&cmu_cmgp CLK_DOUT_CMGP_USI0>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&syscon_cmgp 0x2000>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_24: i2c@14f00000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x14f00000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_cmgp CLK_DOUT_CMGP_USI0>=
,
> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIV=
E_NOC_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 175 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c24_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +
> +                       serial_14: serial@14f00000 {
> +                               compatible =3D "samsung,exynos2200-uart",=
 "google,gs101-uart";
> +                               reg =3D <0x14f00000 0xc0>;
> +                               clocks =3D <&cmu_cmgp CLK_MOUT_CMGP_CLKAL=
IVE_NOC_USER>,
> +                                        <&cmu_cmgp CLK_DOUT_CMGP_USI0>;
> +                               clock-names =3D "uart", "clk_uart_baud0";
> +                               interrupts =3D <GIC_SPI 175 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&uart14_bus_single>;
> +                               pinctrl-names =3D "default";
> +                               samsung,uart-fifosize =3D <64>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi_i2c_cmgp0: usi@14f100c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x14f100c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_=
USER>,
> +                                <&cmu_cmgp CLK_DOUT_CMGP_SPI_I2C0>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,mode =3D <USI_MODE_I2C>;
> +                       samsung,sysreg =3D <&syscon_cmgp 0x2070>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_25: i2c@14f10000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x14f10000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_cmgp CLK_DOUT_CMGP_SPI_I=
2C0>,
> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIV=
E_NOC_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 173 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c25_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi_cmgp1: usi@14f200c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x14f200c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_=
USER>,
> +                                <&cmu_cmgp CLK_DOUT_CMGP_USI1>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&syscon_cmgp 0x2010>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_26: i2c@14f20000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x14f20000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_cmgp CLK_DOUT_CMGP_USI1>=
,
> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIV=
E_NOC_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 176 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c26_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +
> +                       serial_15: serial@14f20000 {
> +                               compatible =3D "samsung,exynos2200-uart",=
 "google,gs101-uart";
> +                               reg =3D <0x14f20000 0xc0>;
> +                               clocks =3D <&cmu_cmgp CLK_MOUT_CMGP_CLKAL=
IVE_NOC_USER>,
> +                                        <&cmu_cmgp CLK_DOUT_CMGP_USI1>;
> +                               clock-names =3D "uart", "clk_uart_baud0";
> +                               interrupts =3D <GIC_SPI 176 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&uart15_bus_single>;
> +                               pinctrl-names =3D "default";
> +                               samsung,uart-fifosize =3D <64>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi_i2c_cmgp1: usi@14f300c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x14f300c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_=
USER>,
> +                                <&cmu_cmgp CLK_DOUT_CMGP_SPI_I2C1>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,mode =3D <USI_MODE_I2C>;
> +                       samsung,sysreg =3D <&syscon_cmgp 0x2074>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_27: i2c@14f30000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x14f30000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_cmgp CLK_DOUT_CMGP_SPI_I=
2C1>,
> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIV=
E_NOC_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c27_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi_cmgp2: usi@14f400c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x14f400c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_=
USER>,
> +                                <&cmu_cmgp CLK_DOUT_CMGP_USI2>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&syscon_cmgp 0x2020>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_28: i2c@14f40000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x14f40000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_cmgp CLK_DOUT_CMGP_USI2>=
,
> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIV=
E_NOC_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 177 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c28_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +
> +                       serial_16: serial@14f40000 {
> +                               compatible =3D "samsung,exynos2200-uart",=
 "google,gs101-uart";
> +                               reg =3D <0x14f40000 0xc0>;
> +                               clocks =3D <&cmu_cmgp CLK_MOUT_CMGP_CLKAL=
IVE_NOC_USER>,
> +                                        <&cmu_cmgp CLK_DOUT_CMGP_USI2>;
> +                               clock-names =3D "uart", "clk_uart_baud0";
> +                               interrupts =3D <GIC_SPI 177 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&uart16_bus_single>;
> +                               pinctrl-names =3D "default";
> +                               samsung,uart-fifosize =3D <64>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi_i2c_cmgp2: usi@14f500c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x14f500c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_=
USER>,
> +                                <&cmu_cmgp CLK_DOUT_CMGP_I2C>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,mode =3D <USI_MODE_I2C>;
> +                       samsung,sysreg =3D <&syscon_cmgp 0x2024>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_29: i2c@14f50000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x14f50000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_cmgp CLK_DOUT_CMGP_I2C>,
> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIV=
E_NOC_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 167 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c29_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi_cmgp3: usi@14f600c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x14f600c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_=
USER>,
> +                                <&cmu_cmgp CLK_DOUT_CMGP_USI3>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&syscon_cmgp 0x2030>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_30: i2c@14f60000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x14f60000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_cmgp CLK_DOUT_CMGP_USI3>=
,
> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIV=
E_NOC_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 178 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c30_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +
> +                       serial_17: serial@14f60000 {
> +                               compatible =3D "samsung,exynos2200-uart",=
 "google,gs101-uart";
> +                               reg =3D <0x14f60000 0xc0>;
> +                               clocks =3D <&cmu_cmgp CLK_MOUT_CMGP_CLKAL=
IVE_NOC_USER>,
> +                                        <&cmu_cmgp CLK_DOUT_CMGP_USI3>;
> +                               clock-names =3D "uart", "clk_uart_baud0";
> +                               interrupts =3D <GIC_SPI 178 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&uart17_bus_single>;
> +                               pinctrl-names =3D "default";
> +                               samsung,uart-fifosize =3D <64>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi_i2c_cmgp3: usi@14f700c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x14f700c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_=
USER>,
> +                                <&cmu_cmgp CLK_DOUT_CMGP_I2C>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,mode =3D <USI_MODE_I2C>;
> +                       samsung,sysreg =3D <&syscon_cmgp 0x2034>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_31: i2c@14f70000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x14f70000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_cmgp CLK_DOUT_CMGP_I2C>,
> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIV=
E_NOC_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 168 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c31_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi_cmgp4: usi@14f800c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x14f800c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_=
USER>,
> +                                <&cmu_cmgp CLK_DOUT_CMGP_USI4>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&syscon_cmgp 0x2040>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_32: i2c@14f80000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x14f80000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_cmgp CLK_DOUT_CMGP_USI4>=
,
> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIV=
E_NOC_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 179 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c32_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +
> +                       serial_18: serial@14f80000 {
> +                               compatible =3D "samsung,exynos2200-uart",=
 "google,gs101-uart";
> +                               reg =3D <0x14f80000 0xc0>;
> +                               clocks =3D <&cmu_cmgp CLK_MOUT_CMGP_CLKAL=
IVE_NOC_USER>,
> +                                        <&cmu_cmgp CLK_DOUT_CMGP_USI4>;
> +                               clock-names =3D "uart", "clk_uart_baud0";
> +                               interrupts =3D <GIC_SPI 179 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&uart18_bus_single>;
> +                               pinctrl-names =3D "default";
> +                               samsung,uart-fifosize =3D <64>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi_i2c_cmgp4: usi@14f900c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x14f900c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_=
USER>,
> +                                <&cmu_cmgp CLK_DOUT_CMGP_I2C>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,mode =3D <USI_MODE_I2C>;
> +                       samsung,sysreg =3D <&syscon_cmgp 0x2044>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_33: i2c@14f90000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x14f90000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_cmgp CLK_DOUT_CMGP_I2C>,
> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIV=
E_NOC_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 169 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c33_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi_cmgp5: usi@14fa00c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x14fa00c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_=
USER>,
> +                                <&cmu_cmgp CLK_DOUT_CMGP_USI5>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&syscon_cmgp 0x2050>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_34: i2c@14fa0000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x14fa0000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_cmgp CLK_DOUT_CMGP_USI5>=
,
> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIV=
E_NOC_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 180 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c34_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +
> +                       serial_19: serial@14fa0000 {
> +                               compatible =3D "samsung,exynos2200-uart",=
 "google,gs101-uart";
> +                               reg =3D <0x14fa0000 0xc0>;
> +                               clocks =3D <&cmu_cmgp CLK_MOUT_CMGP_CLKAL=
IVE_NOC_USER>,
> +                                        <&cmu_cmgp CLK_DOUT_CMGP_USI5>;
> +                               clock-names =3D "uart", "clk_uart_baud0";
> +                               interrupts =3D <GIC_SPI 180 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&uart19_bus_single>;
> +                               pinctrl-names =3D "default";
> +                               samsung,uart-fifosize =3D <64>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi_i2c_cmgp5: usi@14fb00c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x14fb00c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_=
USER>,
> +                                <&cmu_cmgp CLK_DOUT_CMGP_I2C>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,mode =3D <USI_MODE_I2C>;
> +                       samsung,sysreg =3D <&syscon_cmgp 0x2054>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_35: i2c@14fb0000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x14fb0000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_cmgp CLK_DOUT_CMGP_I2C>,
> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIV=
E_NOC_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 170 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c35_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi_cmgp6: usi@14fc00c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x14fc00c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_=
USER>,
> +                                <&cmu_cmgp CLK_DOUT_CMGP_USI6>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&syscon_cmgp 0x2060>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_36: i2c@14fc0000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x14fc0000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_cmgp CLK_DOUT_CMGP_USI6>=
,
> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIV=
E_NOC_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 181 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c36_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +
> +                       serial_20: serial@14fc0000 {
> +                               compatible =3D "samsung,exynos2200-uart",=
 "google,gs101-uart";
> +                               reg =3D <0x14fc0000 0xc0>;
> +                               clocks =3D <&cmu_cmgp CLK_MOUT_CMGP_CLKAL=
IVE_NOC_USER>,
> +                                        <&cmu_cmgp CLK_DOUT_CMGP_USI6>;
> +                               clock-names =3D "uart", "clk_uart_baud0";
> +                               interrupts =3D <GIC_SPI 181 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&uart20_bus_single>;
> +                               pinctrl-names =3D "default";
> +                               samsung,uart-fifosize =3D <64>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi_i2c_cmgp6: usi@14fd00c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x14fd00c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_=
USER>,
> +                                <&cmu_cmgp CLK_DOUT_CMGP_I2C>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,mode =3D <USI_MODE_I2C>;
> +                       samsung,sysreg =3D <&syscon_cmgp 0x2064>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_37: i2c@14fd0000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x14fd0000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_cmgp CLK_DOUT_CMGP_I2C>,
> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIV=
E_NOC_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 171 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c37_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               usi_i2c_cmgp7: usi@14fe00c0 {
> +                       compatible =3D "samsung,exynos2200-usi", "samsung=
,exynos850-usi";
> +                       reg =3D <0x14fe00c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_cmgp CLK_MOUT_CMGP_CLKALIVE_NOC_=
USER>,
> +                                <&cmu_cmgp CLK_DOUT_CMGP_I2C>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,mode =3D <USI_MODE_I2C>;
> +                       samsung,sysreg =3D <&syscon_cmgp 0x2080>;
> +                       status =3D "disabled";
> +
> +                       hsi2c_38: i2c@14fe0000 {
> +                               compatible =3D "samsung,exynos2200-hsi2c"=
,
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x14fe0000 0xc0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&cmu_cmgp CLK_DOUT_CMGP_I2C>,
> +                                        <&cmu_cmgp CLK_MOUT_CMGP_CLKALIV=
E_NOC_USER>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               interrupts =3D <GIC_SPI 127 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               pinctrl-0 =3D <&hsi2c38_bus>;
> +                               pinctrl-names =3D "default";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
>                 cmu_vts: clock-controller@15300000 {
>                         compatible =3D "samsung,exynos2200-cmu-vts";
>                         reg =3D <0x15300000 0x8000>;
> --
> 2.43.0
>
>

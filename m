Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6195522E3E8
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Aug 2025 23:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754089982; cv=none; b=jILGnyHLvVR0kU0xg9ir+6YvTfmunLGwhygg36/XONLWCPFVutGOy9h6WFZSvgt7ccg4LsHC+5HohoeqcMjWSQTIRWm8wybgW7+lOJn55JxKGySNEOleUQqTkh75f4oNpQXr/suu8tq8vh3DxjMClUanwOpPRaFDD4LgezuybWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754089982; c=relaxed/simple;
	bh=cFsxKHNUWz5X8MPXIcuVQApigpPigQKjMIVXFGISYG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bhsSL1QNF0LxkTIvxqRy3gMl5Ylx39wd0Zhnr1422qxXzRhxsNMl3bCdv1EfKu7RAbj9voPKJecGBwWL6hWGsBGIGArv2i8vL758yzLhnskayWkdYcbiUZBDwO83yKqrowbANU/nf8a9h3LAmMfDDdqvQvu69hH5gKws9LPCOVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DLb6kv/p; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DLb6kv/p"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e8e14cf9e2aso2269963276.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Aug 2025 16:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754089978; x=1754694778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qnr0gleEzCaWRPAfwAkPAasxmEHLjKhxCSZjhfl6r00=;
        b=DLb6kv/p0njiWKJONSXelNcyidLwN7ZMYoja5yEtN0CEQ2GU8UPhcZg2YCqZMOn3j3
         4KtaOK3TEftlA7fJeIaxpwcbe8I691a3xihMz1utaQFXjPdWkwV5WLP1JnjQrcnzZoXK
         076IaE/t5ZJQ+ZtjpN4w0H8XazKrWygwzb1oAETsxyDm/OZyoCoynzZXBtLizzSewm6E
         l65fB5ylkGRnDylkxLaNWiCBTmBAHag7mfByBUa78qg9aLEdQDyw4+R94fwuTZ1TH3CQ
         ujOGu5ZrbflALuG0XyUsPv1PGGTveoR4GtGDhftUcjhjSJHig/dyRJMRkclJ2wZ8js6W
         C4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754089978; x=1754694778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qnr0gleEzCaWRPAfwAkPAasxmEHLjKhxCSZjhfl6r00=;
        b=YG36YA1YhkzNC173Xf8zSiM3Y7OIe5AFKi3GcTUnw1Dz5fOnTG4zQDnfV5/lPguMOW
         3looqrli/TjFAA0eB5QYbzUiZxdtYwbxab0S3iFnhIVytzp6RBxRg7aQNZQ9pXlL43+3
         RFurUGgkxwiDJVroL8A/nRL0tUuG7+2a2E0qpIWIo3yL/TWiZrQj0ZiV1IHKOAN97fb3
         syF7VdX78Dum3SIG7/4KfpgBm5XHzi5HXb5iT9CEM8aWWik1zdkQbOm7pub40FOevrp7
         FlLqf9JkIDqht/gZ7Ftx6THWZTeGPiSHVvrwqP6hok5L82adj0Gtv7Tk+5ofInS0u2uA
         85/w==
X-Forwarded-Encrypted: i=1; AJvYcCVXNtQtYzjZsc4slppwkGr6srSfjsKv++BvmrT8BahGK8TOyYN2wphXl3Cc4yexo/gBns2wC2v1sqi39Au4ZHMsxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRqxRgilhZeP0b5RNoeI32gMJVPg73h39hf9e2DJZn4oYqnlrx
	dr4SBSpVVpaFMHd3pl+YzFYi8jcfq18LelVlq7NTsc53K5ohUw+41Iz7553xdhbL7YTpsBLvv+A
	dpm6goJenMPeTthp/MvPrw+Ik1cUIvZUlcZ274eQeXg==
X-Gm-Gg: ASbGncvJSws5hQ0Hyjv52fpudqrIQtPMx6e5WsT/VdWkhWu+kOYJtdE0x6qWNvJDVFS
	dgIr6YDJloQAuolbabBMfOAX0noX8hd8saLB62Nu79EJX7jIPh7f3F5TeHkA56OrCBYMoLoyV6K
	mZfA2LvtN917NGDS7+cpAUdekufA9XPlbABZO+qUX1R7bSRa0AFN/Tg75dok6aKAPvFs+K7H1ak
	8N3Qg==
X-Google-Smtp-Source: AGHT+IFgbhp0zycvCOOvLLcXqyA8OgsubbXQ2AW066KqqN7IDoR7AWFw0XrDwVG6iqqj5YKOJnybVqjIOE+529ZV8Tc=
X-Received: by 2002:a05:690c:d96:b0:71a:1e72:84c6 with SMTP id
 00721157ae682-71b7f5e133emr20973427b3.1.1754089978267; Fri, 01 Aug 2025
 16:12:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com> <20250730074253.1884111-5-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250730074253.1884111-5-ivo.ivanov.ivanov1@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Aug 2025 18:12:47 -0500
X-Gm-Features: Ac12FXzKSBmhmwqRZhR5hadTWEjBctW2rRjuv0sswLAzvNtoYbb40IWjhC7MaD8
Message-ID: <CAPLW+4kOiBOZYQVA-ZiMEn+-_ZF1HD8QTm9AH0y34bcY+Mu92A@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: exynos2200: add serial_0/1 nodes
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 2:43=E2=80=AFAM Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
> Add nodes for serial_0 (UART_DBG) and serial_1 (UART_BT), which
> allows using them.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos2200.dtsi | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot=
/dts/exynos/exynos2200.dtsi
> index bab77b442..22c6da907 100644
> --- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> @@ -336,6 +336,19 @@ pinctrl_peric1: pinctrl@10730000 {
>                         reg =3D <0x10730000 0x1000>;
>                 };
>
> +               serial_1: serial@10840000 {
> +                       compatible =3D "samsung,exynos2200-uart", "google=
,gs101-uart";
> +                       reg =3D <0x10840000 0x100>;
> +                       clocks =3D <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>=
,
> +                                <&cmu_peric1 CLK_DOUT_PERIC1_UART_BT>;
> +                       clock-names =3D "uart", "clk_uart_baud0";
> +                       interrupts =3D <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH 0=
>;
> +                       pinctrl-0 =3D <&uart1_bus>;
> +                       pinctrl-names =3D "default";
> +                       samsung,uart-fifosize =3D <256>;
> +                       status =3D "disabled";
> +               };
> +
>                 cmu_hsi0: clock-controller@10a00000 {
>                         compatible =3D "samsung,exynos2200-cmu-hsi0";
>                         reg =3D <0x10a00000 0x8000>;
> @@ -458,6 +471,19 @@ pinctrl_peric2: pinctrl@11c30000 {
>                         reg =3D <0x11c30000 0x1000>;
>                 };
>
> +               serial_0: serial@11c40000 {
> +                       compatible =3D "samsung,exynos2200-uart", "google=
,gs101-uart";
> +                       reg =3D <0x11c40000 0x100>;
> +                       clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>=
,
> +                                <&cmu_peric2 CLK_DOUT_PERIC2_UART_DBG>;
> +                       clock-names =3D "uart", "clk_uart_baud0";
> +                       interrupts =3D <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH 0=
>;
> +                       pinctrl-0 =3D <&uart0_bus_single>;
> +                       pinctrl-names =3D "default";
> +                       samsung,uart-fifosize =3D <256>;
> +                       status =3D "disabled";
> +               };
> +

Shouldn't these two serial nodes be children of some corresponding USI
nodes? IIUC, the downstream counterpart of this device tree is [1]? I
can see the corresponding USI node is missing there. And if you don't
have the TRM, it might get confusing. But, apart from my intuition
telling me that those UART blocks *should* be implemented as a part of
USI IP blocks in Exynos2200, there is also a fact that the downstream
driver is actually accessing USI registers in exynos_usi_init()
function, in the exynos-uart driver here: [2]. If that's correct, it
means there should exist a USI block, which should be modeled like so:

8<-------------------------------------------------------------------------=
>8
    usi_...: usi@11c400c0 {
        compatible =3D ...;
        reg =3D <0x138200c0 0x20>;
        samsung,sysreg =3D <...>;
        samsung,mode =3D <USI_MODE_UART>;
        #address-cells =3D <1>;
        #size-cells =3D <1>;
        ranges;
        clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
                 <&cmu_peric2 CLK_DOUT_PERIC2_UART_DBG>;
        clock-names =3D "pclk", "ipclk";
        status =3D "disabled";

        serial_0: serial@11c40000 {
            compatible =3D "samsung,exynos2200-uart", "google,gs101-uart";
            reg =3D <0x11c40000 0x100>;
            clocks =3D <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
                     <&cmu_peric2 CLK_DOUT_PERIC2_UART_DBG>;
            clock-names =3D "uart", "clk_uart_baud0";
            interrupts =3D <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH 0>;
            pinctrl-0 =3D <&uart0_bus_single>;
            pinctrl-names =3D "default";
            samsung,uart-fifosize =3D <256>;
            status =3D "disabled";
        };
    };
8<-------------------------------------------------------------------------=
>8

This way you can achieve the same behavior as in downstream kernel, by
making the (upstream) USI driver to initialize corresponding USI
registers for you.

Does that make any sense?

Thanks!

[1] https://github.com/jgudec/android_kernel_samsung_exynos2200/blob/CWAI/a=
rch/arm64/boot/dts/exynos/s5e9925.dts#L4648
[2] https://github.com/jgudec/android_kernel_samsung_exynos2200/blob/CWAI/d=
rivers/tty/serial/exynos_tty.c#L2181


>                 cmu_cmgp: clock-controller@14e00000 {
>                         compatible =3D "samsung,exynos2200-cmu-cmgp";
>                         reg =3D <0x14e00000 0x8000>;
> --
> 2.43.0
>
>

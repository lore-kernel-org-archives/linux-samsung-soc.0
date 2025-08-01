Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0050314AD2B
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Aug 2025 21:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754083001; cv=none; b=HaSpKarE+o6iv9QxBJHCm+s7bqlAITK/KIqpKDz4SWmVXcpeD3kE2clczePiRkwqsCTnpenSkxlfzn46Sb1g6AFvP6mz5SKGhulMwaYBzHpsAfKu3V2nfpdONd33FRbLvKZQvo00LlBJgMsQIlLfAtZ1F9bfm9fr1d1VMEETbXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754083001; c=relaxed/simple;
	bh=myFVlq87fklKUPiuIQ7mZxuvGWj2qxghqoRQXzRge6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ryeQRAbGxi64EJFN6mI6aCY5+nSk/n3UEw9BbJo/76rpx3KtSITCbCFc4ao6sbYVzs7dNXVtXyaaeWe3erA18EDM3oITCedVfoR46ufvdFr6EA4QRgi9c0Xvo9bykVNmYjvPLepo2YxE6kUWkarKe0V/52q0aONYVSbQ+hgGDbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vtEreAKC; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vtEreAKC"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70a57a8ffc3so22901437b3.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Aug 2025 14:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754082999; x=1754687799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqytGXi5W+0oM2gaVZGROmPugYrBG6LtgSr2NAWPIkU=;
        b=vtEreAKCkmqiBVsog63qJEcPFnJmdpOJNXstxwo+sQhC5AxhgUIBX9Y2uAwrkPeZGP
         edmTOLvWIotvvZR2ErncX1zXjK/Wj8H6gg/AM7l0H7SlRchJNGpTAEYehKW+WmfGamqJ
         EDkdz6uXQm2p9aWFNqARGinltoLSKaIkcG4bI/rC2wZYu3hoGZ/WO42zWqHPkDr0WGwY
         7gE6CXMLgXsKX+68xhzuMY6TQCcYLM7FMDyeqT2FeK/8/sL+Xtp5F3NCqyb7oGFx1jrm
         wdUTxMRUqlYNelR9zu1ANkamRMtgwj9YsPL9jtrj2NPAXv10lNrhKb2GZFmzM9gcpBpM
         XtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754082999; x=1754687799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZqytGXi5W+0oM2gaVZGROmPugYrBG6LtgSr2NAWPIkU=;
        b=mlh7HtKgbpn9wqNWw/v0pQph1s1uzIrY8dgaoU788U99cTADQBWYGPw2M/EOMYPy8W
         22jbH64z5kb7rwINjQCrQRMwO1CrGyHxLEerBkGk5tgsjK6aveZer3WgDZHze0mb0xSW
         KvmIBBDt4ikUpULZNgWnBHMmG1Hp85DUKJE8ABpChRTaP0G4q6MQzxrHYQZ3VCvtAm88
         czaA2R48c11+RQDVOo9bzxo+rmZUvb+mQh0Ntl/oCopHk07ibDl0nMRWxmVAEIKeBOK3
         9+6rHcBePqqmXdGn1AQQs6/6qvku20HtaFWdY2B/Qt2tckonmZFuFhcrV5kjc4aauFu6
         dnNg==
X-Forwarded-Encrypted: i=1; AJvYcCWYiyyXbtmEt54mEnTRNe724dsIrFckaFIlr5kTDIN0uL531NBhL5yh6WHswzhk035IE/AJCeC+g6gtB2IEJGrNMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbZqnMWKakZwHzBPzIsp7e2LGYGh0XoUq9xjxTp+rdvzR3vELq
	+DyRuBeBQysV+R0qwueN+qmz/PacEVlrslXe3t/T78z3rksK5sY2XTy54+tAJ7bnA4o5FqvcNlt
	od3xQMT3p7P3a+mry95CRRlrDx4nNJkevKkvrRe1SAg==
X-Gm-Gg: ASbGncuMyFDpJx1J7rdVZU3ieyC3/FklsfQU3BM5y77McuS6XPtvOEdlTK9Arf14IrP
	P68lMv/0bGxO+MJ3ZoDAupU7FJl8QD4vGcJid1ZKxmtQOSQ7JiS/QsahWbqU0KIHNlzYQ3Es3DB
	6jVw8g0yLyxRat7qfBni29KuPIaUWhE2zPwYO5bLmu4Olr/mg3rOgS/rCYoCKvQ0IdsKgRuqyoe
	RK1uA==
X-Google-Smtp-Source: AGHT+IHHaG/CRQsgr7p3Tfo0TOmissc2XOtsczFCXIZQMTy/37MHX8ykJpsP195uACiVjXZcG5lM7NxM/YllXNG+MPA=
X-Received: by 2002:a05:690c:d92:b0:710:f46d:cec3 with SMTP id
 00721157ae682-71b7f5bc0cemr14721927b3.5.1754082998934; Fri, 01 Aug 2025
 14:16:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com> <20250730074253.1884111-3-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250730074253.1884111-3-ivo.ivanov.ivanov1@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Aug 2025 16:16:25 -0500
X-Gm-Features: Ac12FXwMiWZ8AseZWaIlhH5Rvp_XOCb061jYqpt1d42-G4p8qP_4Vml5fYl6nvg
Message-ID: <CAPLW+4nONOm+86vfPNMbTVFUGT7mo5qnefs=S3kSn0R8EEqpRg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: exynos2200: use 32-bit address space
 for /soc
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
> All peripherals on this SoC are mapped under the 32-bit address space
> (0x0 -> 0x20000000), so enforce that.
>
> Suggested-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>
> ---
> This was suggested at [1].
>
> [1] https://lore.kernel.org/all/CAPLW+4kPN65uX0tyG_F-4u5FQpPnwX9y6F1zrobq=
5UyVbks+-w@mail.gmail.com
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos2200.dtsi | 72 +++++++++++-----------
>  1 file changed, 36 insertions(+), 36 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot=
/dts/exynos/exynos2200.dtsi
> index 6b5ac02d0..943e83851 100644
> --- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> @@ -221,22 +221,22 @@ psci {
>                 method =3D "smc";
>         };
>
> -       soc {
> +       soc@0 {
>                 compatible =3D "simple-bus";
> -               ranges;
> +               ranges =3D <0x0 0x0 0x0 0x20000000>;
>
> -               #address-cells =3D <2>;
> -               #size-cells =3D <2>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
>
>                 chipid@10000000 {
>                         compatible =3D "samsung,exynos2200-chipid",
>                                      "samsung,exynos850-chipid";
> -                       reg =3D <0x0 0x10000000 0x0 0x24>;
> +                       reg =3D <0x10000000 0x24>;
>                 };
>
>                 cmu_peris: clock-controller@10020000 {
>                         compatible =3D "samsung,exynos2200-cmu-peris";
> -                       reg =3D <0x0 0x10020000 0x0 0x8000>;
> +                       reg =3D <0x10020000 0x8000>;
>                         #clock-cells =3D <1>;
>
>                         clocks =3D <&cmu_top CLK_DOUT_TCXO_DIV3>,
> @@ -250,7 +250,7 @@ cmu_peris: clock-controller@10020000 {
>                 mct_peris: timer@10040000 {
>                         compatible =3D "samsung,exynos2200-mct-peris",
>                                      "samsung,exynos4210-mct";
> -                       reg =3D <0x0 0x10040000 0x0 0x800>;
> +                       reg =3D <0x10040000 0x800>;
>                         clocks =3D <&cmu_top CLK_DOUT_TCXO_DIV3>, <&cmu_p=
eris CLK_MOUT_PERIS_GIC>;
>                         clock-names =3D "fin_pll", "mct";
>                         interrupts =3D <GIC_SPI 943 IRQ_TYPE_LEVEL_HIGH 0=
>,
> @@ -270,8 +270,8 @@ mct_peris: timer@10040000 {
>
>                 gic: interrupt-controller@10200000 {
>                         compatible =3D "arm,gic-v3";
> -                       reg =3D <0x0 0x10200000 0x0 0x10000>,     /* GICD=
 */
> -                             <0x0 0x10240000 0x0 0x200000>;    /* GICR *=
 8 */
> +                       reg =3D <0x10200000 0x10000>,     /* GICD */
> +                             <0x10240000 0x200000>;    /* GICR * 8 */
>
>                         #interrupt-cells =3D <4>;
>                         interrupt-controller;
> @@ -294,7 +294,7 @@ ppi_cluster2: interrupt-partition-2 {
>
>                 cmu_peric0: clock-controller@10400000 {
>                         compatible =3D "samsung,exynos2200-cmu-peric0";
> -                       reg =3D <0x0 0x10400000 0x0 0x8000>;
> +                       reg =3D <0x10400000 0x8000>;
>                         #clock-cells =3D <1>;
>
>                         clocks =3D <&xtcxo>,
> @@ -306,17 +306,17 @@ cmu_peric0: clock-controller@10400000 {
>
>                 syscon_peric0: syscon@10420000 {
>                         compatible =3D "samsung,exynos2200-peric0-sysreg"=
, "syscon";
> -                       reg =3D <0x0 0x10420000 0x0 0x2000>;
> +                       reg =3D <0x10420000 0x2000>;
>                 };
>
>                 pinctrl_peric0: pinctrl@10430000 {
>                         compatible =3D "samsung,exynos2200-pinctrl";
> -                       reg =3D <0x0 0x10430000 0x0 0x1000>;
> +                       reg =3D <0x10430000 0x1000>;
>                 };
>
>                 cmu_peric1: clock-controller@10700000 {
>                         compatible =3D "samsung,exynos2200-cmu-peric1";
> -                       reg =3D <0x0 0x10700000 0x0 0x8000>;
> +                       reg =3D <0x10700000 0x8000>;
>                         #clock-cells =3D <1>;
>
>                         clocks =3D <&xtcxo>,
> @@ -328,23 +328,23 @@ cmu_peric1: clock-controller@10700000 {
>
>                 syscon_peric1: syscon@10720000 {
>                         compatible =3D "samsung,exynos2200-peric1-sysreg"=
, "syscon";
> -                       reg =3D <0x0 0x10720000 0x0 0x2000>;
> +                       reg =3D <0x10720000 0x2000>;
>                 };
>
>                 pinctrl_peric1: pinctrl@10730000 {
>                         compatible =3D "samsung,exynos2200-pinctrl";
> -                       reg =3D <0x0 0x10730000 0x0 0x1000>;
> +                       reg =3D <0x10730000 0x1000>;
>                 };
>
>                 cmu_hsi0: clock-controller@10a00000 {
>                         compatible =3D "samsung,exynos2200-cmu-hsi0";
> -                       reg =3D <0x0 0x10a00000 0x0 0x8000>;
> +                       reg =3D <0x10a00000 0x8000>;
>                         #clock-cells =3D <1>;
>                 };
>
>                 usb32drd: phy@10aa0000 {
>                         compatible =3D "samsung,exynos2200-usb32drd-phy";
> -                       reg =3D <0x0 0x10aa0000 0x0 0x10000>;
> +                       reg =3D <0x10aa0000 0x10000>;
>
>                         clocks =3D <&cmu_hsi0 CLK_MOUT_HSI0_NOC>;
>                         clock-names =3D "phy";
> @@ -360,7 +360,7 @@ usb32drd: phy@10aa0000 {
>
>                 usb_hsphy: phy@10ab0000 {
>                         compatible =3D "samsung,exynos2200-eusb2-phy";
> -                       reg =3D <0x0 0x10ab0000 0x0 0x10000>;
> +                       reg =3D <0x10ab0000 0x10000>;
>
>                         clocks =3D <&cmu_hsi0 CLK_MOUT_HSI0_USB32DRD>,
>                                  <&cmu_hsi0 CLK_MOUT_HSI0_NOC>,
> @@ -374,7 +374,7 @@ usb_hsphy: phy@10ab0000 {
>
>                 usb: usb@10b00000 {
>                         compatible =3D "samsung,exynos2200-dwusb3";
> -                       ranges =3D <0x0 0x0 0x10b00000 0x10000>;
> +                       ranges =3D <0x0 0x10b00000 0x10000>;
>
>                         clocks =3D <&cmu_hsi0 CLK_MOUT_HSI0_NOC>;
>                         clock-names =3D "link_aclk";
> @@ -406,7 +406,7 @@ usb_dwc3: usb@0 {
>
>                 cmu_ufs: clock-controller@11000000 {
>                         compatible =3D "samsung,exynos2200-cmu-ufs";
> -                       reg =3D <0x0 0x11000000 0x0 0x8000>;
> +                       reg =3D <0x11000000 0x8000>;
>                         #clock-cells =3D <1>;
>
>                         clocks =3D <&xtcxo>,
> @@ -418,27 +418,27 @@ cmu_ufs: clock-controller@11000000 {
>
>                 syscon_ufs: syscon@11020000 {
>                         compatible =3D "samsung,exynos2200-ufs-sysreg", "=
syscon";
> -                       reg =3D <0x0 0x11020000 0x0 0x2000>;
> +                       reg =3D <0x11020000 0x2000>;
>                 };
>
>                 pinctrl_ufs: pinctrl@11040000 {
>                         compatible =3D "samsung,exynos2200-pinctrl";
> -                       reg =3D <0x0 0x11040000 0x0 0x1000>;
> +                       reg =3D <0x11040000 0x1000>;
>                 };
>
>                 pinctrl_hsi1ufs: pinctrl@11060000 {
>                         compatible =3D "samsung,exynos2200-pinctrl";
> -                       reg =3D <0x0 0x11060000 0x0 0x1000>;
> +                       reg =3D <0x11060000 0x1000>;
>                 };
>
>                 pinctrl_hsi1: pinctrl@11240000 {
>                         compatible =3D "samsung,exynos2200-pinctrl";
> -                       reg =3D <0x0 0x11240000 0x0 0x1000>;
> +                       reg =3D <0x11240000 0x1000>;
>                 };
>
>                 cmu_peric2: clock-controller@11c00000 {
>                         compatible =3D "samsung,exynos2200-cmu-peric2";
> -                       reg =3D <0x0 0x11c00000 0x0 0x8000>;
> +                       reg =3D <0x11c00000 0x8000>;
>                         #clock-cells =3D <1>;
>
>                         clocks =3D <&xtcxo>,
> @@ -450,17 +450,17 @@ cmu_peric2: clock-controller@11c00000 {
>
>                 syscon_peric2: syscon@11c20000 {
>                         compatible =3D "samsung,exynos2200-peric2-sysreg"=
, "syscon";
> -                       reg =3D <0x0 0x11c20000 0x0 0x4000>;
> +                       reg =3D <0x11c20000 0x4000>;
>                 };
>
>                 pinctrl_peric2: pinctrl@11c30000 {
>                         compatible =3D "samsung,exynos2200-pinctrl";
> -                       reg =3D <0x0 0x11c30000 0x0 0x1000>;
> +                       reg =3D <0x11c30000 0x1000>;
>                 };
>
>                 cmu_cmgp: clock-controller@14e00000 {
>                         compatible =3D "samsung,exynos2200-cmu-cmgp";
> -                       reg =3D <0x0 0x14e00000 0x0 0x8000>;
> +                       reg =3D <0x14e00000 0x8000>;
>                         #clock-cells =3D <1>;
>
>                         clocks =3D <&xtcxo>,
> @@ -471,12 +471,12 @@ cmu_cmgp: clock-controller@14e00000 {
>
>                 syscon_cmgp: syscon@14e20000 {
>                         compatible =3D "samsung,exynos2200-cmgp-sysreg", =
"syscon";
> -                       reg =3D <0x0 0x14e20000 0x0 0x2000>;
> +                       reg =3D <0x14e20000 0x2000>;
>                 };
>
>                 pinctrl_cmgp: pinctrl@14e30000 {
>                         compatible =3D "samsung,exynos2200-pinctrl";
> -                       reg =3D <0x0 0x14e30000 0x0 0x1000>;
> +                       reg =3D <0x14e30000 0x1000>;
>
>                         wakeup-interrupt-controller {
>                                 compatible =3D "samsung,exynos2200-wakeup=
-eint",
> @@ -487,7 +487,7 @@ wakeup-interrupt-controller {
>
>                 cmu_vts: clock-controller@15300000 {
>                         compatible =3D "samsung,exynos2200-cmu-vts";
> -                       reg =3D <0x0 0x15300000 0x0 0x8000>;
> +                       reg =3D <0x15300000 0x8000>;
>                         #clock-cells =3D <1>;
>
>                         clocks =3D <&xtcxo>,
> @@ -497,12 +497,12 @@ cmu_vts: clock-controller@15300000 {
>
>                 pinctrl_vts: pinctrl@15320000 {
>                         compatible =3D "samsung,exynos2200-pinctrl";
> -                       reg =3D <0x0 0x15320000 0x0 0x1000>;
> +                       reg =3D <0x15320000 0x1000>;
>                 };
>
>                 cmu_alive: clock-controller@15800000 {
>                         compatible =3D "samsung,exynos2200-cmu-alive";
> -                       reg =3D <0x0 0x15800000 0x0 0x8000>;
> +                       reg =3D <0x15800000 0x8000>;
>                         #clock-cells =3D <1>;
>
>                         clocks =3D <&xtcxo>,
> @@ -512,7 +512,7 @@ cmu_alive: clock-controller@15800000 {
>
>                 pinctrl_alive: pinctrl@15850000 {
>                         compatible =3D "samsung,exynos2200-pinctrl";
> -                       reg =3D <0x0 0x15850000 0x0 0x1000>;
> +                       reg =3D <0x15850000 0x1000>;
>
>                         wakeup-interrupt-controller {
>                                 compatible =3D "samsung,exynos2200-wakeup=
-eint",
> @@ -524,7 +524,7 @@ wakeup-interrupt-controller {
>                 pmu_system_controller: system-controller@15860000 {
>                         compatible =3D "samsung,exynos2200-pmu",
>                                      "samsung,exynos7-pmu", "syscon";
> -                       reg =3D <0x0 0x15860000 0x0 0x10000>;
> +                       reg =3D <0x15860000 0x10000>;
>
>                         reboot: syscon-reboot {
>                                 compatible =3D "syscon-reboot";
> @@ -536,7 +536,7 @@ reboot: syscon-reboot {
>
>                 cmu_top: clock-controller@1a320000 {
>                         compatible =3D "samsung,exynos2200-cmu-top";
> -                       reg =3D <0x0 0x1a320000 0x0 0x8000>;
> +                       reg =3D <0x1a320000 0x8000>;
>                         #clock-cells =3D <1>;
>
>                         clocks =3D <&xtcxo>;
> --
> 2.43.0
>
>

Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370D43ACF18
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Aug 2026 12:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845399; cv=pass; b=dumNzdddFrilahtTOWxfGQRGRM9k7qJ1Tso3/GMECyMC0YLEcz/6v+UaCq/IC9NohspEuXOlw4mkhXDANaMiWG5Mqan2nSaLVMNbY8O0W4HlLE1xf9flFXdcfW/M0oPVbgsAxELtNDN1r9plXJiwLQWDi3m0bxw4eVTeypskHyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845399; c=relaxed/simple;
	bh=GsO226cxsvl06Z+Lm1YrsedEZpgGpqjUUyvb2s8/qmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fbeYweicKZt6nU8PHy3QsJafqp69BnN7VJiX/VCLzRbUkpeVEybkl0HGOfbJjk3B0ZQkDowKmt0E7F7o2z4hgoBKog7YJF85wmjokHnuAdHdDUJDMo9/twNpVjyWni1tMyov0qVdxxg5FI/aIvb0Uy+3yIvc/A7WCMMwOgY7NLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QIkdV/Wx; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QIkdV/Wx"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so4720079a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Aug 2026 05:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785845394; cv=none;
        d=google.com; s=arc-20260327;
        b=OH1ylnLbeNw9MjdZuGxUh/c63hIqDzjWPrVK3zJ2aO5/vfulYeB7Vs8flVE24jOUOe
         YjFG0I1ZYRrQlzfYnyrBNV3CbjrhSVVxFe7gUjFRFnrNd6vX6ydgkH8ObVpakITsGpEr
         VQGHZ0oyRX5Ax8iHqUn3ZUKIiOfz8kEorKGZtZVGKUuw+X1aDKHOG/o7CvwiRkp6XgUD
         9BU02NmoarWli6ZCxvfU4IBnA5fr9OEpcBczxtqJeinwGoFXjlazLxr2B4KOJFv870h7
         nMmKoTN46eQdb2upe+HAx6ONI6E1Sf8unU1/v4cm9jwoCB8Mk4WzuUtDJUuqAEeB0oyC
         nagw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jei8t4G8dP/WHAA3ArvZkOSCI1ouVxL8YiLBglXmf+U=;
        fh=RQ8PjdgHVftwaQWo1JEARh1p2pv06eX5A+/hDDJY0+w=;
        b=LAIUQWiAJryn6Lv/8FMczHzg3RyURkRFjEClKWuE85GhJGLu60nkWz6u1FIniyahiU
         qz4VFHnnwD4A2TQR3DdnvqCcGz+EeUmH5kgLXy3oIlHAQoQ4ZLhC96IAXbDNO/wxG+0i
         oVXCznN2xbfeObYxDRblOsiQssiYkH2DqDJXUhIP5KZgqL3nXz7gPGZ6dGofruC5ODFm
         l+5SBjzufeN6PjIbYAOHP+kZ67Di5x05pp1LFaxmRBQWEn9GX6cXh0B5J5ap+3R4GPSj
         FIZsPJ39QV9IChG3wwJG6+IGhqXAcsm7Vxg/WInu+5ZSC9mRTHNlJUSq+eBHqr3ycprs
         BOog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785845394; x=1786450194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jei8t4G8dP/WHAA3ArvZkOSCI1ouVxL8YiLBglXmf+U=;
        b=QIkdV/WxNPlvWMBpIXzi+k8pZxKdq2sWfJKRaObNLAb/AcW0An35+Wl3dzkKiWbbdO
         fbsuIpyaD5vNkY6Qt9QUCRsXaHakvuqdPuJqclXNVVtQIsST+aRtoKWTNPhJ2h7fAK0c
         nJGUHid7R+7EgyiS/gWWSlM6PsF3rhC7oWRf/bZ3c/c0ZlZZeVJn3hYHx2ZAPwg5Ar6z
         C+e8gJH8kkGgD3pw+f+KRZtAETG1t/PhN3odSD5tMZbE9B9ekwJxDhnJvOwGI4s0RaSk
         lvNJixgLUhjCSCsalibLllvEa9itOYMYHw0MDq+LrmKIlT1O4s3yKpe5gLNo5+r6zq1b
         f/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845394; x=1786450194;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jei8t4G8dP/WHAA3ArvZkOSCI1ouVxL8YiLBglXmf+U=;
        b=PUxJI3vNT8eio7wK9SGKqk0nR4nbDNayXuBJXkze6JZagie4qqqpTQZHVFmPyus5i5
         clb03f/BL7TwsYNgDPjiAizLaevAjG7+/kInzDFPHg3m/8B+EmauGsQLHIos64dQKcwR
         h8P4ekTTZ+vgnkWuNeH6f4UximYMyWWLLffYQLy/A6nCC4tCjvTUMCFJPXJfZma/JaQp
         wbhtKgwyaLuvf5Ji9cU9c0UtGKpc3fLtzQWykVvAMSXE2o1ikDLmXlDjWi9AsHEeUbB2
         cxRoMzVs1Dv+NDV1znrdHie+V3HgseVqGntHhb5IVydu2N36iVrbVbbTRcnZWog4WpAK
         Yqyg==
X-Forwarded-Encrypted: i=1; AHgh+Ron4egb2llf3caMLl7ZXICkm9bLJzKJktq8TQHqapbdZcybkQVVOfYuC+YapdSIfDu/8aYl0CcfW0wNUBu/ScvMBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh0uyO1ne4BrCHtEuYme3GtTTRrkgBV4EzaWaVSZHI4odvYFhE
	lcyUb6QB8Y9UMCwRtbAIItKvOw473vc6Fd+SzRkRELszly0zMhw+DMM2SYPvUAUFDmp01bXXuqY
	XZ7ZUmFRbNI1fYtCYWGmQfGaBs/xy4bk51f0VhNapbg==
X-Gm-Gg: AR+sD11O7eSVxkEvNtDyAJGgNszNvMc29aCHM/h6DoFJD7grymf8LwCX/f6o2F9gI8z
	hih50Oj5fgBklPG1LIY2L6Ofdna9PQ6ts3Z+4S1Apk/Nic3Co+5dzQU99vgO+M9E+AVPXeMApW8
	6MV4gzveMoergz8eTu4idgCn+Fz7a3XD+20h4rS6RjTW7qv7Rb4PNtMz+Rceyc6ZdxTc/bZm7GP
	vbCZgq1w6XeMEjdAF+iM7G4zTD/SEYEHqjfSJWdR+dvrZXZnvocFYYt6h+GLMeL3ET0AE7Tmb7+
	cxBrNCEfqFrMreaDjqw3f2vDR/K3U50IbvgfrQ7AQXIsZqBEIcDwJgJxq8IIx+ySuas1LkCmdu/
	Ap7E=
X-Received: by 2002:a05:6402:44d7:b0:69c:72e2:a3d5 with SMTP id
 4fb4d7f45d1cf-6a0a7c61137mr10766363a12.6.1785845394084; Tue, 04 Aug 2026
 05:09:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
 <20260801-b4-dts-coding-style-strict-v2-4-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-4-f09a659ab80d@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Aug 2026 13:09:41 +0100
X-Gm-Features: AUfX_mxuN5Q1A0xEeX4rZ1XnLBRRG-u0-05MQYuftCBPTDnQctf3eV8dHANyUJg
Message-ID: <CADrjBPqqQxE6qnwdrG2YnTW_+sieuynHSqBUXQu05ptii6kVLw@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] arm64: dts: exynos: Re-order clocks and align
 continued properties
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
> Trivial white-space only changes to adjust to DTS coding style
> (clocks-names should follow clocks) and fix dt-check-style strict
> warnings like:
>
>   [property-order] property 'clocks' out of canonical order (should sort =
before 'clock-names')
>   [continuation-alignment] continuation should align to column 39 (under =
< or ")
>
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 282 ++++++++++++++---------=
------
>  1 file changed, 141 insertions(+), 141 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot=
/dts/exynos/exynos5433.dtsi
> index ebd63b9e244d..d318c87effaa 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -400,14 +400,14 @@ cmu_top: clock-controller@10030000 {
>                         reg =3D <0x10030000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk",
> -                               "sclk_mphy_pll",
> -                               "sclk_mfc_pll",
> -                               "sclk_bus_pll";
>                         clocks =3D <&xxti>,
> -                               <&cmu_cpif CLK_SCLK_MPHY_PLL>,
> -                               <&cmu_mif CLK_SCLK_MFC_PLL>,
> -                               <&cmu_mif CLK_SCLK_BUS_PLL>;
> +                                <&cmu_cpif CLK_SCLK_MPHY_PLL>,
> +                                <&cmu_mif CLK_SCLK_MFC_PLL>,
> +                                <&cmu_mif CLK_SCLK_BUS_PLL>;
> +                       clock-names =3D "oscclk",
> +                                     "sclk_mphy_pll",
> +                                     "sclk_mfc_pll",
> +                                     "sclk_bus_pll";
>                 };
>
>                 cmu_cpif: clock-controller@10fc0000 {
> @@ -415,8 +415,8 @@ cmu_cpif: clock-controller@10fc0000 {
>                         reg =3D <0x10fc0000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk";
>                         clocks =3D <&xxti>;
> +                       clock-names =3D "oscclk";
>                 };
>
>                 cmu_mif: clock-controller@105b0000 {
> @@ -424,10 +424,10 @@ cmu_mif: clock-controller@105b0000 {
>                         reg =3D <0x105b0000 0x2000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk",
> -                               "sclk_mphy_pll";
>                         clocks =3D <&xxti>,
> -                               <&cmu_cpif CLK_SCLK_MPHY_PLL>;
> +                                <&cmu_cpif CLK_SCLK_MPHY_PLL>;
> +                       clock-names =3D "oscclk",
> +                                     "sclk_mphy_pll";
>                 };
>
>                 cmu_peric: clock-controller@14c80000 {
> @@ -447,26 +447,26 @@ cmu_fsys: clock-controller@156e0000 {
>                         reg =3D <0x156e0000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk",
> -                               "sclk_ufs_mphy",
> -                               "aclk_fsys_200",
> -                               "sclk_pcie_100_fsys",
> -                               "sclk_ufsunipro_fsys",
> -                               "sclk_mmc2_fsys",
> -                               "sclk_mmc1_fsys",
> -                               "sclk_mmc0_fsys",
> -                               "sclk_usbhost30_fsys",
> -                               "sclk_usbdrd30_fsys";
>                         clocks =3D <&xxti>,
> -                               <&cmu_cpif CLK_SCLK_UFS_MPHY>,
> -                               <&cmu_top CLK_ACLK_FSYS_200>,
> -                               <&cmu_top CLK_SCLK_PCIE_100_FSYS>,
> -                               <&cmu_top CLK_SCLK_UFSUNIPRO_FSYS>,
> -                               <&cmu_top CLK_SCLK_MMC2_FSYS>,
> -                               <&cmu_top CLK_SCLK_MMC1_FSYS>,
> -                               <&cmu_top CLK_SCLK_MMC0_FSYS>,
> -                               <&cmu_top CLK_SCLK_USBHOST30_FSYS>,
> -                               <&cmu_top CLK_SCLK_USBDRD30_FSYS>;
> +                                <&cmu_cpif CLK_SCLK_UFS_MPHY>,
> +                                <&cmu_top CLK_ACLK_FSYS_200>,
> +                                <&cmu_top CLK_SCLK_PCIE_100_FSYS>,
> +                                <&cmu_top CLK_SCLK_UFSUNIPRO_FSYS>,
> +                                <&cmu_top CLK_SCLK_MMC2_FSYS>,
> +                                <&cmu_top CLK_SCLK_MMC1_FSYS>,
> +                                <&cmu_top CLK_SCLK_MMC0_FSYS>,
> +                                <&cmu_top CLK_SCLK_USBHOST30_FSYS>,
> +                                <&cmu_top CLK_SCLK_USBDRD30_FSYS>;
> +                       clock-names =3D "oscclk",
> +                                     "sclk_ufs_mphy",
> +                                     "aclk_fsys_200",
> +                                     "sclk_pcie_100_fsys",
> +                                     "sclk_ufsunipro_fsys",
> +                                     "sclk_mmc2_fsys",
> +                                     "sclk_mmc1_fsys",
> +                                     "sclk_mmc0_fsys",
> +                                     "sclk_usbhost30_fsys",
> +                                     "sclk_usbdrd30_fsys";
>                 };
>
>                 cmu_g2d: clock-controller@12460000 {
> @@ -474,12 +474,12 @@ cmu_g2d: clock-controller@12460000 {
>                         reg =3D <0x12460000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk",
> -                               "aclk_g2d_266",
> -                               "aclk_g2d_400";
>                         clocks =3D <&xxti>,
> -                               <&cmu_top CLK_ACLK_G2D_266>,
> -                               <&cmu_top CLK_ACLK_G2D_400>;
> +                                <&cmu_top CLK_ACLK_G2D_266>,
> +                                <&cmu_top CLK_ACLK_G2D_400>;
> +                       clock-names =3D "oscclk",
> +                                     "aclk_g2d_266",
> +                                     "aclk_g2d_400";
>                         power-domains =3D <&pd_g2d>;
>                 };
>
> @@ -488,24 +488,24 @@ cmu_disp: clock-controller@13b90000 {
>                         reg =3D <0x13b90000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk",
> -                               "sclk_dsim1_disp",
> -                               "sclk_dsim0_disp",
> -                               "sclk_dsd_disp",
> -                               "sclk_decon_tv_eclk_disp",
> -                               "sclk_decon_vclk_disp",
> -                               "sclk_decon_eclk_disp",
> -                               "sclk_decon_tv_vclk_disp",
> -                               "aclk_disp_333";
>                         clocks =3D <&xxti>,
> -                               <&cmu_mif CLK_SCLK_DSIM1_DISP>,
> -                               <&cmu_mif CLK_SCLK_DSIM0_DISP>,
> -                               <&cmu_mif CLK_SCLK_DSD_DISP>,
> -                               <&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>,
> -                               <&cmu_mif CLK_SCLK_DECON_VCLK_DISP>,
> -                               <&cmu_mif CLK_SCLK_DECON_ECLK_DISP>,
> -                               <&cmu_mif CLK_SCLK_DECON_TV_VCLK_DISP>,
> -                               <&cmu_mif CLK_ACLK_DISP_333>;
> +                                <&cmu_mif CLK_SCLK_DSIM1_DISP>,
> +                                <&cmu_mif CLK_SCLK_DSIM0_DISP>,
> +                                <&cmu_mif CLK_SCLK_DSD_DISP>,
> +                                <&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>,
> +                                <&cmu_mif CLK_SCLK_DECON_VCLK_DISP>,
> +                                <&cmu_mif CLK_SCLK_DECON_ECLK_DISP>,
> +                                <&cmu_mif CLK_SCLK_DECON_TV_VCLK_DISP>,
> +                                <&cmu_mif CLK_ACLK_DISP_333>;
> +                       clock-names =3D "oscclk",
> +                                     "sclk_dsim1_disp",
> +                                     "sclk_dsim0_disp",
> +                                     "sclk_dsd_disp",
> +                                     "sclk_decon_tv_eclk_disp",
> +                                     "sclk_decon_vclk_disp",
> +                                     "sclk_decon_eclk_disp",
> +                                     "sclk_decon_tv_vclk_disp",
> +                                     "aclk_disp_333";
>                         power-domains =3D <&pd_disp>;
>                 };
>
> @@ -513,8 +513,8 @@ cmu_aud: clock-controller@114c0000 {
>                         compatible =3D "samsung,exynos5433-cmu-aud";
>                         reg =3D <0x114c0000 0x1000>;
>                         #clock-cells =3D <1>;
> -                       clock-names =3D "oscclk", "fout_aud_pll";
>                         clocks =3D <&xxti>, <&cmu_top CLK_FOUT_AUD_PLL>;
> +                       clock-names =3D "oscclk", "fout_aud_pll";
>                         power-domains =3D <&pd_aud>;
>                 };
>
> @@ -523,8 +523,8 @@ cmu_bus0: clock-controller@13600000 {
>                         reg =3D <0x13600000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "aclk_bus0_400";
>                         clocks =3D <&cmu_top CLK_ACLK_BUS0_400>;
> +                       clock-names =3D "aclk_bus0_400";
>                 };
>
>                 cmu_bus1: clock-controller@14800000 {
> @@ -532,8 +532,8 @@ cmu_bus1: clock-controller@14800000 {
>                         reg =3D <0x14800000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "aclk_bus1_400";
>                         clocks =3D <&cmu_top CLK_ACLK_BUS1_400>;
> +                       clock-names =3D "aclk_bus1_400";
>                 };
>
>                 cmu_bus2: clock-controller@13400000 {
> @@ -541,8 +541,8 @@ cmu_bus2: clock-controller@13400000 {
>                         reg =3D <0x13400000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk", "aclk_bus2_400";
>                         clocks =3D <&xxti>, <&cmu_mif CLK_ACLK_BUS2_400>;
> +                       clock-names =3D "oscclk", "aclk_bus2_400";
>                 };
>
>                 cmu_g3d: clock-controller@14aa0000 {
> @@ -550,8 +550,8 @@ cmu_g3d: clock-controller@14aa0000 {
>                         reg =3D <0x14aa0000 0x2000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk", "aclk_g3d_400";
>                         clocks =3D <&xxti>, <&cmu_top CLK_ACLK_G3D_400>;
> +                       clock-names =3D "oscclk", "aclk_g3d_400";
>                         power-domains =3D <&pd_g3d>;
>                 };
>
> @@ -560,12 +560,12 @@ cmu_gscl: clock-controller@13cf0000 {
>                         reg =3D <0x13cf0000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk",
> -                               "aclk_gscl_111",
> -                               "aclk_gscl_333";
>                         clocks =3D <&xxti>,
> -                               <&cmu_top CLK_ACLK_GSCL_111>,
> -                               <&cmu_top CLK_ACLK_GSCL_333>;
> +                                <&cmu_top CLK_ACLK_GSCL_111>,
> +                                <&cmu_top CLK_ACLK_GSCL_333>;
> +                       clock-names =3D "oscclk",
> +                                     "aclk_gscl_111",
> +                                     "aclk_gscl_333";
>                         power-domains =3D <&pd_gscl>;
>                 };
>
> @@ -574,8 +574,8 @@ cmu_apollo: clock-controller@11900000 {
>                         reg =3D <0x11900000 0x2000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk", "sclk_bus_pll_apollo";
>                         clocks =3D <&xxti>, <&cmu_mif CLK_SCLK_BUS_PLL_AP=
OLLO>;
> +                       clock-names =3D "oscclk", "sclk_bus_pll_apollo";
>                 };
>
>                 cmu_atlas: clock-controller@11800000 {
> @@ -583,8 +583,8 @@ cmu_atlas: clock-controller@11800000 {
>                         reg =3D <0x11800000 0x2000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk", "sclk_bus_pll_atlas";
>                         clocks =3D <&xxti>, <&cmu_mif CLK_SCLK_BUS_PLL_AT=
LAS>;
> +                       clock-names =3D "oscclk", "sclk_bus_pll_atlas";
>                 };
>
>                 cmu_mscl: clock-controller@150d0000 {
> @@ -592,12 +592,12 @@ cmu_mscl: clock-controller@150d0000 {
>                         reg =3D <0x150d0000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk",
> -                               "sclk_jpeg_mscl",
> -                               "aclk_mscl_400";
>                         clocks =3D <&xxti>,
> -                               <&cmu_top CLK_SCLK_JPEG_MSCL>,
> -                               <&cmu_top CLK_ACLK_MSCL_400>;
> +                                <&cmu_top CLK_SCLK_JPEG_MSCL>,
> +                                <&cmu_top CLK_ACLK_MSCL_400>;
> +                       clock-names =3D "oscclk",
> +                                     "sclk_jpeg_mscl",
> +                                     "aclk_mscl_400";
>                         power-domains =3D <&pd_mscl>;
>                 };
>
> @@ -606,8 +606,8 @@ cmu_mfc: clock-controller@15280000 {
>                         reg =3D <0x15280000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk", "aclk_mfc_400";
>                         clocks =3D <&xxti>, <&cmu_top CLK_ACLK_MFC_400>;
> +                       clock-names =3D "oscclk", "aclk_mfc_400";
>                         power-domains =3D <&pd_mfc>;
>                 };
>
> @@ -616,8 +616,8 @@ cmu_hevc: clock-controller@14f80000 {
>                         reg =3D <0x14f80000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk", "aclk_hevc_400";
>                         clocks =3D <&xxti>, <&cmu_top CLK_ACLK_HEVC_400>;
> +                       clock-names =3D "oscclk", "aclk_hevc_400";
>                         power-domains =3D <&pd_hevc>;
>                 };
>
> @@ -626,12 +626,12 @@ cmu_isp: clock-controller@146d0000 {
>                         reg =3D <0x146d0000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk",
> -                               "aclk_isp_dis_400",
> -                               "aclk_isp_400";
>                         clocks =3D <&xxti>,
> -                               <&cmu_top CLK_ACLK_ISP_DIS_400>,
> -                               <&cmu_top CLK_ACLK_ISP_400>;
> +                                <&cmu_top CLK_ACLK_ISP_DIS_400>,
> +                                <&cmu_top CLK_ACLK_ISP_400>;
> +                       clock-names =3D "oscclk",
> +                                     "aclk_isp_dis_400",
> +                                     "aclk_isp_400";
>                         power-domains =3D <&pd_isp>;
>                 };
>
> @@ -640,14 +640,14 @@ cmu_cam0: clock-controller@120d0000 {
>                         reg =3D <0x120d0000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk",
> -                               "aclk_cam0_333",
> -                               "aclk_cam0_400",
> -                               "aclk_cam0_552";
>                         clocks =3D <&xxti>,
> -                               <&cmu_top CLK_ACLK_CAM0_333>,
> -                               <&cmu_top CLK_ACLK_CAM0_400>,
> -                               <&cmu_top CLK_ACLK_CAM0_552>;
> +                                <&cmu_top CLK_ACLK_CAM0_333>,
> +                                <&cmu_top CLK_ACLK_CAM0_400>,
> +                                <&cmu_top CLK_ACLK_CAM0_552>;
> +                       clock-names =3D "oscclk",
> +                                     "aclk_cam0_333",
> +                                     "aclk_cam0_400",
> +                                     "aclk_cam0_552";
>                         power-domains =3D <&pd_cam0>;
>                 };
>
> @@ -656,20 +656,20 @@ cmu_cam1: clock-controller@145d0000 {
>                         reg =3D <0x145d0000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk",
> -                               "sclk_isp_uart_cam1",
> -                               "sclk_isp_spi1_cam1",
> -                               "sclk_isp_spi0_cam1",
> -                               "aclk_cam1_333",
> -                               "aclk_cam1_400",
> -                               "aclk_cam1_552";
>                         clocks =3D <&xxti>,
> -                               <&cmu_top CLK_SCLK_ISP_UART_CAM1>,
> -                               <&cmu_top CLK_SCLK_ISP_SPI1_CAM1>,
> -                               <&cmu_top CLK_SCLK_ISP_SPI0_CAM1>,
> -                               <&cmu_top CLK_ACLK_CAM1_333>,
> -                               <&cmu_top CLK_ACLK_CAM1_400>,
> -                               <&cmu_top CLK_ACLK_CAM1_552>;
> +                                <&cmu_top CLK_SCLK_ISP_UART_CAM1>,
> +                                <&cmu_top CLK_SCLK_ISP_SPI1_CAM1>,
> +                                <&cmu_top CLK_SCLK_ISP_SPI0_CAM1>,
> +                                <&cmu_top CLK_ACLK_CAM1_333>,
> +                                <&cmu_top CLK_ACLK_CAM1_400>,
> +                                <&cmu_top CLK_ACLK_CAM1_552>;
> +                       clock-names =3D "oscclk",
> +                                     "sclk_isp_uart_cam1",
> +                                     "sclk_isp_spi1_cam1",
> +                                     "sclk_isp_spi0_cam1",
> +                                     "aclk_cam1_333",
> +                                     "aclk_cam1_400",
> +                                     "aclk_cam1_552";
>                         power-domains =3D <&pd_cam1>;
>                 };
>
> @@ -678,23 +678,23 @@ cmu_imem: clock-controller@11060000 {
>                         reg =3D <0x11060000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk",
> -                               "aclk_imem_sssx_266",
> -                               "aclk_imem_266",
> -                               "aclk_imem_200";
>                         clocks =3D <&xxti>,
> -                               <&cmu_top CLK_DIV_ACLK_IMEM_SSSX_266>,
> -                               <&cmu_top CLK_DIV_ACLK_IMEM_266>,
> -                               <&cmu_top CLK_DIV_ACLK_IMEM_200>;
> +                                <&cmu_top CLK_DIV_ACLK_IMEM_SSSX_266>,
> +                                <&cmu_top CLK_DIV_ACLK_IMEM_266>,
> +                                <&cmu_top CLK_DIV_ACLK_IMEM_200>;
> +                       clock-names =3D "oscclk",
> +                                     "aclk_imem_sssx_266",
> +                                     "aclk_imem_266",
> +                                     "aclk_imem_200";
>                 };
>
>                 slim_sss: slim-sss@11140000 {
>                         compatible =3D "samsung,exynos5433-slim-sss";
>                         reg =3D <0x11140000 0x1000>;
>                         interrupts =3D <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "pclk", "aclk";
>                         clocks =3D <&cmu_imem CLK_PCLK_SLIMSSS>,
>                                  <&cmu_imem CLK_ACLK_SLIMSSS>;
> +                       clock-names =3D "pclk", "aclk";
>                 };
>
>                 pd_gscl: power-domain@105c4000 {
> @@ -954,8 +954,8 @@ pmu_system_controller: system-controller@105c0000 {
>                         compatible =3D "samsung,exynos5433-pmu", "simple-=
mfd", "syscon";
>                         reg =3D <0x105c0000 0x5008>;
>                         #clock-cells =3D <1>;
> -                       clock-names =3D "clkout16";
>                         clocks =3D <&xxti>;
> +                       clock-names =3D "clkout16";
>
>                         mipi_phy: mipi-phy {
>                                 compatible =3D "samsung,exynos5433-mipi-v=
ideo-phy";
> @@ -975,13 +975,13 @@ reboot: syscon-reboot {
>
>                 gic: interrupt-controller@11001000 {
>                         compatible =3D "arm,gic-400";
> +                       reg =3D <0x11001000 0x1000>,
> +                             <0x11002000 0x2000>,
> +                             <0x11004000 0x2000>,
> +                             <0x11006000 0x2000>;
>                         #address-cells =3D <0>;
>                         #interrupt-cells =3D <3>;
>                         interrupt-controller;
> -                       reg =3D <0x11001000 0x1000>,
> -                               <0x11002000 0x2000>,
> -                               <0x11004000 0x2000>,
> -                               <0x11006000 0x2000>;
>                         interrupts =3D <GIC_PPI 9 0xf04>;
>                 };
>
> @@ -1190,13 +1190,13 @@ gsc_0: video-scaler@13c00000 {
>                         compatible =3D "samsung,exynos5433-gsc";
>                         reg =3D <0x13c00000 0x1000>;
>                         interrupts =3D <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "pclk", "aclk", "aclk_xiu",
> -                                     "aclk_gsclbend", "gsd";
>                         clocks =3D <&cmu_gscl CLK_PCLK_GSCL0>,
>                                  <&cmu_gscl CLK_ACLK_GSCL0>,
>                                  <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
>                                  <&cmu_gscl CLK_ACLK_GSCLBEND_333>,
>                                  <&cmu_gscl CLK_ACLK_GSD>;
> +                       clock-names =3D "pclk", "aclk", "aclk_xiu",
> +                                     "aclk_gsclbend", "gsd";
>                         iommus =3D <&sysmmu_gscl0>;
>                         power-domains =3D <&pd_gscl>;
>                 };
> @@ -1205,13 +1205,13 @@ gsc_1: video-scaler@13c10000 {
>                         compatible =3D "samsung,exynos5433-gsc";
>                         reg =3D <0x13c10000 0x1000>;
>                         interrupts =3D <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "pclk", "aclk", "aclk_xiu",
> -                                     "aclk_gsclbend", "gsd";
>                         clocks =3D <&cmu_gscl CLK_PCLK_GSCL1>,
>                                  <&cmu_gscl CLK_ACLK_GSCL1>,
>                                  <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
>                                  <&cmu_gscl CLK_ACLK_GSCLBEND_333>,
>                                  <&cmu_gscl CLK_ACLK_GSD>;
> +                       clock-names =3D "pclk", "aclk", "aclk_xiu",
> +                                     "aclk_gsclbend", "gsd";
>                         iommus =3D <&sysmmu_gscl1>;
>                         power-domains =3D <&pd_gscl>;
>                 };
> @@ -1220,13 +1220,13 @@ gsc_2: video-scaler@13c20000 {
>                         compatible =3D "samsung,exynos5433-gsc";
>                         reg =3D <0x13c20000 0x1000>;
>                         interrupts =3D <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "pclk", "aclk", "aclk_xiu",
> -                                     "aclk_gsclbend", "gsd";
>                         clocks =3D <&cmu_gscl CLK_PCLK_GSCL2>,
>                                  <&cmu_gscl CLK_ACLK_GSCL2>,
>                                  <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
>                                  <&cmu_gscl CLK_ACLK_GSCLBEND_333>,
>                                  <&cmu_gscl CLK_ACLK_GSD>;
> +                       clock-names =3D "pclk", "aclk", "aclk_xiu",
> +                                     "aclk_gsclbend", "gsd";
>                         iommus =3D <&sysmmu_gscl2>;
>                         power-domains =3D <&pd_gscl>;
>                 };
> @@ -1294,10 +1294,10 @@ scaler_0: scaler@15000000 {
>                         compatible =3D "samsung,exynos5433-scaler";
>                         reg =3D <0x15000000 0x1294>;
>                         interrupts =3D <0 402 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "pclk", "aclk", "aclk_xiu";
>                         clocks =3D <&cmu_mscl CLK_PCLK_M2MSCALER0>,
>                                  <&cmu_mscl CLK_ACLK_M2MSCALER0>,
>                                  <&cmu_mscl CLK_ACLK_XIU_MSCLX>;
> +                       clock-names =3D "pclk", "aclk", "aclk_xiu";
>                         iommus =3D <&sysmmu_scaler_0>;
>                         power-domains =3D <&pd_mscl>;
>                 };
> @@ -1306,10 +1306,10 @@ scaler_1: scaler@15010000 {
>                         compatible =3D "samsung,exynos5433-scaler";
>                         reg =3D <0x15010000 0x1294>;
>                         interrupts =3D <0 403 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "pclk", "aclk", "aclk_xiu";
>                         clocks =3D <&cmu_mscl CLK_PCLK_M2MSCALER1>,
>                                  <&cmu_mscl CLK_ACLK_M2MSCALER1>,
>                                  <&cmu_mscl CLK_ACLK_XIU_MSCLX>;
> +                       clock-names =3D "pclk", "aclk", "aclk_xiu";
>                         iommus =3D <&sysmmu_scaler_1>;
>                         power-domains =3D <&pd_mscl>;
>                 };
> @@ -1318,11 +1318,11 @@ jpeg: codec@15020000 {
>                         compatible =3D "samsung,exynos5433-jpeg";
>                         reg =3D <0x15020000 0x10000>;
>                         interrupts =3D <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "pclk", "aclk", "aclk_xiu", "sclk=
";
>                         clocks =3D <&cmu_mscl CLK_PCLK_JPEG>,
>                                  <&cmu_mscl CLK_ACLK_JPEG>,
>                                  <&cmu_mscl CLK_ACLK_XIU_MSCLX>,
>                                  <&cmu_mscl CLK_SCLK_JPEG>;
> +                       clock-names =3D "pclk", "aclk", "aclk_xiu", "sclk=
";
>                         iommus =3D <&sysmmu_jpeg>;
>                         power-domains =3D <&pd_mscl>;
>                 };
> @@ -1331,10 +1331,10 @@ mfc: codec@152e0000 {
>                         compatible =3D "samsung,exynos5433-mfc";
>                         reg =3D <0x152e0000 0x10000>;
>                         interrupts =3D <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "pclk", "aclk", "aclk_xiu";
>                         clocks =3D <&cmu_mfc CLK_PCLK_MFC>,
>                                  <&cmu_mfc CLK_ACLK_MFC>,
>                                  <&cmu_mfc CLK_ACLK_XIU_MFCX>;
> +                       clock-names =3D "pclk", "aclk", "aclk_xiu";
>                         iommus =3D <&sysmmu_mfc_0>, <&sysmmu_mfc_1>;
>                         iommu-names =3D "left", "right";
>                         power-domains =3D <&pd_mfc>;
> @@ -1344,9 +1344,9 @@ sysmmu_decon0x: sysmmu@13a00000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x13a00000 0x1000>;
>                         interrupts =3D <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_disp CLK_ACLK_SMMU_DECON0X>,
> -                               <&cmu_disp CLK_PCLK_SMMU_DECON0X>;
> +                                <&cmu_disp CLK_PCLK_SMMU_DECON0X>;
> +                       clock-names =3D "aclk", "pclk";
>                         power-domains =3D <&pd_disp>;
>                         #iommu-cells =3D <0>;
>                 };
> @@ -1355,9 +1355,9 @@ sysmmu_decon1x: sysmmu@13a10000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x13a10000 0x1000>;
>                         interrupts =3D <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_disp CLK_ACLK_SMMU_DECON1X>,
> -                               <&cmu_disp CLK_PCLK_SMMU_DECON1X>;
> +                                <&cmu_disp CLK_PCLK_SMMU_DECON1X>;
> +                       clock-names =3D "aclk", "pclk";
>                         #iommu-cells =3D <0>;
>                         power-domains =3D <&pd_disp>;
>                 };
> @@ -1366,9 +1366,9 @@ sysmmu_tv0x: sysmmu@13a20000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x13a20000 0x1000>;
>                         interrupts =3D <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_disp CLK_ACLK_SMMU_TV0X>,
> -                               <&cmu_disp CLK_PCLK_SMMU_TV0X>;
> +                                <&cmu_disp CLK_PCLK_SMMU_TV0X>;
> +                       clock-names =3D "aclk", "pclk";
>                         #iommu-cells =3D <0>;
>                         power-domains =3D <&pd_disp>;
>                 };
> @@ -1377,9 +1377,9 @@ sysmmu_tv1x: sysmmu@13a30000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x13a30000 0x1000>;
>                         interrupts =3D <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_disp CLK_ACLK_SMMU_TV1X>,
> -                               <&cmu_disp CLK_PCLK_SMMU_TV1X>;
> +                                <&cmu_disp CLK_PCLK_SMMU_TV1X>;
> +                       clock-names =3D "aclk", "pclk";
>                         #iommu-cells =3D <0>;
>                         power-domains =3D <&pd_disp>;
>                 };
> @@ -1388,9 +1388,9 @@ sysmmu_gscl0: sysmmu@13c80000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x13c80000 0x1000>;
>                         interrupts =3D <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_gscl CLK_ACLK_SMMU_GSCL0>,
>                                  <&cmu_gscl CLK_PCLK_SMMU_GSCL0>;
> +                       clock-names =3D "aclk", "pclk";
>                         #iommu-cells =3D <0>;
>                         power-domains =3D <&pd_gscl>;
>                 };
> @@ -1399,9 +1399,9 @@ sysmmu_gscl1: sysmmu@13c90000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x13c90000 0x1000>;
>                         interrupts =3D <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_gscl CLK_ACLK_SMMU_GSCL1>,
>                                  <&cmu_gscl CLK_PCLK_SMMU_GSCL1>;
> +                       clock-names =3D "aclk", "pclk";
>                         #iommu-cells =3D <0>;
>                         power-domains =3D <&pd_gscl>;
>                 };
> @@ -1410,9 +1410,9 @@ sysmmu_gscl2: sysmmu@13ca0000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x13ca0000 0x1000>;
>                         interrupts =3D <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_gscl CLK_ACLK_SMMU_GSCL2>,
>                                  <&cmu_gscl CLK_PCLK_SMMU_GSCL2>;
> +                       clock-names =3D "aclk", "pclk";
>                         #iommu-cells =3D <0>;
>                         power-domains =3D <&pd_gscl>;
>                 };
> @@ -1421,9 +1421,9 @@ sysmmu_scaler_0: sysmmu@15040000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x15040000 0x1000>;
>                         interrupts =3D <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_mscl CLK_ACLK_SMMU_M2MSCALER0>,
> -                               <&cmu_mscl CLK_PCLK_SMMU_M2MSCALER0>;
> +                                <&cmu_mscl CLK_PCLK_SMMU_M2MSCALER0>;
> +                       clock-names =3D "aclk", "pclk";
>                         #iommu-cells =3D <0>;
>                         power-domains =3D <&pd_mscl>;
>                 };
> @@ -1432,9 +1432,9 @@ sysmmu_scaler_1: sysmmu@15050000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x15050000 0x1000>;
>                         interrupts =3D <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_mscl CLK_ACLK_SMMU_M2MSCALER1>,
> -                               <&cmu_mscl CLK_PCLK_SMMU_M2MSCALER1>;
> +                                <&cmu_mscl CLK_PCLK_SMMU_M2MSCALER1>;
> +                       clock-names =3D "aclk", "pclk";
>                         #iommu-cells =3D <0>;
>                         power-domains =3D <&pd_mscl>;
>                 };
> @@ -1443,9 +1443,9 @@ sysmmu_jpeg: sysmmu@15060000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x15060000 0x1000>;
>                         interrupts =3D <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_mscl CLK_ACLK_SMMU_JPEG>,
> -                               <&cmu_mscl CLK_PCLK_SMMU_JPEG>;
> +                                <&cmu_mscl CLK_PCLK_SMMU_JPEG>;
> +                       clock-names =3D "aclk", "pclk";
>                         #iommu-cells =3D <0>;
>                         power-domains =3D <&pd_mscl>;
>                 };
> @@ -1454,9 +1454,9 @@ sysmmu_mfc_0: sysmmu@15200000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x15200000 0x1000>;
>                         interrupts =3D <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_mfc CLK_ACLK_SMMU_MFC_0>,
> -                               <&cmu_mfc CLK_PCLK_SMMU_MFC_0>;
> +                                <&cmu_mfc CLK_PCLK_SMMU_MFC_0>;
> +                       clock-names =3D "aclk", "pclk";
>                         #iommu-cells =3D <0>;
>                         power-domains =3D <&pd_mfc>;
>                 };
> @@ -1465,9 +1465,9 @@ sysmmu_mfc_1: sysmmu@15210000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x15210000 0x1000>;
>                         interrupts =3D <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_mfc CLK_ACLK_SMMU_MFC_1>,
> -                               <&cmu_mfc CLK_PCLK_SMMU_MFC_1>;
> +                                <&cmu_mfc CLK_PCLK_SMMU_MFC_1>;
> +                       clock-names =3D "aclk", "pclk";
>                         #iommu-cells =3D <0>;
>                         power-domains =3D <&pd_mfc>;
>                 };
> @@ -1620,8 +1620,8 @@ adc: adc@14d10000 {
>                         compatible =3D "samsung,exynos5433-adc", "samsung=
,exynos7-adc";
>                         reg =3D <0x14d10000 0x100>;
>                         interrupts =3D <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "adc";
>                         clocks =3D <&cmu_peric CLK_PCLK_ADCIF>;
> +                       clock-names =3D "adc";
>                         #io-channel-cells =3D <1>;
>
>                         status =3D "disabled";
>
> --
> 2.53.0
>

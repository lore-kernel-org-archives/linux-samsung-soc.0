Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DCE18F2FF;
	Tue, 30 Jul 2024 12:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722341187; cv=none; b=ItlID2Ph0R8CjOpP+TohkyVN6eNEewF+MJFEojnSUC3mKEZXhQUXlhOUIGvkr9+HtCGLNwhOO9iQZwRjAZ0SXwix5/r39LotYbLuJD94QmnJeonkuMMoH7z3sJHwBBfr/Du9EUxIVMGPpdca3k65YKpTmMEjdKyGiq0HQblSQAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722341187; c=relaxed/simple;
	bh=07Iy5C5shTtP865Ly9gi+XJwhtjmEm5e+chKbMptbIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/FlS1wpUCY0WNCWmBanetpIdDcwhnlhfmPsdsm5jpgiD2tCp1FqgIVloxhltAclioxj5SA7OtH7ThPXQ02R71z8h0vXSdQrLgP6xzw/OC3PbPjXi+nNbXAUoej5lj5MXEjYCNdJgeGtdhofSPxN+T2/RGWSYtsuWdTEc5liqHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4cAgfxr; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4cAgfxr"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3db130a872fso3091331b6e.2;
        Tue, 30 Jul 2024 05:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722341185; x=1722945985; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wTu0bCY12haUFeafoeDVmT2rJGMvu9SE359jSsc/p1s=;
        b=N4cAgfxr2tg1EpCd7PutSEtY8R20omVWnvrcOXWkUmnc8AVc8GTBYASSB3x5Kgu8eB
         tviLmU2YrnkgLIjunxyH2DxkA8UJk3e0tGFzpEoNQgsZ4DGEF44IJmAiBjZgwcHuF+ey
         UClpVQc8Z9CYVVOV58vyOfVFfgkSFGr4sAQjUUpPt3OCCULGesR/QhFJsxwly6zYR8UO
         C0rYKPDInFFAZrXb4Tb9AOKtjbsEkD/4UWguxLSHYArlMGyVIyoWFYB5grfqyqNLewCz
         I4wiz8Y4Ua5TkcX3qPmGZ0OVSMSxOrnFTMBPdBhETJqy32n8uPxIF3lAL8IfUe+CTR9c
         051g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722341185; x=1722945985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTu0bCY12haUFeafoeDVmT2rJGMvu9SE359jSsc/p1s=;
        b=n7zMq3DWRZ6iTV9rYXca3uNCYp3P8Vd4CbUdIAuhNf1QsU61qUwvUzjt9tOs1HNMDT
         YIdqJeiNYSkNtAS+TXtIk8fXhxKJAWq3AKiD10graJQYMS6tJZIpliO0Ntk9HVyz3WxQ
         YXXVGRnnAnKKKVDOCQBsNIbuXXlvdEFwXWb2C45JTANYd05icIFIoSivs1w/hhfNQOF0
         dXmjaIMQVHMiKMminzRrwqGaflahSezhpGkWwtZw/VDLigBxKdwRdWN7G2vHwZmX1X8P
         U3jlzVXUipWtsq/JAkDVB/zerCC1E9ii623ckbaExalUXGCfWyAcpVt13FEo20P+eeg0
         IXMw==
X-Forwarded-Encrypted: i=1; AJvYcCUUfpgVUnSIY3W2/8lM7HPMvlcYluUho64kRjMwnfykyPipo5Pn5ztC6hGMaEW7cl9HLOU1Vdv9AqZhedN0VctF5N42uzNjamF4+ZDNqoA6IihrTwJl5JutVIdSTDVzwVRMdAjRlx+t2jCLxcjTYdZIlsM8ehjgj2pYgTczdK1GokB/+rsCORk+0nUe
X-Gm-Message-State: AOJu0YxQHg4fN5HYmFGRd7RnzKpaiypQCvkSYYCvthMl96LRWF/OcePx
	fT0ALMZsaISQBbYtkKJRxa3OrduFmlfGAiFU8a50hO4qL4oUJgTBg8sNgXhy9rCXSwfrczZMd8M
	RgjQoCm1kxlK2ZJcQ0S8QM5hPNCmAtFqA
X-Google-Smtp-Source: AGHT+IE4qwPd/2Xe9I+KyZvah0VBfycypPzN0gHn1pNlet0MmP8B+YitkCrZrD8v1zvUR0X52X14FbQuDLcYeoi5Q/s=
X-Received: by 2002:a05:6808:1393:b0:3db:26fa:b470 with SMTP id
 5614622812f47-3db26fab847mr12773722b6e.30.1722341184788; Tue, 30 Jul 2024
 05:06:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730091322.5741-1-linux.amoon@gmail.com> <CGME20240730091412eucas1p18feced3968a5f87dc8fe05f78d5c7659@eucas1p1.samsung.com>
 <20240730091322.5741-2-linux.amoon@gmail.com> <09e9cf0b-27fd-46b8-8631-87d798afd19e@samsung.com>
In-Reply-To: <09e9cf0b-27fd-46b8-8631-87d798afd19e@samsung.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 30 Jul 2024 17:36:09 +0530
Message-ID: <CANAwSgT_TOFwP80+H8-CdXDLLu+u2XZMr2dnxcsSDe8S5yeYCw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ARM: dts: samsung: Add cache information to the
 Exynos542x SoC
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, 30 Jul 2024 at 17:14, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
>
> On 30.07.2024 11:13, Anand Moon wrote:
> > As per Exynos 5422 user manual add missing cache information to
> > the Exynos542x SoC.
> >
> > - Each Cortex-A7 core has 32 KB of instruction cache and
> >       32 KB of L1 data cache available.
> > - Each Cortex-A15 core has 32 KB of L1 instruction cache and
> >       32 KB of L1 data cache available.
> > - The little (A7) cluster has 512 KB of unified L2 cache available.
> > - The big (A15) cluster has 2 MB of unified L2 cache available.
> >
> > Features:
> > - Exynos 5422 support cache coherency interconnect (CCI) bus with
> >    L2 cache snooping capability. This hardware automatic L2 cache
> >    snooping removes the efforts of synchronizing the contents of the
> >    two L2 caches in core switching event.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>
>
> The provided values are not correct. Please refer to commit 5f41f9198f29
> ("ARM: 8864/1: Add workaround for I-Cache line size mismatch between CPU
> cores"), which adds workaround for different l1 icache line size between
> big and little CPUs. This workaround gets enabled on all Exynos542x/5800
> boards.
>
Ok, I have just referred to the Exynos 5422 user manual for this patch,
This patch is just updating the cache size for CPU for big.litle architecture..

Thanks
-Anand
>
> > ---
> >   .../arm/boot/dts/samsung/exynos5422-cpus.dtsi | 74 +++++++++++++++++++
> >   1 file changed, 74 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/samsung/exynos5422-cpus.dtsi b/arch/arm/boot/dts/samsung/exynos5422-cpus.dtsi
> > index 412a0bb4b988..9b9b2bdfb522 100644
> > --- a/arch/arm/boot/dts/samsung/exynos5422-cpus.dtsi
> > +++ b/arch/arm/boot/dts/samsung/exynos5422-cpus.dtsi
> > @@ -59,6 +59,13 @@ cpu0: cpu@100 {
> >                       reg = <0x100>;
> >                       clocks = <&clock CLK_KFC_CLK>;
> >                       clock-frequency = <1000000000>;
> > +                     d-cache-line-size = <32>;
> > +                     d-cache-size = <0x8000>;
> > +                     d-cache-sets = <32>;
> > +                     i-cache-line-size = <32>;
> > +                     i-cache-size = <0x8000>;
> > +                     i-cache-sets = <32>;
> > +                     next-level-cache = <&L2_a7>;
> >                       cci-control-port = <&cci_control0>;
> >                       operating-points-v2 = <&cluster_a7_opp_table>;
> >                       #cooling-cells = <2>; /* min followed by max */
> > @@ -72,6 +79,13 @@ cpu1: cpu@101 {
> >                       reg = <0x101>;
> >                       clocks = <&clock CLK_KFC_CLK>;
> >                       clock-frequency = <1000000000>;
> > +                     d-cache-line-size = <32>;
> > +                     d-cache-size = <0x8000>;
> > +                     d-cache-sets = <32>;
> > +                     i-cache-line-size = <32>;
> > +                     i-cache-size = <0x8000>;
> > +                     i-cache-sets = <32>;
> > +                     next-level-cache = <&L2_a7>;
> >                       cci-control-port = <&cci_control0>;
> >                       operating-points-v2 = <&cluster_a7_opp_table>;
> >                       #cooling-cells = <2>; /* min followed by max */
> > @@ -85,6 +99,13 @@ cpu2: cpu@102 {
> >                       reg = <0x102>;
> >                       clocks = <&clock CLK_KFC_CLK>;
> >                       clock-frequency = <1000000000>;
> > +                     d-cache-line-size = <32>;
> > +                     d-cache-size = <0x8000>;
> > +                     d-cache-sets = <32>;
> > +                     i-cache-line-size = <32>;
> > +                     i-cache-size = <0x8000>;
> > +                     i-cache-sets = <32>;
> > +                     next-level-cache = <&L2_a7>;
> >                       cci-control-port = <&cci_control0>;
> >                       operating-points-v2 = <&cluster_a7_opp_table>;
> >                       #cooling-cells = <2>; /* min followed by max */
> > @@ -98,6 +119,13 @@ cpu3: cpu@103 {
> >                       reg = <0x103>;
> >                       clocks = <&clock CLK_KFC_CLK>;
> >                       clock-frequency = <1000000000>;
> > +                     d-cache-line-size = <32>;
> > +                     d-cache-size = <0x8000>;
> > +                     d-cache-sets = <32>;
> > +                     i-cache-line-size = <32>;
> > +                     i-cache-size = <0x8000>;
> > +                     i-cache-sets = <32>;
> > +                     next-level-cache = <&L2_a7>;
> >                       cci-control-port = <&cci_control0>;
> >                       operating-points-v2 = <&cluster_a7_opp_table>;
> >                       #cooling-cells = <2>; /* min followed by max */
> > @@ -111,6 +139,13 @@ cpu4: cpu@0 {
> >                       reg = <0x0>;
> >                       clocks = <&clock CLK_ARM_CLK>;
> >                       clock-frequency = <1800000000>;
> > +                     d-cache-line-size = <32>;
> > +                     d-cache-size = <0x8000>;
> > +                     d-cache-sets = <32>;
> > +                     i-cache-line-size = <32>;
> > +                     i-cache-size = <0x8000>;
> > +                     i-cache-sets = <32>;
> > +                     next-level-cache = <&L2_a15>;
> >                       cci-control-port = <&cci_control1>;
> >                       operating-points-v2 = <&cluster_a15_opp_table>;
> >                       #cooling-cells = <2>; /* min followed by max */
> > @@ -124,6 +159,13 @@ cpu5: cpu@1 {
> >                       reg = <0x1>;
> >                       clocks = <&clock CLK_ARM_CLK>;
> >                       clock-frequency = <1800000000>;
> > +                     d-cache-line-size = <32>;
> > +                     d-cache-size = <0x8000>;
> > +                     d-cache-sets = <32>;
> > +                     i-cache-line-size = <32>;
> > +                     i-cache-size = <0x8000>;
> > +                     i-cache-sets = <32>;
> > +                     next-level-cache = <&L2_a15>;
> >                       cci-control-port = <&cci_control1>;
> >                       operating-points-v2 = <&cluster_a15_opp_table>;
> >                       #cooling-cells = <2>; /* min followed by max */
> > @@ -137,6 +179,13 @@ cpu6: cpu@2 {
> >                       reg = <0x2>;
> >                       clocks = <&clock CLK_ARM_CLK>;
> >                       clock-frequency = <1800000000>;
> > +                     d-cache-line-size = <32>;
> > +                     d-cache-size = <0x8000>;
> > +                     d-cache-sets = <32>;
> > +                     i-cache-line-size = <32>;
> > +                     i-cache-size = <0x8000>;
> > +                     i-cache-sets = <32>;
> > +                     next-level-cache = <&L2_a15>;
> >                       cci-control-port = <&cci_control1>;
> >                       operating-points-v2 = <&cluster_a15_opp_table>;
> >                       #cooling-cells = <2>; /* min followed by max */
> > @@ -150,12 +199,37 @@ cpu7: cpu@3 {
> >                       reg = <0x3>;
> >                       clocks = <&clock CLK_ARM_CLK>;
> >                       clock-frequency = <1800000000>;
> > +                     d-cache-line-size = <32>;
> > +                     d-cache-size = <0x8000>;
> > +                     d-cache-sets = <32>;
> > +                     i-cache-line-size = <32>;
> > +                     i-cache-size = <0x8000>;
> > +                     i-cache-sets = <32>;
> > +                     next-level-cache = <&L2_a15>;
> >                       cci-control-port = <&cci_control1>;
> >                       operating-points-v2 = <&cluster_a15_opp_table>;
> >                       #cooling-cells = <2>; /* min followed by max */
> >                       capacity-dmips-mhz = <1024>;
> >                       dynamic-power-coefficient = <310>;
> >               };
> > +
> > +             L2_a7: l2-cache-cluster0 {
> > +                     compatible = "cache";
> > +                     cache-level = <2>;
> > +                     cache-unified;
> > +                     cache-size = <0x80000>; /* L2. 512 KB */
> > +                     cache-line-size = <64>;
> > +                     cache-sets = <512>;
> > +             };
> > +
> > +             L2_a15: l2-cache-cluster1 {
> > +                     compatible = "cache";
> > +                     cache-level = <2>;
> > +                     cache-unified;
> > +                     cache-size = <0x200000>; /* L2, 2M */
> > +                     cache-line-size = <64>;
> > +                     cache-sets = <512>;
> > +             };
> >       };
> >   };
> >
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>

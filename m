Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060C939934C
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Aug 2026 12:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845261; cv=pass; b=Vb6Dch/zK524czW+8VaB9iskeqd5LNu+uE3wVWUXAsjPGYbfPhf0uNfmJtUmoNieN6tsGueutmUUBuodbSUXx/ztplUh/TTRXNqjM+wFP7fIQqUetX8JwZkDJr5nvD9JZwG0f/KEIrpXbfEAUdzHQX2WUYSDvt4fF03JC42JOvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845261; c=relaxed/simple;
	bh=MKpC6XQ+00hU3bnVTnqZEYjizODE483Yd+dvd3pEtkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rO0Eg+xA6PIPDjybJDg5G8Dg5Q3UhOMou5RXjf1LI0Ftm+XEKjKlxjX7Cjp+SjvUj0NaCuMcoKZ9kLfNR3Jojl2oYlxDCfVf1eQqgx25RiSpU5u+wba6dpYNQ0HXe9mC4HSlB8O76R6QT4dlsx/16irY7LW6uIfw4q5iXALeIOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jlIze3Mx; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jlIze3Mx"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a10b20634fso3062226a12.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Aug 2026 05:07:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785845256; cv=none;
        d=google.com; s=arc-20260327;
        b=r3vA0rakZFYFBSmmyIjcXWMWtUEPvKivN95tRl9tBdLzf+kMBwWHAxz+07LDHU1/4j
         8pfvT0/RUv7Mt2LKwxyFwMXR65J/kuvb5fwTjtDbDIzDmSNcD+oDNz81wWBCJUrQd8yE
         LgBCJ5GnnMLn8NHtMaL6eLT1RNdmbETijcv2UtBSSQOHnkdsa1OGgWTz79cSyp8aHnii
         N2p00gmLq+kyBpFf8KFVyY1TE4KoESfoPrN11bi4ocHKAoqoH59PXK4a0504Lpg1h/Ui
         3UoQW8s7S32r3r9CFHP/IXRlZu9Jc1+iWRrqHdsqrcvxzo/tYHOtfrib0OaRB9H7UGHO
         Zjdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k86BDqMgnjiTWxgiwHkrcpnRcpmgZHNdGs3Vg4GeEN4=;
        fh=oXb+7jIqiYityK5C9RVXjWj5jBlvc8lIsu9wxwRHK54=;
        b=DHzZq/+gAahDjG5btlRh6d1hRI32KcKYZ4v7fcwkLuB1WCS5z5nkAL/M4kjhttNx/3
         3Pzk3bL17G2i+Lk2n89erzMJlBh2/QN4KMnseUisxCfQG4luCAx5DNgRu6yzRyeo3azF
         XhSWkShPvVmYnOs8KH9mW1hJ67mlUm/aKA3z/hD6WKMegEFdqBRJcG6+TdF3LvLaZoHs
         NYzGYfGt4MnpKYFaDK2AmqnY8oKrRWO8aycIskS0xHMnWwMXCBJ28sLssswcnYmS+IWf
         8IhAmC8Z07QuEw8QtZiJ3mbf5pNMEW6TR3P964mLtGt5MhOoeZIAMYaozvuU/dT0EX6n
         wEuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785845256; x=1786450056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k86BDqMgnjiTWxgiwHkrcpnRcpmgZHNdGs3Vg4GeEN4=;
        b=jlIze3MxIiy3EZmsy7bDZEtdHooTWnY9d5joOvWdestzEXyaS9RETuhR1SnR2KByc4
         UK1brCAi3pfj76/Motfq8x8WMTERjhv7gqatpwHtIcKkJBBT57RTPENt2znWr3OynLc2
         eQY7g9YnHFz2JQhfwhxZz9ixlldDXDJnWU9+sPet5u+xo2SpQIZEe7wH0bdJlnQ6Rzkc
         o9HXvZjA6abitLgILmkzTKww0M5wdVWod1LpVgo5Ndjwpk+IOEAKwAcu7LCuplIG/Okp
         WDZDSPY5Geb3ODqGDAeXtJPEfR37xoYsdIkGG1neQlAmbkfOBSL8fBeRI+VTu4bFanOE
         ZNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845256; x=1786450056;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k86BDqMgnjiTWxgiwHkrcpnRcpmgZHNdGs3Vg4GeEN4=;
        b=ELerCPriZFjTcJK+maPL8ZPFVpCqf/jgZG3qwZf6K3fPKM8OYLsPdpmrfwaMKexrll
         Vd8PI8EUv/YzizDcqBr3XN82DmPGnFZyrudUpoz6uJsB87TTv4XJKsJk3OydmRR3izHj
         FXBJ8X6dmtZ9oVRUI2t7A/1K+ey4kq3PPvrz9JJYM82oSiaW5K1281QBWMnWQ4IU9VB8
         ZFF0opbImOK/eCsH60phYRDh0py8jb9fWd+nmWKemzoZ4fBsm1pFy8BxvjO83yNo7A67
         SMa2EybPIRGlFBOalDZ5mi2WL04B0g7PRHABgjdTda2acvQwGvcFGXIlZ3jc/WjZh3DY
         LQWw==
X-Forwarded-Encrypted: i=1; AHgh+RrxDzEPeGWFN3BbMWZeXThrXXm/v/n4KQ1mks4sEEYHwxOzWf8zFpIey8qDYUjd/20ogzBDtslnECL2u8vaSGxR5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjo/C3WvbNyddkyPQvqEWvo5r2tpFx8orgF1rOHsdHcoAKfuPO
	mNo87Lv/T/oN6A3+WpAQ5MlCCu19Gi+rV5HRVkKh+QwfaJEYCPHP0kQQzBrsrw8gzH1Elkcdfcx
	se+7t7kyv2ILPqdY9TOsTnGiyrvlvbiBwDg4tOnqLcQ==
X-Gm-Gg: AR+sD129+aWKoeaZ9AFo/jn/rCDbyVq8jPS166PUAhoUyZQCfProcRxzYXRAGSnKA4s
	wXtKSH6sS+CU6s8maTwiR55UKRm8cqdRV/thR1MjlVhYrwENQyTIYXu4MCgESzU4tG0D4KXbEWN
	cE3eQ5elHdegzycYlMnzgSLJyQvrro/QgurU3DVefHKqoI0qiQsDAssFSV7Urnb45rtz22VPAZ7
	x+irtLYXcPcyDX9U/fCpe9PuVIm5SuH3qDYWp4Grs7PcKB0peqcP0y5CJoPW8qqfS/4kM/+iP1r
	sRRAWJSmQfDD9sHBfEn3HwvqeFsyE1AtYHHKrRvoCUEMKnyyoKzUuDybVeREl7kCJAyePRDGx6w
	Zuxw=
X-Received: by 2002:a05:6402:388e:b0:6a1:2863:ad74 with SMTP id
 4fb4d7f45d1cf-6a12863af68mr2437534a12.16.1785845256497; Tue, 04 Aug 2026
 05:07:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
 <20260801-b4-dts-coding-style-strict-v2-3-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-3-f09a659ab80d@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Aug 2026 13:07:22 +0100
X-Gm-Features: AUfX_mwrWQhO6_L2Bot9kuFbfGYJZrtdWlLRWzD4dosje_HVGZdBKQIbCnWzkTk
Message-ID: <CADrjBPqc7jsrfYJXecG-PYt_Pp0vE0mA6GhOhb54u1p0SUFCzw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] arm64: dts: exynos5433: Override thermal zones by phandle
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
> Fix indentation of DTSI file with thermal zones (two opening { brackets,
> but only one indent) by using a safer choice of phandle/label override.
>
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi | 4 +---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi     | 3 +++
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi b/arch/arm64/=
boot/dts/exynos/exynos5433-tmu.dtsi
> index 57b335f579d8..a3ebc49fcd36 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi
> @@ -7,8 +7,7 @@
>
>  #include <dt-bindings/thermal/thermal.h>
>
> -/ {
> -thermal-zones {
> +&thermal_zones {
>         atlas0_thermal: atlas0-thermal {
>                 thermal-sensors =3D <&tmu_atlas0>;
>                 polling-delay-passive =3D <0>;
> @@ -347,4 +346,3 @@ isp_alert_6: isp-alert-6 {
>                 };
>         };
>  };
> -};
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot=
/dts/exynos/exynos5433.dtsi
> index 5fc3ca233ac6..ebd63b9e244d 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -2073,6 +2073,9 @@ pcie: pcie@15700000 {
>                 };
>         };
>
> +       thermal_zones: thermal-zones {
> +       };
> +
>         timer: timer {
>                 compatible =3D "arm,armv8-timer";
>                 interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_=
TYPE_LEVEL_HIGH)>,
>
> --
> 2.53.0
>

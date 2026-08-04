Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2729E3D88F6
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Aug 2026 12:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845506; cv=pass; b=Er2AHRK4gIwGGlW3CScVb76m1FuV4J5fNa0js+yev2ptB6R8+/gjdd8C9EBiREd4hY736KTiqiZycNNiVdChxL/3VJAi+aqSiLffvi/kh7Nz03pS1ej9cez36UhwYlQG5VJRGtZzjgCiRWiYFiwjFYrp83zDv0NZ3TAWbvkcKo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845506; c=relaxed/simple;
	bh=Vc2K8K3/wO2xt9lWIqY7aV8z8TRWb0/Z/YFUuOsyxKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jKJ5hVKhn6+xiPuMl1WxVZlpDmNm+6db8IJZYbwFPnpvAt09ZHVemyLsQRZI43eG2GiOaDiU5kbolE5QHq9T8W6s8/JStXRAUnjTqTPHMYNCJiYYH0cKFNmUmlq25kDuZVDUaF5AlWvOwSsicCuki+oVbrCH5iiHXcEhXPA5D2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WSTeQaj9; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WSTeQaj9"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69f2c67650aso7031546a12.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Aug 2026 05:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785845502; cv=none;
        d=google.com; s=arc-20260327;
        b=XBlQGMR17skUOp3gKAJnVkbRZOWN0IOIwaQw/hXEOCflDfNzs6GJJl1+3IjAUP3JTI
         6n2SbmksNpWfpOg/6RTeeM1O56j0a4D+POQwPQpmFpUhAIqdxmFKPoYVdx9TZr0wI/rv
         tpWV91ElUlUBD/WseV4luefk2y1pUWeiQZb6rERcfD4eoZyJNLDMnkHQ6QnwXZY2YNzE
         ipmbr1xR1pE3THQgCL4+aaVGrijo2NQqaE3Xc2Uq6MOF6qnK3aHxsbqq7WovySs4q3zt
         GyXsVh7h7DamQ9+jAvLIvIBFniB/9KwSlrhHmrzku8yijaziTUG+/46kOtESdSvkwLXX
         BIHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z0BOXxAbTVuGKMQNaanorzcfB9Bd3BBit6YLVIa3kYc=;
        fh=3rtku2LoNOzZVyFIjlLSUW44twdbSN7TrD50CQU/Q+c=;
        b=WYtgZ5JQXa8t8s007SfUGJ6JqGQXFbVYDNEdlY+Gx2czORKyUfog0NIIRsf1p0sRBl
         JI3Zcoc2+xGv1aqk5yWPJ64cWlSd/Xt/FkFrUYeMUAYT2ax0GxlKuvM2kEIb3CVeBaZf
         C/+7ngcncav69s2ndpHcF6xqQ86sfzvwiLCsJSUAjg6xeS9HIAZonnUW478HvsFBcofK
         5P0kOtH4mkC1aoTytlMQvb4WTf0wWl083Aa9YOUNRtunzG98Pfn0K6/nba9+sBw2as7I
         pS0SIW0o8DZ7nBDA8EoDOPQF3MZRiDZuR9Sj2qSUoCZvX9d64ejzxnk5TX125ZFSMXPf
         IM5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785845502; x=1786450302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z0BOXxAbTVuGKMQNaanorzcfB9Bd3BBit6YLVIa3kYc=;
        b=WSTeQaj90XqCKBoZlv7SV9OHDQUEqz6sTMi6wDop63SlFs3Ud1BE6IsWQ3VKubdwlX
         KdfpsOhOXmjdlLbVjQnLlF96zMKI8+VqWBEK7FijvFkvkrsewXGKKFTW3ej5jwKwrjJO
         jAEU+zydwTcnL8+XJ1v1nykknetjnbN7ZQundPJAL4/AC709aDGipyESJIhJxIxnw/dY
         Z6voUGFAqnPgtBngyyFlY6vufhfkJQNRLnSdJ7d+inD89uintMlsv4+KeN/JEIV+AUi1
         8YXLiCeFS1w2boZfIS3gOGStIgMSSQjTPzdpXppVlY/vfNSPc6YiSFoekE59xuEbBWiE
         C9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845502; x=1786450302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z0BOXxAbTVuGKMQNaanorzcfB9Bd3BBit6YLVIa3kYc=;
        b=kZjdr72xObeJrBWh5BylT814Bh0U1/8AHi/11bWvtEhc3LM68U9lfEkQIM5ZSxzoIB
         droLTh8EOe/ysFN3dMcyADQC1PtmGmzXTWC7I8QUIHUynegyRBHj9DV0wnXXvlYeuH6w
         6k3nNZZqvz6CcayLovh1qqFbKNxos8wDU3tB2WljbMXxWMCxkMXWE0fcFK5BaDQ7s9MF
         2iNf0HtInmESmXNQXsWXaq837UR6+kckEe1owF82r1MC5b9QglRJNLnPPbWk52ypZWKo
         jf3gVxtA3q/pN8Ha6RG56W3yEbRnzqtaeL5Zy5Kbs9BNDh5c3hZGVgpVAsCrONwxLtP5
         hYJg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+oVZlHDyuy5H8kQVjySg5eyNcjBTf1CWbaLocRBfDekR6vTq/W55KNqIwEX1HixazBh5EOyBwsfIh/pFb1uX0PQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz8BdEPKcpMxJDn/COimU6ap/mLPco77jDlA7LHZW80FMAHgAR
	RdGL1hdZtVyCQAjlL8q/wEtUMsWURGFKXJ1TURn+hXg0xMa4QmL88T8KiaK62JIjgqeOUM+xeOn
	8BlAgO0pONMPCF5g2mABhFYEHVCjn8m0FjgbrJaIIcQ==
X-Gm-Gg: AR+sD12Tm181jWrOoh6KGRlOMvqf2W8Jx1OSFq8H9+DXBPJIi/kdBz1dhdXdu89p+G/
	NsBc5RMz5f2ZHD71OkL5i3KiGn+aQutfyY6geMxAM5O6EsAcModqVhG5FxEtz8eQ2eqvEZeOMeU
	EjT5LWvcAclZwfuWy+28cEj25Yv1bogGoMNdwrgIKRbat7cy7eEG6kys4fBYTNiuioEA3x8bJF1
	3mv7bvUKq+3vHurnEgm1tc0981+C53F0tVaW/DEdyLBySjgppu9oS3nrvVBPWuoSdJLvnlaiR+j
	Q6atWhDimfwMDC3YpR8Qwz7/lsb1e7Lm6/52Yq50buHdkohAJFZS+eNYyYhH1ZvlPMy49cUyqTs
	qSaA=
X-Received: by 2002:a05:6402:a51b:10b0:6a0:c826:6494 with SMTP id
 4fb4d7f45d1cf-6a0c82665a7mr6874744a12.17.1785845501833; Tue, 04 Aug 2026
 05:11:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
 <20260801-b4-dts-coding-style-strict-v2-6-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-6-f09a659ab80d@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Aug 2026 13:11:28 +0100
X-Gm-Features: AUfX_mxMUwqUomM84AsdgBn375nan6j7Xy_5FQP7ITXDD-yyX2SPy00_MokSRL4
Message-ID: <CADrjBPouUvFVLDWwDDS=+1EBfqSqUz1HLKcLPLRyjB++vBy88Q@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] arm64: dts: google: Align continued properties and
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

>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index edc38f2d1183..bfceea5486f4 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -39,12 +39,15 @@ cluster0 {
>                                 core0 {
>                                         cpu =3D <&cpu0>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu1>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpu2>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpu3>;
>                                 };
> @@ -54,6 +57,7 @@ cluster1 {
>                                 core0 {
>                                         cpu =3D <&cpu4>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu5>;
>                                 };
> @@ -63,6 +67,7 @@ cluster2 {
>                                 core0 {
>                                         cpu =3D <&cpu6>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu7>;
>                                 };
> @@ -1681,9 +1686,9 @@ usbdrd31: usb@11110000 {
>                         compatible =3D "google,gs101-dwusb3";
>                         ranges =3D <0x0 0x11110000 0x10000>;
>                         clocks =3D <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_BUS_=
CLK_EARLY>,
> -                               <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_I_USB31=
DRD_SUSPEND_CLK_26>,
> -                               <&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_A=
CLK>,
> -                               <&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_P=
CLK>;
> +                                <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_I_USB3=
1DRD_SUSPEND_CLK_26>,
> +                                <&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_=
ACLK>,
> +                                <&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_=
PCLK>;
>                         clock-names =3D "bus_early", "susp_clk", "link_ac=
lk", "link_pclk";
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
>
> --
> 2.53.0
>

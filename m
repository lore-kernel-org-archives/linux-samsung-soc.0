From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: add DT nodes for PRNG in Exynos5 SoCs
Date: Tue, 28 Nov 2017 13:56:42 +0100
Message-ID: <CAJKOXPexERCdXgYbE9TSE1RzNEyLwiSM9wCMwVJahQoapjSrJw@mail.gmail.com>
References: <CGME20171128125013eucas1p1767769224b6bc9455fe2b3158c1d7fad@eucas1p1.samsung.com>
 <20171128125009.30195-1-l.stelmach@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:56514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751555AbdK1M4o (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Nov 2017 07:56:44 -0500
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com [209.85.128.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2289721943
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Nov 2017 12:56:44 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id o14so241350wrf.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Nov 2017 04:56:44 -0800 (PST)
In-Reply-To: <20171128125009.30195-1-l.stelmach@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, Kukjin Kim <kgene@kernel.org>

On Tue, Nov 28, 2017 at 1:50 PM, Łukasz Stelmach <l.stelmach@samsung.com> wrote:
> Add nodes for PRNG in dts files decribing Exynos5 chips.
>
> Rename the device node in exynos4.dtsi to match names
> in exynos5.dtsi.
>
> Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi    | 2 +-
>  arch/arm/boot/dts/exynos5.dtsi    | 5 +++++
>  arch/arm/boot/dts/exynos5250.dtsi | 5 +++++
>  arch/arm/boot/dts/exynos5410.dtsi | 5 +++++
>  arch/arm/boot/dts/exynos5420.dtsi | 5 +++++
>  5 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index 5739389f5bb8..bfa4c9062449 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -1005,7 +1005,7 @@
>                 clock-names = "secss";
>         };
>
> -       prng: rng@10830400 {
> +       prng: prng@10830400 {

When you added a trng node in Exynos TRNG patch [1] I was thinking
about using just "rng" as node name. However it seemed not that
important to raise a review concern.

However now you want to convert rng to prng... I think no. It should
be rng because this is the generic name of a device class (as pointed
by ePAPR).

Please use scripts/get_maintainers.pl to get the list of people to CC
(+Cc Kukjin).

[1] https://patchwork.kernel.org/patch/10076239/

Best regards,
Krzysztof

>                 compatible = "samsung,exynos4-rng";
>                 reg = <0x10830400 0x200>;
>                 clocks = <&clock CLK_SSS>;
> diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
> index 7da4a4285b24..8429d9f4dc52 100644
> --- a/arch/arm/boot/dts/exynos5.dtsi
> +++ b/arch/arm/boot/dts/exynos5.dtsi
> @@ -210,5 +210,10 @@
>                         reg = <0x10830000 0x300>;
>                         interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
>                 };
> +
> +               prng: prng@10830400 {
> +                     compatible = "samsung,exynos4-rng";
> +                     reg = <0x10830400 0x200>;
> +               };
>         };
>  };
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 8032d7e567fc..51aa83ba8c87 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -1036,6 +1036,11 @@
>         pinctrl-0 = <&i2c3_bus>;
>  };
>
> +&prng {
> +       clocks = <&clock CLK_SSS>;
> +       clock-names = "secss";
> +};
> +
>  &pwm {
>         clocks = <&clock CLK_PWM>;
>         clock-names = "timers";
> diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
> index 7eab4bc07cec..1604cb1b837d 100644
> --- a/arch/arm/boot/dts/exynos5410.dtsi
> +++ b/arch/arm/boot/dts/exynos5410.dtsi
> @@ -325,6 +325,11 @@
>         clock-names = "fin_pll", "mct";
>  };
>
> +&prng {
> +       clocks = <&clock CLK_SSS>;
> +       clock-names = "secss";
> +};
> +
>  &pwm {
>         clocks = <&clock CLK_PWM>;
>         clock-names = "timers";
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 02d2f898efa6..31c77ea9123d 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -1409,6 +1409,11 @@
>         clock-names = "fin_pll", "mct";
>  };
>
> +&prng {
> +       clocks = <&clock CLK_SSS>;
> +       clock-names = "secss";
> +};
> +
>  &pwm {
>         clocks = <&clock CLK_PWM>;
>         clock-names = "timers";
> --
> 2.11.0
>

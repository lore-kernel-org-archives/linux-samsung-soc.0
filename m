From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: exynos: Add I2S1 device node to exynos5433.dtsi
Date: Tue, 6 Feb 2018 14:07:24 +0100
Message-ID: <CAJKOXPdxND9Rf4p6stkdhBNY0AzdMqfDtopiBfYttex77+tjnA@mail.gmail.com>
References: <CGME20180205172146epcas1p1cd7a5027e673fc17fb64d8841c47175a@epcas1p1.samsung.com>
 <20180205172110.9897-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752488AbeBFNH1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Feb 2018 08:07:27 -0500
In-Reply-To: <20180205172110.9897-1-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene@kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, jcsing.lee@samsung.com, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On Mon, Feb 5, 2018 at 6:21 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> Add DT node for the second I2S controller available on Exynos 5433
> SoC. While at it the i2s0 node name is changed to a more generic
> "i2s" and missing properties are added to that node.

Please split it - one patch for adding new I2S and second minor
cleanup in i2s0 and adding of required properties.

I think there are no dependencies on driver code changes... but let me
know if I am wrong.

Best regards,
Krzysztof


> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index 62f276970174..2b73bd86bc56 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -1311,6 +1311,25 @@
>                         status = "disabled";
>                 };
>
> +               i2s1: i2s@14d60000 {
> +                       compatible = "samsung,exynos7-i2s";
> +                       reg = <0x14d60000 0x100>;
> +                       dmas = <&pdma0 31 &pdma0 30>;
> +                       dma-names = "tx", "rx";
> +                       interrupts = <GIC_SPI 435 IRQ_TYPE_NONE>;
> +                       clocks = <&cmu_peric CLK_PCLK_I2S1>,
> +                                <&cmu_peric CLK_PCLK_I2S1>,
> +                                <&cmu_peric CLK_SCLK_I2S1>;
> +                       clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
> +                       #clock-cells = <1>;
> +                       samsung,supports-6ch;
> +                       samsung,supports-rstclr;
> +                       samsung,supports-tdm;
> +                       samsung,supports-low-rfs;
> +                       #sound-dai-cells = <1>;
> +                       status = "disabled";
> +               };
> +
>                 pwm: pwm@14dd0000 {
>                         compatible = "samsung,exynos4210-pwm";
>                         reg = <0x14dd0000 0x100>;
> @@ -1639,7 +1658,7 @@
>                                 power-domains = <&pd_aud>;
>                         };
>
> -                       i2s0: i2s0@11440000 {
> +                       i2s0: i2s@11440000 {
>                                 compatible = "samsung,exynos7-i2s";
>                                 reg = <0x11440000 0x100>;
>                                 dmas = <&adma 0 &adma 2>;
> @@ -1651,9 +1670,11 @@
>                                         <&cmu_aud CLK_SCLK_AUD_I2S>,
>                                         <&cmu_aud CLK_SCLK_I2S_BCLK>;
>                                 clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
> +                               #clock-cells = <1>;
>                                 pinctrl-names = "default";
>                                 pinctrl-0 = <&i2s0_bus>;
>                                 power-domains = <&pd_aud>;
> +                               #sound-dai-cells = <1>;
>                                 status = "disabled";
>                         };
>
> --
> 2.14.2
>

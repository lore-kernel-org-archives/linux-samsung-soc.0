From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: exynos: Add soc node to exynos5440
Date: Mon, 5 Feb 2018 16:19:35 +0100
Message-ID: <CAJKOXPdw3veeg5_CQDLwLcGefKoA1yQXy9Aa=bcvXzDe05JPsQ@mail.gmail.com>
References: <CGME20180205123946eucas1p15bea1fa030286a8e217db8dac6340dcb@eucas1p1.samsung.com>
 <1517834374-2169-1-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517834374-2169-1-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 5, 2018 at 1:39 PM, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> The exynos5440 device tree is the only one left, which does not use
> "soc" node. Add a "soc" node to exynos5440.dtsi in order to make it
> compatible with other exynos DTS.
>
> Signed-off-by: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos5440.dtsi | 526 +++++++++++++++++++-------------------
>  1 file changed, 267 insertions(+), 259 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
> index fce9e26..5cdeda0 100644
> --- a/arch/arm/boot/dts/exynos5440.dtsi
> +++ b/arch/arm/boot/dts/exynos5440.dtsi

(...)

>
> -       tmuctrl_2: tmuctrl@160120 {
> -               compatible = "samsung,exynos5440-tmu";
> -               reg = <0x160120 0x230>, <0x160368 0x10>;
> -               interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> -               clocks = <&clock CLK_B_125>;
> -               clock-names = "tmu_apbif";
> -               #include "exynos5440-tmu-sensor-conf.dtsi"
> -       };
> +               tmuctrl_0: tmuctrl@160118 {
> +                       compatible = "samsung,exynos5440-tmu";
> +                       reg = <0x160118 0x230>, <0x160368 0x10>;
> +                       interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&clock CLK_B_125>;
> +                       clock-names = "tmu_apbif";
> +                       #include "exynos5440-tmu-sensor-conf.dtsi"
> +               };
>
> -       thermal-zones {
> -               cpu0_thermal: cpu0-thermal {
> -                       thermal-sensors = <&tmuctrl_0>;
> -                       #include "exynos5440-trip-points.dtsi"
> +               tmuctrl_1: tmuctrl@16011c {
> +                       compatible = "samsung,exynos5440-tmu";
> +                       reg = <0x16011C 0x230>, <0x160368 0x10>;
> +                       interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&clock CLK_B_125>;
> +                       clock-names = "tmu_apbif";
> +                       #include "exynos5440-tmu-sensor-conf.dtsi"
>                 };
> -               cpu1_thermal: cpu1-thermal {
> -                      thermal-sensors = <&tmuctrl_1>;
> -                      #include "exynos5440-trip-points.dtsi"
> +
> +               tmuctrl_2: tmuctrl@160120 {
> +                       compatible = "samsung,exynos5440-tmu";
> +                       reg = <0x160120 0x230>, <0x160368 0x10>;
> +                       interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&clock CLK_B_125>;
> +                       clock-names = "tmu_apbif";
> +                       #include "exynos5440-tmu-sensor-conf.dtsi"
>                 };
> -               cpu2_thermal: cpu2-thermal {
> -                      thermal-sensors = <&tmuctrl_2>;
> -                      #include "exynos5440-trip-points.dtsi"
> +
> +               thermal-zones {

Just like in case of other boards, leave thermal-zones outside of soc
(unless there is a problem with it?).

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

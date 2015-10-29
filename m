From: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 2/4] ARM: dts: Add SROMc to Exynos 5410
Date: Thu, 29 Oct 2015 22:58:16 +0530
Message-ID: <CAGcde9EXfe0amqoTOwgKi-Y6=4mRcEbZrA=as-BxzfMv3ntAhQ@mail.gmail.com>
References: <cover.1446122247.git.p.fedin@samsung.com> <eafa355058ff500a72ff2e3408ab635954467a76.1446122247.git.p.fedin@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <eafa355058ff500a72ff2e3408ab635954467a76.1446122247.git.p.fedin-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Fedin <p.fedin-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Pavel,

On 29 October 2015 at 18:12, Pavel Fedin <p.fedin-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> This machine uses own SoC device tree file, add missing part.
>
> Signed-off-by: Pavel Fedin <p.fedin-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos5410.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
> index 4603356..da6a8fa0e 100644
> --- a/arch/arm/boot/dts/exynos5410.dtsi
> +++ b/arch/arm/boot/dts/exynos5410.dtsi
> @@ -101,6 +101,15 @@
>                         reg = <0x10000000 0x100>;
>                 };
>
> +               sromc: sromc@12250000 {
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges;
> +

We do not need to specify these three properties as they are already
present in parent node "soc".

> +                       compatible = "samsung,exynos-srom";
> +                       reg = <0x12250000 0x14>;
> +               };
> +
>                 pmu_system_controller: system-controller@10040000 {
>                         compatible = "samsung,exynos5410-pmu", "syscon";
>                         reg = <0x10040000 0x5000>;
> @@ -133,6 +142,12 @@
>                                                 <10 &gic 0 130 0>,
>                                                 <11 &gic 0 131 0>;
>                         };
> +
> +                       arch_timer {
> +                               compatible = "arm,armv7-timer";
> +                               clock-frequency = <24000000>;
> +                       };
> +

This change should not be part of this patch.

Thanks,
Pankaj Dubey

>                 };
>
>                 sysram@02020000 {
> --
> 2.4.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 0/4] ARM/arm64: exynos: Fix missing missing reg
 warning for syscon restart nodes
Date: Thu, 08 Feb 2018 14:46:32 +0100
Message-ID: <4642d2d0-61c9-33b6-0289-76f487aa45ab@samsung.com>
References: <CGME20180130211855epcas1p25cce42a195d8b407f4267309f9b5ccb9@epcas1p2.samsung.com>
        <20180130211819.17139-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20180130211819.17139-1-krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Content-language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 2018-01-30 22:18, Krzysztof Kozlowski wrote:
> Hi,
>
> Changes since v1:
> 1. New patch (1/4) calling devm_of_platform_populate() in PMU driver,
>     following Rob's advice.
> 2. The DTS patches moving reboot/poweroff nodes (3/4 and 4/4) now depend
>     on this.

Tested-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Tested following boards and reboot works fine:
Exynos3250 (artik5-eval)
Exynos4412 (trats2)
Exynos5410 (odroid xu)
Exynos5422 (odroid xu3/xu4)
Exynos5433 (tm2)

> Best regards,
> Krzysztof
>
>
> Krzysztof Kozlowski (4):
>    soc: samsung: pmu: Populate children syscon nodes
>    ARM: dts: exynos: Remove duplicated inclusion of syscon restart nodes
>      on Exynos5410
>    ARM: dts: exynos: Fix missing missing reg warning for syscon restart
>      nodes
>    arm64: dts: exynos: Fix missing missing reg warning for syscon restart
>      nodes
>
>   .../devicetree/bindings/arm/samsung/pmu.txt        |  6 +++++
>   arch/arm/boot/dts/exynos-syscon-restart.dtsi       | 28 ++++++++++------------
>   arch/arm/boot/dts/exynos3250.dtsi                  |  2 +-
>   arch/arm/boot/dts/exynos4.dtsi                     |  3 ++-
>   arch/arm/boot/dts/exynos5.dtsi                     |  1 -
>   arch/arm/boot/dts/exynos5250.dtsi                  |  1 +
>   arch/arm/boot/dts/exynos5410.dtsi                  |  2 +-
>   arch/arm/boot/dts/exynos5420.dtsi                  |  1 +
>   arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 14 +++++------
>   arch/arm64/boot/dts/exynos/exynos7.dtsi            | 12 +++++-----
>   drivers/soc/samsung/exynos-pmu.c                   |  3 +++
>   11 files changed, 40 insertions(+), 33 deletions(-)
>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

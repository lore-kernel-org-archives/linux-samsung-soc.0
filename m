From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] dt-bindings: timer: Use defines instead of numbers in
 Exynos MCT examples
Date: Fri, 27 Sep 2019 08:36:47 +0200
Message-ID: <fc0809b0-1e6a-0564-75d9-0ccb14d2826c@samsung.com>
References: <CGME20190926183707epcas3p350fe17bc738540b37f1130d967c31a62@epcas3p3.samsung.com>
        <20190926183643.7118-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190926183643.7118-1-krzk@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 26.09.2019 20:36, Krzysztof Kozlowski wrote:
> Make the examples in Exynos Multi Core Timer bindings more readable and
> bring them closer to real DTS by using defines for interrupt flags.
>
> Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Rebased on top of:
> https://patchwork.kernel.org/project/linux-samsung-soc/list/?series=177667&state=*
> ---
>   .../timer/samsung,exynos4210-mct.yaml         | 37 ++++++++++++++-----
>   1 file changed, 27 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
> index bff3f54a398f..c4d152009f76 100644
> --- a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
> +++ b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
> @@ -75,51 +75,68 @@ examples:
>       // In this example, the IP contains two local timers, using separate
>       // interrupts, so two local timer interrupts have been specified,
>       // in addition to four global timer interrupts.
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>   
>       timer@10050000 {
>           compatible = "samsung,exynos4210-mct";
>           reg = <0x10050000 0x800>;
> -        interrupts = <0 57 0>, <0 69 0>, <0 70 0>, <0 71 0>,
> -                     <0 42 0>, <0 48 0>;
> +        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
>       };
>   
>     - |
>       // In this example, the timer interrupts are connected to two separate
>       // interrupt controllers. Hence, an interrupts-extended is needed.
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>   
>       timer@101c0000 {
>           compatible = "samsung,exynos4210-mct";
>           reg = <0x101C0000 0x800>;
> -        interrupts-extended = <&gic 0 57 0>,
> -                              <&gic 0 69 0>,
> +        interrupts-extended = <&gic GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
> +                              <&gic GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
>                                 <&combiner 12 6>,
>                                 <&combiner 12 7>,
> -                              <&gic 0 42 0>,
> -                              <&gic 0 48 0>;
> +                              <&gic GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> +                              <&gic GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
>       };
>   
>     - |
>       // In this example, the IP contains four local timers, but using
>       // a per-processor interrupt to handle them. Only one first local
>       // interrupt is specified.
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>   
>       timer@10050000 {
>           compatible = "samsung,exynos4412-mct";
>           reg = <0x10050000 0x800>;
>   
> -        interrupts = <0 57 0>, <0 69 0>, <0 70 0>, <0 71 0>,
> -                     <0 42 0>;
> +        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;

the last one should be GIC_PPI

>       };
>   
>     - |
>       // In this example, the IP contains four local timers, but using
>       // a per-processor interrupt to handle them. All the local timer
>       // interrupts are specified.
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>   
>       timer@10050000 {
>           compatible = "samsung,exynos4412-mct";
>           reg = <0x10050000 0x800>;
>   
> -        interrupts = <0 57 0>, <0 69 0>, <0 70 0>, <0 71 0>,
> -                     <0 42 0>, <0 42 0>, <0 42 0>, <0 42 0>;
> +        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;

again, last 4 entries should use GIC_PPI


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

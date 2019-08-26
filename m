From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC 5/9] dt-bindings: arm: samsung: Convert Exynos PMU bindings
 to json-schema
Date: Mon, 26 Aug 2019 06:54:02 -0500
Message-ID: <CAL_JsqJybT41cEqiTriLMywUQj1BtAG_9muJ4=84OkF23y53CA@mail.gmail.com>
References: <20190823145356.6341-1-krzk@kernel.org> <20190823145356.6341-5-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190823145356.6341-5-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>, notify@kernel.orgArnd Bergmann <ar>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Aug 23, 2019 at 9:54 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Convert Samsung Exynos Power Management Unit (PMU) bindings to DT schema
> format using json-schema.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/arm/samsung/pmu.txt   | 72 --------------
>  .../devicetree/bindings/arm/samsung/pmu.yaml  | 93 +++++++++++++++++++
>  2 files changed, 93 insertions(+), 72 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/samsung/pmu.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/samsung/pmu.yaml


> diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.yaml b/Documentation/devicetree/bindings/arm/samsung/pmu.yaml
> new file mode 100644
> index 000000000000..818c6f3488ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/samsung/pmu.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/samsung/pmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos SoC series Power Management Unit (PMU)
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - samsung,exynos3250-pmu
> +          - samsung,exynos4210-pmu
> +          - samsung,exynos4412-pmu
> +          - samsung,exynos5250-pmu
> +          - samsung,exynos5260-pmu
> +          - samsung,exynos5410-pmu
> +          - samsung,exynos5420-pmu
> +          - samsung,exynos5433-pmu
> +          - samsung,exynos7-pmu
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clock-names:
> +    description:
> +      list of clock names for particular CLKOUT mux inputs
> +    # TODO: what is the maximum number of elements (mux inputs)?
> +    minItems: 1
> +    maxItems: 32
> +    items:
> +      - enum:

This isn't correct as you are only defining possible names for the
first item. Drop the '-' (making items a schema instead of a list) and
then it applies to all. However, doing that will cause a meta-schema
error which I need to fix to allow. Or if there's a small set of
possibilities of number of inputs, you can list them under a 'oneOf'
list.

> +          - clkout0
> +          - clkout1
> +          - clkout2
> +          - clkout3
> +          - clkout4
> +          - clkout5
> +          - clkout6
> +          - clkout7
> +          - clkout8
> +          - clkout9
> +          - clkout10
> +          - clkout11
> +          - clkout12
> +          - clkout13
> +          - clkout14
> +          - clkout15
> +          - clkout16
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 32
> +
> +  interrupt-controller:
> +    description:
> +      Some PMUs are capable of behaving as an interrupt controller (mostly
> +      to wake up a suspended PMU).
> +
> +  '#interrupt-cells':
> +    # TODO: must be identical to the that of the parent interrupt controller.

There's not really a way to express that. Just state that in the
description if you want.

> +    const: 3
> +
> +  # TODO: Mark interrupt-controller and #interrupt-cells as required, if one is present

No need, the core schemas handle that dependency. It would be good to
define for which compatibles the properties are required. You can do
this with if/then schema. There's several examples in the tree.

> +  # TODO: nodes defining the restart and poweroff syscon children
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - clock-names
> +  - clocks
> +
> +examples:
> +  - |
> +    pmu_system_controller: system-controller@10040000 {
> +      compatible = "samsung,exynos5250-pmu", "syscon";
> +      reg = <0x10040000 0x5000>;
> +      interrupt-controller;
> +      #interrupt-cells = <3>;
> +       interrupt-parent = <&gic>;
> +      #clock-cells = <1>;
> +      clock-names = "clkout16";
> +      clocks = <&clock 0>; // CLK_FIN_PLL
> +    };
> --
> 2.17.1
>

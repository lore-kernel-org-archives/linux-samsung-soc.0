From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: gpu: Convert Samsung 2D Graphics
 Accelerator to dt-schema
Date: Tue, 24 Sep 2019 17:13:51 +0200
Message-ID: <20190924151351.GC9218@pi3>
References: <CGME20190924134628eucas1p1586ca3285dac6b5d5cd1026ea78c436e@eucas1p1.samsung.com>
 <20190924134614.13371-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190924134614.13371-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Inki Dae <inki.dae@samsung.com>, Maciej Falkowski <m.falkowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Sep 24, 2019 at 03:46:14PM +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Convert Samsung 2D Graphics Accelerator to newer dt-schema format
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v2:
> - Added if-then statements for 'clocks' and 'clock-names'
> properties.
> 
> Best regards,
> Maciej Falkowski
> ---
>  .../devicetree/bindings/gpu/samsung-g2d.txt   | 27 -------
>  .../devicetree/bindings/gpu/samsung-g2d.yaml  | 76 +++++++++++++++++++
>  2 files changed, 76 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpu/samsung-g2d.txt
>  create mode 100644 Documentation/devicetree/bindings/gpu/samsung-g2d.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/samsung-g2d.txt b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
> deleted file mode 100644
> index 1e7959332dbc..000000000000
> --- a/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -* Samsung 2D Graphics Accelerator
> -
> -Required properties:
> -  - compatible : value should be one among the following:
> -	(a) "samsung,s5pv210-g2d" for G2D IP present in S5PV210 & Exynos4210 SoC
> -	(b) "samsung,exynos4212-g2d" for G2D IP present in Exynos4x12 SoCs
> -	(c) "samsung,exynos5250-g2d" for G2D IP present in Exynos5250 SoC
> -
> -  - reg : Physical base address of the IP registers and length of memory
> -	  mapped region.
> -
> -  - interrupts : G2D interrupt number to the CPU.
> -  - clocks : from common clock binding: handle to G2D clocks.
> -  - clock-names : names of clocks listed in clocks property, in the same
> -		  order, depending on SoC type:
> -		  - for S5PV210 and Exynos4 based SoCs: "fimg2d" and
> -		    "sclk_fimg2d"
> -		  - for Exynos5250 SoC: "fimg2d".
> -
> -Example:
> -	g2d@12800000 {
> -		compatible = "samsung,s5pv210-g2d";
> -		reg = <0x12800000 0x1000>;
> -		interrupts = <0 89 0>;
> -		clocks = <&clock 177>, <&clock 277>;
> -		clock-names = "sclk_fimg2d", "fimg2d";
> -	};
> diff --git a/Documentation/devicetree/bindings/gpu/samsung-g2d.yaml b/Documentation/devicetree/bindings/gpu/samsung-g2d.yaml
> new file mode 100644
> index 000000000000..5e05e8ccc83f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/samsung-g2d.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/samsung-g2d.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung SoC 2D Graphics Accelerator
> +
> +maintainers:
> +  - Inki Dae <inki.dae@samsung.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,s5pv210-g2d    # in S5PV210 & Exynos4210 SoC
> +      - samsung,exynos4212-g2d # in Exynos4x12 SoCs
> +      - samsung,exynos5250-g2d
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +

I think it is worth to leave the clocks and clock-names here (could be
empty or with min/max values for number of items). This makes it easy to
find the properties by humans.

Midgard bindings could be used as example.

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos5250-g2d
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: fimg2d clock
> +        clock-names:
> +          items:
> +            - const: fimg2d
> +
> +  - if:

else:

Best regards,
Krzysztof

> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,s5pv210-g2d
> +              - samsung,exynos4212-g2d
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: sclk_fimg2d clock
> +            - description: fimg2d clock
> +        clock-names:
> +          items:
> +            - const: sclk_fimg2d
> +            - const: fimg2d
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    g2d@12800000 {
> +        compatible = "samsung,s5pv210-g2d";
> +        reg = <0x12800000 0x1000>;
> +        interrupts = <0 89 0>;
> +        clocks = <&clock 177>, <&clock 277>;
> +        clock-names = "sclk_fimg2d", "fimg2d";
> +    };
> +
> -- 
> 2.17.1
> 
> 
> 

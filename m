From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: gpu: Convert Samsung Image Rotator to
 dt-schema
Date: Fri, 13 Sep 2019 08:29:45 +0200
Message-ID: <20190913062945.GA10283@pi3>
References: <20190912093315.5744-1-m.falkowski@samsung.com>
 <CGME20190912161550eucas1p2bdc813d46f337f3717bdbfd33bae8d4a@eucas1p2.samsung.com>
 <20190912161538.4321-1-m.falkowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190912161538.4321-1-m.falkowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maciej Falkowski <m.falkowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, a.hajda@samsung.com, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Sep 12, 2019 at 06:15:38PM +0200, Maciej Falkowski wrote:
> Convert Samsung Image Rotator to newer dt-schema format.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Just to make it clear, Marek's signed-off should appear for one of
conditions:
 - he contributed some source code to your patch,
 - he took your patch, rebased, send by himself (not a case here, I
   think),
 - he contributed significant ideas, although for this there is a
   "Co-developed-by" tag.

If someone made just review - add Reviewed-by. If someone suggested the
patch - add Suggested-by.

> ---
> v2:
> - add required properties
> - add proper commit recipients
> ---
>  .../bindings/gpu/samsung-rotator.txt          | 28 ----------
>  .../bindings/gpu/samsung-rotator.yaml         | 52 +++++++++++++++++++
>  2 files changed, 52 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpu/samsung-rotator.txt
>  create mode 100644 Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/samsung-rotator.txt b/Documentation/devicetree/bindings/gpu/samsung-rotator.txt
> deleted file mode 100644
> index 3aca2578da0b..000000000000
> --- a/Documentation/devicetree/bindings/gpu/samsung-rotator.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -* Samsung Image Rotator
> -
> -Required properties:
> -  - compatible : value should be one of the following:
> -	* "samsung,s5pv210-rotator" for Rotator IP in S5PV210
> -	* "samsung,exynos4210-rotator" for Rotator IP in Exynos4210
> -	* "samsung,exynos4212-rotator" for Rotator IP in Exynos4212/4412
> -	* "samsung,exynos5250-rotator" for Rotator IP in Exynos5250
> -
> -  - reg : Physical base address of the IP registers and length of memory
> -	  mapped region.
> -
> -  - interrupts : Interrupt specifier for rotator interrupt, according to format
> -		 specific to interrupt parent.
> -
> -  - clocks : Clock specifier for rotator clock, according to generic clock
> -	     bindings. (See Documentation/devicetree/bindings/clock/exynos*.txt)
> -
> -  - clock-names : Names of clocks. For exynos rotator, it should be "rotator".
> -
> -Example:
> -	rotator@12810000 {
> -		compatible = "samsung,exynos4210-rotator";
> -		reg = <0x12810000 0x1000>;
> -		interrupts = <0 83 0>;
> -		clocks = <&clock 278>;
> -		clock-names = "rotator";
> -	};
> diff --git a/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml b/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
> new file mode 100644
> index 000000000000..96afafe98388
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/samsung-rotator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Image Rotator

Thanks Maciej for working on this.

I am trying to make the names more consistent:
1. For Exynos bindings:
Samsung Exynos SoC xxx yyy zzz

2. For multiple SoCs (S3C, S5P, Exynos etc):
Samsung SoC xxx yyy zzz

Currently the names are mixture of legacy and new names. It is a
nit-pick but makes all bindings look like a part of bigger effort, not
bunch of patches done by random people. :)

If there are no objections, maybe you could change it to:
Samsung SoC Image Rotator

> +
> +maintainers:
> +  - Inki Dae <inki.dae@samsung.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - "samsung,s5pv210-rotator"    # for Rotator IP in S5PV210
> +      - "samsung,exynos4210-rotator" # for Rotator IP in Exynos4210
> +      - "samsung,exynos4212-rotator" # for Rotator IP in Exynos4212/4412
> +      - "samsung,exynos5250-rotator" # for Rotator IP in Exynos5250

The comments are duplicating the compatible, so skip them.

> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    description: |
> +      Clock specifier for rotator clock according to generic clock
> +      bindings. (See Documentation/devicetree/bindings/clock/exynos*.txt)

Skip the description. Clocks property is a well-known binding.

> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +    - const: rotator
> +    maxItems: 1

I think there is no need to maxItems since all possible items are fixed.

Best regards,
Krzysztof


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
> +    rotator@12810000 {
> +        compatible = "samsung,exynos4210-rotator";
> +        reg = <0x12810000 0x1000>;
> +        interrupts = <0 83 0>;
> +        clocks = <&clock 278>;
> +        clock-names = "rotator";
> +    };
> +
> -- 
> 2.17.1
> 

From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] dt-bindings: gpu: Convert Samsung Image Scaler to dt-schema
Date: Wed, 18 Sep 2019 12:52:58 +0200
Message-ID: <CAJKOXPcDWtT0RbqmpmjDAZw-gCWppSbZqAjOgcbZUaraT5ethA@mail.gmail.com>
References: <CGME20190913094136eucas1p1fd424b5f5a6f0a97b31af54e55fe28c1@eucas1p1.samsung.com>
 <20190913094123.23169-1-m.falkowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190913094123.23169-1-m.falkowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maciej Falkowski <m.falkowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 13 Sep 2019 at 11:41, Maciej Falkowski <m.falkowski@samsung.com> wrote:
>
> Convert Samsung Image Scaler to newer dt-schema format.
>
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  .../bindings/gpu/samsung-scaler.txt           | 27 ---------
>  .../bindings/gpu/samsung-scaler.yaml          | 57 +++++++++++++++++++
>  2 files changed, 57 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpu/samsung-scaler.txt
>  create mode 100644 Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
>
> diff --git a/Documentation/devicetree/bindings/gpu/samsung-scaler.txt b/Documentation/devicetree/bindings/gpu/samsung-scaler.txt
> deleted file mode 100644
> index 9c3d98105dfd..000000000000
> --- a/Documentation/devicetree/bindings/gpu/samsung-scaler.txt
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -* Samsung Exynos Image Scaler
> -
> -Required properties:
> -  - compatible : value should be one of the following:
> -       (a) "samsung,exynos5420-scaler" for Scaler IP in Exynos5420
> -       (b) "samsung,exynos5433-scaler" for Scaler IP in Exynos5433
> -
> -  - reg : Physical base address of the IP registers and length of memory
> -         mapped region.
> -
> -  - interrupts : Interrupt specifier for scaler interrupt, according to format
> -                specific to interrupt parent.
> -
> -  - clocks : Clock specifier for scaler clock, according to generic clock
> -            bindings. (See Documentation/devicetree/bindings/clock/exynos*.txt)
> -
> -  - clock-names : Names of clocks. For exynos scaler, it should be "mscl"
> -                 on 5420 and "pclk", "aclk" and "aclk_xiu" on 5433.
> -
> -Example:
> -       scaler@12800000 {
> -               compatible = "samsung,exynos5420-scaler";
> -               reg = <0x12800000 0x1294>;
> -               interrupts = <0 220 IRQ_TYPE_LEVEL_HIGH>;
> -               clocks = <&clock CLK_MSCL0>;
> -               clock-names = "mscl";
> -       };
> diff --git a/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml b/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
> new file mode 100644
> index 000000000000..ee2caab22977
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/samsung-scaler.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos SoC Image Scaler
> +
> +maintainers:
> +  - Inki Dae <inki.dae@samsung.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - "samsung,exynos5420-scaler"
> +      - "samsung,exynos5433-scaler"
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names:
> +    oneOf:
> +      - items:
> +          - const: mscl
> +      - items:
> +          - const: pclk
> +          - const: aclk
> +          - const: aclk_xiu
> +    description: |
> +      For exynos scaler it should be:
> +      - "mscl" on Exynos5420
> +      - "pclk", "aclk", "aclk_xiu" on Exynos5433

Hi,

This should be customized with proper if in allOf section.

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
> +    scaler@12800000 {
> +        compatible = "samsung,exynos5420-scaler";
> +        reg = <0x12800000 0x1294>;
> +        interrupts = <0 220 4>; // IRQ_TYPE_LEVEL_HIGH
> +        clocks = <&clock 0>; // CLK_MSCL0
> +        clock-names = "mscl";
> +    };
> +
> --
> 2.17.1
>

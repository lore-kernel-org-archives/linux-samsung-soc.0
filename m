From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: Convert Samsung I2S
 controller to dt-schema
Date: Tue, 17 Sep 2019 14:49:38 +0200
Message-ID: <1c1264ac-f657-1e3d-360f-af0cbc58549a@samsung.com>
References: <20190917111413.22711-1-m.falkowski@samsung.com>
        <CGME20190917120517eucas1p1188d244fac2d10d7990363ff25ffb70d@eucas1p1.samsung.com>
        <20190917120452.28135-1-m.falkowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917120452.28135-1-m.falkowski@samsung.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Maciej Falkowski <m.falkowski@samsung.com>, linux-kernel@vger.kernel.org
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, krzk@kernel.org, sbkim73@samsung.com, lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, a.hajda@samsung.com, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 9/17/19 14:04, Maciej Falkowski wrote:
> Convert Samsung I2S controller to newer dt-schema format.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

> --- a/Documentation/devicetree/bindings/sound/samsung-i2s.txt
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -* Samsung I2S controller

> -- clocks: Handle to iis clock and RCLK source clk.
> -- clock-names:
> -  i2s0 uses some base clocks from CMU and some are from audio subsystem internal
> -  clock controller. The clock names for i2s0 should be "iis", "i2s_opclk0" and
> -  "i2s_opclk1" as shown in the example below.
> -  i2s1 and i2s2 uses clocks from CMU. The clock names for i2s1 and i2s2 should
> -  be "iis" and "i2s_opclk0".
> -  "iis" is the i2s bus clock and i2s_opclk0, i2s_opclk1 are sources of the root
> -  clk. i2s0 has internal mux to select the source of root clk and i2s1 and i2s2
> -  doesn't have any such mux.
> -
> -There are following clocks available at the I2S device nodes:
> - CLK_I2S_CDCLK    - the CDCLK (CODECLKO) gate clock,
> - CLK_I2S_RCLK_PSR - the RCLK prescaler divider clock (corresponding to the
> -		    IISPSR register),
> - CLK_I2S_RCLK_SRC - the RCLKSRC mux clock (corresponding to RCLKSRC bit in
> -		    IISMOD register).
> -
> -Refer to the SoC datasheet for availability of the above clocks.
> -The CLK_I2S_RCLK_PSR and CLK_I2S_RCLK_SRC clocks are usually only available
> -in the IIS Multi Audio Interface.
> -
> -Note: Old DTs may not have the #clock-cells property and then not use the I2S
> -node as a clock supplier.

> -Example:
> -
> -i2s0: i2s@3830000 {

> -	clocks = <&clock_audss EXYNOS_I2S_BUS>,
> -		<&clock_audss EXYNOS_I2S_BUS>,
> -		<&clock_audss EXYNOS_SCLK_I2S>;

> -};
> diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
> new file mode 100644
> index 000000000000..59dc76035cb4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---

> +properties:

> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names:
> +    oneOf:
> +      - items:
> +          - const: iis
> +      - items:
> +          - const: iis
> +          - const: i2s_opclk0
> +      - items:
> +          - const: iis
> +          - const: i2s_opclk0
> +          - const: i2s_opclk1
> +    description: |
> +      "iis" is the i2s bus clock.
> +      For i2s1 and i2s2 - "iis", "i2s_opclk0"
> +      For i2s0 - "iis", "i2s_opclk0", "i2s_opclk1"

My impression is that there is a significant information loss in conversion
of: clocks, clock-names properties.  Can't we describe the meaning of 
CLK_I2S_CDCLK, CLK_I2S_RCLK_PSR, CLK_I2S_RCLK_SRC supplier clocks similarly 
as it was in txt version?

> +examples:
> +  - |
> +    i2s0: i2s@3830000 {
> +        compatible = "samsung,s5pv210-i2s";
> +        reg = <0x03830000 0x100>;
> +        dmas = <&pdma0 10
> +                &pdma0 9
> +                &pdma0 8>;
> +        dma-names = "tx", "rx", "tx-sec";
> +        clocks = <&clock_audss 0>, // EXYNOS_I2S_BUS
> +                <&clock_audss 0>, // EXYNOS_I2S_BUS
> +                <&clock_audss 0>; // EXYNOS_SCLK_I2S

It should not be <&clock_audss 0> for each clock, each clock has different
index as indicated by the commented out macro definitions.
		
> +        clock-names = "iis", "i2s_opclk0", "i2s_opclk1";

-- 
Thanks,
Sylwester

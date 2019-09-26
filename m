From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH v5] dt-bindings: sound: Convert Samsung I2S
 controller to dt-schema
Date: Thu, 26 Sep 2019 13:08:25 +0200
Message-ID: <e95b9f26-d667-4ebe-dcfa-264a6053f4ad@samsung.com>
References: <CGME20190925132644eucas1p2716a805d184f9bbc4ad7a94cc9cca633@eucas1p2.samsung.com>
        <20190925132628.31858-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190925132628.31858-1-m.szyprowski@samsung.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Maciej Falkowski <m.falkowski@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 9/25/19 15:26, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Convert Samsung I2S controller to newer dt-schema format.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Thanks Maciej, it looks good to me, I just think it might make sense 
to improve the comments a little while we are doing such a conversion.
Please see my comments below.

With those corrections made:
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

>  .../devicetree/bindings/sound/samsung-i2s.txt |  84 -----------
>  .../bindings/sound/samsung-i2s.yaml           | 136 ++++++++++++++++++
>  2 files changed, 136 insertions(+), 84 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.yaml

> +++ b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: https://protect2.fireeye.com/url?k=9b0307ba8b0d1f39.9b028cf5-9870da798974f201&u=http://devicetree.org/schemas/sound/samsung-i2s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung SoC I2S controller
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> +
> +properties:
> +  compatible:
> +    description: |
> +      samsung,s3c6410-i2s: for 8/16/24bit stereo I2S.
> +
> +      samsung,s5pv210-i2s: for 8/16/24bit multichannel(5.1) I2S with

space before "(5.1)" ?

> +      secondary fifo, s/w reset control and internal mux for root clk src.

s/fifo/FIFO ?
s/clk src/clock source ?

> +      samsung,exynos5420-i2s: for 8/16/24bit multichannel(5.1) I2S for

space before "(5.1)" ?

> +      playback, stereo channel capture, secondary fifo using internal

s/fifo/FIFO

> +      or external dma, s/w reset control, internal mux for root clk src

s/dma/DMA ?
s/clk src/clock source ?

> +      and 7.1 channel TDM support for playback. TDM (Time division multiplexing)
> +      is to allow transfer of multiple channel audio data on single data line.
> +
> +      samsung,exynos7-i2s: with all the available features of exynos5 i2s.

s/exynos5 i2s/ exynos5 I2S ?

> +      exynos7 I2S has 7.1 channel TDM support for capture, secondary fifo

s/fifo/FIFO ?

> +      with only external dma and more no.of root clk sampling frequencies.

s/dma/DMA ?
s/no.of/number of ?

> +      samsung,exynos7-i2s1: I2S1 on previous samsung platforms supports
> +      stereo channels. exynos7 i2s1 upgraded to 5.1 multichannel with

s/i2s1/I2S1 ? It would be good to convert all i2s0, i2s1, i2s2 occurrences 
in comments/descriptions into either upper or lower case for consistency.

> +  clock-names:
> +    oneOf:
> +      - items:
> +          - const: iis
> +      - items: # for i2s0
> +          - const: iis
> +          - const: i2s_opclk0
> +          - const: i2s_opclk1
> +      - items: # for i2s1 and i2s2
> +          - const: iis
> +          - const: i2s_opclk0
> +    description: |
> +      "iis" is the i2s bus clock and i2s_opclk0, i2s_opclk1 are sources
> +      of the root clk. i2s0 has internal mux to select the source
> +      of root clk and i2s1 and i2s2 doesn't have any such mux.

> +  clock-output-names:
> +    deprecated: true
> +    oneOf:
> +      - items: # for i2s0
> +          - const: i2s_cdclk0
> +      - items: # for i2s1> +          - const: i2s_cdclk1
> +      - items: # for i2s2
> +          - const: i2s_cdclk2
> +    description: Names of the CDCLK I2S output clocks.

> +  samsung,idma-addr:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Internal DMA register base address of the audio
> +      sub system(used in secondary sound source).

s/sub system(used/subsystem (used ?

-- 
Thanks,
Sylwester

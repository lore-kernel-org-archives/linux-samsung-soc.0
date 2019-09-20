From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v3] dt-bindings: sound: Convert Samsung I2S controller
 to dt-schema
Date: Fri, 20 Sep 2019 14:33:13 +0200
Message-ID: <68ec938a-29b5-0c07-3a5e-771d6ce587b4@samsung.com>
References: <CAL_JsqJ=QWk07y=h7dHFiRrKuE7NGoUr50bu3kiOC+YU8qS9jg@mail.gmail.com>
        <CGME20190920115200eucas1p2253a3eb13373061ef8aa39131c98a319@eucas1p2.samsung.com>
        <20190920113540.30687-1-m.szyprowski@samsung.com>
        <20190920122616.GA26862@pi3>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190920122616.GA26862@pi3>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, Maciej Falkowski <m.falkowski@samsung.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 20.09.2019 14:26, Krzysztof Kozlowski wrote:
> On Fri, Sep 20, 2019 at 01:35:40PM +0200, Marek Szyprowski wrote:
>> From: Maciej Falkowski <m.falkowski@samsung.com>
>>
>> Convert Samsung I2S controller to newer dt-schema format.
>>
>> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>> v3:
>> - Removed quotation marks from strings in compatible property
>> - Added min/max items to dmas property
>> - Removed unneeded description from dma-names property
>> - Added specific dma-names
>> - Added clock description
>> - Added include directive to examples to use clock macros directly
> Guys, please stop attaching new versions of entire patchset to existing
> discussions with in-reply-to. Entire V2 was attached to V1. V3 is
> attached here. On some mail clients (GMail) this does not mark entire
> thread unread at it looks like someone just commented about something.
> Some other clients, e.g. mbsynsc with GMail, do not sync entire thread
> so new version looks like reply-to but attached to nothing (missing
> context). Not mentioning that you need additional effort on your side to
> copy+paste the in-reply-to ID.
>
>> ---
>>   .../devicetree/bindings/sound/samsung-i2s.txt |  84 -----------
>>   .../bindings/sound/samsung-i2s.yaml           | 135 ++++++++++++++++++
>>   2 files changed, 135 insertions(+), 84 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.txt
>>   create mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.txt b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
>> deleted file mode 100644
>> index a88cb00fa096..000000000000
>> --- a/Documentation/devicetree/bindings/sound/samsung-i2s.txt
>> +++ /dev/null
>> @@ -1,84 +0,0 @@
>> -* Samsung I2S controller
>> -
>> -Required SoC Specific Properties:
>> -
>> -- compatible : should be one of the following.
>> -   - samsung,s3c6410-i2s: for 8/16/24bit stereo I2S.
>> -   - samsung,s5pv210-i2s: for 8/16/24bit multichannel(5.1) I2S with
>> -     secondary fifo, s/w reset control and internal mux for root clk src.
>> -   - samsung,exynos5420-i2s: for 8/16/24bit multichannel(5.1) I2S for
>> -     playback, stereo channel capture, secondary fifo using internal
>> -     or external dma, s/w reset control, internal mux for root clk src
>> -     and 7.1 channel TDM support for playback. TDM (Time division multiplexing)
>> -     is to allow transfer of multiple channel audio data on single data line.
>> -   - samsung,exynos7-i2s: with all the available features of exynos5 i2s,
>> -     exynos7 I2S has 7.1 channel TDM support for capture, secondary fifo
>> -     with only external dma and more no.of root clk sampling frequencies.
>> -   - samsung,exynos7-i2s1: I2S1 on previous samsung platforms supports
>> -     stereo channels. exynos7 i2s1 upgraded to 5.1 multichannel with
>> -     slightly modified bit offsets.
>> -
>> -- reg: physical base address of the controller and length of memory mapped
>> -  region.
>> -- dmas: list of DMA controller phandle and DMA request line ordered pairs.
>> -- dma-names: identifier string for each DMA request line in the dmas property.
>> -  These strings correspond 1:1 with the ordered pairs in dmas.
>> -- clocks: Handle to iis clock and RCLK source clk.
>> -- clock-names:
>> -  i2s0 uses some base clocks from CMU and some are from audio subsystem internal
>> -  clock controller. The clock names for i2s0 should be "iis", "i2s_opclk0" and
>> -  "i2s_opclk1" as shown in the example below.
>> -  i2s1 and i2s2 uses clocks from CMU. The clock names for i2s1 and i2s2 should
>> -  be "iis" and "i2s_opclk0".
>> -  "iis" is the i2s bus clock and i2s_opclk0, i2s_opclk1 are sources of the root
>> -  clk. i2s0 has internal mux to select the source of root clk and i2s1 and i2s2
>> -  doesn't have any such mux.
> I think you still miss this description of clocks and Sylwester asked for it.
>
>> -- #clock-cells: should be 1, this property must be present if the I2S device
>> -  is a clock provider in terms of the common clock bindings, described in
>> -  ../clock/clock-bindings.txt.
>> -- clock-output-names (deprecated): from the common clock bindings, names of
>> -  the CDCLK I2S output clocks, suggested values are "i2s_cdclk0", "i2s_cdclk1",
>> -  "i2s_cdclk3" for the I2S0, I2S1, I2S2 devices respectively.
> You missed this. If you decide to remove deprecated properties, then
> make it in separate patach. You described this patch as pure conversion
> so I expect no logical/functional changes.
>
>> -
>> -There are following clocks available at the I2S device nodes:
>> - CLK_I2S_CDCLK    - the CDCLK (CODECLKO) gate clock,
>> - CLK_I2S_RCLK_PSR - the RCLK prescaler divider clock (corresponding to the
>> -		    IISPSR register),
>> - CLK_I2S_RCLK_SRC - the RCLKSRC mux clock (corresponding to RCLKSRC bit in
>> -		    IISMOD register).
>> -
>> -Refer to the SoC datasheet for availability of the above clocks.
>> -The CLK_I2S_RCLK_PSR and CLK_I2S_RCLK_SRC clocks are usually only available
>> -in the IIS Multi Audio Interface.
>> -
>> -Note: Old DTs may not have the #clock-cells property and then not use the I2S
>> -node as a clock supplier.
>> -
>> -Optional SoC Specific Properties:
>> -
>> -- samsung,idma-addr: Internal DMA register base address of the audio
>> -  sub system(used in secondary sound source).
>> -- pinctrl-0: Should specify pin control groups used for this controller.
>> -- pinctrl-names: Should contain only one value - "default".
>> -- #sound-dai-cells: should be 1.
>> -
>> -
>> -Example:
>> -
>> -i2s0: i2s@3830000 {
>> -	compatible = "samsung,s5pv210-i2s";
>> -	reg = <0x03830000 0x100>;
>> -	dmas = <&pdma0 10
>> -		&pdma0 9
>> -		&pdma0 8>;
>> -	dma-names = "tx", "rx", "tx-sec";
>> -	clocks = <&clock_audss EXYNOS_I2S_BUS>,
>> -		<&clock_audss EXYNOS_I2S_BUS>,
>> -		<&clock_audss EXYNOS_SCLK_I2S>;
>> -	clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
>> -	#clock-cells = <1>;
>> -	samsung,idma-addr = <0x03000000>;
>> -	pinctrl-names = "default";
>> -	pinctrl-0 = <&i2s0_bus>;
>> -	#sound-dai-cells = <1>;
>> -};
>> diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
>> new file mode 100644
>> index 000000000000..20ae5da7f798
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
>> @@ -0,0 +1,135 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/samsung-i2s.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Samsung SoC I2S controller
>> +
>> +maintainers:
>> +  - Krzysztof Kozlowski <krzk@kernel.org>
>> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
>> +
>> +properties:
>> +  compatible:
>> +    description: |
>> +      samsung,s3c6410-i2s: for 8/16/24bit stereo I2S.
>> +
>> +      samsung,s5pv210-i2s: for 8/16/24bit multichannel(5.1) I2S with
>> +      secondary fifo, s/w reset control and internal mux for root clk src.
>> +
>> +      samsung,exynos5420-i2s: for 8/16/24bit multichannel(5.1) I2S for
>> +      playback, stereo channel capture, secondary fifo using internal
>> +      or external dma, s/w reset control, internal mux for root clk src
>> +      and 7.1 channel TDM support for playback. TDM (Time division multiplexing)
>> +      is to allow transfer of multiple channel audio data on single data line.
>> +
>> +      samsung,exynos7-i2s: with all the available features of exynos5 i2s.
>> +      exynos7 I2S has 7.1 channel TDM support for capture, secondary fifo
>> +      with only external dma and more no.of root clk sampling frequencies.
>> +
>> +      samsung,exynos7-i2s1: I2S1 on previous samsung platforms supports
>> +      stereo channels. exynos7 i2s1 upgraded to 5.1 multichannel with
>> +      slightly modified bit offsets.
>> +    enum:
>> +      - samsung,s3c6410-i2s
>> +      - samsung,s5pv210-i2s
>> +      - samsung,exynos5420-i2s
>> +      - samsung,exynos7-i2s
>> +      - samsung,exynos7-i2s1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  dmas:
>> +    minItems: 2
>> +    maxItems: 3
>> +
>> +  dma-names:
>> +    oneOf:
>> +      - items:
>> +          - const: tx
>> +          - const: rx
>> +      - items:
>> +          - const: tx
>> +          - const: rx
>> +          - const: tx-sec
>> +
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 3
>> +    description: |
>> +      There are following clocks available at the I2S device nodes:
>> +      CLK_I2S_CDCLK:
>> +      the CDCLK (CODECLKO) gate clock.
>> +
>> +      CLK_I2S_RCLK_PSR:
>> +      RCLK prescaler divider clock corresponding to the IISPSR register.
>> +
>> +      CLK_I2S_RCLK_SRC:
>> +      RCLKSRC mux clock corresponding to RCLKSRC bit in IISMOD register.
>> +
>> +  clock-names:
>> +    oneOf:
>> +      - items:
>> +          - const: iis
>> +      - items:
>> +          - const: iis
>> +          - const: i2s_opclk0
>> +      - items:
>> +          - const: iis
>> +          - const: i2s_opclk0
>> +          - const: i2s_opclk1
>> +    description: |
>> +      "iis" is the i2s bus clock.
>> +      For i2s1 and i2s2 - "iis", "i2s_opclk0"
>> +      For i2s0 - "iis", "i2s_opclk0", "i2s_opclk1"
>> +
>> +  "#clock-cells":
>> +    const: 1
>> +
>> +  samsung,idma-addr:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      Internal DMA register base address of the audio
>> +      sub system(used in secondary sound source).
>> +
>> +  pinctrl-0:
>> +    description: Should specify pin control groups used for this controller.
>> +
>> +  pinctrl-names:
>> +    const: default
>> +
>> +  "#sound-dai-cells":
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - dmas
>> +  - dma-names
>> +  - clocks
>> +  - clock-names
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/exynos-audss-clk.h>
> Does it really work? When I tried, it was failing... If you look up at
> resulting DTS example it is wrong.

In which way it was wrong? We checked and it was correctly propagated to 
the example dts. It also compiled fine without errors. The only minor 
issue was that the include was generated inside the root node, but for 
the clock definitions this doesn't matter, but it makes the example 
easier to understand.

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

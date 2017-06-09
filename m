From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RFC 5/7] ASoC: Add Odroid sound DT bindings
 documentation
Date: Fri, 09 Jun 2017 18:53:52 +0200
Message-ID: <82c62742-679a-0d36-a6de-f94eb5e7eac0@samsung.com>
References: <1492795191-31298-1-git-send-email-s.nawrocki@samsung.com>
        <CGME20170421172040epcas5p2ee7191a899c52ea3f077837dc2e865ca@epcas5p2.samsung.com>
        <1492795191-31298-6-git-send-email-s.nawrocki@samsung.com>
        <20170428170335.7zoovrcs6v22x3lz@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <20170428170335.7zoovrcs6v22x3lz@rob-hp-laptop>
Content-language: en-GB
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, krzk@kernel.org, jy0922.shim@samsung.com, broonie@kernel.org, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 04/28/2017 07:03 PM, Rob Herring wrote:
> On Fri, Apr 21, 2017 at 07:19:49PM +0200, Sylwester Nawrocki wrote:

>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/samsung,odroid.txt
>> @@ -0,0 +1,57 @@
>> +Samsung Exynos Odroid XU3/XU4 audio complex with MAX98090 codec
>> +
>> +Required properties:
>> +
>> + - compatible - "samsung,odroidxu3-audio" - for Odroid XU3 board,
>> +		"samsung,odroidxu4-audio" - for Odroid XU4 board
>> + - model - the user-visible name of this sound complex
>
> ASoC will support "label" soon (see graph support). Use that instead.

I could change that but it now might be too late since the patch has been
merged in v4.12-rc1. Sorry, I couldn't get back to this earlier.

>> + - clocks - should contain entries matching clock names in the clock-names
>> +    property
>> + - clock-names - should contain following entries:
>> +    - "epll" - indicating the EPLL output clock
>> +    - "i2s_rclk" - indicating the RCLK (root) clock of the I2S0 controller
>
> At least the 2nd one should be in the i2s node. This node isn't really a
> h/w block, so it shouldn't have clocks IMO.

"i2s_rclk" is a clock exposed by the I2S controller.

The RCLK clock has already assigned clock parent in DT:

&i2s0 {
	assigned-clocks = <&i2s0 CLK_I2S_RCLK_SRC>;
	assigned-clock-parents = <&clock_audss EXYNOS_SCLK_I2S>;
};

In fact the sound card is not a consumer of this clock, the clock is used
only internally in the I2S device.  I could try to drop it and use ASoC
internal API for CPU DAI clock setting.

But I have no idea what else could be done with the PLL, it belongs to
the audio card and the card driver must somehow get hold of that clock
to configure its frequency depending on audio sampling rate.

>> +Example:
>> +
>> +sound {
>> +	compatible = "samsung,odroidxu3-audio";
>
>> +	samsung,cpu-dai = <&i2s0>;
>> +	samsung,codec-dai = <&max98090>;
>
> Not documented. Nor needed?

Yes, I will remove these, that's a leftover from initial versions
of the binding.

--
Thanks,
Sylwester

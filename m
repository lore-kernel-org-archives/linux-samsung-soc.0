From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH/RFC 12/14] ASoC: samsung: i2s: Add clock
 provider for the I2S internal clocks
Date: Wed, 17 Dec 2014 18:00:10 +0100
Message-ID: <5491B69A.6080901@samsung.com>
References: <1418319952-10163-1-git-send-email-s.nawrocki@samsung.com>
 <1418319952-10163-13-git-send-email-s.nawrocki@samsung.com>
 <20141212200342.GV11764@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:59921 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750953AbaLQRAQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Dec 2014 12:00:16 -0500
In-reply-to: <20141212200342.GV11764@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, padma.v@samsung.com, sbkim73@samsung.com, drake@endlessm.com

On 12/12/14 21:03, Mark Brown wrote:
> On Thu, Dec 11, 2014 at 06:45:50PM +0100, Sylwester Nawrocki wrote:
> 
>> +Optional Properties:
>>
>>  - samsung,idma-addr: Internal DMA register base address of the audio
>>    sub system(used in secondary sound source).
>>  - pinctrl-0: Should specify pin control groups used for this controller.
>>  - pinctrl-names: Should contain only one value - "default".
>> +- #clock-cells: should be 1, this property must be present if the I2S device
>> +  is a clock provider in terms of the common clock bindings, described in
>> +  ../clock/clock-bindings.txt.
>> +- clock-output-names: from the common clock bindings, names of the CDCLK
>> +  I2S output clocks, suggested values are "i2s_cdclk0", "i2s_cdclk1",
>> +  "i2s_cdclk3" for the I2S0, I2S1, I2S2 devices recpectively.
>> +
> 
> Why not make this mandatory going forwards?  You can add a note saying
> that older DTs may not have it.

I guess that makes more sense, I'll move it to the mandatory properties
section.

>> +The assignment of indices for the I2Sx clock provider is as follows:
>> + 0 - the CDCLK (CODECLKO) gate clock,
>> + 1 - the RCLK prescaler divider clock (corresponding to the IISPSR register),
>> + 2 - the RCLKSRC mux clock (corresponding to RCLKSRC bit in register IISMOD).
> 
> Why use the indicies here, they only seem to add obscurity?

I didn't want to create a separate header file, with all the GPL copyright
notice header etc, for just this enumeration.
Anyway I'll put these as macro definitions into include/dt-bindings/sound
/samsung-i2s.h.

>> +		clk_put(rclksrc);
>> +	}
>> +	/*
> 
> Missing blank line.
> 
>> +	 * Register the mux and div clocks only if both source clocks
>> +	 * are available, i.e. for the I2S0 instance and versions with
>> +	 * QUIRK_NO_MUXPSR quirk not set.
>> +	 */
> 
> Why not proceed even if one is missing?  This repeats in words the if
> statement but doesn't explain why we're doing this.

Right, I should have said here that this is really to distinguish between
I2S0 and I2S1, I2S2. So we register the mux and div clocks only for
the IIS Multi Audio Interface (I2S0) and not for the IIS Bus Interface
(I2S1, I2S2) instances.
However, it seems I got confused by same compatible string set for
I2S0..I2S2 in arch/arm/boot/dts/exynos4.dtsi - "samsung,s5pv210-i2s",
where for I2S1, I2S2 it should be "samsung,s3c6410-i2s". So we have,
for example, QUIRK_NO_MUXPSR set for them. There seems to be no similar
bug in arch/arm/boot/dts/exynos5250.dtsi.
I'll drop that mux input clock test the and fix the compatible strings
for exynos4 in dts.

>> +	ret = of_clk_add_provider(dev->of_node, of_clk_src_onecell_get,
>> +				  &i2s->clk_data);
>> +	if (ret < 0) {
>> +		dev_err(dev, "failed to add clock provider\n");
> 
> Best practice is to print the error code.

Yeah, I'll add it.

--
Regards,
Sylwester

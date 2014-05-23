From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/2] doc: dt bindings: Document Odroid X2/U3 audio
 subsystem bindings
Date: Fri, 23 May 2014 11:54:31 +0200
Message-ID: <537F1AD7.1070808@samsung.com>
References: <1400759708-25831-1-git-send-email-s.nawrocki@samsung.com>
 <20140522184656.GS12304@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:38393 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751537AbaEWJyg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 05:54:36 -0400
In-reply-to: <20140522184656.GS12304@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 22/05/14 20:46, Mark Brown wrote:
> On Thu, May 22, 2014 at 01:55:07PM +0200, Sylwester Nawrocki wrote:
> 
>> +	sound {
>> +		compatible = "samsung,odroidx2-audio";
>> +		samsung,i2s-controller = <&i2s0>;
>> +		samsung,audio-codec = <&max98090>;
>> +	};
> 
> Can this not use simple-card?

I dug into that and it seems it almost could, but there is one
thing I'm not sure how to cover with the simple-card DT bindings
and the related driver.

There are these two calls:

+	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_OPCLK,
+					0, MOD_OPCLK_PCLK);


+	/* Set the cpu DAI configuration in order to use CDCLK */
+	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_CDCLK,
+					0, SND_SOC_CLOCK_OUT);

This changes clocks routing so that the CPU DAI in slave mode generates
master clock for the codec, on the SoC's CDCLK pin. Then this is
a reference clock for the codec's PLL, which is a source of the I2S
interface clocks.

It's done this way to avoid changing at runtime frequency of the EPLL
clock, which may be parent of other clocks than the sound subsystem,
e.g. MMC.

simple-card just calls set_sysclk once for the CPU DAI and CODEC with
the second and last argument set to 0.
I'll try and see again if there is some way to use simple-card.

-- 
Thanks,
Sylwester

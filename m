From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/2] ARM: S5PV210: Add audio support to Aquila
Date: Tue, 3 Aug 2010 09:59:29 +0100
Message-ID: <20100803085929.GC25306@rakim.wolfsonmicro.main>
References: <4C4F9E4C.7000001@samsung.com>
 <20100729173825.GE24781@opensource.wolfsonmicro.com>
 <4C527C11.5090409@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:54839 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752651Ab0HCI7c (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Aug 2010 04:59:32 -0400
Content-Disposition: inline
In-Reply-To: <4C527C11.5090409@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben@simtec.co.uk>, Liam Girdwood <lrg@slimlogic.co.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Myungjoo Ham <myungjoo.ham@samsung.com>

On Fri, Jul 30, 2010 at 04:15:29PM +0900, Chanwoo Choi wrote:

> > All these fixed voltage regulators seem a bit suspicous for a mobile
> > phone - I'd have expected that the supplies would all be being provided
> > by your PMIC except for things taken directly from the battery supply
> > (like the speakers tend to be, for example)?  There's no problem with
> > the code itself, it just looks a bit odd.

> All these consumer supply of WM8994 codec connected the below regulator(VCC_1.8V) on
> a circuit diagram. "VCC_1.8V" regualtor is always enabled, because it is used to many devices.
> Then I haven't connected all these consumer supply of WM8994 codec to "VCC_1.8V" regulator.
> I will modify that the consumer supply would be provided by PMIC.

OK, good - the fact that the connection wasn't being made with the PMIC
was my main point here.

> >> +	/* CODEC_XTAL_EN */
> >> +	gpio = S5PV210_GPH3(2);		/* XEINT_26 */
> >> +	gpio_request(gpio, "CODEC_XTAL_EN");

> > Might be as well to provide some or all this stuff in your audio machine
> > driver?

> The Aquila board have a oscillator which provide main clock to 
> WM8994 audio codec. The oscillator provide 24MHz clock to WM8994 audio codec
> (MCLK1 pin). I set gpio setting of "CODEC_XTAL_EN" to enable a oscillator.

I understand what the code does.  My point is that it looks like it's
in the wrong place - it'd seem nicer (and to open up more optimisation
opportunties to manage the clock in the audio driver).

> >> +	/* ADC_EN */
> >> +	gpio = S5PV210_GPJ3(2);
> >> +	gpio_request(gpio, "ADC_EN");
> >> +	s3c_gpio_cfgpin(gpio, S3C_GPIO_OUTPUT);
> >> +	gpio_direction_output(gpio, 1);

> > I'm not sure what this does?

> I explained below description about "ADC_EN" :
> "ADC_EN : This gpio enable the ADC device which is used to detect
>  the kind of jack. (SND_JACK_HEADPHONE/HEADSET/MECHANICAL/AVOUT)
>  According to the kind of jack, an electric current is changed.
>  (Only used on Aquila board) "

> When inserting the jack to Aquila board, I used ADC driver so that, detecting
> the kind of jack(SND_JACK_HEADPHONE/HEADSET/MECHANICAL/AVOUT).

> I will separately make the another function to initialize ADC driver.

So you're using an external ADC to measure the current draw on micbias
as part of your jack sense.  Again, this feels like something that ought
to be managed along with the rest of the audio code.

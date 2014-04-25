From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH V2] ASoC: SAMSUNG: Add sound card driver for Snow board
Date: Fri, 25 Apr 2014 09:46:11 +0530
Message-ID: <5359E18B.60600@linaro.org>
References: <1398243705-31151-1-git-send-email-tushar.behera@linaro.org> <20140424133920.GA12304@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:44222 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750767AbaDYEQR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Apr 2014 00:16:17 -0400
Received: by mail-pd0-f175.google.com with SMTP id fp1so509356pdb.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2014 21:16:16 -0700 (PDT)
In-Reply-To: <20140424133920.GA12304@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org, sbkim73@samsung.com, rdunlap@infradead.org, dianders@chromium.org

On 04/24/2014 07:09 PM, Mark Brown wrote:
> On Wed, Apr 23, 2014 at 02:31:45PM +0530, Tushar Behera wrote:
> 
>> +Required properties:
>> +- compatible : Can be one of the following,
>> +			"google,snow-audio-max98090" or
>> +			"google,snow-audio-max98095"
>> +- samsung,i2s-controller: The phandle of the Samsung I2S0 controller
> 
> This should be any I2S controller, not just I2S0?
> 

Yes, right. It can be any I2S controller. Just that, right now it is
wired to I2S0.

>> +- samsung,audio-codec: The phandle of the audio codec
> 
> This binding only has one I2S controller and CODEC.  However...
> 
>> +static struct snd_soc_dai_link snow_dai[] = {
>> +	{ /* Playback DAI i/f */
>> +		.name = "Playback",
>> +		.stream_name = "Playback",
>> +		.codec_dai_name = "HiFi",
>> +		.dai_fmt = SND_SOC_DAIFMT_I2S |
>> +				SND_SOC_DAIFMT_NB_NF |
>> +				SND_SOC_DAIFMT_CBS_CFS,
>> +	}, { /* Capture DAI i/f */
>> +		.name = "Capture",
>> +		.stream_name = "Capture",
>> +		.codec_dai_name = "HiFi",
>> +		.dai_fmt = SND_SOC_DAIFMT_I2S |
>> +				SND_SOC_DAIFMT_NB_NF |
>> +				SND_SOC_DAIFMT_CBS_CFS,
>> +	},
>> +};
> 
> ...for some reason we have separate capture and playback DAI links

That was lack of understanding from my side. I was of the impression
that the back-end uses different DAI interfaces for aplay and arecord,
which certainly is not the case. I will remove the 'Capture' dai and
make 'Playback' dai as the primary DAI.

> defined.  Why is that?  Also, why is the secondary I2S playback stream
> not supported (this may be a reason to restrict to only the one I2S
> interface)?

AFAICS, I2S driver doesn't support secondary DAI with DT (dai type is
always TYPE_PRI in case of DT). Hence I could not find a setup to test
secondary dai with this board.

> 
> Please also use subject lines consistent with the subsystem - NO NEED TO
> SHOUT.
> 

Noted, will take care.

Thanks.
-- 
Tushar Behera

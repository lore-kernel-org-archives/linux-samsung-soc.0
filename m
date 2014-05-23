From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/2] ASoC: samsung: Add machine driver for odroidx2
Date: Fri, 23 May 2014 10:44:56 +0200
Message-ID: <537F0A88.8000904@samsung.com>
References: <1400759708-25831-1-git-send-email-s.nawrocki@samsung.com>
 <1400759708-25831-2-git-send-email-s.nawrocki@samsung.com>
 <20140522185334.GT12304@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:42705 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750958AbaEWIpA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 04:45:00 -0400
In-reply-to: <20140522185334.GT12304@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chen Zhen <zhen1.chen@samsung.com>

On 22/05/14 20:53, Mark Brown wrote:
> On Thu, May 22, 2014 at 01:55:08PM +0200, Sylwester Nawrocki wrote:
>> From: Chen Zhen <zhen1.chen@samsung.com>
>>
>> This machine driver primary defines the audio path, the supported
>> data formats and sample frequency.
> 
> I guess it can't yet, it would have been good to explain that in the
> changelog for the bindings (and include the binding in this patch...).

Thanks for the review, I'm still rather inexperienced in the ASoC stuff,
I've obviously overlooked there is actually no routing handling. I'd rather
add those bits.
As for the DT binding documentation patch, I thought we're supposed to keep
documentation in separate patches, so processes of separating it from the
kernel is easier ?

>> +	ret = snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_I2S
>> +					| SND_SOC_DAIFMT_NB_NF
>> +					| SND_SOC_DAIFMT_CBM_CFM);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_I2S
>> +					| SND_SOC_DAIFMT_NB_NF
>> +					| SND_SOC_DAIFMT_CBM_CFM);
>> +	if (ret < 0)
>> +		return ret;
> 
> These are constant, set these in the dai_link.
> 
>> +
>> +	ret = snd_soc_dai_set_sysclk(codec_dai, 3, MAX98090_MCLK_FREQ,
>> +				     SND_SOC_CLOCK_IN);
>> +	if (ret < 0) {
>> +		dev_err(codec_dai->dev,
>> +			"Unable to switch to FLL1: %d\n", ret);
>> +		return ret;
>> +	}
> 
> So's this - also what is 3?  Set it on init.

OK, will move it. I'm not sure why 3, it seems to be ignored by the codec
anyway. Chen, can you confirm the second argument is actually a don't care
value ?

>> +	ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_OPCLK,
>> +					0, MOD_OPCLK_PCLK);
> 
> Similarly for the rest of the function.
> 
>> +	return snd_soc_register_card(card);
> 
> devm_snd_soc_register_card().

Thanks for the suggestions, I'll amend that.


--
Regards,
Sylwester

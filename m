From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/2] ASoC: samsung: Add machine driver for odroidx2
Date: Fri, 04 Jul 2014 13:04:18 +0200
Message-ID: <53B68A32.8000203@samsung.com>
References: <1400759708-25831-1-git-send-email-s.nawrocki@samsung.com>
 <1400759708-25831-2-git-send-email-s.nawrocki@samsung.com>
 <20140522185334.GT12304@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:9653 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753074AbaGDLEW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 07:04:22 -0400
In-reply-to: <20140522185334.GT12304@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chen Zhen <zhen1.chen@samsung.com>

On 22/05/14 20:53, Mark Brown wrote:
>> +	ret = snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_I2S
>> > +					| SND_SOC_DAIFMT_NB_NF
>> > +					| SND_SOC_DAIFMT_CBM_CFM);
>> > +	if (ret < 0)
>> > +		return ret;
>> > +
>> > +	ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_I2S
>> > +					| SND_SOC_DAIFMT_NB_NF
>> > +					| SND_SOC_DAIFMT_CBM_CFM);
>> > +	if (ret < 0)
>> > +		return ret;
>
> These are constant, set these in the dai_link.

set_fmt also sets master/slave mode of the I2S DAI, after I moved
this into the cpu_dai link data structure after suspend/resume cycle
the I2S IP block is not being properly re-configured. Should the
format setting be added in resume_post callback, or is there any
other preferred way ? Similarly the syclk settings are being lost
over suspend/resume cycle and nothing restores them.

--
Thanks,
Sylwester

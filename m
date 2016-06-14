From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RFC 3/6] ASoC: max98504: Add max98504 speaker amplifier
 driver
Date: Tue, 14 Jun 2016 16:52:15 +0200
Message-ID: <57601A1F.5030906@samsung.com>
References: <1465815160-28504-1-git-send-email-s.nawrocki@samsung.com>
 <1465815160-28504-4-git-send-email-s.nawrocki@samsung.com>
 <20160613151429.GI2282@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:31555 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751268AbcFNOwn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jun 2016 10:52:43 -0400
In-reply-to: <20160613151429.GI2282@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, robh@kernel.org, linux-samsung-soc@vger.kernel.org, ideal.song@samsung.com, beomho.seo@samsung.com, inki.dae@samsung.com, k.kozlowski@samsung.com, b.zolnierkie@samsung.com

On 06/13/2016 05:14 PM, Mark Brown wrote:
> On Mon, Jun 13, 2016 at 12:52:37PM +0200, Sylwester Nawrocki wrote:
> 
>> [s.nawrocki: removed unused macro definitions and regulator handling
>>  code, rewrote regmap config code, added support for speaker enable
>>  and global chip enable through DAPM, rewritten as component driver,
>>  redesigned DT bindings]
> 
> Removed the regulator handling code?  Why?

Because it was effectively a dead code (disabled by a DT flag property)
and didn't make any sense on our test board. It was setting regulator's
load and voltage on a shared fixed voltage regulator. Even if calls like
regulator_set_optimum_mode() were added that wouldn't make any difference,
since the corresponding PMIC driver ops were not implemented.
I started more or less with something like this [1].

>> +	default:
>> +		/* Analog input, disable PCM, PDM Rx */
>> +		regmap_write(map, MAX98504_REG_PCM_RX_ENABLE, 0);
>> +		regmap_write(map, MAX98504_REG_PDM_RX_ENABLE, 0);
>> +	}
> 
> Add a break here please, at least for consistency.
> 
>> +		ret = PTR_ERR(max98504->regmap);
>> +		dev_err(&client->dev, "regmap initialization failed: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = max98504_probe(max98504);
>> +	if (ret < 0)
>> +		return ret;
> 
> Why not just inline this code?

Will do in next iteration. Thanks for your review.

[1]
https://github.com/halaszk/Perseus-halaszk-universal5433/blob/perseus5433-mm/sound/soc/codecs/max98504a.c

From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 2/4] ASoC: Drop
 SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME flag
Date: Thu, 27 Oct 2016 17:28:55 +0200
Message-ID: <5f1e2423-ad1a-72b4-ec79-5ef5412e380d@samsung.com>
References: <1477408121-24716-1-git-send-email-s.nawrocki@samsung.com>
 <CGME20161025150901epcas5p39c8cc9b980e71ee184fd831ad854a046@epcas5p3.samsung.com>
 <1477408121-24716-2-git-send-email-s.nawrocki@samsung.com>
 <a06af81c-32e0-69d9-1653-0154616b8dc3@samsung.com>
 <20161027142305.GM25322@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:24449 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932768AbcJ0P3B (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 11:29:01 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OFP000A7PO92S00@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Oct 2016 16:28:58 +0100 (BST)
In-reply-to: <20161027142305.GM25322@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, krzk@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

On 10/27/2016 04:23 PM, Mark Brown wrote:
> On Thu, Oct 27, 2016 at 01:21:21PM +0200, Sylwester Nawrocki wrote:
>> On 10/25/2016 05:08 PM, Sylwester Nawrocki wrote:
>>> Since commit 194c7dea00c68c1b1f8ff26304fa937a006f66dd
>>> "ASoC: dmaengine: add custom DMA config to snd_dmaengine_pcm_config"
>>> custom DMA channels can be also specified in chan_names[] field of
>>> struct snd_dmaengine_pcm_config.  This patch removes chan_name field
>>> of struct snd_dmaengine_dai_dma_data as it is now unused.
>>>
>>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>>
>> I'm afraid this patch needs to be reverted :/ I didn't notice earlier
>> the Samsung AC97 controller has 3 substreams per a platform device and
>> this cannot be handled with struct snd_dmaengine_pcm_config, which
>> allows to specify up to 2 DMA channel names.
> 
> Can you send a revert patch with an explanation though...

Sure, I'll prepare the patch.

>> The AC97 driver (sound/soc/samsung/ac97.c) seems to have been broken
>> for a long time as it currently doesn't have the channel names
>> specified at all [1].  It seems in order to fix it the best would
>> be to restore the feature the $subject patch removes.
> 
> ...if the driver just doesn't work and hasn't worked for a long time
> perhaps it's better to just drop the driver?

I'm not opposed to that, the feature certainly hasn't been used for
a long time with mainline kernels.
Then I think these drivers could be dropped as well:

sound/soc/samsung/ln2440sbc_alc650.c
sound/soc/samsung/smdk2443_wm9710.c
sound/soc/samsung/smdk_wm9713.c

That all could be added again with support for new frameworks if there
are requests to support the feature.
I'm going to post patches removing those drivers.

Still I'd like to revert $subject patch to be able to handle more than
2 substreams per DMA device.  I planned to get rid of an additional
platform device creation in sound/soc/samsung/i2s.c,  which IIUC
introduces now unnecessary complication, could be avoided and doesn't
match the hardware very well.  Not quite sure it that would be
the right direction but I think being able to specify custom DMA channel
names per DAI DMA data could be helpful in doing that. I.e. to have
1 PCM with 3 substreams {"tx", "rx", "tx-sec"} instead of 2 PCMs with
substreams {"tx", "rx"} and {"tx-sec"}.

--
Thanks,
Sylwester

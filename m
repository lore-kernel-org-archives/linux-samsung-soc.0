From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH 1/3] ASoC: Drop
 SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME flag
Date: Tue, 25 Oct 2016 15:39:29 +0200
Message-ID: <298f24ca-8c11-6625-b5e4-41570a882c6e@samsung.com>
References: <1477392991-10604-1-git-send-email-s.nawrocki@samsung.com>
 <CGME20161025122302eucas1p220a7fdc6b412e42d83efe9bbf721a237@eucas1p2.samsung.com>
 <4abcead6-1f2a-e604-97f6-96e6f26ff9f0@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40705 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935062AbcJYNjg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Oct 2016 09:39:36 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OFL00IOXV9W8I80@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 25 Oct 2016 14:39:32 +0100 (BST)
In-reply-to: <4abcead6-1f2a-e604-97f6-96e6f26ff9f0@metafoo.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, lgirdwood@gmail.com, krzk@kernel.org

On 10/25/2016 02:22 PM, Lars-Peter Clausen wrote:
> On 10/25/2016 12:56 PM, Sylwester Nawrocki wrote:
<...>
> Nice patch. One nice-to-have change request, can you split this into two
> patches, one which removes the last users and one patch which removes
> support for it from the framework?

OK, I've made such split, looks cleaner this way indeed.

> Having the new DMA map framework should also allow us to eventually remove
> the channel request in dmaengine_pcm_new() once all users of filter
> functions have gone.

I've started working on removing all DMA filter uses from sound/soc/samsung,
hopefully it's ready in coming or next kernel release.  I need to add couple
more DMA map tables and support for DMA slave map to the PL080 controller.

> [...]
>> @@ -284,12 +283,9 @@ static int dmaengine_pcm_new(struct snd_soc_pcm_runtime *rtd)
>>  		if (!substream)
>>  			continue;
>>  
>> -		dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
>> -
>> -		if (!pcm->chan[i] &&
>> -		    (pcm->flags & SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME))
>> +		if (!pcm->chan[i] && config->chan_names[i])
>>  			pcm->chan[i] = dma_request_slave_channel(dev,
>> -				dma_data->chan_name);
>> +				config->chan_names[i]);
> 
> I think this can be removed altogether. The only reason why we did the
> delayed request is because the name would have not been available when
> initially trying to request the channel when the PCM device is registered.

Thanks for the hint, I will remove that call in v2.  I suspected it might
not be necessary any more but was afraid a bit of introducing a breakage.

Now the patch will be basically a revert of

commit ea73b7ddf13548afd666373dc5e26ee7c812a3fe
ASoC: dmaengine: Support custom channel names

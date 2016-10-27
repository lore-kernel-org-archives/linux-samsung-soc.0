From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 2/4] ASoC: Drop
 SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME flag
Date: Thu, 27 Oct 2016 13:21:21 +0200
Message-ID: <a06af81c-32e0-69d9-1653-0154616b8dc3@samsung.com>
References: <1477408121-24716-1-git-send-email-s.nawrocki@samsung.com>
 <CGME20161025150901epcas5p39c8cc9b980e71ee184fd831ad854a046@epcas5p3.samsung.com>
 <1477408121-24716-2-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:26602 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936678AbcJ0Pe1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 11:34:27 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OFP00872E7OHD40@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Oct 2016 12:21:24 +0100 (BST)
In-reply-to: <1477408121-24716-2-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org, Lars-Peter Clausen <lars@metafoo.de>
Cc: krzk@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

On 10/25/2016 05:08 PM, Sylwester Nawrocki wrote:
> Since commit 194c7dea00c68c1b1f8ff26304fa937a006f66dd
> "ASoC: dmaengine: add custom DMA config to snd_dmaengine_pcm_config"
> custom DMA channels can be also specified in chan_names[] field of
> struct snd_dmaengine_pcm_config.  This patch removes chan_name field
> of struct snd_dmaengine_dai_dma_data as it is now unused.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

I'm afraid this patch needs to be reverted :/ I didn't notice earlier
the Samsung AC97 controller has 3 substreams per a platform device and
this cannot be handled with struct snd_dmaengine_pcm_config, which
allows to specify up to 2 DMA channel names.

The AC97 driver (sound/soc/samsung/ac97.c) seems to have been broken
for a long time as it currently doesn't have the channel names
specified at all [1].  It seems in order to fix it the best would
be to restore the feature the $subject patch removes.

[1]
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/sound/soc/samsung/ac97.c#n40

>  include/sound/dmaengine_pcm.h         |  6 ------
>  sound/soc/soc-generic-dmaengine-pcm.c | 13 +------------
>  2 files changed, 1 insertion(+), 18 deletions(-)
> 
> diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
> index 67be244..1c8f9e1 100644
> --- a/include/sound/dmaengine_pcm.h
> +++ b/include/sound/dmaengine_pcm.h
> @@ -71,7 +71,6 @@ struct dma_chan *snd_dmaengine_pcm_request_channel(dma_filter_fn filter_fn,
>   * @slave_id: Slave requester id for the DMA channel.
>   * @filter_data: Custom DMA channel filter data, this will usually be used when
>   * requesting the DMA channel.
> - * @chan_name: Custom channel name to use when requesting DMA channel.
>   * @fifo_size: FIFO size of the DAI controller in bytes
>   * @flags: PCM_DAI flags, only SND_DMAENGINE_PCM_DAI_FLAG_PACK for now
>   */
> @@ -81,7 +80,6 @@ struct snd_dmaengine_dai_dma_data {
>  	u32 maxburst;
>  	unsigned int slave_id;
>  	void *filter_data;
> -	const char *chan_name;
>  	unsigned int fifo_size;
>  	unsigned int flags;
>  };
> @@ -107,10 +105,6 @@ void snd_dmaengine_pcm_set_config_from_dai_data(
>   * playback.
>   */
>  #define SND_DMAENGINE_PCM_FLAG_HALF_DUPLEX BIT(3)
> -/*
> - * The PCM streams have custom channel names specified.
> - */
> -#define SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME BIT(4)
> 
>  /**
>   * struct snd_dmaengine_pcm_config - Configuration data for dmaengine based PCM
> diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
> index 6cef397..17eb149 100644
> --- a/sound/soc/soc-generic-dmaengine-pcm.c
> +++ b/sound/soc/soc-generic-dmaengine-pcm.c
> @@ -263,7 +263,6 @@ static int dmaengine_pcm_new(struct snd_soc_pcm_runtime *rtd)
>  	struct dmaengine_pcm *pcm = soc_platform_to_pcm(rtd->platform);
>  	const struct snd_dmaengine_pcm_config *config = pcm->config;
>  	struct device *dev = rtd->platform->dev;
> -	struct snd_dmaengine_dai_dma_data *dma_data;
>  	struct snd_pcm_substream *substream;
>  	size_t prealloc_buffer_size;
>  	size_t max_buffer_size;
> @@ -278,19 +277,11 @@ static int dmaengine_pcm_new(struct snd_soc_pcm_runtime *rtd)
>  		max_buffer_size = SIZE_MAX;
>  	}
> 
> -
>  	for (i = SNDRV_PCM_STREAM_PLAYBACK; i <= SNDRV_PCM_STREAM_CAPTURE; i++) {
>  		substream = rtd->pcm->streams[i].substream;
>  		if (!substream)
>  			continue;
> 
> -		dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
> -
> -		if (!pcm->chan[i] &&
> -		    (pcm->flags & SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME))
> -			pcm->chan[i] = dma_request_slave_channel(dev,
> -				dma_data->chan_name);
> -
>  		if (!pcm->chan[i] && (pcm->flags & SND_DMAENGINE_PCM_FLAG_COMPAT)) {
>  			pcm->chan[i] = dmaengine_pcm_compat_request_channel(rtd,
>  				substream);
> @@ -359,9 +350,7 @@ static int dmaengine_pcm_request_chan_of(struct dmaengine_pcm *pcm,
>  	const char *name;
>  	struct dma_chan *chan;
> 
> -	if ((pcm->flags & (SND_DMAENGINE_PCM_FLAG_NO_DT |
> -			   SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME)) ||
> -	    !dev->of_node)
> +	if ((pcm->flags & SND_DMAENGINE_PCM_FLAG_NO_DT) || !dev->of_node)
>  		return 0;

I somehow messed up testing this patch series on a non-DT platform and
missed the fact that standard "tx", "rx" DMA channel names will only
be used for DT cases in the ASoC core.

Perhaps it makes sense to change the above test to something like:

 if (((pcm->flags & SND_DMAENGINE_PCM_FLAG_NO_DT) || (!dev->of_node &&
		     (pcm->flags & SND_DMAENGINE_PCM_FLAG_COMPAT))))
	return 0;

so when a platform gets converted to use the DMA slave map it can be
treated similarly to a DT platform when SND_DMAENGINE_PCM_FLAG_COMPAT
flag is not set.

I'd either need a change as above or to also revert patch 1/4 :/

>  	if (config && config->dma_dev) {
> --
> 1.9.1

--
Thanks,
Sylwester

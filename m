From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [alsa-devel] [PATCH 1/3] ASoC: Drop
 SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME flag
Date: Tue, 25 Oct 2016 14:22:51 +0200
Message-ID: <4abcead6-1f2a-e604-97f6-96e6f26ff9f0@metafoo.de>
References: <1477392991-10604-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from www381.your-server.de ([78.46.137.84]:33300 "EHLO
        www381.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751594AbcJYMXC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Oct 2016 08:23:02 -0400
In-Reply-To: <1477392991-10604-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, lgirdwood@gmail.com, krzk@kernel.org

On 10/25/2016 12:56 PM, Sylwester Nawrocki wrote:
> Since commit 194c7dea00c68c1b1f8ff26304fa937a006f66dd
> "ASoC: dmaengine: add custom DMA config to snd_dmaengine_pcm_config"
> custom DMA channels can be also specified in chan_names[] field of
> struct snd_dmaengine_pcm_config.  This patch drops chan_name field
> of struct snd_dmaengine_dai_dma_data and makes soc-generic-dmaengine-pcm
> module using config->chan_names instead.  Remaining users of struct
> snd_dmaengine_dai_dma_data::chan_name are updated to not require
> that field.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Nice patch. One nice-to-have change request, can you split this into two
patches, one which removes the last users and one patch which removes
support for it from the framework?

Having the new DMA map framework should also allow us to eventually remove
the channel request in dmaengine_pcm_new() once all users of filter
functions have gone.

[...]
> diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
> index 6cef397..f2d372d 100644
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
> @@ -284,12 +283,9 @@ static int dmaengine_pcm_new(struct snd_soc_pcm_runtime *rtd)
>  		if (!substream)
>  			continue;
>  
> -		dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
> -
> -		if (!pcm->chan[i] &&
> -		    (pcm->flags & SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME))
> +		if (!pcm->chan[i] && config->chan_names[i])
>  			pcm->chan[i] = dma_request_slave_channel(dev,
> -				dma_data->chan_name);
> +				config->chan_names[i]);

I think this can be removed altogether. The only reason why we did the
delayed request is because the name would have not been available when
initially trying to request the channel when the PCM device is registered.

>  
>  		if (!pcm->chan[i] && (pcm->flags & SND_DMAENGINE_PCM_FLAG_COMPAT)) {
>  			pcm->chan[i] = dmaengine_pcm_compat_request_channel(rtd,
> @@ -359,9 +355,7 @@ static int dmaengine_pcm_request_chan_of(struct dmaengine_pcm *pcm,
>  	const char *name;
>  	struct dma_chan *chan;
>  
> -	if ((pcm->flags & (SND_DMAENGINE_PCM_FLAG_NO_DT |
> -			   SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME)) ||
> -	    !dev->of_node)
> +	if ((pcm->flags & SND_DMAENGINE_PCM_FLAG_NO_DT) || !dev->of_node)
>  		return 0;
>  
>  	if (config && config->dma_dev) {
> 

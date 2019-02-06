From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ASoC: dapm: Check for NULL widget in
 dapm_update_dai_unlocked
Date: Wed, 06 Feb 2019 11:18:01 +0100
Message-ID: <a1f95900-caa6-0dbd-3c8e-88a2d802163d@samsung.com>
References: <CGME20190205211638epcas3p409823d4acac8073473153d745151ea5f@epcas3p4.samsung.com>
        <20190205211622.GA5891@kozik-lap>
        <844c3f34-f7db-6b26-169a-994922367c78@samsung.com>
        <20190206100549.GO3837@imbe.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190206100549.GO3837@imbe.wolfsonmicro.main>
Content-language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 2/6/19 11:05, Charles Keepax wrote:
> DAIs linked to the dummy will not have an associated playback/capture
> widget, so we need to skip the update in that case.
> 
> Fixes: 078a85f2806f ("ASoC: dapm: Only power up active channels from a DAI")
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Tested-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

> ---
> 
> Ok so that all makes sense, this patch is probably the best fix?

It seems so, everything works well with such change, thank you.
 
>  sound/soc/soc-dapm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
> index 482ddb825fb59..5235d8828758a 100644
> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -2570,6 +2570,9 @@ static int dapm_update_dai_unlocked(struct snd_pcm_substream *substream,
>  	else
>  		w = dai->capture_widget;
>  
> +	if (!w)
> +		return 0;
> +
>  	dev_dbg(dai->dev, "Update DAI routes for %s %s\n", dai->name,
>  		dir == SNDRV_PCM_STREAM_PLAYBACK ? "playback" : "capture");
>  

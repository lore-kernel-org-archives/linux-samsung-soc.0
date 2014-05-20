From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] sound: soc: samsung: dma.c: Fix for possible null pointer
 dereference
Date: Tue, 20 May 2014 11:10:59 +0530
Message-ID: <537AEAEB.8040803@linaro.org>
References: <1400535443-5886-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1400535443-5886-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 05/20/2014 03:07 AM, Rickard Strandqvist wrote:
> There is otherwise a risk of a possible null pointer dereference.
> 
> Was largely found by using a static code analysis program called cppcheck.
> 
> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
> ---
>  sound/soc/samsung/dma.c |   10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/samsung/dma.c b/sound/soc/samsung/dma.c
> index dc09b71..1d9bcaa 100644
> --- a/sound/soc/samsung/dma.c
> +++ b/sound/soc/samsung/dma.c
> @@ -115,17 +115,19 @@ static void dma_enqueue(struct snd_pcm_substream *substream)
>  static void audio_buffdone(void *data)
>  {
>  	struct snd_pcm_substream *substream = data;
> -	struct runtime_data *prtd = substream->runtime->private_data;
> +	struct runtime_data *prtd = NULL;

I am not sure if this check is required as audio_buffdone() is set as a
callback function with known valid parameter during dma_enqueue().

>  
>  	pr_debug("Entered %s\n", __func__);
>  
> -	if (prtd->state & ST_RUNNING) {
> +	if (substream)
> +		prtd = substream->runtime->private_data;
> +
> +	if (prtd && prtd->state & ST_RUNNING) {

ditto as above

>  		prtd->dma_pos += prtd->dma_period;
>  		if (prtd->dma_pos >= prtd->dma_end)
>  			prtd->dma_pos = prtd->dma_start;
>  
> -		if (substream)
> -			snd_pcm_period_elapsed(substream);
> +		snd_pcm_period_elapsed(substream);

This check certainly can be removed as snd_pcm_period_elapsed() also
checks the validity of the argument.

-- 
Tushar Behera

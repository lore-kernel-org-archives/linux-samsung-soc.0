From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] Fix for possible null pointer dereference in dma.c
Date: Mon, 19 May 2014 12:52:52 +0200
Message-ID: <5379E284.7030700@gmail.com>
References: <1400191076-28279-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f50.google.com ([74.125.83.50]:44824 "EHLO
	mail-ee0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752756AbaESKxC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 06:53:02 -0400
In-Reply-To: <1400191076-28279-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

Hi Rickard,

On 15.05.2014 23:57, Rickard Strandqvist wrote:
> There is otherwise a risk of a possible null pointer dereference.
>=20
> Was largely found by using a static code analysis program called cppc=
heck.
>=20
> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigit=
al.se>
> ---
>  sound/soc/samsung/dma.c |   10 ++++++----
>  1 fil =C3=A4ndrad, 6 till=C3=A4gg(+), 4 borttagningar(-)
>=20
> diff --git a/sound/soc/samsung/dma.c b/sound/soc/samsung/dma.c
> index dc09b71..b1f6757 100644
> --- a/sound/soc/samsung/dma.c
> +++ b/sound/soc/samsung/dma.c
> @@ -115,17 +115,19 @@ static void dma_enqueue(struct snd_pcm_substrea=
m *substream)
>  static void audio_buffdone(void *data)
>  {
>  	struct snd_pcm_substream *substream =3D data;
> -	struct runtime_data *prtd =3D substream->runtime->private_data;
> +	struct runtime_data *prtd =3D NULL;
> =20
>  	pr_debug("Entered %s\n", __func__);
> =20
> -	if (prtd->state & ST_RUNNING) {
> +	if(substream)
> +		prtd =3D substream->runtime->private_data;
> +
> +	if (prtd && prtd->state & ST_RUNNING) {
>  		prtd->dma_pos +=3D prtd->dma_period;
>  		if (prtd->dma_pos >=3D prtd->dma_end)
>  			prtd->dma_pos =3D prtd->dma_start;
> =20
> -		if (substream)
> -			snd_pcm_period_elapsed(substream);
> +		snd_pcm_period_elapsed(substream);
> =20
>  		spin_lock(&prtd->lock);
>  		if (!samsung_dma_has_circular()) {
>=20

Can you find a path (or use case, if possible) on which any of affected
pointers will be NULL?

Best regards,
Tomasz

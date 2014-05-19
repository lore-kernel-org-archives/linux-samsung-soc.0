From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCH] Fix for possible null pointer dereference in dma.c
Date: Mon, 19 May 2014 07:39:47 +0200
Message-ID: <20140519073947.66bb2c46@ipc1.ka-ro>
References: <1400191076-28279-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.karo-electronics.de ([81.173.242.67]:56343 "EHLO
	mail.karo-electronics.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750738AbaESFkH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 01:40:07 -0400
In-Reply-To: <1400191076-28279-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org

Hi,

Rickard Strandqvist wrote:
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
>
Missing space.


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________

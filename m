From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v6 14/15] ASoC: Samsung: Update DMA interface
Date: Mon, 22 Aug 2011 16:08:47 +0530
Message-ID: <CABb+yY0snxwTovU1rJVmvs+_r2FGd9=FfjFzLqcEcSRxLK2OHQ@mail.gmail.com>
References: <1313744097-27289-1-git-send-email-boojin.kim@samsung.com>
	<1313744097-27289-15-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:50189 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756647Ab1HVKit convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Aug 2011 06:38:49 -0400
Received: by bke11 with SMTP id 11so3554854bke.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Aug 2011 03:38:47 -0700 (PDT)
In-Reply-To: <1313744097-27289-15-git-send-email-boojin.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Dan Williams <dan.j.williams@intel.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King <linux@arm.linux.org.uk>, Liam Girdwood <lrg@ti.com>

On Fri, Aug 19, 2011 at 2:24 PM, Boojin Kim <boojin.kim@samsung.com> wr=
ote:
> This patch adds to support the DMA PL330 driver that uses
> DMA generic API. Samsung sound driver uses DMA generic API
> if architecture supports it. Otherwise, use samsung specific
> S3C-PL330 API driver to transfer PCM data.
>
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Vinod Koul <vinod.koul@intel.com>
> Cc: Jassi Brar <jassisinghbrar@gmail.com>
> Cc: Liam Girdwood <lrg@ti.com>
> Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> [kgene.kim@samsung.com: removed useless variable]
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =C2=A0arch/arm/mach-s3c2410/include/mach/dma.h =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 10 +-
> =C2=A0arch/arm/mach-s3c64xx/include/mach/dma.h =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A02 +-
> =C2=A0arch/arm/plat-samsung/include/plat/dma-pl330.h | =C2=A0 =C2=A02=
 +-
> =C2=A0sound/soc/samsung/ac97.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 10 ++-
> =C2=A0sound/soc/samsung/dma.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0146 ++++++++++-------=
-------
> =C2=A0sound/soc/samsung/dma.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A04 +-
> =C2=A06 files changed, 78 insertions(+), 96 deletions(-)
>
> diff --git a/arch/arm/mach-s3c2410/include/mach/dma.h b/arch/arm/mach=
-s3c2410/include/mach/dma.h
> index e61a91f..4e485ba 100644
> --- a/arch/arm/mach-s3c2410/include/mach/dma.h
> +++ b/arch/arm/mach-s3c2410/include/mach/dma.h
> @@ -50,6 +50,11 @@ enum dma_ch {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0DMACH_MAX, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* the end entry */
> =C2=A0};
>
> +static inline bool samsung_dma_has_circular(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return false;
> +}
> +
> =C2=A0static inline bool samsung_dma_is_dmadev(void)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;
> @@ -202,9 +207,4 @@ struct s3c2410_dma_chan {
>
> =C2=A0typedef unsigned long dma_device_t;
>
> -static inline bool s3c_dma_has_circular(void)
> -{
> - =C2=A0 =C2=A0 =C2=A0 return false;
> -}
> -
> =C2=A0#endif /* __ASM_ARCH_DMA_H */
> diff --git a/arch/arm/mach-s3c64xx/include/mach/dma.h b/arch/arm/mach=
-s3c64xx/include/mach/dma.h
> index 49c3a53..74fdf25 100644
> --- a/arch/arm/mach-s3c64xx/include/mach/dma.h
> +++ b/arch/arm/mach-s3c64xx/include/mach/dma.h
> @@ -58,7 +58,7 @@ enum dma_ch {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0DMACH_MAX =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /* the end */
> =C2=A0};
>
> -static __inline__ bool s3c_dma_has_circular(void)
> +static inline bool samsung_dma_has_circular(void)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;
> =C2=A0}
> diff --git a/arch/arm/plat-samsung/include/plat/dma-pl330.h b/arch/ar=
m/plat-samsung/include/plat/dma-pl330.h
> index 9a1dadb..2e55e59 100644
> --- a/arch/arm/plat-samsung/include/plat/dma-pl330.h
> +++ b/arch/arm/plat-samsung/include/plat/dma-pl330.h
> @@ -89,7 +89,7 @@ struct s3c2410_dma_client {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0char =C2=A0 =C2=A0*name;
> =C2=A0};
>
> -static inline bool s3c_dma_has_circular(void)
> +static inline bool samsung_dma_has_circular(void)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;
> =C2=A0}
> diff --git a/sound/soc/samsung/ac97.c b/sound/soc/samsung/ac97.c
> index f97110e..b4f9b00 100644
> --- a/sound/soc/samsung/ac97.c
> +++ b/sound/soc/samsung/ac97.c
> @@ -271,7 +271,10 @@ static int s3c_ac97_trigger(struct snd_pcm_subst=
ream *substream, int cmd,
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0writel(ac_glbctrl, s3c_ac97.regs + S3C_AC9=
7_GLBCTRL);
>
> - =C2=A0 =C2=A0 =C2=A0 s3c2410_dma_ctrl(dma_data->channel, S3C2410_DM=
AOP_STARTED);
> + =C2=A0 =C2=A0 =C2=A0 if (!dma_data->ops)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_data->ops =3D =
samsung_dma_get_ops();
> +
> + =C2=A0 =C2=A0 =C2=A0 dma_data->ops->started(dma_data->channel);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
> @@ -317,7 +320,10 @@ static int s3c_ac97_mic_trigger(struct snd_pcm_s=
ubstream *substream,
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0writel(ac_glbctrl, s3c_ac97.regs + S3C_AC9=
7_GLBCTRL);
>
> - =C2=A0 =C2=A0 =C2=A0 s3c2410_dma_ctrl(dma_data->channel, S3C2410_DM=
AOP_STARTED);
> + =C2=A0 =C2=A0 =C2=A0 if (!dma_data->ops)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_data->ops =3D =
samsung_dma_get_ops();
> +
> + =C2=A0 =C2=A0 =C2=A0 dma_data->ops->started(dma_data->channel);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
> diff --git a/sound/soc/samsung/dma.c b/sound/soc/samsung/dma.c
> index 9465588..851346f 100644
> --- a/sound/soc/samsung/dma.c
> +++ b/sound/soc/samsung/dma.c
> @@ -54,7 +54,6 @@ struct runtime_data {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0spinlock_t lock;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int state;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int dma_loaded;
> - =C2=A0 =C2=A0 =C2=A0 unsigned int dma_limit;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int dma_period;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_t dma_start;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_t dma_pos;
> @@ -62,77 +61,79 @@ struct runtime_data {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct s3c_dma_params *params;
> =C2=A0};
>
> +static void audio_buffdone(void *data);
> +
> =C2=A0/* dma_enqueue
> =C2=A0*
> =C2=A0* place a dma buffer onto the queue for the dma system
> =C2=A0* to handle.
> -*/
> + */
> =C2=A0static void dma_enqueue(struct snd_pcm_substream *substream)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct runtime_data *prtd =3D substream->r=
untime->private_data;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_t pos =3D prtd->dma_pos;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int limit;
> - =C2=A0 =C2=A0 =C2=A0 int ret;
> + =C2=A0 =C2=A0 =C2=A0 struct samsung_dma_prep_info dma_info;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug("Entered %s\n", __func__);
>
> - =C2=A0 =C2=A0 =C2=A0 if (s3c_dma_has_circular())
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 limit =3D (prtd->d=
ma_end - prtd->dma_start) / prtd->dma_period;
> - =C2=A0 =C2=A0 =C2=A0 else
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 limit =3D prtd->dm=
a_limit;
> + =C2=A0 =C2=A0 =C2=A0 limit =3D (prtd->dma_end - prtd->dma_start) / =
prtd->dma_period;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug("%s: loaded %d, limit %d\n",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, prtd->dma_loaded, l=
imit);
>
> - =C2=A0 =C2=A0 =C2=A0 while (prtd->dma_loaded < limit) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long len =
=3D prtd->dma_period;
> + =C2=A0 =C2=A0 =C2=A0 dma_info.cap =3D (samsung_dma_has_circular() ?=
 DMA_CYCLIC : DMA_SLAVE);
> + =C2=A0 =C2=A0 =C2=A0 dma_info.direction =3D
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (substream->stream=
 =3D=3D SNDRV_PCM_STREAM_PLAYBACK
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ? DMA_TO_DEVICE : =
DMA_FROM_DEVICE);
> + =C2=A0 =C2=A0 =C2=A0 dma_info.fp =3D audio_buffdone;
> + =C2=A0 =C2=A0 =C2=A0 dma_info.fp_param =3D substream;
> + =C2=A0 =C2=A0 =C2=A0 dma_info.period =3D prtd->dma_period;
> + =C2=A0 =C2=A0 =C2=A0 dma_info.len =3D prtd->dma_period*limit;
>
> + =C2=A0 =C2=A0 =C2=A0 while (prtd->dma_loaded < limit) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug("dma_=
loaded: %d\n", prtd->dma_loaded);
>
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((pos + len) > =
prtd->dma_end) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 len =C2=A0=3D prtd->dma_end - pos;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 pr_debug("%s: corrected dma len %ld\n", __func__, len);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((pos + dma_inf=
o.period) > prtd->dma_end) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dma_info.period =C2=A0=3D prtd->dma_end - pos;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 pr_debug("%s: corrected dma len %ld\n",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func_=
_, dma_info.period);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s3c2410_dm=
a_enqueue(prtd->params->channel,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 substream, pos, len);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_info.buf =3D p=
os;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prtd->params->ops-=
>prepare(prtd->params->ch, &dma_info);
>
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D 0) =
{
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 prtd->dma_loaded++;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 pos +=3D prtd->dma_period;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (pos >=3D prtd->dma_end)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pos =3D prtd->dma_start;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prtd->dma_loaded++=
;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pos +=3D prtd->dma=
_period;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pos >=3D prtd-=
>dma_end)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 pos =3D prtd->dma_start;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0prtd->dma_pos =3D pos;
> =C2=A0}
>
> -static void audio_buffdone(struct s3c2410_dma_chan *channel,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *dev_id, int size,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum s3c2410_dma_buffresult result)
> +static void audio_buffdone(void *data)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 struct snd_pcm_substream *substream =3D dev_id=
;
> - =C2=A0 =C2=A0 =C2=A0 struct runtime_data *prtd;
> + =C2=A0 =C2=A0 =C2=A0 struct snd_pcm_substream *substream =3D data;
> + =C2=A0 =C2=A0 =C2=A0 struct runtime_data *prtd =3D substream->runti=
me->private_data;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug("Entered %s\n", __func__);
>
> - =C2=A0 =C2=A0 =C2=A0 if (result =3D=3D S3C2410_RES_ABORT || result =
=3D=3D S3C2410_RES_ERR)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> -
> - =C2=A0 =C2=A0 =C2=A0 prtd =3D substream->runtime->private_data;
> + =C2=A0 =C2=A0 =C2=A0 if (prtd->state & ST_RUNNING) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prtd->dma_pos +=3D=
 prtd->dma_period;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (prtd->dma_pos =
>=3D prtd->dma_end)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 prtd->dma_pos =3D prtd->dma_start;
>
> - =C2=A0 =C2=A0 =C2=A0 if (substream)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snd_pcm_period_ela=
psed(substream);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (substream)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 snd_pcm_period_elapsed(substream);
>
> - =C2=A0 =C2=A0 =C2=A0 spin_lock(&prtd->lock);
> - =C2=A0 =C2=A0 =C2=A0 if (prtd->state & ST_RUNNING && !s3c_dma_has_c=
ircular()) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prtd->dma_loaded--=
;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_enqueue(substr=
eam);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_lock(&prtd->l=
ock);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!samsung_dma_h=
as_circular()) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 prtd->dma_loaded--;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dma_enqueue(substream);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_unlock(&prtd-=
>lock);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> -
> - =C2=A0 =C2=A0 =C2=A0 spin_unlock(&prtd->lock);
> =C2=A0}
>
> =C2=A0static int dma_hw_params(struct snd_pcm_substream *substream,
> @@ -144,8 +145,7 @@ static int dma_hw_params(struct snd_pcm_substream=
 *substream,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long totbytes =3D params_buffer_b=
ytes(params);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct s3c_dma_params *dma =3D
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snd_soc_dai_ge=
t_dma_data(rtd->cpu_dai, substream);
> - =C2=A0 =C2=A0 =C2=A0 int ret =3D 0;
> -
> + =C2=A0 =C2=A0 =C2=A0 struct samsung_dma_info dma_info;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug("Entered %s\n", __func__);
>
> @@ -163,30 +163,26 @@ static int dma_hw_params(struct snd_pcm_substre=
am *substream,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug("para=
ms %p, client %p, channel %d\n", prtd->params,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0prtd->params->client, prtd->params->channel);
>
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s3c2410_dm=
a_request(prtd->params->channel,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
prtd->params->client, NULL);
> -
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret < 0) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 printk(KERN_ERR "failed to get dma channel\n");
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return ret;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> -
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* use the circula=
r buffering if we have it available. */
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s3c_dma_has_ci=
rcular())
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 s3c2410_dma_setflags(prtd->params->channel,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0S3C2410_DMAF_CIRCULAR);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prtd->params->ops =
=3D samsung_dma_get_ops();
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_info.cap =3D (=
samsung_dma_has_circular() ?
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 DMA_CYCLIC : DMA_SLAVE);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_info.client =3D=
 prtd->params->client;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_info.direction=
 =3D
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ? DMA_TO_DEVICE : DMA_FROM_DEVICE);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_info.width =3D=
 prtd->params->dma_size;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_info.fifo =3D =
prtd->params->dma_addr;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prtd->params->ch =3D=
 prtd->params->ops->request(
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prtd->params->channel, &dma_info);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> - =C2=A0 =C2=A0 =C2=A0 s3c2410_dma_set_buffdone_fn(prtd->params->chan=
nel,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 audio_buffdone);
> -
> =C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_set_runtime_buffer(substream, &sub=
stream->dma_buffer);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0runtime->dma_bytes =3D totbytes;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_irq(&prtd->lock);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0prtd->dma_loaded =3D 0;
> - =C2=A0 =C2=A0 =C2=A0 prtd->dma_limit =3D runtime->hw.periods_min;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0prtd->dma_period =3D params_period_bytes(p=
arams);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0prtd->dma_start =3D runtime->dma_addr;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0prtd->dma_pos =3D prtd->dma_start;
> @@ -206,7 +202,8 @@ static int dma_hw_free(struct snd_pcm_substream *=
substream)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_set_runtime_buffer(substream, NULL=
);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (prtd->params) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c2410_dma_free(p=
rtd->params->channel, prtd->params->client);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prtd->params->ops-=
>release(prtd->params->ch,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prtd->p=
arams->client);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prtd->params =3D=
 NULL;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> @@ -225,23 +222,9 @@ static int dma_prepare(struct snd_pcm_substream =
*substream)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!prtd->params)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>
> - =C2=A0 =C2=A0 =C2=A0 /* channel needs configuring for mem=3D>device=
, increment memory addr,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0* sync to pclk, half-word transfers to t=
he IIS-FIFO. */
> - =C2=A0 =C2=A0 =C2=A0 if (substream->stream =3D=3D SNDRV_PCM_STREAM_=
PLAYBACK) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c2410_dma_devcon=
fig(prtd->params->channel,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S3C2410_DMASRC=
_MEM,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prtd->params->=
dma_addr);
> - =C2=A0 =C2=A0 =C2=A0 } else {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c2410_dma_devcon=
fig(prtd->params->channel,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S3C2410_DMASRC=
_HW,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prtd->params->=
dma_addr);
> - =C2=A0 =C2=A0 =C2=A0 }
> -
> - =C2=A0 =C2=A0 =C2=A0 s3c2410_dma_config(prtd->params->channel,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0prtd->params->dma_size);
> -
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* flush the DMA channel */
> - =C2=A0 =C2=A0 =C2=A0 s3c2410_dma_ctrl(prtd->params->channel, S3C241=
0_DMAOP_FLUSH);
> + =C2=A0 =C2=A0 =C2=A0 prtd->params->ops->flush(prtd->params->ch);
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0prtd->dma_loaded =3D 0;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0prtd->dma_pos =3D prtd->dma_start;
>
> @@ -265,14 +248,14 @@ static int dma_trigger(struct snd_pcm_substream=
 *substream, int cmd)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0case SNDRV_PCM_TRIGGER_RESUME:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prtd->state |=3D=
 ST_RUNNING;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c2410_dma_ctrl(p=
rtd->params->channel, S3C2410_DMAOP_START);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prtd->params->ops-=
>trigger(prtd->params->ch);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0case SNDRV_PCM_TRIGGER_STOP:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0case SNDRV_PCM_TRIGGER_SUSPEND:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prtd->state &=3D=
 ~ST_RUNNING;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c2410_dma_ctrl(p=
rtd->params->channel, S3C2410_DMAOP_STOP);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prtd->params->ops-=
>stop(prtd->params->ch);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0default:
> @@ -291,21 +274,12 @@ dma_pointer(struct snd_pcm_substream *substream=
)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct snd_pcm_runtime *runtime =3D substr=
eam->runtime;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct runtime_data *prtd =3D runtime->pri=
vate_data;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long res;
> - =C2=A0 =C2=A0 =C2=A0 dma_addr_t src, dst;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug("Entered %s\n", __func__);
>
> - =C2=A0 =C2=A0 =C2=A0 spin_lock(&prtd->lock);
> - =C2=A0 =C2=A0 =C2=A0 s3c2410_dma_getposition(prtd->params->channel,=
 &src, &dst);
> -
> - =C2=A0 =C2=A0 =C2=A0 if (substream->stream =3D=3D SNDRV_PCM_STREAM_=
CAPTURE)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D dst - prtd=
->dma_start;
> - =C2=A0 =C2=A0 =C2=A0 else
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D src - prtd=
->dma_start;
> -
> - =C2=A0 =C2=A0 =C2=A0 spin_unlock(&prtd->lock);
> + =C2=A0 =C2=A0 =C2=A0 res =3D prtd->dma_pos - prtd->dma_start;
>
> - =C2=A0 =C2=A0 =C2=A0 pr_debug("Pointer %x %x\n", src, dst);
> + =C2=A0 =C2=A0 =C2=A0 pr_debug("Pointer offset: %lu\n", res);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* we seem to be getting the odd error fro=
m the pcm library due
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * to out-of-bounds pointers. this is mayb=
e due to the dma engine
> diff --git a/sound/soc/samsung/dma.h b/sound/soc/samsung/dma.h
> index c506592..7d1ead7 100644
> --- a/sound/soc/samsung/dma.h
> +++ b/sound/soc/samsung/dma.h
> @@ -6,7 +6,7 @@
> =C2=A0* =C2=A0Free Software Foundation; =C2=A0either version 2 of the=
 =C2=A0License, or (at your
> =C2=A0* =C2=A0option) any later version.
> =C2=A0*
> - * =C2=A0ALSA PCM interface for the Samsung S3C24xx CPU
> + * =C2=A0ALSA PCM interface for the Samsung SoC
> =C2=A0*/
>
> =C2=A0#ifndef _S3C_AUDIO_H
> @@ -17,6 +17,8 @@ struct s3c_dma_params {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int channel; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Ch=
annel ID */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_t dma_addr;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int dma_size; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Size of the DMA transfer */
> + =C2=A0 =C2=A0 =C2=A0 unsigned ch;
> + =C2=A0 =C2=A0 =C2=A0 struct samsung_dma_ops *ops;
> =C2=A0};

Hi Mark,
 I see the patch is unrevised, despite my last alert of regression.
If Samsung guys decide to live with it and you are ok  - I am ok too.

Also, I am planning to get out of the way of Samsung patches -
so that I can concentrate better on my official interests and also so t=
hat I
am no more seen as an 'obstacle' by Kukjin & Co.  I am sure they have f=
ar
better folks than me and everything would continue to be ok.
If you find some patch ok, please don't wait for my review before mergi=
ng it.

Thanks,
-Jassi

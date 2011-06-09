From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 2/4] ASoC: SAMSUNG: Add I2S0 internal dma driver
Date: Thu, 9 Jun 2011 21:33:09 +0900
Message-ID: <BANLkTikUe7MV7EHc7CN4WECs0oLrQBAs4g@mail.gmail.com>
References: <1307606950-8310-1-git-send-email-sbkim73@samsung.com>
	<1307606950-8310-3-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:33036 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757311Ab1FIMdL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jun 2011 08:33:11 -0400
Received: by vws1 with SMTP id 1so1106386vws.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jun 2011 05:33:10 -0700 (PDT)
In-Reply-To: <1307606950-8310-3-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, ben-linux@fluff.org

On Thu, Jun 9, 2011 at 5:09 PM, Sangbeom Kim <sbkim73@samsung.com> wrot=
e:
> I2S in Exynos4 and S5PC110(S5PV210) has a internal dma.
> It can be used low power audio mode and 2nd channel transfer.
>
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> ---
> =A0sound/soc/samsung/Makefile | =A0 =A02 +
> =A0sound/soc/samsung/idma.c =A0 | =A0492 ++++++++++++++++++++++++++++=
++++++++++++++++
> =A0sound/soc/samsung/idma.h =A0 | =A0 28 +++
> =A03 files changed, 522 insertions(+), 0 deletions(-)
> =A0create mode 100644 sound/soc/samsung/idma.c
> =A0create mode 100644 sound/soc/samsung/idma.h
>
> diff --git a/sound/soc/samsung/Makefile b/sound/soc/samsung/Makefile
> index 683843a..2b9e251 100644
> --- a/sound/soc/samsung/Makefile
> +++ b/sound/soc/samsung/Makefile
> @@ -1,5 +1,6 @@
> =A0# S3c24XX Platform Support
> =A0snd-soc-s3c24xx-objs :=3D dma.o
> +snd-soc-idma-objs :=3D idma.o
> =A0snd-soc-s3c24xx-i2s-objs :=3D s3c24xx-i2s.o
> =A0snd-soc-s3c2412-i2s-objs :=3D s3c2412-i2s.o
> =A0snd-soc-ac97-objs :=3D ac97.o
> @@ -16,6 +17,7 @@ obj-$(CONFIG_SND_S3C_I2SV2_SOC) +=3D snd-soc-s3c-i2=
s-v2.o
> =A0obj-$(CONFIG_SND_SAMSUNG_SPDIF) +=3D snd-soc-samsung-spdif.o
> =A0obj-$(CONFIG_SND_SAMSUNG_PCM) +=3D snd-soc-pcm.o
> =A0obj-$(CONFIG_SND_SAMSUNG_I2S) +=3D snd-soc-i2s.o
> +obj-$(CONFIG_SND_SAMSUNG_I2S) +=3D snd-soc-idma.o
>
> =A0# S3C24XX Machine Support
> =A0snd-soc-jive-wm8750-objs :=3D jive_wm8750.o
> diff --git a/sound/soc/samsung/idma.c b/sound/soc/samsung/idma.c
> new file mode 100644
> index 0000000..ae19546
> --- /dev/null
> +++ b/sound/soc/samsung/idma.c
> @@ -0,0 +1,492 @@
> +/*
> + * linux/sound/soc/samsung/idma.c
> + *
> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> + *
> + * I2S0's Internal DMA driver
> + *
> + * This program is free software; you can redistribute =A0it and/or =
modify it
> + * under =A0the terms of =A0the GNU General =A0Public License as pub=
lished by the
> + * Free Software Foundation; =A0either version 2 of the =A0License, =
or (at your
> + * option) any later version.
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/platform_device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/slab.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +
> +#include "i2s.h"
> +#include "idma.h"
> +#include "dma.h"
> +
> +static const struct snd_pcm_hardware idma_hardware =3D {
> + =A0 =A0 =A0 .info =3D SNDRV_PCM_INFO_INTERLEAVED |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SNDRV_PCM_INFO_BLOCK_TRANSFER |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SNDRV_PCM_INFO_MMAP |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SNDRV_PCM_INFO_MMAP_VALID |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SNDRV_PCM_INFO_PAUSE |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SNDRV_PCM_INFO_RESUME,
> + =A0 =A0 =A0 .formats =3D SNDRV_PCM_FMTBIT_S16_LE |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SNDRV_PCM_FMTBIT_U16_LE |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SNDRV_PCM_FMTBIT_S24_LE |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SNDRV_PCM_FMTBIT_U24_LE |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SNDRV_PCM_FMTBIT_U8 |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SNDRV_PCM_FMTBIT_S8,
> + =A0 =A0 =A0 .channels_min =3D 2,
> + =A0 =A0 =A0 .channels_max =3D 2,
> + =A0 =A0 =A0 .buffer_bytes_max =3D 128 * 1024,
> + =A0 =A0 =A0 .period_bytes_min =3D 128,
> + =A0 =A0 =A0 .period_bytes_max =3D PAGE_SIZE*2,
> + =A0 =A0 =A0 .periods_min =3D 1,
> + =A0 =A0 =A0 .periods_max =3D 4,
> +};
> +
> +struct idma_ctrl {
> + =A0 =A0 =A0 spinlock_t =A0 =A0 =A0lock;
> + =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 state;
> + =A0 =A0 =A0 dma_addr_t =A0 =A0 =A0start;
> + =A0 =A0 =A0 dma_addr_t =A0 =A0 =A0pos;
> + =A0 =A0 =A0 dma_addr_t =A0 =A0 =A0end;
> + =A0 =A0 =A0 dma_addr_t =A0 =A0 =A0period;
> + =A0 =A0 =A0 dma_addr_t =A0 =A0 =A0periodsz;
> + =A0 =A0 =A0 void =A0 =A0 =A0 =A0 =A0 =A0*token;
> + =A0 =A0 =A0 void =A0 =A0 =A0 =A0 =A0 =A0(*cb)(void *dt, int bytes_x=
fer);
> +};
> +
> +static struct idma_info {
> + =A0 =A0 =A0 spinlock_t =A0 =A0 =A0lock;
> + =A0 =A0 =A0 void =A0 =A0 =A0 =A0 =A0 =A0 __iomem =A0*regs;
> + =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 trigger_stat;
> +} idma;
> +
> +static void idma_getpos(dma_addr_t *src)
> +{
> + =A0 =A0 =A0 *src =3D LP_TXBUFF_ADDR +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 (readl(idma.regs + I2STRNCNT) & 0xfffff=
f) * 4;
> +}
> +
> +void i2sdma_getpos(dma_addr_t *src)
> +{
> + =A0 =A0 =A0 if (idma.trigger_stat =3D=3D LPAM_DMA_START)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *src =3D LP_TXBUFF_ADDR +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (readl(idma.regs + I2ST=
RNCNT) & 0xffffff) * 4;
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *src =3D LP_TXBUFF_ADDR;
> +}
> +
> +static int idma_enqueue(struct snd_pcm_substream *substream)
> +{
> + =A0 =A0 =A0 struct snd_pcm_runtime *runtime =3D substream->runtime;
> + =A0 =A0 =A0 struct idma_ctrl *prtd =3D substream->runtime->private_=
data;
> + =A0 =A0 =A0 u32 val;
> +
> + =A0 =A0 =A0 spin_lock(&prtd->lock);
> + =A0 =A0 =A0 prtd->token =3D (void *) substream;
> + =A0 =A0 =A0 spin_unlock(&prtd->lock);
> +
> + =A0 =A0 =A0 /* Internal DMA Level0 Interrupt Address */
> + =A0 =A0 =A0 val =3D LP_TXBUFF_ADDR + prtd->periodsz;
> + =A0 =A0 =A0 writel(val, idma.regs + I2SLVL0ADDR);
> +
> + =A0 =A0 =A0 /* Start address0 of I2S internal DMA operation. */
> + =A0 =A0 =A0 val =3D readl(idma.regs + I2SSTR0);
> + =A0 =A0 =A0 val =3D LP_TXBUFF_ADDR;
> + =A0 =A0 =A0 writel(val, idma.regs + I2SSTR0);
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Transfer block size for I2S internal DMA.
> + =A0 =A0 =A0 =A0* Should decide transfer size before start dma opera=
tion
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 val =3D readl(idma.regs + I2SSIZE);
> + =A0 =A0 =A0 val &=3D ~(I2SSIZE_TRNMSK << I2SSIZE_SHIFT);
> +
> + =A0 =A0 =A0 val |=3D (((runtime->dma_bytes >> 2) &
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 I2SSIZE_TRNMSK) << I2SS=
IZE_SHIFT);
> + =A0 =A0 =A0 writel(val, idma.regs + I2SSIZE);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static void idma_setcallbk(struct snd_pcm_substream *substream,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 void (*=
cb)(void *, int))
> +{
> + =A0 =A0 =A0 struct idma_ctrl *prtd =3D substream->runtime->private_=
data;
> +
> + =A0 =A0 =A0 spin_lock(&prtd->lock);
> + =A0 =A0 =A0 prtd->cb =3D cb;
> + =A0 =A0 =A0 spin_unlock(&prtd->lock);
> +
> + =A0 =A0 =A0 pr_debug("%s:%d dma_period=3D%x\n", __func__, __LINE__,=
 prtd->periodsz);
> +}
> +
> +static void idma_ctrl(int op)
> +{
> + =A0 =A0 =A0 u32 val =3D readl(idma.regs + I2SAHB);
> +
> + =A0 =A0 =A0 spin_lock(&idma.lock);
> +
> + =A0 =A0 =A0 switch (op) {
> + =A0 =A0 =A0 case LPAM_DMA_START:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val |=3D (AHB_INTENLVL0 | AHB_DMAEN);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case LPAM_DMA_STOP:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val &=3D ~(AHB_INTENLVL0 | AHB_DMAEN);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 writel(val, idma.regs + I2SAHB);
> + =A0 =A0 =A0 spin_unlock(&idma.lock);
> +}
> +
> +static void idma_done(void *id, int bytes_xfer)
> +{
> + =A0 =A0 =A0 struct snd_pcm_substream *substream =3D id;
> + =A0 =A0 =A0 struct idma_ctrl *prtd =3D substream->runtime->private_=
data;
> +
> + =A0 =A0 =A0 if (prtd && (prtd->state & ST_RUNNING))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 snd_pcm_period_elapsed(substream);
> +}
> +
> +static int idma_hw_params(struct snd_pcm_substream *substream,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
snd_pcm_hw_params *params)
> +{
> + =A0 =A0 =A0 struct snd_pcm_runtime *runtime =3D substream->runtime;
> + =A0 =A0 =A0 struct idma_ctrl *prtd =3D substream->runtime->private_=
data;
> +
> + =A0 =A0 =A0 pr_debug("Entered %s\n", __func__);
> +
> + =A0 =A0 =A0 snd_pcm_set_runtime_buffer(substream, &substream->dma_b=
uffer);
> + =A0 =A0 =A0 runtime->dma_bytes =3D params_buffer_bytes(params);
> + =A0 =A0 =A0 memset(runtime->dma_area, 0, runtime->dma_bytes);
> +
> + =A0 =A0 =A0 prtd->start =3D prtd->pos =3D runtime->dma_addr;
> + =A0 =A0 =A0 prtd->period =3D params_periods(params);
> + =A0 =A0 =A0 prtd->periodsz =3D params_period_bytes(params);
> + =A0 =A0 =A0 prtd->end =3D LP_TXBUFF_ADDR + runtime->dma_bytes;
> +
> + =A0 =A0 =A0 idma_setcallbk(substream, idma_done);
> +
> + =A0 =A0 =A0 pr_debug("DmaAddr=3D@%x Total=3D%dbytes PrdSz=3D%d #Prd=
s=3D%d dma_area=3D0x%x\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 prtd->start, runtime->d=
ma_bytes, prtd->periodsz,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 prtd->period, (unsigned=
 int)runtime->dma_area);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static int idma_hw_free(struct snd_pcm_substream *substream)
> +{
> + =A0 =A0 =A0 pr_debug("Entered %s\n", __func__);
> +
> + =A0 =A0 =A0 snd_pcm_set_runtime_buffer(substream, NULL);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static int idma_prepare(struct snd_pcm_substream *substream)
> +{
> + =A0 =A0 =A0 struct idma_ctrl *prtd =3D substream->runtime->private_=
data;
> +
> + =A0 =A0 =A0 pr_debug("Entered %s\n", __func__);
> +
> + =A0 =A0 =A0 prtd->pos =3D prtd->start;
> +
> + =A0 =A0 =A0 /* flush the DMA channel */
> + =A0 =A0 =A0 idma_ctrl(LPAM_DMA_STOP);
> + =A0 =A0 =A0 idma_enqueue(substream);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static int idma_trigger(struct snd_pcm_substream *substream, int cmd=
)
> +{
> + =A0 =A0 =A0 struct idma_ctrl *prtd =3D substream->runtime->private_=
data;
> + =A0 =A0 =A0 int ret =3D 0;
> +
> + =A0 =A0 =A0 pr_debug("Entered %s\n", __func__);
> +
> + =A0 =A0 =A0 spin_lock(&prtd->lock);
> +
> + =A0 =A0 =A0 switch (cmd) {
> + =A0 =A0 =A0 case SNDRV_PCM_TRIGGER_RESUME:
> + =A0 =A0 =A0 case SNDRV_PCM_TRIGGER_START:
> + =A0 =A0 =A0 case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 prtd->state |=3D ST_RUNNING;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 idma.trigger_stat =3D LPAM_DMA_START;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 idma_ctrl(LPAM_DMA_START);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case SNDRV_PCM_TRIGGER_SUSPEND:
> + =A0 =A0 =A0 case SNDRV_PCM_TRIGGER_STOP:
> + =A0 =A0 =A0 case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 prtd->state &=3D ~ST_RUNNING;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 idma.trigger_stat =3D LPAM_DMA_STOP;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 idma_ctrl(LPAM_DMA_STOP);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 spin_unlock(&prtd->lock);
> +
> + =A0 =A0 =A0 return ret;
> +}
> +
> +static snd_pcm_uframes_t
> + =A0 =A0 =A0 idma_pointer(struct snd_pcm_substream *substream)
> +{
> + =A0 =A0 =A0 struct snd_pcm_runtime *runtime =3D substream->runtime;
> + =A0 =A0 =A0 struct idma_ctrl *prtd =3D runtime->private_data;
> + =A0 =A0 =A0 dma_addr_t src;
> + =A0 =A0 =A0 unsigned long res;
> +
> + =A0 =A0 =A0 pr_debug("Entered %s\n", __func__);
> +
> + =A0 =A0 =A0 spin_lock(&prtd->lock);
> +
> + =A0 =A0 =A0 idma_getpos(&src);
> + =A0 =A0 =A0 res =3D src - prtd->start;
> +
> + =A0 =A0 =A0 spin_unlock(&prtd->lock);
> +
> + =A0 =A0 =A0 pr_debug("Pointer %x \n", src);
> +
> + =A0 =A0 =A0 if (res >=3D snd_pcm_lib_buffer_bytes(substream)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (res =3D=3D snd_pcm_lib_buffer_bytes=
(substream))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 res =3D 0;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return bytes_to_frames(substream->runtime, res);
> +}
> +
> +static int idma_mmap(struct snd_pcm_substream *substream,
> + =A0 =A0 =A0 struct vm_area_struct *vma)
> +{
> + =A0 =A0 =A0 struct snd_pcm_runtime *runtime =3D substream->runtime;
> + =A0 =A0 =A0 unsigned long size, offset;
> + =A0 =A0 =A0 int ret;
> +
> + =A0 =A0 =A0 pr_debug("Entered %s\n", __func__);
> +
> + =A0 =A0 =A0 /* From snd_pcm_lib_mmap_iomem */
> + =A0 =A0 =A0 vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_pro=
t);
> + =A0 =A0 =A0 vma->vm_flags |=3D VM_IO;
> + =A0 =A0 =A0 size =3D vma->vm_end - vma->vm_start;
> + =A0 =A0 =A0 offset =3D vma->vm_pgoff << PAGE_SHIFT;
> + =A0 =A0 =A0 ret =3D io_remap_pfn_range(vma, vma->vm_start,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (runtime->dma_addr + of=
fset) >> PAGE_SHIFT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 size, vma->vm_page_prot=
);
> +
> + =A0 =A0 =A0 return ret;
> +}
> +
> +static irqreturn_t iis_irq(int irqno, void *dev_id)
> +{
> + =A0 =A0 =A0 struct idma_ctrl *prtd =3D (struct idma_ctrl *)dev_id;
> + =A0 =A0 =A0 u32 iiscon, iisahb, val, addr;
> +
> + =A0 =A0 =A0 iisahb =A0=3D readl(idma.regs + I2SAHB);
> + =A0 =A0 =A0 iiscon =A0=3D readl(idma.regs + I2SCON);
> +
> + =A0 =A0 =A0 if (iisahb & AHB_LVL0INT)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D AHB_CLRLVL0INT;
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 val =3D 0;
> +
> + =A0 =A0 =A0 if (val) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 iisahb |=3D val;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(iisahb, idma.regs + I2SAHB);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 addr =3D readl(idma.regs + I2SLVL0ADDR)=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 addr +=3D prtd->periodsz;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (addr >=3D prtd->end)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 addr =3D LP_TXBUFF_ADDR=
;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(addr, idma.regs + I2SLVL0ADDR);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Finished dma transfer ? */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (iisahb & AHB_LVLINTMASK) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (prtd->cb)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 prtd->c=
b(prtd->token, prtd->periodsz);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return IRQ_HANDLED;
> +}
> +
> +static int idma_open(struct snd_pcm_substream *substream)
> +{
> + =A0 =A0 =A0 struct snd_pcm_runtime *runtime =3D substream->runtime;
> + =A0 =A0 =A0 struct idma_ctrl *prtd;
> + =A0 =A0 =A0 int ret;
> +
> + =A0 =A0 =A0 pr_debug("Entered %s\n", __func__);
> +
> + =A0 =A0 =A0 snd_soc_set_runtime_hwparams(substream, &idma_hardware)=
;
> +
> + =A0 =A0 =A0 prtd =3D kzalloc(sizeof(struct idma_ctrl), GFP_KERNEL);
> + =A0 =A0 =A0 if (prtd =3D=3D NULL)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> +
> + =A0 =A0 =A0 ret =3D request_irq(IRQ_I2S0, iis_irq, 0, "i2s", prtd);
> + =A0 =A0 =A0 if (ret < 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("fail to claim i2s irq , ret =3D=
 %d\n", ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(prtd);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 spin_lock_init(&prtd->lock);
> +
> + =A0 =A0 =A0 runtime->private_data =3D prtd;
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static int idma_close(struct snd_pcm_substream *substream)
> +{
> + =A0 =A0 =A0 struct snd_pcm_runtime *runtime =3D substream->runtime;
> + =A0 =A0 =A0 struct idma_ctrl *prtd =3D runtime->private_data;
> +
> + =A0 =A0 =A0 pr_debug("Entered %s, prtd =3D %p\n", __func__, prtd);
> +
> + =A0 =A0 =A0 free_irq(IRQ_I2S0, prtd);
> +
> + =A0 =A0 =A0 if (!prtd)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("idma_close called with prtd =3D=
=3D NULL\n");
> +
> + =A0 =A0 =A0 kfree(prtd);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static struct snd_pcm_ops idma_ops =3D {
> + =A0 =A0 =A0 .open =A0 =A0 =A0 =A0 =A0 =3D idma_open,
> + =A0 =A0 =A0 .close =A0 =A0 =A0 =A0 =A0=3D idma_close,
> + =A0 =A0 =A0 .ioctl =A0 =A0 =A0 =A0 =A0=3D snd_pcm_lib_ioctl,
> + =A0 =A0 =A0 .trigger =A0 =A0 =A0 =A0=3D idma_trigger,
> + =A0 =A0 =A0 .pointer =A0 =A0 =A0 =A0=3D idma_pointer,
> + =A0 =A0 =A0 .mmap =A0 =A0 =A0 =A0 =A0 =3D idma_mmap,
> + =A0 =A0 =A0 .hw_params =A0 =A0 =A0=3D idma_hw_params,
> + =A0 =A0 =A0 .hw_free =A0 =A0 =A0 =A0=3D idma_hw_free,
> + =A0 =A0 =A0 .prepare =A0 =A0 =A0 =A0=3D idma_prepare,
> +};
> +
> +static void idma_free(struct snd_pcm *pcm)
> +{
> + =A0 =A0 =A0 struct snd_pcm_substream *substream;
> + =A0 =A0 =A0 struct snd_dma_buffer *buf;
> +
> + =A0 =A0 =A0 pr_debug("Entered %s\n", __func__);
> +
> + =A0 =A0 =A0 substream =3D pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].s=
ubstream;
> + =A0 =A0 =A0 if (!substream)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> +
> + =A0 =A0 =A0 buf =3D &substream->dma_buffer;
> + =A0 =A0 =A0 if (!buf->area)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> +
> + =A0 =A0 =A0 iounmap(buf->area);
> +
> + =A0 =A0 =A0 buf->area =3D NULL;
> + =A0 =A0 =A0 buf->addr =3D 0;
> +}
> +
> +static int preallocate_idma_buffer(struct snd_pcm *pcm, int stream)
> +{
> + =A0 =A0 =A0 struct snd_pcm_substream *substream =3D pcm->streams[st=
ream].substream;
> + =A0 =A0 =A0 struct snd_dma_buffer *buf =3D &substream->dma_buffer;
> +
> + =A0 =A0 =A0 pr_debug("Entered %s\n", __func__);
> + =A0 =A0 =A0 buf->dev.dev =3D pcm->card->dev;
> + =A0 =A0 =A0 buf->private_data =3D NULL;
> +
> + =A0 =A0 =A0 /* Assign PCM buffer pointers */
> + =A0 =A0 =A0 buf->dev.type =3D SNDRV_DMA_TYPE_CONTINUOUS;
> + =A0 =A0 =A0 buf->addr =3D LP_TXBUFF_ADDR;
> + =A0 =A0 =A0 buf->bytes =3D idma_hardware.buffer_bytes_max;
> + =A0 =A0 =A0 buf->area =3D (unsigned char *)ioremap(buf->addr, buf->=
bytes);
> + =A0 =A0 =A0 pr_debug("%s: =A0VA-%p =A0PA-%X =A0%ubytes\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func__, buf->area, bu=
f->addr, buf->bytes);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static u64 idma_mask =3D DMA_BIT_MASK(32);
> +
> +static int idma_new(struct snd_card *card,
> + =A0 =A0 =A0 struct snd_soc_dai *dai, struct snd_pcm *pcm)
> +{
> + =A0 =A0 =A0 int ret =3D 0;
> +
> + =A0 =A0 =A0 pr_debug("Entered %s\n", __func__);
> + =A0 =A0 =A0 if (!card->dev->dma_mask)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 card->dev->dma_mask =3D &idma_mask;
> + =A0 =A0 =A0 if (!card->dev->coherent_dma_mask)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 card->dev->coherent_dma_mask =3D DMA_BI=
T_MASK(32);
> +
> + =A0 =A0 =A0 if (dai->driver->playback.channels_min)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D preallocate_idma_buffer(pcm,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SNDRV_P=
CM_STREAM_PLAYBACK);
> +
> + =A0 =A0 =A0 return ret;
> +}
> +
> +void idma_init(void *regs)
> +{
> + =A0 =A0 =A0 spin_lock_init(&idma.lock);
> + =A0 =A0 =A0 idma.regs =3D regs;
> +}
> +
> +struct snd_soc_platform_driver asoc_idma_platform =3D {
> + =A0 =A0 =A0 .ops =3D &idma_ops,
> + =A0 =A0 =A0 .pcm_new =3D idma_new,
> + =A0 =A0 =A0 .pcm_free =3D idma_free,
> +};
> +
> +static int __devinit asoc_idma_platform_probe(struct platform_device=
 *pdev)
> +{
> + =A0 =A0 =A0 return snd_soc_register_platform(&pdev->dev, &asoc_idma=
_platform);
> +}
> +
> +static int __devexit asoc_idma_platform_remove(struct platform_devic=
e *pdev)
> +{
> + =A0 =A0 =A0 snd_soc_unregister_platform(&pdev->dev);
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static struct platform_driver asoc_idma_driver =3D {
> + =A0 =A0 =A0 .driver =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =3D "samsung-idma",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .owner =3D THIS_MODULE,
> + =A0 =A0 =A0 },
> +
> + =A0 =A0 =A0 .probe =3D asoc_idma_platform_probe,
> + =A0 =A0 =A0 .remove =3D __devexit_p(asoc_idma_platform_remove),
> +};
> +
> +static int __init asoc_idma_init(void)
> +{
> + =A0 =A0 =A0 return platform_driver_register(&asoc_idma_driver);
> +}
> +module_init(asoc_idma_init);
> +
> +static void __exit asoc_idma_exit(void)
> +{
> + =A0 =A0 =A0 platform_driver_unregister(&asoc_idma_driver);
> +}
> +module_exit(asoc_idma_exit);
> +
> +MODULE_AUTHOR("Sangbeom Kim, <sbkim73@samsung.com>");
> +MODULE_DESCRIPTION("Samsung ASoC IDMA Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:samsung-idma");
> diff --git a/sound/soc/samsung/idma.h b/sound/soc/samsung/idma.h
> new file mode 100644
> index 0000000..2b0ac37
> --- /dev/null
> +++ b/sound/soc/samsung/idma.h
> @@ -0,0 +1,28 @@
> +/*
> + * idma.h =A0-- =A0I2S0's Internal Dma driver
> + *
> + * Copyright (c) 2010 Samsung Electronics Co. Ltd
> + *
> + * =A0This program is free software; you can redistribute =A0it and/=
or modify it
> + * =A0under =A0the terms of =A0the GNU General =A0Public License as =
published by the
> + * =A0Free Software Foundation; =A0either version 2 of the =A0Licens=
e, or (at your
> + * =A0option) any later version.
> + *
> + */
> +
> +#ifndef __S3C_IDMA_H_
> +#define __S3C_IDMA_H_
> +
> +#ifdef CONFIG_ARCH_EXYNOS4
> +#define LP_TXBUFF_ADDR =A0 =A0(0x02020000)
> +#else
> +#define LP_TXBUFF_ADDR =A0 =A0(0xC0000000)
> +#endif

Are there more fancy way to define the internal DMA address?
Are you sure new EXYNOS4 series will use the same address?

Thank you,
Kyungmin Park
> +
> +/* idma_state */
> +#define LPAM_DMA_STOP =A0 =A00
> +#define LPAM_DMA_START =A0 1
> +
> +extern void idma_init(void *regs);
> +
> +#endif /* __S3C_IDMA_H_ */
> --
> 1.7.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

From: Sangbeom Kim <sbkim73@samsung.com>
Subject: RE: [alsa-devel] [PATCH 2/4] ASoC: SAMSUNG: Add I2S0 internal dma
	driver
Date: Mon, 13 Jun 2011 16:55:51 +0900
Message-ID: <005001cc299f$5105b850$f31128f0$@com>
References: <1307606950-8310-1-git-send-email-sbkim73@samsung.com>
 <1307606950-8310-3-git-send-email-sbkim73@samsung.com>
 <BANLkTikND3dyqmi9xj93ZDPh2-NaXo_jTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:15053 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753416Ab1FMHzu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Jun 2011 03:55:50 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LMP006BZY0Z1BH0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Jun 2011 16:55:48 +0900 (KST)
Received: from DOSBKIM7301 ([12.23.119.77])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LMP00E3VY0ZUR@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Jun 2011 16:55:47 +0900 (KST)
In-reply-to: <BANLkTikND3dyqmi9xj93ZDPh2-NaXo_jTA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jassi Brar' <jassisinghbrar@gmail.com>
Cc: alsa-devel@alsa-project.org, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, lrg@slimlogic.co.uk

On Thu, Jun 10, 2011 at 7:08 PM, Jassi Brar wrote:
> For my convenience, could you please tell how does it differ from my
> original implementation?  Most things look same, except for a few
> variables.
Original code only can support specific buffer size and period count.
New idma driver can work with various buffer size and multiple period.
And Original code is implemented it based on wrapper arch.
But This patch can support driver arch.

> 
> > @@ -16,6 +17,7 @@ obj-$(CONFIG_SND_S3C_I2SV2_SOC) += snd-soc-s3c-i2s-
> v2.o
> >  obj-$(CONFIG_SND_SAMSUNG_SPDIF) += snd-soc-samsung-spdif.o
> >  obj-$(CONFIG_SND_SAMSUNG_PCM) += snd-soc-pcm.o
> >  obj-$(CONFIG_SND_SAMSUNG_I2S) += snd-soc-i2s.o
> > +obj-$(CONFIG_SND_SAMSUNG_I2S) += snd-soc-idma.o
> 
> Please check that building only for s3c64xx doesn't break by this.
If It have building problem, I will modify it in the next version

> 
> > +
> > +static struct idma_info {
> > +       spinlock_t      lock;
> > +       void             __iomem  *regs;
> > +       int             trigger_stat;
> The role of trigger_stat is not necessary.
trigger_stat can be used LP audio mode.
It can be used flag for checking idma operation.


> > +
> > +       /* Start address0 of I2S internal DMA operation. */
> > +       val = readl(idma.regs + I2SSTR0);
> Why read when you immediately overwrite it ?
This is useless code, It will be deleted.
 
> > +static int idma_hw_params(struct snd_pcm_substream *substream,
> > +                               struct snd_pcm_hw_params *params)
> > +{
> > +       struct snd_pcm_runtime *runtime = substream->runtime;
> > +       struct idma_ctrl *prtd = substream->runtime->private_data;
> > +
> > +       pr_debug("Entered %s\n", __func__);
> can we have all the pr_debug's converted to dev_debug ?
OK, I will change it.
 
> 
> > +       snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
> > +       runtime->dma_bytes = params_buffer_bytes(params);
> > +       memset(runtime->dma_area, 0, runtime->dma_bytes);
> Is it really needed ?
It can delete useless data in dma buffer.
But It looks not need absolutely.

> > +
> > +       if (iisahb & AHB_LVL0INT)
> > +               val = AHB_CLRLVL0INT;
> > +       else
> > +               val = 0;
>   val = (iisahb & AHB_LVL0INT) ? AHB_CLRLVL0INT : 0;     looks better
OK, I will change
> > +
> > +       if (val) {
> > +               iisahb |= val;
> > +               writel(iisahb, idma.regs + I2SAHB);
> > +
> > +               addr = readl(idma.regs + I2SLVL0ADDR);
> > +               addr += prtd->periodsz;
> > +
> > +               if (addr >= prtd->end)
> > +                       addr = LP_TXBUFF_ADDR;
> This will break if ring buffer is not a multiple of period size.
> Either set the constraint in open or do modulo operation here.
OK,

> > +
> > +static int idma_close(struct snd_pcm_substream *substream)
> > +{
> > +       struct snd_pcm_runtime *runtime = substream->runtime;
> > +       struct idma_ctrl *prtd = runtime->private_data;
> > +
> > +       pr_debug("Entered %s, prtd = %p\n", __func__, prtd);
> > +
> > +       free_irq(IRQ_I2S0, prtd);
> > +
> > +       if (!prtd)
> > +               pr_err("idma_close called with prtd == NULL\n");
> > +
> > +       kfree(prtd);
> 
> Also       runtime->private_data = NULL;
OK,

> > diff --git a/sound/soc/samsung/idma.h b/sound/soc/samsung/idma.h
> > new file mode 100644
> > index 0000000..2b0ac37
> > --- /dev/null
> > +++ b/sound/soc/samsung/idma.h
> > @@ -0,0 +1,28 @@
> > +/*
> > + * idma.h  --  I2S0's Internal Dma driver
> > + *
> > + * Copyright (c) 2010 Samsung Electronics Co. Ltd
> Copyright 2011 ?
OK, I will modify it.
> 
> > +/* idma_state */
> > +#define LPAM_DMA_STOP    0
> > +#define LPAM_DMA_START   1
> These are internal to idma.c, please move them there.
OK, I will move it.

Thanks,

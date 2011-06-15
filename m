From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH V2 2/4] ASoC: SAMSUNG: Add I2S0 internal dma driver
Date: Wed, 15 Jun 2011 17:43:25 +0900
Message-ID: <1308127407-22458-3-git-send-email-sbkim73@samsung.com>
References: <1308127407-22458-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:34618 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752905Ab1FOItx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jun 2011 04:49:53 -0400
In-Reply-To: <1308127407-22458-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, Sangbeom Kim <sbkim73@samsung.com>

I2S in Exynos4 and S5PC110(S5PV210) has a internal dma.
It can be used low power audio mode and 2nd channel transfer.

Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 sound/soc/samsung/Makefile |    2 +
 sound/soc/samsung/idma.c   |  495 ++++++++++++++++++++++++++++++++++++++++++++
 sound/soc/samsung/idma.h   |   27 +++
 3 files changed, 524 insertions(+), 0 deletions(-)
 create mode 100644 sound/soc/samsung/idma.c
 create mode 100644 sound/soc/samsung/idma.h

diff --git a/sound/soc/samsung/Makefile b/sound/soc/samsung/Makefile
index 683843a..2b9e251 100644
--- a/sound/soc/samsung/Makefile
+++ b/sound/soc/samsung/Makefile
@@ -1,5 +1,6 @@
 # S3c24XX Platform Support
 snd-soc-s3c24xx-objs := dma.o
+snd-soc-idma-objs := idma.o
 snd-soc-s3c24xx-i2s-objs := s3c24xx-i2s.o
 snd-soc-s3c2412-i2s-objs := s3c2412-i2s.o
 snd-soc-ac97-objs := ac97.o
@@ -16,6 +17,7 @@ obj-$(CONFIG_SND_S3C_I2SV2_SOC) += snd-soc-s3c-i2s-v2.o
 obj-$(CONFIG_SND_SAMSUNG_SPDIF) += snd-soc-samsung-spdif.o
 obj-$(CONFIG_SND_SAMSUNG_PCM) += snd-soc-pcm.o
 obj-$(CONFIG_SND_SAMSUNG_I2S) += snd-soc-i2s.o
+obj-$(CONFIG_SND_SAMSUNG_I2S) += snd-soc-idma.o
 
 # S3C24XX Machine Support
 snd-soc-jive-wm8750-objs := jive_wm8750.o
diff --git a/sound/soc/samsung/idma.c b/sound/soc/samsung/idma.c
new file mode 100644
index 0000000..2deeb38
--- /dev/null
+++ b/sound/soc/samsung/idma.c
@@ -0,0 +1,495 @@
+/*
+ * linux/sound/soc/samsung/idma.c
+ *
+ * Copyright (c) 2011 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * I2S0's Internal DMA driver
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
+#include <linux/slab.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+#include "i2s.h"
+#include "idma.h"
+#include "dma.h"
+#include "i2s-regs.h"
+
+#define ST_RUNNING		(1<<0)
+#define ST_OPENED		(1<<1)
+
+static struct device *dev;
+static const struct snd_pcm_hardware idma_hardware = {
+	.info = SNDRV_PCM_INFO_INTERLEAVED |
+		    SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		    SNDRV_PCM_INFO_MMAP |
+		    SNDRV_PCM_INFO_MMAP_VALID |
+		    SNDRV_PCM_INFO_PAUSE |
+		    SNDRV_PCM_INFO_RESUME,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE |
+		    SNDRV_PCM_FMTBIT_U16_LE |
+		    SNDRV_PCM_FMTBIT_S24_LE |
+		    SNDRV_PCM_FMTBIT_U24_LE |
+		    SNDRV_PCM_FMTBIT_U8 |
+		    SNDRV_PCM_FMTBIT_S8,
+	.channels_min = 2,
+	.channels_max = 2,
+	.buffer_bytes_max = MAX_IDMA_BUFFER,
+	.period_bytes_min = 128,
+	.period_bytes_max = MAX_IDMA_PERIOD,
+	.periods_min = 1,
+	.periods_max = 2,
+};
+
+struct idma_ctrl {
+	spinlock_t	lock;
+	int		state;
+	dma_addr_t	start;
+	dma_addr_t	pos;
+	dma_addr_t	end;
+	dma_addr_t	period;
+	dma_addr_t	periodsz;
+	void		*token;
+	void		(*cb)(void *dt, int bytes_xfer);
+};
+
+static struct idma_info {
+	spinlock_t	lock;
+	void		 __iomem  *regs;
+	dma_addr_t	lp_tx_addr;
+} idma;
+
+static void idma_getpos(dma_addr_t *src)
+{
+	*src = idma.lp_tx_addr +
+		(readl(idma.regs + I2STRNCNT) & 0xffffff) * 4;
+}
+
+void i2sdma_getpos(dma_addr_t *src, struct snd_pcm_substream *substream)
+{
+	struct idma_ctrl *prtd = substream->runtime->private_data;
+
+	if (prtd && (prtd->state & ST_RUNNING))
+		*src = idma.lp_tx_addr +
+			(readl(idma.regs + I2STRNCNT) & 0xffffff) * 4;
+	else
+		*src = idma.lp_tx_addr;
+}
+
+static int idma_enqueue(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct idma_ctrl *prtd = substream->runtime->private_data;
+	u32 val;
+
+	spin_lock(&prtd->lock);
+	prtd->token = (void *) substream;
+	spin_unlock(&prtd->lock);
+
+	/* Internal DMA Level0 Interrupt Address */
+	val = idma.lp_tx_addr + prtd->periodsz;
+	writel(val, idma.regs + I2SLVL0ADDR);
+
+	/* Start address0 of I2S internal DMA operation. */
+	val = idma.lp_tx_addr;
+	writel(val, idma.regs + I2SSTR0);
+
+	/*
+	 * Transfer block size for I2S internal DMA.
+	 * Should decide transfer size before start dma operation
+	 */
+	val = readl(idma.regs + I2SSIZE);
+	val &= ~(I2SSIZE_TRNMSK << I2SSIZE_SHIFT);
+
+	val |= (((runtime->dma_bytes >> 2) &
+			I2SSIZE_TRNMSK) << I2SSIZE_SHIFT);
+	writel(val, idma.regs + I2SSIZE);
+
+	return 0;
+}
+
+static void idma_setcallbk(struct snd_pcm_substream *substream,
+				void (*cb)(void *, int))
+{
+	struct idma_ctrl *prtd = substream->runtime->private_data;
+
+	spin_lock(&prtd->lock);
+	prtd->cb = cb;
+	spin_unlock(&prtd->lock);
+
+	dev_dbg(dev, "%s:%d dma_period=%x\n", __func__, __LINE__, prtd->periodsz);
+}
+
+static void idma_control(int op)
+{
+	u32 val = readl(idma.regs + I2SAHB);
+
+	spin_lock(&idma.lock);
+
+	switch (op) {
+	case LPAM_DMA_START:
+		val |= (AHB_INTENLVL0 | AHB_DMAEN);
+		break;
+	case LPAM_DMA_STOP:
+		val &= ~(AHB_INTENLVL0 | AHB_DMAEN);
+		break;
+	default:
+		return;
+	}
+
+	writel(val, idma.regs + I2SAHB);
+	spin_unlock(&idma.lock);
+}
+
+static void idma_done(void *id, int bytes_xfer)
+{
+	struct snd_pcm_substream *substream = id;
+	struct idma_ctrl *prtd = substream->runtime->private_data;
+
+	if (prtd && (prtd->state & ST_RUNNING))
+		snd_pcm_period_elapsed(substream);
+}
+
+static int idma_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct idma_ctrl *prtd = substream->runtime->private_data;
+
+	dev_dbg(dev, "Entered %s\n", __func__);
+
+	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
+	runtime->dma_bytes = params_buffer_bytes(params);
+
+	prtd->start = prtd->pos = runtime->dma_addr;
+	prtd->period = params_periods(params);
+	prtd->periodsz = params_period_bytes(params);
+	prtd->end = idma.lp_tx_addr + runtime->dma_bytes;
+
+	idma_setcallbk(substream, idma_done);
+
+	dev_dbg(dev, "DmaAddr=@%x Total=%dbytes PrdSz=%d #Prds=%d dma_area=0x%x\n",
+			prtd->start, runtime->dma_bytes, prtd->periodsz,
+			prtd->period, (unsigned int)runtime->dma_area);
+
+	return 0;
+}
+
+static int idma_hw_free(struct snd_pcm_substream *substream)
+{
+	dev_dbg(dev, "Entered %s\n", __func__);
+
+	snd_pcm_set_runtime_buffer(substream, NULL);
+
+	return 0;
+}
+
+static int idma_prepare(struct snd_pcm_substream *substream)
+{
+	struct idma_ctrl *prtd = substream->runtime->private_data;
+
+	dev_dbg(dev, "Entered %s\n", __func__);
+
+	prtd->pos = prtd->start;
+
+	/* flush the DMA channel */
+	idma_control(LPAM_DMA_STOP);
+	idma_enqueue(substream);
+
+	return 0;
+}
+
+static int idma_trigger(struct snd_pcm_substream *substream, int cmd)
+{
+	struct idma_ctrl *prtd = substream->runtime->private_data;
+	int ret = 0;
+
+	dev_dbg(dev, "Entered %s\n", __func__);
+
+	spin_lock(&prtd->lock);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		prtd->state |= ST_RUNNING;
+		idma_control(LPAM_DMA_START);
+		break;
+
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		prtd->state &= ~ST_RUNNING;
+		idma_control(LPAM_DMA_STOP);
+		break;
+
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	spin_unlock(&prtd->lock);
+
+	return ret;
+}
+
+static snd_pcm_uframes_t
+	idma_pointer(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct idma_ctrl *prtd = runtime->private_data;
+	dma_addr_t src;
+	unsigned long res;
+
+	dev_dbg(dev, "Entered %s\n", __func__);
+
+	spin_lock(&prtd->lock);
+
+	idma_getpos(&src);
+	res = src - prtd->start;
+
+	spin_unlock(&prtd->lock);
+
+	dev_dbg(dev, "Pointer %x \n", src);
+
+	if (res >= snd_pcm_lib_buffer_bytes(substream)) {
+		if (res == snd_pcm_lib_buffer_bytes(substream))
+			res = 0;
+	}
+
+	return bytes_to_frames(substream->runtime, res);
+}
+
+static int idma_mmap(struct snd_pcm_substream *substream,
+	struct vm_area_struct *vma)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	unsigned long size, offset;
+	int ret;
+
+	dev_dbg(dev, "Entered %s\n", __func__);
+
+	/* From snd_pcm_lib_mmap_iomem */
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+	vma->vm_flags |= VM_IO;
+	size = vma->vm_end - vma->vm_start;
+	offset = vma->vm_pgoff << PAGE_SHIFT;
+	ret = io_remap_pfn_range(vma, vma->vm_start,
+			(runtime->dma_addr + offset) >> PAGE_SHIFT,
+			size, vma->vm_page_prot);
+
+	return ret;
+}
+
+static irqreturn_t iis_irq(int irqno, void *dev_id)
+{
+	struct idma_ctrl *prtd = (struct idma_ctrl *)dev_id;
+	u32 iiscon, iisahb, val, addr;
+
+	iisahb  = readl(idma.regs + I2SAHB);
+	iiscon  = readl(idma.regs + I2SCON);
+
+	val = (iisahb & AHB_LVL0INT) ? AHB_CLRLVL0INT : 0;
+
+	if (val) {
+		iisahb |= val;
+		writel(iisahb, idma.regs + I2SAHB);
+
+		addr = readl(idma.regs + I2SLVL0ADDR) - idma.lp_tx_addr;
+		addr += prtd->period;
+		addr %= MAX_IDMA_BUFFER;
+		addr += idma.lp_tx_addr;
+
+		writel(addr, idma.regs + I2SLVL0ADDR);
+
+		if (prtd->cb) {
+			if (iisahb & AHB_LVL0INT)
+				prtd->cb(prtd->token, prtd->period);
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int idma_open(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct idma_ctrl *prtd;
+	int ret;
+
+	dev_dbg(dev, "Entered %s\n", __func__);
+
+	snd_soc_set_runtime_hwparams(substream, &idma_hardware);
+
+	prtd = kzalloc(sizeof(struct idma_ctrl), GFP_KERNEL);
+	if (prtd == NULL)
+		return -ENOMEM;
+
+	ret = request_irq(IRQ_I2S0, iis_irq, 0, "i2s", prtd);
+	if (ret < 0) {
+		pr_err("fail to claim i2s irq , ret = %d\n", ret);
+		kfree(prtd);
+		return ret;
+	}
+
+	spin_lock_init(&prtd->lock);
+
+	runtime->private_data = prtd;
+
+	return 0;
+}
+
+static int idma_close(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct idma_ctrl *prtd = runtime->private_data;
+
+	dev_dbg(dev, "Entered %s, prtd = %p\n", __func__, prtd);
+
+	free_irq(IRQ_I2S0, prtd);
+
+	if (!prtd)
+		pr_err("idma_close called with prtd == NULL\n");
+
+	kfree(prtd);
+
+	return 0;
+}
+
+static struct snd_pcm_ops idma_ops = {
+	.open		= idma_open,
+	.close		= idma_close,
+	.ioctl		= snd_pcm_lib_ioctl,
+	.trigger	= idma_trigger,
+	.pointer	= idma_pointer,
+	.mmap		= idma_mmap,
+	.hw_params	= idma_hw_params,
+	.hw_free	= idma_hw_free,
+	.prepare	= idma_prepare,
+};
+
+static void idma_free(struct snd_pcm *pcm)
+{
+	struct snd_pcm_substream *substream;
+	struct snd_dma_buffer *buf;
+
+	dev_dbg(dev, "Entered %s\n", __func__);
+
+	substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
+	if (!substream)
+		return;
+
+	buf = &substream->dma_buffer;
+	if (!buf->area)
+		return;
+
+	iounmap(buf->area);
+
+	buf->area = NULL;
+	buf->addr = 0;
+}
+
+static int preallocate_idma_buffer(struct snd_pcm *pcm, int stream)
+{
+	struct snd_pcm_substream *substream = pcm->streams[stream].substream;
+	struct snd_dma_buffer *buf = &substream->dma_buffer;
+
+	dev_dbg(dev, "Entered %s\n", __func__);
+	buf->dev.dev = pcm->card->dev;
+	buf->private_data = NULL;
+
+	/* Assign PCM buffer pointers */
+	buf->dev.type = SNDRV_DMA_TYPE_CONTINUOUS;
+	buf->addr = idma.lp_tx_addr;
+	buf->bytes = idma_hardware.buffer_bytes_max;
+	buf->area = (unsigned char *)ioremap(buf->addr, buf->bytes);
+	dev_dbg(dev, "%s:  VA-%p  PA-%X  %ubytes\n",
+			__func__, buf->area, buf->addr, buf->bytes);
+
+	return 0;
+}
+
+static u64 idma_mask = DMA_BIT_MASK(32);
+
+static int idma_new(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_card *card = rtd->card->snd_card;
+	struct snd_soc_dai *dai = rtd->cpu_dai;
+	struct snd_pcm *pcm = rtd->pcm;
+	int ret = 0;
+
+	dev_dbg(dev, "Entered %s\n", __func__);
+	if (!card->dev->dma_mask)
+		card->dev->dma_mask = &idma_mask;
+	if (!card->dev->coherent_dma_mask)
+		card->dev->coherent_dma_mask = DMA_BIT_MASK(32);
+
+	if (dai->driver->playback.channels_min)
+		ret = preallocate_idma_buffer(pcm,
+				SNDRV_PCM_STREAM_PLAYBACK);
+
+	return ret;
+}
+
+void idma_reg_init(void *regs)
+{
+	spin_lock_init(&idma.lock);
+	idma.regs = regs;
+}
+
+void idma_addr_init(dma_addr_t addr)
+{
+	spin_lock_init(&idma.lock);
+	idma.lp_tx_addr = addr;
+}
+
+struct snd_soc_platform_driver asoc_idma_platform = {
+	.ops = &idma_ops,
+	.pcm_new = idma_new,
+	.pcm_free = idma_free,
+};
+
+static int __devinit asoc_idma_platform_probe(struct platform_device *pdev)
+{
+	return snd_soc_register_platform(&pdev->dev, &asoc_idma_platform);
+}
+
+static int __devexit asoc_idma_platform_remove(struct platform_device *pdev)
+{
+	snd_soc_unregister_platform(&pdev->dev);
+	return 0;
+}
+
+static struct platform_driver asoc_idma_driver = {
+	.driver = {
+		.name = "samsung-idma",
+		.owner = THIS_MODULE,
+	},
+
+	.probe = asoc_idma_platform_probe,
+	.remove = __devexit_p(asoc_idma_platform_remove),
+};
+
+static int __init asoc_idma_init(void)
+{
+	return platform_driver_register(&asoc_idma_driver);
+}
+module_init(asoc_idma_init);
+
+static void __exit asoc_idma_exit(void)
+{
+	platform_driver_unregister(&asoc_idma_driver);
+}
+module_exit(asoc_idma_exit);
+
+MODULE_DESCRIPTION("Samsung ASoC IDMA Driver");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/samsung/idma.h b/sound/soc/samsung/idma.h
new file mode 100644
index 0000000..511ad40
--- /dev/null
+++ b/sound/soc/samsung/idma.h
@@ -0,0 +1,27 @@
+/*
+ * linux/sound/soc/samsung/idma.h
+ *
+ * Copyright (c) 2011 Samsung Electronics Co., Ltd
+ *		http://www.samsung.com
+ *
+ *  This program is free software; you can redistribute  it and/or modify it
+ *  under  the terms of  the GNU General  Public License as published by the
+ *  Free Software Foundation;  either version 2 of the  License, or (at your
+ *  option) any later version.
+ *
+ */
+
+#ifndef __SND_SOC_SAMSUNG_IDMA_H_
+#define __SND_SOC_SAMSUNG_IDMA_H_
+
+extern void idma_reg_init(void *regs);
+extern void idma_addr_init(dma_addr_t addr);
+
+/* dma_state */
+#define LPAM_DMA_STOP	0
+#define LPAM_DMA_START	1
+
+#define MAX_IDMA_PERIOD (105 * 1024)
+#define MAX_IDMA_BUFFER (128 * 1024)
+
+#endif /* __SND_SOC_SAMSUNG_IDMA_H_ */
-- 
1.7.1

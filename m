From: Atul Dahiya <atul.dahiya@samsung.com>
Subject: [PATCH 2/3] ARM: S5P6440: Added PL330 support for samsung S5P6440 soc.
Date: Fri, 19 Mar 2010 16:32:52 +0530
Message-ID: <1268996572-15513-1-git-send-email-atul.dahiya@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:33016 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751068Ab0CSLDy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Mar 2010 07:03:54 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KZJ009180252K@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Mar 2010 20:03:41 +0900 (KST)
Received: from localhost.localdomain ([107.108.83.112])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KZJ00EAA01Y9U@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Mar 2010 20:03:41 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, atul.dahiya@samsung.com

This patch adds the DMA pl330 driver functions to plat-s5.

Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
---
 arch/arm/include/asm/hardware/pl330.h    |  114 ++++
 arch/arm/plat-s5p/Kconfig                |    1 +
 arch/arm/plat-s5p/Makefile               |    1 +
 arch/arm/plat-s5p/dma.c                  | 1081 ++++++++++++++++++++++++++++++
 arch/arm/plat-s5p/include/plat/s5p-dma.h |  224 ++++++
 5 files changed, 1421 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/include/asm/hardware/pl330.h
 create mode 100644 arch/arm/plat-s5p/dma.c
 create mode 100644 arch/arm/plat-s5p/include/plat/s5p-dma.h

diff --git a/arch/arm/include/asm/hardware/pl330.h b/arch/arm/include/asm/hardware/pl330.h
new file mode 100644
index 0000000..ce57196
--- /dev/null
+++ b/arch/arm/include/asm/hardware/pl330.h
@@ -0,0 +1,114 @@
+/* linux/arch/arm/plat-s5p/include/plat/dma.h
+ *
+ * Copyright (c) 2010 Samsung Electronics
+ * 		http://www.samsung.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __ARM_PLAT_DMA_PL330_H
+#define __ARM_PLAT_DMA_PL330_H __FILE__
+
+#define DMACH_LOW_LEVEL		(1<<28)	/*use this to specifiy hardware ch no*/
+#define DMAF_SLOW		(1<<0)	/* slow, so don't worry about */
+#define DMAF_AUTOSTART		(1<<1)	/* auto-start if buffer queued */
+
+/* DMA Register Definitions for PL330 DMAC */
+
+#define DMAC_DS				(0x00)
+#define DMAC_DPC			(0x04)
+#define DMAC_INTEN			(0x20)		/* R/W */
+#define DMAC_ES				(0x24)
+#define DMAC_INTSTATUS			(0x28)
+#define DMAC_INTCLR			(0x2C)		/* W/O */
+#define DMAC_FSM			(0x30)
+#define DMAC_FSC			(0x34)
+#define DMAC_FTM			(0x38)
+
+#define DMAC_FTC0			(0x40)
+#define DMAC_CS0  			(0x100)
+#define DMAC_CPC0			(0x104)
+#define DMAC_SA_0			(0x400)
+#define DMAC_DA_0  			(0x404)
+#define DMAC_CC_0			(0x408)
+#define DMAC_LC0_0			(0x40C)
+#define DMAC_LC1_0			(0x410)
+
+#define DMAC_FTC(ch)			(DMAC_FTC0+ch*0x4)
+#define DMAC_CS(ch)			(DMAC_CS0+ch*0x8)
+#define DMAC_CPC(ch)			(DMAC_CPC0+ch*0x8)
+#define DMAC_SA(ch)			(DMAC_SA_0+ch*0x20)
+#define DMAC_DA(ch)			(DMAC_DA_0+ch*0x20)
+#define DMAC_CC(ch)			(DMAC_CC_0+ch*0x20)
+#define DMAC_LC0(ch)			(DMAC_LC0_0+ch*0x20)
+#define DMAC_LC10(ch)			(DMAC_LC1_0+ch*0x20)
+
+#define DMAC_DBGSTATUS			(0xD00)
+#define DMAC_DBGCMD			(0xD04)		/* W/O */
+#define DMAC_DBGINST0			(0xD08)		/* W/O */
+#define DMAC_DBGINST1			(0xD0C)		/* W/O */
+#define DMAC_CR0			(0xE00)
+#define DMAC_CR1			(0xE04)
+#define DMAC_CR2			(0xE08)
+#define DMAC_CR3			(0xE0C)
+#define DMAC_CR4			(0xE10)
+#define DMAC_CRDn			(0xE14)
+
+#define	DMAC_PERI_ID			(0xFE0)
+#define DMAC_PCELL_ID			(0xFF0)
+
+/* DMAC_CS[3:0] - Channel status */
+#define DMAC_CS_STOPPED			0x0
+#define DMAC_CS_EXECUTING		0x1
+#define DMAC_CS_CACHE_MISS		0x2
+#define DMAC_CS_UPDATING_PC		0x3
+#define DMAC_CS_WAITING_FOR_EVENT	0x4
+#define DMAC_CS_AT_BARRIER		0x5
+#define DMAC_CS_QUEUE_BUSY		0x6
+#define DMAC_CS_WAITING_FOR_PERI	0x7
+#define DMAC_CS_KILLING			0x8
+#define DMAC_CS_COMPLETING		0x9
+#define DMAC_CS_FAULT_COMPLETING	0xE
+#define DMAC_CS_FAULTING		0xF
+
+/* DMAC_INTEN : Interrupt Enable Register */
+#define DMAC_INTEN_EVENT(x)		((x)<<0)
+#define DMAC_INTEN_IRQ(x)		((x)<<1)
+
+/* DMAC_INTCLR : Interrupt Clear Register */
+#define DMAC_INTCLR_IRQ(x)		((x)<<1)
+
+/* DMA Channel control */
+/* Source control */
+#define DMACONTROL_SRC_INC		(1<<0)
+#define DMACONTROL_SRC_FIXED		(0<<0)
+#define DMACONTROL_SRC_WIDTH_BYTE	(0<<1)
+#define DMACONTROL_SRC_WIDTH_HWORD	(1<<1)
+#define DMACONTROL_SRC_WIDTH_WORD	(2<<1)
+#define DMACONTROL_SRC_WIDTH_DWORD	(3<<1)
+#define DMACONTROL_SBSIZE(x)		(((x-1)&0xF)<<4)
+#define DMACONTROL_SP_SECURE		(0<<8)
+#define DMACONTROL_SP_NON_SECURE	(2<<8)
+#define DMACONTROL_SCACHE		(0<<11)
+
+/* Destination control */
+#define DMACONTROL_DEST_INC		(1<<14)
+#define DMACONTROL_DEST_FIXED		(0<<14)
+#define DMACONTROL_DEST_WIDTH_BYTE	(0<<15)
+#define DMACONTROL_DEST_WIDTH_HWORD	(1<<15)
+#define DMACONTROL_DEST_WIDTH_WORD	(2<<15)
+#define DMACONTROL_DEST_WIDTH_DWORD	(3<<15)
+#define DMACONTROL_DBSIZE(x)		(((x-1)&0xF)<<18)
+#define DMACONTROL_DP_SECURE		(0<<22)
+#define DMACONTROL_DP_NON_SECURE	(2<<22)
+#define DMACONTROL_DCACHE		(0<<25)
+
+#define DMACONTROL_ES_SIZE_8		(0<<28)
+#define DMACONTROL_ES_SIZE_16		(1<<28)
+#define DMACONTROL_ES_SIZE_32		(2<<28)
+#define DMACONTROL_ES_SIZE_64		(3<<28)
+
+#endif /* __ARM_MACH_DMA_PL330_H */
+
diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index d400a6a..097f1a4 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -21,5 +21,6 @@ config PLAT_S5P
 	select SAMSUNG_CLKSRC
 	select SAMSUNG_IRQ_VIC_TIMER
 	select SAMSUNG_IRQ_UART
+	select SAMSUNG_PL_330
 	help
 	  Base platform code for Samsung's S5P series SoC.
diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
index a7c54b3..81bdf08 100644
--- a/arch/arm/plat-s5p/Makefile
+++ b/arch/arm/plat-s5p/Makefile
@@ -17,3 +17,4 @@ obj-y				+= cpu.o
 obj-y				+= clock.o
 obj-y				+= irq.o
 obj-y				+= setup-i2c0.o
+obj-y				+= dma.o
diff --git a/arch/arm/plat-s5p/dma.c b/arch/arm/plat-s5p/dma.c
new file mode 100644
index 0000000..ff04e06
--- /dev/null
+++ b/arch/arm/plat-s5p/dma.c
@@ -0,0 +1,1081 @@
+/* linux/arch/arm/plat-s5p/dma.c
+ *
+ * Copyright (c) 2010 Samsung Electronics
+ *		http://www.samsung.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/interrupt.h>
+#include <linux/sysdev.h>
+#include <linux/errno.h>
+#include <asm/system.h>
+#include <asm/irq.h>
+#include <linux/dma-mapping.h>
+#include <asm/dma.h>
+#include <mach/map.h>
+#include "plat/dma.h"
+#include "plat/s5p-dma.h"
+#include "asm/hardware/pl330.h"
+#include "plat/dma-pl330-mcode.h"
+#undef pr_debug
+
+#ifndef dma_dbg
+#define pr_debug(fmt...) 	printk(fmt)
+#else
+#define pr_debug(fmt...)
+#endif
+
+/* io map for dma */
+static void __iomem *dma_base;
+static struct kmem_cache *dma_kmem;
+static int dma_channels;
+struct s5p_dma_selection dma_sel;
+static struct s5p_dma_chan *dma_chan_map[DMACH_MAX];
+
+/* dma channel state information */
+struct s5p_dma_chan s5p_dma_chans[S5P_DMA_CHANNELS];
+struct s5p_dma_controller s5p_dma_cntlrs[S5P_DMA_CONTROLLERS];
+
+#define SIZE_OF_MICRO_CODES		512
+#define PL330_NON_SECURE_DMA		1
+#define PL330_SECURE_DMA		0
+#define BUF_MAGIC 			(0xcafebabe)
+#define dmawarn(fmt...) 		printk(KERN_DEBUG fmt)
+#define dma_regaddr(dcon, reg) 		((dcon)->regs + (reg))
+#define dma_wrreg(dcon, reg, val) 	writel((val), (dcon)->regs + (reg))
+#define dma_rdreg(dcon, reg) 		readl((dcon)->regs + (reg))
+#define dbg_showregs(chan)		do { } while (0)
+#define dbg_showchan(chan)		do { } while (0)
+
+
+/* lookup_dma_channel
+ * change the dma channel number given into a real dma channel id
+ */
+
+static struct s5p_dma_chan *lookup_dma_channel(unsigned int channel)
+{
+	if (channel & DMACH_LOW_LEVEL)
+		return &s5p_dma_chans[channel & ~DMACH_LOW_LEVEL];
+	else
+		return dma_chan_map[channel];
+}
+
+/* s5p_dma_stats_timeout
+ * Update DMA stats from timeout info
+ */
+static void s5p_dma_stats_timeout(struct s5p_dma_stats *stats, int val)
+{
+	if (stats == NULL)
+		return;
+	if (val > stats->timeout_longest)
+		stats->timeout_longest = val;
+	if (val < stats->timeout_shortest)
+		stats->timeout_shortest = val;
+	stats->timeout_avg += val;
+}
+
+void s5p_enable_dmac(unsigned int dcon_num)
+{
+	struct s5p_dma_controller *dma_controller = &s5p_dma_cntlrs[dcon_num];
+	start_dma_controller(dma_regaddr(dma_controller, DMAC_DBGSTATUS));
+}
+
+void s5p_disable_dmac(unsigned int dcon_num)
+{
+	struct s5p_dma_controller *dma_controller = &s5p_dma_cntlrs[dcon_num];
+	stop_dma_controller(dma_regaddr(dma_controller, DMAC_DBGSTATUS));
+}
+
+void s5p_clear_interrupts(int dcon_num, int channel)
+{
+	unsigned long tmp;
+	struct s5p_dma_controller *dma_controller = &s5p_dma_cntlrs[dcon_num];
+	tmp = dma_rdreg(dma_controller, DMAC_INTCLR);
+	tmp |= (1 << channel);
+	dma_wrreg(dma_controller, DMAC_INTCLR, tmp);
+}
+
+/* s5p_dma_waitforload
+ * wait for the DMA engine to load a buffer, and update the state accordingly
+ */
+static int s5p_dma_waitforload(struct s5p_dma_chan *chan, int line)
+{
+	int timeout = chan->load_timeout;
+	int took;
+	if (chan->load_state != S3C2410_DMALOAD_1LOADED) {
+		printk(KERN_ERR	"dma CH %d: s5p_dma_waitforload() called"
+					"in loadstate %d from line %d\n",
+					chan->number, chan->load_state, line);
+		return 0;
+	}
+	if (chan->stats != NULL)
+		chan->stats->loads++;
+	while (--timeout > 0) {
+			took = chan->load_timeout - timeout;
+			s5p_dma_stats_timeout(chan->stats, took);
+			switch (chan->load_state) {
+			case S3C2410_DMALOAD_1LOADED:
+				chan->load_state = S3C2410_DMALOAD_1RUNNING;
+				break;
+			default:
+				printk(KERN_ERR "dma CH %d: unknown load_state"
+						"in s5p_dma_waitforload() %d\n",
+						chan->number, chan->load_state);
+			}
+			return 1;
+	}
+	if (chan->stats != NULL)
+		chan->stats->timeout_failed++;
+	return 0;
+}
+
+static inline void s5p_dma_freebuf(struct s5p_dma_buf *buf);
+
+/* s5p_dma_loadbuffer
+ * load a buffer, and update the channel state
+ */
+static int s5p_dma_loadbuffer(struct s5p_dma_chan *chan,
+				struct s5p_dma_buf *buf)
+{
+	unsigned long tmp;
+	struct DMA_parameters dma_param;
+	struct s5p_dma_buf *firstbuf;
+	struct s5p_dma_buf *last1buf;
+	struct s5p_dma_buf *last2buf;
+	int bwJump = 0;
+	memset(&dma_param, 0, sizeof(struct DMA_parameters));
+	pr_debug("s5p_chan_loadbuffer: loading buffer %p (0x%08lx,0x%06x)\n",
+				buf, (unsigned long) buf->data, buf->size);
+	if (buf == NULL) {
+		dmawarn("buffer is NULL\n");
+		return -EINVAL;
+	}
+	firstbuf = buf;
+	last1buf = buf;
+	last2buf = buf;
+	do {
+		dma_param.mPeriNum = chan->config_flags;
+		dma_param.mDirection = chan->source;
+		switch (dma_param.mDirection) {
+		case S5P_DMASRC_MEM:	/* Mem-to-Peri (Write into FIFO) */
+			dma_param.mSrcAddr = buf->data;
+			dma_param.mDstAddr = chan->dev_addr;
+			break;
+		case S5P_DMASRC_HW:	/* Peri-to-Mem (Read from FIFO) */
+			dma_param.mSrcAddr = chan->dev_addr;
+			dma_param.mDstAddr = buf->data;
+			break;
+		case S5P_DMA_MEM2MEM:		/* Mem-to-Mem  */
+			dma_param.mSrcAddr = chan->dev_addr;
+			dma_param.mDstAddr = buf->data;
+			break;
+		case S5P_DMA_MEM2MEM_SET:	/* Mem-to-Mem*/
+			dma_param.mDirection = S5P_DMA_MEM2MEM;
+			dma_param.mSrcAddr = chan->dev_addr;
+			dma_param.mDstAddr = buf->data;
+			break;
+		case S5P_DMA_PER2PER:
+		default:
+			printk("Peri-to-Peri DMA NOT YET implemented !! \n");
+			return -EINVAL;
+		}
+		dma_param.mTrSize = buf->size;
+		dma_param.mLoop = 0;
+		dma_param.mControl = *(struct DMA_control *) &chan->dcon;
+		last2buf = last1buf;
+		last1buf = buf;
+		chan->next = buf->next;
+		buf = chan->next;
+		if (buf == NULL) {
+			firstbuf->next = NULL;
+			dma_param.mLastReq = 1;
+			dma_param.mIrqEnable = 1;
+		} else {
+			dma_param.mLastReq = 0;
+			dma_param.mIrqEnable = 0;
+		}
+		bwJump += setup_dma_channel(((u8 *)firstbuf->mcptr_cpu)+bwJump,
+						dma_param, chan->number);
+		if (last2buf != firstbuf)
+			s5p_dma_freebuf(last2buf);
+	} while (buf != NULL);
+	if (last1buf != firstbuf)
+		s5p_dma_freebuf(last1buf);
+	if (dma_param.mIrqEnable) {
+		tmp = dma_rdreg(chan->dma_con, DMAC_INTEN);
+		tmp |= (1 << chan->number);
+		dma_wrreg(chan->dma_con, DMAC_INTEN, tmp);
+	}
+	/* update the state of the channel */
+	switch (chan->load_state) {
+	case S3C2410_DMALOAD_NONE:
+		chan->load_state = S3C2410_DMALOAD_1LOADED;
+		break;
+	case S3C2410_DMALOAD_1RUNNING:
+		chan->load_state = S3C2410_DMALOAD_1LOADED_1RUNNING;
+		break;
+	default:
+		dmawarn("dmaload: unknown state %d in loadbuffer\n",
+						chan->load_state);
+		break;
+	}
+	return 0;
+}
+
+
+/* s5p_dma_call_op
+ * small routine to call the o routine with the given op if it has been
+ * registered
+ */
+static void s5p_dma_call_op(struct s5p_dma_chan *chan, enum s3c2410_chan_op op)
+{
+	if (chan->op_fn != NULL)
+		(chan->op_fn) (chan, op);
+
+}
+
+/* s5p_dma_buffdone
+ * small wrapper to check if callback routine needs to be called, and
+ * if so, call it
+ */
+static void s5p_dma_buffdone(struct s5p_dma_chan *chan,
+				struct s5p_dma_buf *buf,
+				enum s3c2410_dma_buffresult result)
+{
+	pr_debug("callback_fn will be called=%p,"
+			"buf=%p, id=%p, size=%d, result=%d\n",
+		 chan->callback_fn, buf, buf->id, buf->size, result);
+	if (chan->callback_fn != NULL)
+		(chan->callback_fn) (chan, buf->id, buf->size, result);
+
+}
+
+/* s5p_dma_start
+ * start a dma channel going
+ */
+static int s5p_dma_start(struct s5p_dma_chan *chan)
+{
+	unsigned long flags;
+	pr_debug("s5p_start_dma: channel number=%d, index=%d\n",
+					chan->number, chan->index);
+	local_irq_save(flags);
+	if (chan->state == S3C2410_DMA_RUNNING) {
+		pr_debug("s5p_start_dma: already running (%d)\n", chan->state);
+		local_irq_restore(flags);
+		return 0;
+	}
+	chan->state = S3C2410_DMA_RUNNING;
+	/* check wether there is anything to load, and if not, see
+	 * if we can find anything to load
+	 */
+	if (chan->load_state == S3C2410_DMALOAD_NONE) {
+		if (chan->next == NULL) {
+			printk(KERN_ERR "dma CH %d:dcon_num has not loaded\n",
+								chan->number);
+			chan->state = S3C2410_DMA_IDLE;
+			local_irq_restore(flags);
+			return -EINVAL;
+		}
+		s5p_dma_loadbuffer(chan, chan->next);
+	}
+	dbg_showchan(chan);
+	/* enable the channel */
+	if (!chan->irq_enabled) {
+		enable_irq(chan->irq);
+		chan->irq_enabled = 1;
+	}
+	start_dma_channel(dma_regaddr(chan->dma_con, DMAC_DBGSTATUS),
+						chan->number, chan->curr->mcptr,
+						PL330_NON_SECURE_DMA);
+	/* Start the DMA operation on Peripheral */
+	s5p_dma_call_op(chan, S3C2410_DMAOP_START);
+	dbg_showchan(chan);
+	local_irq_restore(flags);
+	return 0;
+}
+
+/* s5p_dma_enqueue
+ * queue an given buffer for dma transfer.
+ * id         the device driver's id information for this buffer
+ * data       the physical address of the buffer data
+ * size       the size of the buffer in bytes
+ * If the channel is not running, then the flag DMAF_AUTOSTART
+ * is checked, and if set, the channel is started. If this flag isn't set,
+ * then an error will be returned.
+ * It is possible to queue more than one DMA buffer onto a channel at
+ * once, and the code will deal with the re-loading of the next buffer
+ * when necessary.
+ */
+int s5p_dma_enqueue(unsigned int channel, void *id,
+			dma_addr_t data, int size)
+{
+	struct s5p_dma_chan *chan = lookup_dma_channel(channel);
+	struct s5p_dma_buf *buf;
+	unsigned long flags;
+	buf = kmem_cache_alloc(dma_kmem, GFP_ATOMIC);
+	if (buf == NULL) {
+		printk(KERN_ERR "dma <%d> no memory for buffer\n", channel);
+		return -ENOMEM;
+	}
+	pr_debug("%s: new buffer %p\n", __func__, buf);
+	buf->next = NULL;
+	buf->data = buf->ptr = data;
+	buf->size = size;
+	buf->id = id;
+	buf->magic = BUF_MAGIC;
+	local_irq_save(flags);
+	buf->mcptr_cpu = dma_alloc_coherent(NULL, SIZE_OF_MICRO_CODES,
+						 &buf->mcptr, GFP_ATOMIC);
+
+	if (buf->mcptr_cpu == NULL) {
+		printk(KERN_ERR "%s: failed to allocate memory\n", __func__);
+		return -ENOMEM;
+	}
+	if (chan->curr == NULL) {
+		pr_debug("%s: buffer %p queued empty \n", __func__, buf);
+		chan->curr = buf;
+		chan->end = buf;
+		chan->next = NULL;
+	} else {
+		pr_debug("dma CH %d: %s: buffer %p queued non-empty channel\n",
+			 chan->number, __func__, buf);
+		if (chan->end == NULL)
+			pr_debug("dma CH %d: %s: %p  and chan->end==NULL?\n",
+				 chan->number, __func__, chan);
+		else {
+			chan->end->next = buf;
+			chan->end = buf;
+		}
+	}
+	if (chan->next == NULL)
+		chan->next = buf;
+	if (chan->state == S3C2410_DMA_RUNNING) {
+		if (chan->load_state == S3C2410_DMALOAD_1LOADED && 1) {
+			if (s5p_dma_waitforload(chan, __LINE__) == 0) {
+				printk(KERN_ERR "dma CH %d: loadbuffer:"
+				"timeout loading buffer\n", chan->number);
+				dbg_showchan(chan);
+				local_irq_restore(flags);
+				return -EINVAL;
+			}
+		}
+
+	} else if (chan->state == S3C2410_DMA_IDLE) {
+		if (chan->flags & DMAF_AUTOSTART)
+			s5p_dma_ctrl(channel, S3C2410_DMAOP_START);
+		 else
+			pr_debug("loading onto stopped channel\n");
+	}
+	local_irq_restore(flags);
+	return 0;
+}
+EXPORT_SYMBOL(s5p_dma_enqueue);
+
+static inline void s5p_dma_freebuf(struct s5p_dma_buf *buf)
+{
+	int magicok = (buf->magic == BUF_MAGIC);
+	buf->magic = -1;
+	if (magicok) {
+		local_irq_enable();
+		dma_free_coherent(NULL, SIZE_OF_MICRO_CODES,
+			buf->mcptr_cpu, buf->mcptr);
+		local_irq_disable();
+		kmem_cache_free(dma_kmem, buf);
+	} else {
+		printk("s5p_dma_freebuf: buff %p with bad magic\n", buf);
+	}
+}
+
+/* s5p_dma_lastxfer
+ * called when the system is out of buffers, to ensure that the channel
+ * is prepared for shutdown.
+ */
+static inline void s5p_dma_lastxfer(struct s5p_dma_chan *chan)
+{
+	switch (chan->load_state) {
+	case S3C2410_DMALOAD_NONE:
+		break;
+	case S3C2410_DMALOAD_1LOADED:
+		if (s5p_dma_waitforload(chan, __LINE__) == 0) {
+			/* flag error? */
+			printk(KERN_ERR "dma CH %d: timeout waiting \n",
+			chan->number);
+			return;
+		}
+		break;
+	default:
+		pr_debug("dma CH %d: lastxfer: unhandled  %d with no next",
+			 chan->number, chan->load_state);
+		return;
+	}
+}
+
+#define dmadbg2(x...)
+
+static irqreturn_t s5p_dma_irq(int irq, void *devpw)
+{
+	unsigned int channel = 0, dcon_num, i;
+	unsigned long tmp;
+	struct s5p_dma_controller *dma_controller =
+			(struct s5p_dma_controller *) devpw;
+	struct s5p_dma_chan *chan = NULL;
+	struct s5p_dma_buf *buf;
+	dcon_num = dma_controller->number;
+	tmp = dma_rdreg(dma_controller, DMAC_INTSTATUS);
+	if (tmp == 0)
+		return IRQ_HANDLED;
+	for (i = 0; i < S5P_CHANNELS_PER_DMA; i++) {
+		if (tmp & 0x01) {
+			channel = i;
+			chan = &s5p_dma_chans[channel + dcon_num
+							* S5P_CHANNELS_PER_DMA];
+			buf = chan->curr;
+			dbg_showchan(chan);
+			/* modify the channel state */
+			switch (chan->load_state) {
+			case S3C2410_DMALOAD_1RUNNING:
+				/* TODO - if we are running only one buffer,
+				we probably want to reload here, and then worry
+				about the buffer callback */
+				chan->load_state = S3C2410_DMALOAD_NONE;
+				break;
+			case S3C2410_DMALOAD_1LOADED:
+				/* iirc, we should go back to NONE loaded here,
+				we had a buffer, and it was never verified as
+				being loaded.*/
+				chan->load_state = S3C2410_DMALOAD_NONE;
+				break;
+			case S3C2410_DMALOAD_1LOADED_1RUNNING:
+				/* we'll worry about checking to see if another
+				buffer is ready after we've called back the
+				owner. This should ensure we do not wait around
+				too long for the DMA engine to start the next
+				transfer */
+				chan->load_state = S3C2410_DMALOAD_1LOADED;
+				break;
+			case S3C2410_DMALOAD_NONE:
+				printk(KERN_ERR "dma%d: IRQ with no loaded"
+						"buffer?\n", chan->number);
+				break;
+			default:
+				printk(KERN_ERR "dma%d: IRQ in invalid"
+					"load_state %d\n", chan->number,
+							chan->load_state);
+				break;
+			}
+			if (buf != NULL) {
+				/* update the chain to make sure that if we
+				load any more buffers when we call the callback
+				things should work properly */
+
+				chan->curr = buf->next;
+				buf->next = NULL;
+
+				if (buf->magic != BUF_MAGIC) {
+					printk(KERN_ERR "dma"
+						"CH %d: %s: buf %p \n",
+					       chan->number, __func__, buf);
+					goto next_channel;
+				}
+				s5p_dma_buffdone(chan, buf, S3C2410_RES_OK);
+				/* free resouces */
+				s5p_dma_freebuf(buf);
+			} else {
+			}
+		/* only reload if the channel is still running... our buffer
+		one routine may have altered the state by requesting the dma
+		channel to stop or shutdown... */
+		if (chan->next != NULL && chan->state != S3C2410_DMA_IDLE) {
+			unsigned long flags;
+			switch (chan->load_state) {
+			case S3C2410_DMALOAD_1RUNNING:
+				/* don't need to do anything for this state */
+			break;
+			case S3C2410_DMALOAD_NONE:
+				/* can load buffer immediately */
+				break;
+			case S3C2410_DMALOAD_1LOADED:
+				if (s5p_dma_waitforload(chan, __LINE__) == 0) {
+						/* flag error? */
+			printk(KERN_ERR "dma CH %d: timeout waiting for load\n",
+							chan->number);
+					goto next_channel;
+				}
+				break;
+			case S3C2410_DMALOAD_1LOADED_1RUNNING:
+				goto next_channel;
+			default:
+			printk(KERN_ERR "dma CH %d: unknown load_state, %d\n",
+					chan->number, chan->load_state);
+					goto next_channel;
+				}
+				local_irq_save(flags);
+				s5p_dma_loadbuffer(chan, chan->next);
+		start_dma_channel(dma_regaddr(chan->dma_con,
+					 DMAC_DBGSTATUS),
+				 chan->number,
+				chan->curr->mcptr, PL330_NON_SECURE_DMA);
+
+				local_irq_restore(flags);
+			} else {
+				s5p_dma_lastxfer(chan);
+				if (chan->load_state == S3C2410_DMALOAD_NONE) {
+			s5p_dma_ctrl(chan->index |
+					DMACH_LOW_LEVEL, S3C2410_DMAOP_STOP);
+				}
+			}
+		s5p_clear_interrupts(chan->dma_con->number, chan->number);
+		}
+next_channel:
+		tmp >>= 1;
+	}
+	return IRQ_HANDLED;
+}
+
+static struct s5p_dma_chan *s5p_dma_map_channel(int channel);
+
+/* s5p_dma_request
+ * get control of an dma channel
+*/
+
+int s5p_dma_request(unsigned int channel,
+			struct s3c2410_dma_client *client,
+			void *dev)
+{
+	struct s5p_dma_chan *chan;
+	unsigned long flags;
+	int err;
+	pr_debug("DMA CH %d: s5p_request_dma: client=%s, dev=%p\n",
+					 channel, client->name, dev);
+	local_irq_save(flags);
+	chan = s5p_dma_map_channel(channel);
+	if (chan == NULL) {
+		local_irq_restore(flags);
+		return -EBUSY;
+	}
+	dbg_showchan(chan);
+	chan->client = client;
+	chan->in_use = 1;
+	chan->dma_con->in_use++;
+	if (!chan->irq_claimed) {
+		pr_debug("DMA CH %d: %s : requesting irq %d\n",
+					 channel, __func__, chan->irq);
+		chan->irq_claimed = 1;
+		local_irq_restore(flags);
+		err = request_irq(chan->irq, s5p_dma_irq, IRQF_SHARED,
+					client->name, (void *) chan->dma_con);
+		local_irq_save(flags);
+		if (err) {
+			chan->in_use = 0;
+			chan->irq_claimed = 0;
+			chan->dma_con->in_use--;
+			local_irq_restore(flags);
+
+			printk(KERN_ERR "%s: cannot get IRQ %d for DMA %d\n",
+				       client->name, chan->irq, chan->number);
+			return err;
+		}
+		chan->irq_enabled = 1;
+		/* enable the main dma.. this can be disabled
+		 * when main channel use count is 0 */
+		s5p_enable_dmac(chan->dma_con->number);
+	}
+	s5p_clear_interrupts(chan->dma_con->number, chan->number);
+	local_irq_restore(flags);
+	return 0;
+}
+EXPORT_SYMBOL(s5p_dma_request);
+
+/* s5p_dma_free
+ * release the given channel back to the system, will stop and flush
+ * any outstanding transfers, and ensure the channel is ready for the
+ * next claimant.
+ *
+ * Note, although a warning is currently printed if the freeing client
+ * info is not the same as the registrant's client info, the free is still
+ * allowed to go through.
+ */
+int s5p_dma_free(unsigned int channel, struct s3c2410_dma_client *client)
+{
+	unsigned long flags;
+	struct s5p_dma_chan *chan = lookup_dma_channel(channel);
+	pr_debug("%s: DMA channel %d will be stopped\n",
+				__func__, chan->number);
+	if (chan == NULL)
+		return -EINVAL;
+	local_irq_save(flags);
+	if (chan->client != client) {
+		printk(KERN_WARNING "DMA CH %d:free from different client"
+						"channel %p, passed %p)\n",
+						 channel, chan->client, client);
+	}
+	/* sort out stopping and freeing the channel */
+	if (chan->state != S3C2410_DMA_IDLE) {
+		pr_debug("%s:need to stop dma channel %p\n", __func__, chan);
+		/* possibly flush the channel */
+		s5p_dma_ctrl(channel, S3C2410_DMAOP_STOP);
+	}
+	chan->client = NULL;
+	chan->in_use = 0;
+	chan->dma_con->in_use--;
+	if (chan->irq_claimed)
+		free_irq(chan->irq, (void *)chan->dma_con);
+	chan->irq_claimed = 0;
+	if (!(channel & DMACH_LOW_LEVEL))
+		dma_chan_map[channel] = NULL;
+	local_irq_restore(flags);
+	return 0;
+}
+EXPORT_SYMBOL(s5p_dma_free);
+
+static int s5p_dma_dostop(struct s5p_dma_chan *chan)
+{
+	unsigned long flags;
+	dbg_showchan(chan);
+	local_irq_save(flags);
+	s5p_dma_call_op(chan, S3C2410_DMAOP_STOP);
+	stop_dma_channel(dma_regaddr(chan->dma_con,
+			DMAC_DBGSTATUS), chan->number);
+	chan->state = S3C2410_DMA_IDLE;
+	chan->load_state = S3C2410_DMALOAD_NONE;
+	local_irq_restore(flags);
+	return 0;
+}
+
+/* s5p_dma_flush
+ * stop the channel, and remove all current and pending transfers
+ */
+static int s5p_dma_flush(struct s5p_dma_chan *chan)
+{
+	struct s5p_dma_buf *buf, *next;
+	unsigned long flags;
+	pr_debug("%s:\n", __func__);
+	local_irq_save(flags);
+	if (chan->state != S3C2410_DMA_IDLE)
+		s5p_dma_ctrl(chan->number, S3C2410_DMAOP_STOP);
+
+	buf = chan->curr;
+	if (buf == NULL)
+		buf = chan->next;
+	chan->curr = chan->next = chan->end = NULL;
+	chan->load_state = S3C2410_DMALOAD_NONE;
+	if (buf != NULL) {
+		for (; buf != NULL; buf = next) {
+			next = buf->next;
+			s5p_dma_buffdone(chan, buf, S3C2410_RES_ABORT);
+			s5p_dma_freebuf(buf);
+		}
+	}
+	local_irq_restore(flags);
+	return 0;
+}
+
+int s5p_dma_started(struct s5p_dma_chan *chan)
+{
+	unsigned long flags;
+	local_irq_save(flags);
+	dbg_showchan(chan);
+
+	/* if we've only loaded one buffer onto the channel, then check
+	 * to see if we have another, and if so, try and load it so when
+	 * the first buffer is finished, the new one will be loaded onto
+	 * the channel */
+	if (chan->next != NULL) {
+		if (chan->load_state == S3C2410_DMALOAD_1LOADED) {
+			if (s5p_dma_waitforload(chan, __LINE__) == 0) {
+				pr_debug("%s: buff not loaded,\n", __func__);
+			} else {
+				chan->load_state = S3C2410_DMALOAD_1RUNNING;
+				s5p_dma_loadbuffer(chan, chan->next);
+			}
+		} else if (chan->load_state == S3C2410_DMALOAD_1RUNNING) {
+			s5p_dma_loadbuffer(chan, chan->next);
+		}
+	}
+	local_irq_restore(flags);
+	return 0;
+}
+
+int s5p_dma_ctrl(unsigned int channel, enum s3c2410_chan_op op)
+{
+	struct s5p_dma_chan *chan = lookup_dma_channel(channel);
+	if (chan == NULL)
+		return -EINVAL;
+	switch (op) {
+	case S3C2410_DMAOP_START:
+		return s5p_dma_start(chan);
+	case S3C2410_DMAOP_STOP:
+		return s5p_dma_dostop(chan);
+	case S3C2410_DMAOP_PAUSE:
+	case S3C2410_DMAOP_RESUME:
+		return -ENOENT;
+	case S3C2410_DMAOP_FLUSH:
+		return s5p_dma_flush(chan);
+	case S3C2410_DMAOP_STARTED:
+		return s5p_dma_started(chan);
+	case S3C2410_DMAOP_TIMEOUT:
+		return 0;
+	}
+	printk("Invalid operation entered \n");
+	return -ENOENT;
+}
+EXPORT_SYMBOL(s5p_dma_ctrl);
+
+
+/* s5p_dma_config
+ * xfersize:     size of unit in bytes (1,2,4,8)
+ * dcon:         base value of the DCONx register
+ */
+int s5p_dma_config(unsigned int channel,
+		       int xferunit,
+		       int dcon)
+{
+	struct s5p_dma_chan *chan = lookup_dma_channel(channel);
+	pr_debug("%s: chan=%d, xfer_unit=%d, dcon=%08x\n",
+		 __func__, channel, xferunit, dcon);
+	if (chan == NULL)
+		return -EINVAL;
+	pr_debug("%s: Initial dcon is %08x\n", __func__, dcon);
+		dcon |= chan->dcon & dma_sel.dcon_mask;
+	pr_debug("%s: New dcon is %08x\n", __func__, dcon);
+	switch (xferunit) {
+	case 1:
+		dcon |= DMACONTROL_SRC_WIDTH_BYTE;
+		dcon |= DMACONTROL_DEST_WIDTH_BYTE;
+		break;
+	case 2:
+		dcon |= DMACONTROL_SRC_WIDTH_HWORD;
+		dcon |= DMACONTROL_DEST_WIDTH_HWORD;
+		break;
+	case 4:
+		dcon |= DMACONTROL_SRC_WIDTH_WORD;
+		dcon |= DMACONTROL_DEST_WIDTH_WORD;
+		break;
+	case 8:
+		dcon |= DMACONTROL_SRC_WIDTH_DWORD;
+		dcon |= DMACONTROL_DEST_WIDTH_DWORD;
+		break;
+	default:
+		printk(KERN_WARNING "%s: Bad transfer size %d\n", __func__,
+							xferunit);
+		return -EINVAL;
+	}
+	dcon |= chan->control_flags;
+	/* For DMCCxControl 0 */
+	chan->dcon = dcon;
+	/* For DMACCxControl 1 : xferunit means transfer width.*/
+	chan->xfer_unit = xferunit;
+	return 0;
+}
+EXPORT_SYMBOL(s5p_dma_config);
+
+int s5p_dma_setflags(unsigned int channel, unsigned int flags)
+{
+	struct s5p_dma_chan *chan = lookup_dma_channel(channel);
+	if (chan == NULL)
+		return -EINVAL;
+	chan->flags = flags;
+	return 0;
+}
+EXPORT_SYMBOL(s5p_dma_setflags);
+
+int s5p_dma_set_opfn(unsigned int channel, s5p_dma_opfn_t rtn)
+{
+	struct s5p_dma_chan *chan = lookup_dma_channel(channel);
+	if (chan == NULL)
+		return -EINVAL;
+	chan->op_fn = rtn;
+	return 0;
+}
+EXPORT_SYMBOL(s5p_dma_set_opfn);
+
+int s5p_dma_set_buffdone_fn(unsigned int channel, s5p_dma_cbfn_t rtn)
+{
+	struct s5p_dma_chan *chan = lookup_dma_channel(channel);
+	if (chan == NULL)
+		return -EINVAL;
+	chan->callback_fn = rtn;
+	return 0;
+}
+EXPORT_SYMBOL(s5p_dma_set_buffdone_fn);
+
+/* s5p_dma_devconfig
+ * configure the dma source/destination hardware type and address
+ * flowctrl: direction of dma flow
+ * src_per dst_per: dma channel number of src and dst periphreal,
+ * devaddr:   physical address of the source
+ */
+
+int s5p_dma_devconfig(int channel,
+			  enum s5p_dmasrc source,
+			  int hwcfg,
+			  unsigned long devaddr)
+{
+	struct s5p_dma_chan *chan = lookup_dma_channel(channel);
+	if (chan == NULL)
+		return -EINVAL;
+	pr_debug("%s: source=%d, hwcfg=%08x, devaddr=%08lx\n",
+		 __func__, (int)source, hwcfg, devaddr);
+	chan->source = source;
+	chan->dev_addr = devaddr;
+	switch (source) {
+	case S5P_DMASRC_MEM:
+		/* source is Memory : Mem-to-Peri ( Write into FIFO) */
+		chan->config_flags = chan->map->hw_addr.to;
+		hwcfg = DMACONTROL_DBSIZE(1)|DMACONTROL_SBSIZE(1);
+		chan->control_flags = DMACONTROL_DP_NON_SECURE|
+					DMACONTROL_DEST_FIXED|
+					DMACONTROL_SP_NON_SECURE|
+					DMACONTROL_SRC_INC|
+				      hwcfg;
+		return 0;
+	case S5P_DMASRC_HW:
+		/* source is peripheral : Peri-to-Mem ( Read from FIFO) */
+		chan->config_flags = chan->map->hw_addr.from;
+		hwcfg = DMACONTROL_DBSIZE(1)|DMACONTROL_SBSIZE(1);
+		chan->control_flags = DMACONTROL_DP_NON_SECURE|
+					DMACONTROL_DEST_INC|
+					DMACONTROL_SP_NON_SECURE|
+					DMACONTROL_SRC_FIXED|
+				      hwcfg;
+		return 0;
+	case S5P_DMA_MEM2MEM:
+		chan->config_flags = 0;
+		hwcfg = DMACONTROL_DBSIZE(16)|DMACONTROL_SBSIZE(16);
+		chan->control_flags = DMACONTROL_DP_NON_SECURE|
+					DMACONTROL_DEST_INC|
+					DMACONTROL_SP_NON_SECURE|
+					DMACONTROL_SRC_INC|
+				      hwcfg;
+		return 0;
+	case S5P_DMA_MEM2MEM_SET:
+		chan->config_flags = 0;
+		hwcfg = DMACONTROL_DBSIZE(16)|DMACONTROL_SBSIZE(16);
+		chan->control_flags = DMACONTROL_DP_NON_SECURE|
+					DMACONTROL_DEST_INC|
+					DMACONTROL_SP_NON_SECURE|
+					DMACONTROL_SRC_FIXED|
+				      hwcfg;
+		return 0;
+	case S5P_DMA_PER2PER:
+		printk(KERN_ERR "Peripheral-to-PeripheralNOT implemented\n");
+		return -EINVAL;
+	default:
+		printk(KERN_ERR "DMA CH :%d-invalid source type\n", channel);
+		printk(KERN_ERR "Unsupported DMA configuration \n");
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL(s5p_dma_devconfig);
+
+/*
+ * s5p_dma_getposition
+ * returns the current transfer points for the dma source and destination
+ */
+int s5p_dma_getposition(unsigned int channel, dma_addr_t *src, dma_addr_t *dst)
+{
+	struct s5p_dma_chan *chan = lookup_dma_channel(channel);
+	if (chan == NULL)
+		return -EINVAL;
+	if (src != NULL)
+		*src = dma_rdreg(chan->dma_con, DMAC_SA(chan->number));
+	if (dst != NULL)
+		*dst = dma_rdreg(chan->dma_con, DMAC_DA(chan->number));
+	return 0;
+}
+EXPORT_SYMBOL(s5p_dma_getposition);
+
+/* system device class */
+#ifdef CONFIG_PM
+static int s5p_dma_suspend(struct sys_device *dev, pm_message_t state)
+{
+	return 0;
+}
+
+static int s5p_dma_resume(struct sys_device *dev)
+{
+	return 0;
+}
+#else
+#define s5p_dma_suspend NULL
+#define s5p_dma_resume  NULL
+#endif		/* CONFIG_PM */
+
+struct sysdev_class dma_sysclass = {
+	.name = "pl330-dma",
+	.suspend = s5p_dma_suspend,
+	.resume = s5p_dma_resume,
+};
+
+/* kmem cache implementation */
+
+static void s5p_dma_cache_ctor(void *p)
+{
+	memset(p, 0, sizeof(struct s5p_dma_buf));
+}
+
+/* initialisation code */
+int __init s5p_dma_init(unsigned int channels, unsigned int irq,
+			    unsigned int stride)
+{
+	struct s5p_dma_chan *cp;
+	struct s5p_dma_controller *dconp;
+	int channel, controller;
+	int ret;
+	printk(KERN_WARNING "S5P PL330-DMA Controller Driver\n");
+	dma_channels = channels;
+	printk(KERN_WARNING "Total %d DMA channels will be initialized.\n",
+			channels);
+	ret = sysdev_class_register(&dma_sysclass);
+	if (ret != 0) {
+		printk(KERN_ERR "dma sysclass registration failed.\n");
+		goto err;
+	}
+	dma_kmem = kmem_cache_create("dma_desc",
+				     sizeof(struct s5p_dma_buf), 0,
+				     SLAB_HWCACHE_ALIGN,
+				     s5p_dma_cache_ctor);
+	if (dma_kmem == NULL) {
+		printk(KERN_ERR "DMA failed to make kmem cache for DMA channel descriptor\n");
+		ret = -ENOMEM;
+		goto err;
+	}
+	for (controller = 0; controller < S5P_DMA_CONTROLLERS; controller++) {
+		dconp = &s5p_dma_cntlrs[controller];
+		memset(dconp, 0, sizeof(struct s5p_dma_controller));
+		if (controller == 0) {
+			dma_base = ioremap(S5P_PA_DMA, stride);
+			if (dma_base == NULL) {
+				printk(KERN_ERR "M2M-DMA failed to ioremap register block\n");
+				return -ENOMEM;
+			}
+			/* dma controller's irqs are in order.. */
+			dconp->irq = controller + irq;
+		} else {
+			dma_base = ioremap(((S5P_PA_DMA + 0xF00000) +
+					((controller-1) * 0x200000)), stride);
+			if (dma_base == NULL) {
+				printk(KERN_ERR "Peri-DMA failed to ioremap register block\n");
+				return -ENOMEM;
+			}
+			/* dma controller's irqs are in order.. */
+			dconp->irq = controller + irq;
+		}
+		dconp->number = controller;
+		dconp->regs = dma_base;
+	}
+	for (channel = 0; channel < channels; channel++) {
+		controller = channel / S5P_CHANNELS_PER_DMA;
+		cp = &s5p_dma_chans[channel];
+		memset(cp, 0, sizeof(struct s5p_dma_chan));
+		cp->dma_con = &s5p_dma_cntlrs[controller];
+		/* dma channel irqs are in order.. */
+		cp->index = channel;
+		cp->number = channel%S5P_CHANNELS_PER_DMA;
+		cp->irq = s5p_dma_cntlrs[controller].irq;
+		cp->regs = s5p_dma_cntlrs[controller].regs;
+		/* point current stats somewhere */
+		cp->stats = &cp->stats_store;
+		cp->stats_store.timeout_shortest = LONG_MAX;
+		/* basic channel configuration */
+		cp->load_timeout = 1 << 18;
+		/* register system device */
+		cp->dev.cls = &dma_sysclass;
+		cp->dev.id = channel;
+		pr_debug("DMA channel %d at %p, irq %d\n",
+		cp->number, cp->regs, cp->irq);
+	}
+	return 0;
+err:
+	kmem_cache_destroy(dma_kmem);
+	iounmap(dma_base);
+	dma_base = NULL;
+	return ret;
+}
+
+static inline int is_channel_valid(unsigned int channel)
+{
+	return channel & DMA_CH_VALID;
+}
+
+static struct s5p_dma_order *dma_order;
+
+/* s5p_dma_map_channel()
+ * turn the virtual channel number into a real, and un-used hardware
+ * channel.
+ * first, try the dma ordering given to us by either the relevant
+ * dma code, or the board. Then just find the first usable free
+ * channel
+*/
+struct s5p_dma_chan *s5p_dma_map_channel(int channel)
+{
+	struct s5p_dma_order_ch *ord = NULL;
+	struct s5p_dma_map *ch_map;
+	struct s5p_dma_chan *dmach;
+	int ch;
+	if (dma_sel.map == NULL || channel > dma_sel.map_size)
+		return NULL;
+	ch_map = dma_sel.map + channel;
+	/* first, try the board mapping */
+	if (dma_order) {
+		ord = &dma_order->channels[channel];
+		for (ch = 0; ch < dma_channels; ch++) {
+			if (!is_channel_valid(ord->list[ch]))
+				continue;
+			if (s5p_dma_chans[ord->list[ch]].in_use == 0) {
+				ch = ord->list[ch] & ~DMA_CH_VALID;
+				goto found;
+			}
+		}
+		if (ord->flags & DMA_CH_NEVER)
+			return NULL;
+	}
+	/* second, search the channel map for first free */
+	for (ch = 0; ch < dma_channels; ch++) {
+		if (!is_channel_valid(ch_map->channels[ch]))
+			continue;
+		if (s5p_dma_chans[ch].in_use == 0) {
+			pr_debug("mapped channel %d to %d\n", channel, ch);
+			break;
+		}
+	}
+	if (ch >= dma_channels)
+		return NULL;
+	/* update our channel mapping */
+ found:
+	dmach = &s5p_dma_chans[ch];
+	dma_chan_map[channel] = dmach;
+	/* select the channel */
+	(dma_sel.select)(dmach, ch_map);
+	return dmach;
+}
+
+int __init s5p_dma_init_map(struct s5p_dma_selection *sel)
+{
+	struct s5p_dma_map *nmap;
+	size_t map_sz = sizeof(*nmap) * sel->map_size;
+	nmap = kmalloc(map_sz, GFP_KERNEL);
+	if (nmap == NULL)
+		return -ENOMEM;
+	memcpy(nmap, sel->map, map_sz);
+	memcpy(&dma_sel, sel, sizeof(*sel));
+	dma_sel.map = nmap;
+	return 0;
+}
+
+int __init s5p_dma_order_set(struct s5p_dma_order *ord)
+{
+	struct s5p_dma_order *nord = dma_order;
+	if (nord == NULL)
+		nord = kmalloc(sizeof(struct s5p_dma_order), GFP_KERNEL);
+	if (nord == NULL) {
+		printk(KERN_ERR "no memory to store dma channel order\n");
+		return -ENOMEM;
+	}
+	dma_order = nord;
+	memcpy(nord, ord, sizeof(struct s5p_dma_order));
+	return 0;
+}
diff --git a/arch/arm/plat-s5p/include/plat/s5p-dma.h b/arch/arm/plat-s5p/include/plat/s5p-dma.h
new file mode 100644
index 0000000..0ffa79a
--- /dev/null
+++ b/arch/arm/plat-s5p/include/plat/s5p-dma.h
@@ -0,0 +1,225 @@
+/* linux/arch/arm/plat-s5p/include/plat/s5p-dma.h
+ *
+ * Copyright (c) 2010 Samsung Electronics
+ *             http://www.samsung.com/
+ *
+ * his program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/sysdev.h>
+#include <mach/hardware.h>
+#include <plat/dma.h>
+
+#ifndef __ARM_PLAT_S5P_DMA_H
+#define __ARM_PLAT_S5P_DMA_H
+
+#define DMA_CH_VALID			(1<<31)
+#define DMA_CH_NEVER			(1<<30)
+#define S5P_DMA_CONTROLLERS		(1)
+#define S5P_CHANNELS_PER_DMA		(8)
+#define S5P_CANDIDATE_CHANNELS_PER_DMA	(32)
+#define S5P_DMA_CHANNELS		(8)
+
+/* We use `virtual` dma channels to hide the fact we have only a limited
+ * number of DMA channels, and not of all of them (dependant on the device)
+ * can be attached to any DMA source. We therefore let the DMA core handle
+ * the allocation of hardware channels to clients.
+*/
+
+enum dma_ch {
+	DMACH_UART00,
+	DMACH_UART01,
+	DMACH_UART10,
+	DMACH_UART11,
+	DMACH_UART20,
+	DMACH_UART21,
+	DMACH_UART30,
+	DMACH_UART31,
+	DMACH_PCM0_IN,
+	DMACH_PCM0_OUT,
+	DMACH_I2S_IN,
+	DMACH_I2S_OUT,
+	DMACH_SPI0_IN,
+	DMACH_SPI0_OUT,
+	DMACH_SPI1_IN,
+	DMACH_SPI1_OUT,
+	DMACH_PWM,
+	DMACH_MAX,	/* the end entry */
+};
+
+enum s5p_dmasrc {
+	S5P_DMASRC_HW,		/* source is memory */
+	S5P_DMASRC_MEM,		/* source is hardware */
+	S5P_DMA_MEM2MEM,	/* source is memory - READ/WRITE */
+	S5P_DMA_MEM2MEM_SET,	/* source is memory - READ/WRITE for MEMSET*/
+	S5P_DMA_MEM2MEM_P,	/* source is hardware - READ/WRITE */
+	S5P_DMA_PER2PER,	/* source is hardware - READ/WRITE */
+};
+
+struct s5p_dma_buf {
+	struct s5p_dma_buf	*next;
+	int			magic;	/* magic */
+	int			size; 	/* buffer size in bytes */
+	dma_addr_t		data;	/* start of DMA data */
+	dma_addr_t		ptr;	/* where the DMA got to [1] */
+	void			*id;	/* client's id */
+	dma_addr_t		mcptr;	/*physical pointer*/
+	unsigned long		*mcptr_cpu;	/*virtual pointer*/
+};
+
+struct s5p_dma_chan;
+
+enum s3c2410_dma_buffresult;
+
+enum s3c2410_dma_state;
+
+enum s3c2410_dma_loadst;
+
+typedef void (*s5p_dma_cbfn_t)(struct s5p_dma_chan *,
+					void *buf, int size,
+					enum s3c2410_dma_buffresult result);
+
+typedef int  (*s5p_dma_opfn_t)(struct s5p_dma_chan *,
+					enum s3c2410_chan_op);
+
+struct s5p_dma_stats {
+	unsigned long		loads;
+	unsigned long		timeout_longest;
+	unsigned long		timeout_shortest;
+	unsigned long		timeout_avg;
+	unsigned long		timeout_failed;
+};
+
+struct s5p_dma_controller {
+	/* channel state flags and information */
+	unsigned char		number;	/* number of this dma channel */
+	unsigned char		in_use;	/*how many channel are used*/
+	unsigned char		irq_claimed;	/* irq claimed for channel */
+	unsigned char		irq_enabled;	/* irq enabled for channel */
+	unsigned char		xfer_unit;	/* size of an transfer */
+	/* channel state */
+	enum s3c2410_dma_state	state;
+	enum s3c2410_dma_loadst	load_state;
+	struct s3c2410_dma_client	*client;
+	/* channel configuration */
+	unsigned long		dev_addr;
+	unsigned long		load_timeout;
+	unsigned int		flags;	/* channel flags */
+	/* channel's hardware position and configuration */
+	void __iomem		*regs;	/* channels registers */
+	void __iomem 		*addr_reg;	/* data address register */
+	unsigned int 		irq;		/* channel irq */
+	unsigned long		dcon;		/* default value of DCON */
+
+};
+
+struct s5p_dma_chan {
+	/* channel state flags and information */
+	unsigned char		number;	/* number of this dma channel */
+	unsigned char		in_use;	/* channel allocated */
+	unsigned char		irq_claimed;	/* irq claimed for channel */
+	unsigned char		irq_enabled;	/* irq enabled for channel */
+	unsigned char		xfer_unit;	/* size of an transfer */
+	/* channel state */
+	enum s3c2410_dma_state	state;
+	enum s3c2410_dma_loadst	load_state;
+	struct s3c2410_dma_client	*client;
+	/* channel configuration */
+	enum s5p_dmasrc		source;
+	enum dma_ch		req_ch;
+	unsigned long		dev_addr;
+	unsigned long		load_timeout;
+	unsigned int		flags;		/* channel flags */
+	struct s5p_dma_map	*map;	/* channel hw maps */
+	/* channel's hardware position and configuration */
+	void __iomem		*regs;		/* channels registers */
+	void __iomem		*addr_reg;	/* data address register */
+	unsigned int		irq;		/* channel irq */
+	unsigned long		dcon;		/* default value of DCON */
+	/* driver handles */
+	s5p_dma_cbfn_t		callback_fn;	/* buffer done callback */
+	s5p_dma_opfn_t		op_fn;		/* channel op callback */
+	/* stats gathering */
+	struct s5p_dma_stats	*stats;
+	struct s5p_dma_stats	stats_store;
+	/* buffer list and information */
+	struct s5p_dma_buf	*curr;		/* current dma buffer */
+	struct s5p_dma_buf	*next;		/* next buffer to load */
+	struct s5p_dma_buf	*end;		/* end of queue */
+	/* system device */
+	struct sys_device	dev;
+	unsigned int		index;		/* channel index */
+	unsigned int		config_flags;	/* channel flags */
+	unsigned int		control_flags;	/* channel flags */
+	struct s5p_dma_controller	*dma_con;
+};
+
+extern int s5p_dma_ctrl(unsigned int channel, enum s3c2410_chan_op op);
+
+struct s5p_dma_addr {
+	unsigned long		from;
+	unsigned long		to;
+};
+
+/* struct s5p_dma_map
+ * this holds the mapping information for the channel selected
+ * to be connected to the specified device
+*/
+struct s5p_dma_map {
+	const char		*name;
+	struct s5p_dma_addr  	hw_addr;
+	unsigned long		channels[S5P_DMA_CHANNELS];
+	unsigned long		channels_rx[S5P_DMA_CHANNELS];
+	unsigned long		sdma_sel;
+};
+
+struct s5p_dma_selection {
+	struct s5p_dma_map	*map;
+	unsigned long		 map_size;
+	unsigned long		 dcon_mask;
+	void	(*select)(struct s5p_dma_chan *chan,
+			  struct s5p_dma_map *map);
+	void	(*direction)(struct s5p_dma_chan *chan,
+			     struct s5p_dma_map *map,
+			     enum s5p_dmasrc dir);
+};
+
+/* struct s5p_dma_order_ch
+ * channel map for one of the `enum dma_ch` dma channels. the list
+ * entry contains a set of low-level channel numbers, orred with
+ * DMA_CH_VALID, which are checked in the order in the array.
+*/
+struct s5p_dma_order_ch {
+	unsigned int	list[S5P_DMA_CHANNELS];	/* list of channels */
+	unsigned int	flags;				/* flags */
+};
+
+/* struct s5p_dma_order
+ * information provided by either the core or the board to give the
+ * dma system a hint on how to allocate channels
+*/
+struct s5p_dma_order {
+	struct s5p_dma_order_ch	channels[DMACH_MAX];
+};
+
+/* DMA init code, called from the cpu support code */
+extern int s5p_dma_init(unsigned int channels, unsigned int irq,
+				unsigned int stride);
+extern int s5p_dma_init_map(struct s5p_dma_selection *sel);
+
+extern int s5p_dma_request(unsigned int channel,
+				struct s3c2410_dma_client *client,
+				void *dev);
+extern int s5p_dma_set_buffdone_fn(unsigned int channel, s5p_dma_cbfn_t rtn);
+
+extern int s5p_dma_devconfig(int channel, enum s5p_dmasrc source,
+				int hwcfg, unsigned long devaddr);
+extern int s5p_dma_config(unsigned int channel,
+				int xferunit, int dcon);
+extern int s5p_dma_enqueue(unsigned int channel, void *id,
+				dma_addr_t data, int size);
+extern int s5p_dma_free(unsigned int channel,
+				struct s3c2410_dma_client *client);
+#endif
-- 
1.6.6

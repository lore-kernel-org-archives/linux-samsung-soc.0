From: Jassi Brar <jassi.brar@samsung.com>
Subject: [PATCH 5/6] S3C64XX SPI: SPI Controller driver for S3C64XX
Date: Sat, 21 Nov 2009 11:52:21 +0900
Message-ID: <1258771941-14245-1-git-send-email-jassi.brar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:38609 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754178AbZKUC5E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Nov 2009 21:57:04 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Jassi Brar <jassi.brar@samsung.com>

Added S3C64XX SPI controller driver.

Each SPI controller has exactly one CS line and as such doesn't
provide for multi-cs. We implement a workaround to support
multi-cs by _not_ configuring the mux'ed CS pin for each SPI
controller. The CS mechanism is assumed to be fully machine
specific - the driver doesn't even assume some GPIO pin is used
to control the CS.
The driver has been designed to be capable of running SoCs since
s3c64xx and till date, for that reason some of the register fields
have been passed via, SoC specific, platform data.

Currently. the driver works only in DMA mode. Later choice can
be implemented to use DMA or IRQ mode based on the size of xfer
and ability to 'dma_map_single'.

Signed-off-by: Jassi Brar <jassi.brar@samsung.com>
---
 drivers/spi/Kconfig       |    7 +
 drivers/spi/Makefile      |    1 +
 drivers/spi/spi_s3c64xx.c | 1036 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/spi/spi_s3c64xx.h |  187 ++++++++
 4 files changed, 1231 insertions(+), 0 deletions(-)
 create mode 100644 drivers/spi/spi_s3c64xx.c
 create mode 100644 drivers/spi/spi_s3c64xx.h

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 2c733c2..5c67e1e 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -204,6 +204,13 @@ config SPI_S3C24XX_GPIO
 	  the inbuilt hardware cannot provide the transfer mode, or
 	  where the board is using non hardware connected pins.
 
+config SPI_S3C64XX
+	tristate "Samsung S3C64XX series type SPI"
+	depends on ARCH_S3C64XX && EXPERIMENTAL
+	select S3C64XX_DMA
+	help
+	  SPI driver for Samsung S3C64XX and newer SoCs.
+
 config SPI_SH_SCI
 	tristate "SuperH SCI SPI controller"
 	depends on SUPERH
diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
index 3de408d..53452b2 100644
--- a/drivers/spi/Makefile
+++ b/drivers/spi/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_SPI_S3C24XX)		+= spi_s3c24xx.o
 obj-$(CONFIG_SPI_TXX9)			+= spi_txx9.o
 obj-$(CONFIG_SPI_XILINX)		+= xilinx_spi.o
 obj-$(CONFIG_SPI_SH_SCI)		+= spi_sh_sci.o
+obj-$(CONFIG_SPI_S3C64XX)		+= spi_s3c64xx.o
 # 	... add above this line ...
 
 # SPI protocol drivers (device/link on bus)
diff --git a/drivers/spi/spi_s3c64xx.c b/drivers/spi/spi_s3c64xx.c
new file mode 100644
index 0000000..54f88d0
--- /dev/null
+++ b/drivers/spi/spi_s3c64xx.c
@@ -0,0 +1,1034 @@
+/* linux/drivers/spi/spi_s3c64xx.c
+ *
+ * Copyright (C) 2009 Samsung Electronics Ltd.
+ *	Jaswinder Singh <jassi.brar@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/workqueue.h>
+#include <linux/interrupt.h>
+#include <linux/delay.h>
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/platform_device.h>
+#include <linux/spi/spi.h>
+
+#include <mach/dma.h>
+#include <plat/spi.h>
+
+#include "spi_s3c64xx.h"
+
+static struct s3c2410_dma_client s3c64xx_spi_dma_client = {
+	.name = "s3c64xx-spi-dma",
+};
+
+#define msecs_to_loops(t) (loops_per_jiffy / 1000 * HZ * t)
+
+static void flush_fifo(struct s3c64xx_spi_driver_data *sdd)
+{
+	struct s3c64xx_spi_cntrlr_info *sci = sdd->cntrlr_info;
+	unsigned long loops;
+	u32 val;
+
+	val = readl(sdd->regs + S3C64XX_SPI_CH_CFG);
+	val |= S3C64XX_SPI_CH_SW_RST;
+	val &= ~S3C64XX_SPI_CH_HS_EN;
+	writel(val, sdd->regs + S3C64XX_SPI_CH_CFG);
+
+	/* Flush TxFIFO*/
+	loops = msecs_to_loops(1);
+	do {
+		val = readl(sdd->regs + S3C64XX_SPI_STATUS);
+	} while (TX_FIFO_LVL(val, sci) && loops--);
+
+	/* Flush RxFIFO*/
+	loops = msecs_to_loops(1);
+	do {
+		val = readl(sdd->regs + S3C64XX_SPI_STATUS);
+		if (RX_FIFO_LVL(val, sci))
+			readl(sdd->regs + S3C64XX_SPI_RX_DATA);
+		else
+			break;
+	} while (loops--);
+
+	val = readl(sdd->regs + S3C64XX_SPI_CH_CFG);
+	val &= ~S3C64XX_SPI_CH_SW_RST;
+	writel(val, sdd->regs + S3C64XX_SPI_CH_CFG);
+}
+
+static void flush_dma(struct s3c64xx_spi_driver_data *sdd,
+						struct spi_transfer *xfer)
+{
+	if (xfer->tx_buf != NULL)
+		s3c2410_dma_ctrl(sdd->tx_dmach, S3C2410_DMAOP_FLUSH);
+	if (xfer->rx_buf != NULL)
+		s3c2410_dma_ctrl(sdd->rx_dmach, S3C2410_DMAOP_FLUSH);
+}
+
+static void enable_datapath(struct s3c64xx_spi_driver_data *sdd,
+			struct spi_device *spi, struct spi_transfer *xfer)
+{
+	struct s3c64xx_spi_cntrlr_info *sci = sdd->cntrlr_info;
+	struct s3c64xx_spi_csinfo *cs = spi->controller_data;
+	u32 modecfg, chcfg, intr;
+
+	/* Configure feedback delay */
+	writel(cs->fb_delay & 0x3, sdd->regs + S3C64XX_SPI_FB_CLK);
+
+	/* Enable Interrupts */
+	intr = 0;
+	if (xfer->tx_buf != NULL)
+		intr |= S3C64XX_SPI_INT_TX_OVERRUN_EN
+				| S3C64XX_SPI_INT_TX_UNDERRUN_EN;
+
+	if (xfer->rx_buf != NULL)
+		intr |= S3C64XX_SPI_INT_RX_UNDERRUN_EN
+			| S3C64XX_SPI_INT_RX_OVERRUN_EN
+			| S3C64XX_SPI_INT_TRAILING_EN;
+
+	writel(intr, sdd->regs + S3C64XX_SPI_INT_EN);
+
+	modecfg = readl(sdd->regs + S3C64XX_SPI_MODE_CFG);
+	modecfg &= ~(S3C64XX_SPI_MODE_TXDMA_ON | S3C64XX_SPI_MODE_RXDMA_ON);
+
+	chcfg = readl(sdd->regs + S3C64XX_SPI_CH_CFG);
+	chcfg &= ~(S3C64XX_SPI_CH_RXCH_ON | S3C64XX_SPI_CH_TXCH_ON);
+
+	/* Enqueue data on DMA */
+	if (xfer->tx_buf != NULL) {
+		sdd->tx_done = BUSY;
+
+		modecfg |= S3C64XX_SPI_MODE_TXDMA_ON;
+		chcfg |= S3C64XX_SPI_CH_TXCH_ON;
+
+		s3c2410_dma_config(sdd->tx_dmach, sdd->cur_bpw/8);
+		s3c2410_dma_enqueue(sdd->tx_dmach, (void *)sdd,
+						xfer->tx_dma, xfer->len);
+		s3c2410_dma_ctrl(sdd->tx_dmach, S3C2410_DMAOP_START);
+	}
+
+	if (xfer->rx_buf != NULL) {
+		sdd->rx_done = BUSY;
+
+		modecfg |= S3C64XX_SPI_MODE_RXDMA_ON;
+		chcfg |= S3C64XX_SPI_CH_RXCH_ON;
+
+		writel(((xfer->len * 8 / sdd->cur_bpw) & 0xffff)
+				| S3C64XX_SPI_PACKET_CNT_EN,
+					sdd->regs + S3C64XX_SPI_PACKET_CNT);
+
+		if (sci->high_speed && sdd->cur_speed >= 30000000UL
+					&& !(sdd->cur_mode & SPI_CPHA))
+			chcfg |= S3C64XX_SPI_CH_HS_EN;
+
+		s3c2410_dma_config(sdd->rx_dmach, sdd->cur_bpw/8);
+		s3c2410_dma_enqueue(sdd->rx_dmach, (void *)sdd,
+						xfer->rx_dma, xfer->len);
+		s3c2410_dma_ctrl(sdd->rx_dmach, S3C2410_DMAOP_START);
+	}
+
+	writel(modecfg, sdd->regs + S3C64XX_SPI_MODE_CFG);
+	writel(chcfg, sdd->regs + S3C64XX_SPI_CH_CFG);
+}
+
+static inline void enable_cs(struct s3c64xx_spi_driver_data *sdd,
+						struct spi_device *spi)
+{
+	struct s3c64xx_spi_csinfo *cs;
+
+	if (sdd->tgl_spi != NULL) { /* If last device toggled after mssg */
+		if (sdd->tgl_spi != spi) { /* if last mssg on diff device */
+			/* Deselect the last toggled device */
+			cs = sdd->tgl_spi->controller_data;
+			if (sdd->tgl_spi->mode & SPI_CS_HIGH)
+				cs->set_level(0);
+			else
+				cs->set_level(1);
+		}
+		sdd->tgl_spi = NULL;
+	}
+
+	cs = spi->controller_data;
+	if (spi->mode & SPI_CS_HIGH)
+		cs->set_level(1);
+	else
+		cs->set_level(0);
+
+	S3C64XX_SPI_ACT(sdd);
+}
+
+static int wait_for_xfer(struct s3c64xx_spi_driver_data *sdd,
+						struct spi_transfer *xfer)
+{
+	struct s3c64xx_spi_cntrlr_info *sci = sdd->cntrlr_info;
+	unsigned long loops;
+	int status;
+	u32 val;
+
+	/* time to xfer data at min. speed */
+	val = msecs_to_jiffies(xfer->len / (sdd->min_speed / 8 / 1000));
+	val += msecs_to_jiffies(10); /* just some more */
+	status = wait_for_completion_interruptible_timeout(
+						&sdd->xfer_completion, val);
+
+	if (status == 0)
+		status = -ETIMEDOUT;
+	else if (status == -ERESTARTSYS)
+		status = -EINTR;
+	else if ((sdd->tx_done != PASS) || (sdd->rx_done != PASS))
+		status = -EIO;
+	else
+		status = 0;	/* All OK */
+
+	/*
+	 * DmaTx returns after simply writing data in the FIFO,
+	 * w/o waiting for real transmission on the bus to finish.
+	 * DmaRx returns only after Dma read data from FIFO which
+	 * needs bus transmission to finish, so we don't worry if
+	 * Xfer involved Rx(with or without Tx).
+	 */
+	if (!status && (xfer->rx_buf == NULL)) {
+		/* Flush TxFIFO*/
+		loops = msecs_to_loops(10);
+		val = readl(sdd->regs + S3C64XX_SPI_STATUS);
+		while ((TX_FIFO_LVL(val, sci)
+				|| !S3C64XX_SPI_ST_TX_DONE(val, sci))
+				&& --loops) {
+			cpu_relax();
+			val = readl(sdd->regs + S3C64XX_SPI_STATUS);
+		}
+
+		if (!loops)
+			status = -ETIMEDOUT;
+		else
+			status = 0;
+	}
+
+	return status;
+}
+
+static inline void disable_cs(struct s3c64xx_spi_driver_data *sdd,
+						struct spi_device *spi)
+{
+	struct s3c64xx_spi_csinfo *cs;
+
+	S3C64XX_SPI_DEACT(sdd);
+
+	if (sdd->tgl_spi == spi)
+		sdd->tgl_spi = NULL;
+
+	cs = spi->controller_data;
+	if (spi->mode & SPI_CS_HIGH)
+		cs->set_level(0);
+	else
+		cs->set_level(1);
+}
+
+static void s3c64xx_spi_config(struct s3c64xx_spi_driver_data *sdd)
+{
+	struct s3c64xx_spi_cntrlr_info *sci = sdd->cntrlr_info;
+	u32 val;
+
+	/* Disable Clock */
+	val = readl(sdd->regs + S3C64XX_SPI_CLK_CFG);
+	val &= ~S3C64XX_SPI_ENCLK_ENABLE;
+	writel(val, sdd->regs + S3C64XX_SPI_CLK_CFG);
+
+	/* Set Polarity and Phase */
+	val = readl(sdd->regs + S3C64XX_SPI_CH_CFG);
+	val &= ~(S3C64XX_SPI_CH_SLAVE |
+			S3C64XX_SPI_CPOL_L |
+			S3C64XX_SPI_CPHA_B);
+
+	if (sdd->cur_mode & SPI_CPOL)
+		val |= S3C64XX_SPI_CPOL_L;
+
+	if (sdd->cur_mode & SPI_CPHA)
+		val |= S3C64XX_SPI_CPHA_B;
+
+	writel(val, sdd->regs + S3C64XX_SPI_CH_CFG);
+
+	/* Set Channel & DMA Mode */
+	val = readl(sdd->regs + S3C64XX_SPI_MODE_CFG);
+	val &= ~(S3C64XX_SPI_MODE_BUS_TSZ_MASK
+			| S3C64XX_SPI_MODE_CH_TSZ_MASK);
+
+	switch (sdd->cur_bpw) {
+	case 32:
+		val |= S3C64XX_SPI_MODE_CH_TSZ_WORD;
+		val |= S3C64XX_SPI_MODE_BUS_TSZ_WORD;
+		break;
+	case 16:
+		val |= S3C64XX_SPI_MODE_CH_TSZ_HALFWORD;
+		val |= S3C64XX_SPI_MODE_BUS_TSZ_HALFWORD;
+		break;
+	default:
+		val |= S3C64XX_SPI_MODE_CH_TSZ_BYTE;
+		val |= S3C64XX_SPI_MODE_BUS_TSZ_BYTE;
+		break;
+	}
+
+	writel(val, sdd->regs + S3C64XX_SPI_MODE_CFG);
+
+	/* Configure Clock */
+	val = readl(sdd->regs + S3C64XX_SPI_CLK_CFG);
+	val &= ~0xff;
+	val |= ((clk_get_rate(sci->src_clk) / sdd->cur_speed / 2 - 1) & 0xff);
+	writel(val, sdd->regs + S3C64XX_SPI_CLK_CFG);
+
+	/* Enable Clock */
+	val = readl(sdd->regs + S3C64XX_SPI_CLK_CFG);
+	val |= S3C64XX_SPI_ENCLK_ENABLE;
+	writel(val, sdd->regs + S3C64XX_SPI_CLK_CFG);
+}
+
+static irqreturn_t s3c64xx_spi_interrupt(int irq, void *dev_id)
+{
+	struct s3c64xx_spi_driver_data *sdd = dev_id;
+	u32 val;
+
+	val = readl(sdd->regs + S3C64XX_SPI_PENDING_CLR);
+	writel(val, sdd->regs + S3C64XX_SPI_PENDING_CLR);
+	dev_err(&sdd->pdev->dev, "PENDING-%x\n", val);
+
+	/* We get interrupted only for bad news */
+	if (sdd->tx_done != PASS)
+		sdd->tx_done = FAIL;
+	if (sdd->rx_done != PASS)
+		sdd->rx_done = FAIL;
+
+	atomic_set(&sdd->state, atomic_read(&sdd->state) | IRQERR);
+
+	complete(&sdd->xfer_completion);
+
+	return IRQ_HANDLED;
+}
+
+void s3c64xx_spi_dma_rxcb(struct s3c2410_dma_chan *chan, void *buf_id,
+				int size, enum s3c2410_dma_buffresult res)
+{
+	struct s3c64xx_spi_driver_data *sdd = buf_id;
+
+	if (res == S3C2410_RES_OK) {
+		sdd->rx_done = PASS;
+	} else {
+		sdd->rx_done = FAIL;
+		dev_err(&sdd->pdev->dev, "DmaAbrtRx-%d\n", size);
+	}
+
+	/* If all OK and the other done */
+	if (!(atomic_read(&sdd->state) & IRQERR) && sdd->tx_done != BUSY)
+		complete(&sdd->xfer_completion);
+}
+
+void s3c64xx_spi_dma_txcb(struct s3c2410_dma_chan *chan, void *buf_id,
+				int size, enum s3c2410_dma_buffresult res)
+{
+	struct s3c64xx_spi_driver_data *sdd = buf_id;
+
+	if (res == S3C2410_RES_OK) {
+		sdd->tx_done = PASS;
+	} else {
+		sdd->tx_done = FAIL;
+		dev_err(&sdd->pdev->dev, "DmaAbrtTx-%d \n", size);
+	}
+
+	/* If all OK and the other done */
+	if (!(atomic_read(&sdd->state) & IRQERR) && sdd->rx_done != BUSY)
+		complete(&sdd->xfer_completion);
+}
+
+#define XFER_DMAADDR_INVALID DMA_BIT_MASK(32)
+
+static int s3c64xx_spi_map_mssg(struct s3c64xx_spi_driver_data *sdd,
+						struct spi_message *msg)
+{
+	struct device *dev = &sdd->pdev->dev;
+	struct spi_transfer *t;
+
+	if (msg->is_dma_mapped)
+		return 0;
+
+	/* First mark all xfer unmapped */
+	list_for_each_entry(t, &msg->transfers, transfer_list) {
+		t->rx_dma = XFER_DMAADDR_INVALID;
+		t->tx_dma = XFER_DMAADDR_INVALID;
+	}
+
+	/* Map until end or first fail */
+	list_for_each_entry(t, &msg->transfers, transfer_list) {
+
+		if (t->tx_buf != NULL) {
+			t->tx_dma = dma_map_single(dev, t->tx_buf,
+							t->len, DMA_TO_DEVICE);
+			if (dma_mapping_error(dev, t->tx_dma)) {
+				dev_err(dev, "dma_map_single Tx failed\n");
+				t->tx_dma = XFER_DMAADDR_INVALID;
+				return -ENOMEM;
+			}
+		}
+
+		if (t->rx_buf != NULL) {
+			t->rx_dma = dma_map_single(dev, t->rx_buf,
+						t->len, DMA_FROM_DEVICE);
+			if (dma_mapping_error(dev, t->rx_dma)) {
+				dev_err(dev, "dma_map_single Rx failed\n");
+				dma_unmap_single(dev, t->tx_dma,
+							t->len, DMA_TO_DEVICE);
+				t->tx_dma = XFER_DMAADDR_INVALID;
+				t->rx_dma = XFER_DMAADDR_INVALID;
+				return -ENOMEM;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static void s3c64xx_spi_unmap_mssg(struct s3c64xx_spi_driver_data *sdd,
+						struct spi_message *msg)
+{
+	struct device *dev = &sdd->pdev->dev;
+	struct spi_transfer *t;
+
+	if (msg->is_dma_mapped)
+		return;
+
+	list_for_each_entry(t, &msg->transfers, transfer_list) {
+
+		if (t->rx_buf != NULL && t->rx_dma != XFER_DMAADDR_INVALID)
+			dma_unmap_single(dev, t->rx_dma,
+						t->len, DMA_FROM_DEVICE);
+
+		if (t->tx_buf != NULL && t->tx_dma != XFER_DMAADDR_INVALID)
+			dma_unmap_single(dev, t->tx_dma,
+						t->len, DMA_TO_DEVICE);
+	}
+}
+
+static void handle_msg(struct s3c64xx_spi_driver_data *sdd,
+					struct spi_message *msg)
+{
+	struct spi_device *spi = msg->spi;
+	struct spi_transfer *xfer;
+	int status = 0, cs_toggle = 0;
+	u32 speed, val;
+	u8 bpw;
+
+	/* If Master's(controller) state differs from that needed by Slave */
+	if ((sdd->cur_speed != spi->max_speed_hz)
+			|| (sdd->cur_mode != spi->mode)
+			|| (sdd->cur_bpw != spi->bits_per_word)) {
+		sdd->cur_bpw = spi->bits_per_word;
+		sdd->cur_speed = spi->max_speed_hz;
+		sdd->cur_mode = spi->mode;
+		s3c64xx_spi_config(sdd);
+	}
+
+	/* Map all the transfers if needed */
+	if (s3c64xx_spi_map_mssg(sdd, msg)) {
+		dev_err(&spi->dev,
+			"Xfer: Unable to map message buffers!\n");
+		status = -ENOMEM;
+		goto out;
+	}
+
+	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
+
+		flush_fifo(sdd);
+
+		INIT_COMPLETION(sdd->xfer_completion);
+
+		/* Only BPW and Speed may change across transfers */
+		bpw = xfer->bits_per_word ? : spi->bits_per_word;
+		speed = xfer->speed_hz ? : spi->max_speed_hz;
+
+		if (bpw != sdd->cur_bpw || speed != sdd->cur_speed) {
+			sdd->cur_bpw = bpw;
+			sdd->cur_speed = speed;
+			s3c64xx_spi_config(sdd);
+		}
+
+		/* Pending only which is to be done */
+		sdd->rx_done = PASS;
+		sdd->tx_done = PASS;
+
+		enable_datapath(sdd, spi, xfer);
+
+		/* Slave Select */
+		enable_cs(sdd, spi);
+
+		status = wait_for_xfer(sdd, xfer);
+		if (status) {
+			dev_err(&spi->dev, "Xfer: error(%d)!\n", status);
+			dev_err(&spi->dev,
+				"rx-%d tx-%d res:rx-%c tx-%c len-%d\n",
+				xfer->rx_buf ? 1 : 0, xfer->tx_buf ? 1 : 0,
+				sdd->rx_done == PASS ? 'p' : 'f',
+				sdd->tx_done == PASS ? 'p' : 'f',
+				xfer->len);
+			flush_dma(sdd, xfer);
+			goto out;
+		}
+
+		if (xfer->delay_usecs)
+			udelay(xfer->delay_usecs);
+
+		if (xfer->cs_change) {
+			/* Hint that the next mssg is gonna be
+			   for the same device */
+			if (list_is_last(&xfer->transfer_list,
+						&msg->transfers))
+				cs_toggle = 1;
+			else
+				disable_cs(sdd, spi);
+		}
+
+		msg->actual_length += xfer->len;
+	}
+
+out:
+	/* Quiese the signals */
+	S3C64XX_SPI_DEACT(sdd);
+
+	/* Interrupts Disable */
+	writel(0, sdd->regs + S3C64XX_SPI_INT_EN);
+
+	/* Tx/Rx Disable */
+	val = readl(sdd->regs + S3C64XX_SPI_CH_CFG);
+	val &= ~(S3C64XX_SPI_CH_RXCH_ON | S3C64XX_SPI_CH_TXCH_ON);
+	writel(val, sdd->regs + S3C64XX_SPI_CH_CFG);
+
+	/* DMA Disable*/
+	val = readl(sdd->regs + S3C64XX_SPI_MODE_CFG);
+	val &= ~(S3C64XX_SPI_MODE_TXDMA_ON | S3C64XX_SPI_MODE_RXDMA_ON);
+	writel(val, sdd->regs + S3C64XX_SPI_MODE_CFG);
+
+	if (!cs_toggle || status)
+		disable_cs(sdd, spi);
+	else
+		sdd->tgl_spi = spi;
+
+	s3c64xx_spi_unmap_mssg(sdd, msg);
+
+	msg->status = status;
+	if (msg->complete)
+		msg->complete(msg->context);
+}
+
+static int acquire_dma(struct s3c64xx_spi_driver_data *sdd)
+{
+	if (s3c2410_dma_request(sdd->rx_dmach,
+					&s3c64xx_spi_dma_client, NULL) < 0) {
+		dev_err(&sdd->pdev->dev, "cannot get RxDMA\n");
+		return 0;
+	}
+	s3c2410_dma_set_buffdone_fn(sdd->rx_dmach, s3c64xx_spi_dma_rxcb);
+	s3c2410_dma_devconfig(sdd->rx_dmach, S3C2410_DMASRC_HW,
+					sdd->sfr_start + S3C64XX_SPI_RX_DATA);
+
+	if (s3c2410_dma_request(sdd->tx_dmach,
+					&s3c64xx_spi_dma_client, NULL) < 0) {
+		dev_err(&sdd->pdev->dev, "cannot get TxDMA\n");
+		s3c2410_dma_free(sdd->rx_dmach, &s3c64xx_spi_dma_client);
+		return 0;
+	}
+	s3c2410_dma_set_buffdone_fn(sdd->tx_dmach, s3c64xx_spi_dma_txcb);
+	s3c2410_dma_devconfig(sdd->tx_dmach, S3C2410_DMASRC_MEM,
+					sdd->sfr_start + S3C64XX_SPI_TX_DATA);
+
+	return 1;
+}
+
+static void s3c64xx_spi_work(struct work_struct *work)
+{
+	struct s3c64xx_spi_driver_data *sdd = container_of(work,
+					struct s3c64xx_spi_driver_data, work);
+	unsigned long flags;
+
+	/* Acquire DMA channels */
+	while (!acquire_dma(sdd))
+		msleep(10);
+
+	spin_lock_irqsave(&sdd->lock, flags);
+
+	while (!list_empty(&sdd->queue)
+				&& !(atomic_read(&sdd->state) & SUSPND)) {
+
+		struct spi_message *msg;
+
+		msg = container_of(sdd->queue.next, struct spi_message, queue);
+
+		list_del_init(&msg->queue);
+
+		/* Start with all ERROR flags cleared */
+		atomic_set(&sdd->state, atomic_read(&sdd->state) & ~ERRS);
+		/* Set Xfer busy flag */
+		atomic_set(&sdd->state, atomic_read(&sdd->state) | XFERBUSY);
+
+		spin_unlock_irqrestore(&sdd->lock, flags);
+
+		handle_msg(sdd, msg);
+
+		spin_lock_irqsave(&sdd->lock, flags);
+
+		atomic_set(&sdd->state, atomic_read(&sdd->state) & ~XFERBUSY);
+	}
+
+	spin_unlock_irqrestore(&sdd->lock, flags);
+
+	/* Free DMA channels */
+	s3c2410_dma_free(sdd->tx_dmach, &s3c64xx_spi_dma_client);
+	s3c2410_dma_free(sdd->rx_dmach, &s3c64xx_spi_dma_client);
+}
+
+static int s3c64xx_spi_transfer(struct spi_device *spi,
+						struct spi_message *msg)
+{
+	struct s3c64xx_spi_driver_data *sdd;
+	unsigned long flags;
+
+	sdd = spi_master_get_devdata(spi->master);
+
+	spin_lock_irqsave(&sdd->lock, flags);
+
+	if (atomic_read(&sdd->state) & SUSPND) {
+		spin_unlock_irqrestore(&sdd->lock, flags);
+		return -ESHUTDOWN;
+	}
+
+	msg->actual_length = 0;
+	msg->status = -EINPROGRESS;
+
+	list_add_tail(&msg->queue, &sdd->queue);
+
+	queue_work(sdd->workqueue, &sdd->work);
+
+	spin_unlock_irqrestore(&sdd->lock, flags);
+
+	return 0;
+}
+
+/*
+ * Here we only check the validity of requested configuration
+ * and save the configuration in a local data-structure.
+ * The controller is actually configured only just before we
+ * get a message to transfer.
+ */
+static int s3c64xx_spi_setup(struct spi_device *spi)
+{
+	struct s3c64xx_spi_csinfo *cs = spi->controller_data;
+	struct s3c64xx_spi_driver_data *sdd;
+	struct s3c64xx_spi_cntrlr_info *sci;
+	struct spi_message *msg;
+	unsigned int psr;
+
+	if (cs == NULL || cs->set_level == NULL) {
+		dev_err(&spi->dev, "No CS for SPI(%d)\n", spi->chip_select);
+		return -ENODEV;
+	}
+
+	sdd = spi_master_get_devdata(spi->master);
+	sci = sdd->cntrlr_info;
+
+	spin_lock(&sdd->lock);
+
+	list_for_each_entry(msg, &sdd->queue, queue) {
+		/* Is some mssg is already queued for this device */
+		if (msg->spi == spi) {
+			dev_err(&spi->dev,
+				"setup: attempt while mssg in queue!\n");
+			spin_unlock(&sdd->lock);
+			return -EBUSY;
+		}
+	}
+
+	if (atomic_read(&sdd->state) & SUSPND) {
+		spin_unlock(&sdd->lock);
+		dev_err(&spi->dev,
+			"setup: SPI-%d not active!\n", spi->master->bus_num);
+		return -ESHUTDOWN;
+	}
+
+	spin_unlock(&sdd->lock);
+
+	if ((spi->bits_per_word != 8)
+			&& (spi->bits_per_word != 16)
+			&& (spi->bits_per_word != 32)) {
+		dev_err(&spi->dev, "setup: %dbits/wrd not supported!\n",
+							spi->bits_per_word);
+		return -EINVAL;
+	}
+
+	if (spi->max_speed_hz < sdd->min_speed) {
+		dev_err(&spi->dev, "minimum possible speed is %uhz\n",
+							sdd->min_speed);
+		return -EINVAL;
+	}
+
+	if (spi->max_speed_hz > sdd->max_speed)
+		spi->max_speed_hz = sdd->max_speed;
+
+	psr = clk_get_rate(sci->src_clk) / spi->max_speed_hz / 2 - 1;
+	psr &= 0xff;
+	if (spi->max_speed_hz < clk_get_rate(sci->src_clk) / 2 / (psr + 1))
+		psr = (psr+1) & 0xff;
+
+	spi->max_speed_hz = clk_get_rate(sci->src_clk) / 2 / (psr + 1);
+
+	/* setup() returns with device de-selected */
+	disable_cs(sdd, spi);
+
+	return 0;
+}
+
+static void s3c64xx_spi_hwinit(struct s3c64xx_spi_driver_data *sdd, int channel)
+{
+	struct s3c64xx_spi_cntrlr_info *sci = sdd->cntrlr_info;
+	unsigned int val;
+
+	sdd->cur_speed = 0;
+	sdd->max_speed = clk_get_rate(sci->src_clk) / 2 / (0x0 + 1);
+	sdd->min_speed = clk_get_rate(sci->src_clk) / 2 / (0xff + 1);
+
+	writel(S3C64XX_SPI_SLAVE_SIG_INACT,
+				sdd->regs + S3C64XX_SPI_SLAVE_SEL);
+
+	/* Disable Interrupts */
+	writel(0, sdd->regs + S3C64XX_SPI_INT_EN);
+
+	writel(sci->src_clk_nr << S3C64XX_SPI_CLKSEL_SRCSHFT,
+				sdd->regs + S3C64XX_SPI_CLK_CFG);
+	writel(0, sdd->regs + S3C64XX_SPI_MODE_CFG);
+	writel(0, sdd->regs + S3C64XX_SPI_PACKET_CNT);
+
+	/* Clear any irq pending bits */
+	writel(readl(sdd->regs + S3C64XX_SPI_PENDING_CLR),
+				sdd->regs + S3C64XX_SPI_PENDING_CLR);
+
+	writel(0, sdd->regs + S3C64XX_SPI_SWAP_CFG);
+
+	val = readl(sdd->regs + S3C64XX_SPI_MODE_CFG);
+	val &= ~S3C64XX_SPI_MODE_4BURST;
+	val &= ~(S3C64XX_SPI_MAX_TRAILCNT << S3C64XX_SPI_TRAILCNT_OFF);
+	val |= (S3C64XX_SPI_TRAILCNT << S3C64XX_SPI_TRAILCNT_OFF);
+	writel(val, sdd->regs + S3C64XX_SPI_MODE_CFG);
+}
+
+static int __init s3c64xx_spi_probe(struct platform_device *pdev)
+{
+	struct resource	*mem_res, *irq_res, *dmatx_res, *dmarx_res;
+	struct s3c64xx_spi_driver_data *sdd;
+	struct s3c64xx_spi_cntrlr_info *sci;
+	struct spi_master *master;
+	int ret;
+
+	if (pdev->id < 0) {
+		dev_err(&pdev->dev,
+				"Invalid platform device id-%d\n", pdev->id);
+		return -ENODEV;
+	}
+
+	if (pdev->dev.platform_data == NULL) {
+		dev_err(&pdev->dev, "platform_data missing!\n");
+		return -ENODEV;
+	}
+
+	/* Check for availability of necessary resource */
+
+	dmatx_res = platform_get_resource(pdev, IORESOURCE_DMA, 0);
+	if (dmatx_res == NULL) {
+		dev_err(&pdev->dev, "Unable to get SPI-Tx dma resource\n");
+		return -ENXIO;
+	}
+
+	dmarx_res = platform_get_resource(pdev, IORESOURCE_DMA, 1);
+	if (dmarx_res == NULL) {
+		dev_err(&pdev->dev, "Unable to get SPI-Rx dma resource\n");
+		return -ENXIO;
+	}
+
+	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (mem_res == NULL) {
+		dev_err(&pdev->dev, "Unable to get SPI MEM resource\n");
+		return -ENXIO;
+	}
+
+	irq_res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+	if (irq_res == NULL) {
+		dev_err(&pdev->dev, "Unable to get SPI IRQ resource\n");
+		return -ENXIO;
+	}
+
+	master = spi_alloc_master(&pdev->dev,
+				sizeof(struct s3c64xx_spi_driver_data));
+	if (master == NULL) {
+		dev_err(&pdev->dev, "Unable to allocate SPI Master\n");
+		return -ENOMEM;
+	}
+
+	sci = pdev->dev.platform_data;
+
+	platform_set_drvdata(pdev, master);
+
+	sdd = spi_master_get_devdata(master);
+	sdd->master = master;
+	sdd->cntrlr_info = sci;
+	sdd->pdev = pdev;
+	sdd->sfr_start = mem_res->start;
+	sdd->tx_dmach = dmatx_res->start;
+	sdd->rx_dmach = dmarx_res->start;
+
+	sdd->cur_bpw = 8;
+
+	master->bus_num = pdev->id;
+	master->setup = s3c64xx_spi_setup;
+	master->transfer = s3c64xx_spi_transfer;
+	master->num_chipselect = sci->num_cs;
+	master->dma_alignment = 4;
+	/* the spi->mode bits understood by this driver: */
+	master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
+
+	if (request_mem_region(mem_res->start,
+			resource_size(mem_res), pdev->name) == NULL) {
+		dev_err(&pdev->dev, "Req mem region failed\n");
+		ret = -ENXIO;
+		goto err0;
+	}
+
+	sdd->regs = ioremap(mem_res->start, resource_size(mem_res));
+	if (sdd->regs == NULL) {
+		dev_err(&pdev->dev, "Unable to remap IO\n");
+		ret = -ENXIO;
+		goto err1;
+	}
+
+	ret = request_irq(irq_res->start, s3c64xx_spi_interrupt,
+				IRQF_SHARED, dev_name(&pdev->dev), sdd);
+	if (ret) {
+		dev_err(&pdev->dev, "Unable to acquire IRQ\n");
+		ret = -EBUSY;
+		goto err2;
+	}
+
+	if (sci->cfg_gpio == NULL || sci->cfg_gpio(pdev)) {
+		dev_err(&pdev->dev, "Unable to config gpio\n");
+		ret = -EBUSY;
+		goto err3;
+	}
+
+	/* Setup clocks */
+	sdd->clk = clk_get(&pdev->dev, "spi");
+	if (IS_ERR(sdd->clk)) {
+		dev_err(&pdev->dev, "Unable to acquire clock 'spi'\n");
+		ret = PTR_ERR(sdd->clk);
+		goto err4;
+	}
+
+	if (clk_enable(sdd->clk)) {
+		dev_err(&pdev->dev, "Couldn't enable clock 'spi'\n");
+		ret = -EBUSY;
+		goto err5;
+	}
+
+	if (sci->src_clk_nr == S3C64XX_SPI_SRCCLK_PCLK)
+		sci->src_clk = sdd->clk;
+	else
+		sci->src_clk = clk_get(&pdev->dev, sci->src_clk_name);
+	if (IS_ERR(sci->src_clk)) {
+		dev_err(&pdev->dev,
+			"Unable to acquire clock '%s'\n", sci->src_clk_name);
+		ret = PTR_ERR(sci->src_clk);
+		goto err6;
+	}
+
+	if (sci->src_clk != sdd->clk && clk_enable(sci->src_clk)) {
+		dev_err(&pdev->dev, "Couldn't enable clock '%s'\n",
+							sci->src_clk_name);
+		ret = -EBUSY;
+		goto err7;
+	}
+
+	sdd->workqueue = create_singlethread_workqueue(
+						dev_name(master->dev.parent));
+	if (sdd->workqueue == NULL) {
+		dev_err(&pdev->dev, "Unable to create workqueue\n");
+		ret = -ENOMEM;
+		goto err8;
+	}
+
+	/* Setup Deufult Mode */
+	s3c64xx_spi_hwinit(sdd, pdev->id);
+
+	spin_lock_init(&sdd->lock);
+	init_completion(&sdd->xfer_completion);
+	INIT_WORK(&sdd->work, s3c64xx_spi_work);
+	INIT_LIST_HEAD(&sdd->queue);
+
+	if (spi_register_master(master)) {
+		dev_err(&pdev->dev, "cannot register SPI master\n");
+		ret = -EBUSY;
+		goto err9;
+	}
+
+	dev_dbg(&pdev->dev, "Samsung SoC SPI Driver loaded for Bus SPI-%d \
+					with %d Slaves attached\n",
+					pdev->id, master->num_chipselect);
+	dev_dbg(&pdev->dev, "\tIrq=%d\tIOmem=[0x%x-0x%x]\
+					\tDMA=[Rx-%d, Tx-%d]\n",
+					irq_res->start,
+					mem_res->end, mem_res->start,
+					sdd->rx_dmach, sdd->tx_dmach);
+
+	return 0;
+
+err9:
+	destroy_workqueue(sdd->workqueue);
+err8:
+	if (sci->src_clk != sdd->clk)
+		clk_disable(sci->src_clk);
+err7:
+	if (sci->src_clk != sdd->clk)
+		clk_put(sci->src_clk);
+err6:
+	clk_disable(sdd->clk);
+err5:
+	clk_put(sdd->clk);
+err4:
+err3:
+	free_irq(irq_res->start, sdd);
+err2:
+	iounmap((void *) sdd->regs);
+err1:
+	release_mem_region(mem_res->start, resource_size(mem_res));
+err0:
+	platform_set_drvdata(pdev, NULL);
+	spi_master_put(master);
+
+	return ret;
+}
+
+static int s3c64xx_spi_remove(struct platform_device *pdev)
+{
+	struct spi_master *master = spi_master_get(platform_get_drvdata(pdev));
+	struct s3c64xx_spi_driver_data *sdd = spi_master_get_devdata(master);
+	struct s3c64xx_spi_cntrlr_info *sci = sdd->cntrlr_info;
+	struct resource	*mem_res, *irq_res;
+
+	spi_unregister_master(master);
+
+	destroy_workqueue(sdd->workqueue);
+
+	if (sci->src_clk != sdd->clk)
+		clk_disable(sci->src_clk);
+
+	if (sci->src_clk != sdd->clk)
+		clk_put(sci->src_clk);
+
+	clk_disable(sdd->clk);
+	clk_put(sdd->clk);
+
+	irq_res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+	free_irq(irq_res->start, sdd);
+
+	iounmap((void *) sdd->regs);
+
+	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	release_mem_region(mem_res->start, resource_size(mem_res));
+
+	platform_set_drvdata(pdev, NULL);
+	spi_master_put(master);
+
+	return 0;
+}
+
+#if defined(CONFIG_PM)
+static int s3c64xx_spi_suspend(struct platform_device *pdev, pm_message_t state)
+{
+	struct spi_master *master = spi_master_get(platform_get_drvdata(pdev));
+	struct s3c64xx_spi_driver_data *sdd = spi_master_get_devdata(master);
+	struct s3c64xx_spi_cntrlr_info *sci = sdd->cntrlr_info;
+	struct s3c64xx_spi_csinfo *cs;
+
+	atomic_set(&sdd->state, atomic_read(&sdd->state) | SUSPND);
+
+	while (atomic_read(&sdd->state) & XFERBUSY)
+		msleep(10);
+
+	/* Disable the clock */
+	if (sci->src_clk != sdd->clk)
+		clk_disable(sci->src_clk);
+
+	clk_disable(sdd->clk);
+
+	sdd->cur_speed = 0; /* Output Clock is stopped */
+
+	return 0;
+}
+
+static int s3c64xx_spi_resume(struct platform_device *pdev)
+{
+	struct spi_master *master = spi_master_get(platform_get_drvdata(pdev));
+	struct s3c64xx_spi_driver_data *sdd = spi_master_get_devdata(master);
+	struct s3c64xx_spi_cntrlr_info *sci = sdd->cntrlr_info;
+
+	sci->cfg_gpio(pdev);
+
+	/* Enable the clock */
+	if (sci->src_clk != sdd->clk)
+		clk_enable(sci->src_clk);
+
+	clk_enable(sdd->clk);
+
+	s3c64xx_spi_hwinit(sdd, pdev->id);
+
+	atomic_set(&sdd->state, atomic_read(&sdd->state) & ~SUSPND);
+
+	return 0;
+}
+#else
+#define s3c64xx_spi_suspend	NULL
+#define s3c64xx_spi_resume	NULL
+#endif /* CONFIG_PM */
+
+static struct platform_driver s3c64xx_spi_driver = {
+	.driver = {
+		.name	= "s3c64xx-spi",
+		.owner = THIS_MODULE,
+	},
+	.remove = s3c64xx_spi_remove,
+	.suspend = s3c64xx_spi_suspend,
+	.resume = s3c64xx_spi_resume,
+};
+MODULE_ALIAS("platform:s3c64xx-spi");
+
+static int __init s3c64xx_spi_init(void)
+{
+	return platform_driver_probe(&s3c64xx_spi_driver, s3c64xx_spi_probe);
+}
+module_init(s3c64xx_spi_init);
+
+static void __exit s3c64xx_spi_exit(void)
+{
+	platform_driver_unregister(&s3c64xx_spi_driver);
+}
+module_exit(s3c64xx_spi_exit);
+
+MODULE_AUTHOR("Jaswinder Singh <jassi.brar@samsung.com>");
+MODULE_DESCRIPTION("S3C64XX SPI Controller Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/spi/spi_s3c64xx.h b/drivers/spi/spi_s3c64xx.h
new file mode 100644
index 0000000..c899c94
--- /dev/null
+++ b/drivers/spi/spi_s3c64xx.h
@@ -0,0 +1,187 @@
+/* linux/drivers/spi/spi_s3c64xx.h
+ *
+ * Copyright (C) 2009 Samsung Electronics Ltd.
+ *	Jaswinder Singh <jassi.brar@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+
+#ifndef __S3C64XX_SPI_H
+#define __S3C64XX_SPI_H
+
+#define S3C64XX_SPI_CH_CFG		0x00
+#define S3C64XX_SPI_CLK_CFG		0x04
+#define S3C64XX_SPI_MODE_CFG	0x08
+#define S3C64XX_SPI_SLAVE_SEL	0x0C
+#define S3C64XX_SPI_INT_EN		0x10
+#define S3C64XX_SPI_STATUS		0x14
+#define S3C64XX_SPI_TX_DATA		0x18
+#define S3C64XX_SPI_RX_DATA		0x1C
+#define S3C64XX_SPI_PACKET_CNT	0x20
+#define S3C64XX_SPI_PENDING_CLR	0x24
+#define S3C64XX_SPI_SWAP_CFG	0x28
+#define S3C64XX_SPI_FB_CLK		0x2C
+
+#define S3C64XX_SPI_CH_HS_EN		(1<<6)	/* High Speed Enable */
+#define S3C64XX_SPI_CH_SW_RST		(1<<5)
+#define S3C64XX_SPI_CH_SLAVE		(1<<4)
+#define S3C64XX_SPI_CPOL_L		(1<<3)
+#define S3C64XX_SPI_CPHA_B		(1<<2)
+#define S3C64XX_SPI_CH_RXCH_ON		(1<<1)
+#define S3C64XX_SPI_CH_TXCH_ON		(1<<0)
+
+#define S3C64XX_SPI_CLKSEL_SRCMSK	(3<<9)
+#define S3C64XX_SPI_CLKSEL_SRCSHFT	(9)
+#define S3C64XX_SPI_ENCLK_ENABLE	(1<<8)
+
+#define S3C64XX_SPI_MODE_CH_TSZ_BYTE		(0<<29)
+#define S3C64XX_SPI_MODE_CH_TSZ_HALFWORD	(1<<29)
+#define S3C64XX_SPI_MODE_CH_TSZ_WORD		(2<<29)
+#define S3C64XX_SPI_MODE_CH_TSZ_MASK		(3<<29)
+#define S3C64XX_SPI_MODE_BUS_TSZ_BYTE		(0<<17)
+#define S3C64XX_SPI_MODE_BUS_TSZ_HALFWORD	(1<<17)
+#define S3C64XX_SPI_MODE_BUS_TSZ_WORD		(2<<17)
+#define S3C64XX_SPI_MODE_BUS_TSZ_MASK		(3<<17)
+#define S3C64XX_SPI_MODE_RXDMA_ON		(1<<2)
+#define S3C64XX_SPI_MODE_TXDMA_ON		(1<<1)
+#define S3C64XX_SPI_MODE_4BURST			(1<<0)
+
+#define S3C64XX_SPI_SLAVE_AUTO			(1<<1)
+#define S3C64XX_SPI_SLAVE_SIG_INACT		(1<<0)
+
+#define S3C64XX_SPI_ACT(c) writel(readl((c)->regs + S3C64XX_SPI_SLAVE_SEL) \
+					& ~S3C64XX_SPI_SLAVE_SIG_INACT, \
+					(c)->regs + S3C64XX_SPI_SLAVE_SEL)
+
+#define S3C64XX_SPI_DEACT(c) writel(readl((c)->regs + S3C64XX_SPI_SLAVE_SEL) \
+					| S3C64XX_SPI_SLAVE_SIG_INACT, \
+					(c)->regs + S3C64XX_SPI_SLAVE_SEL)
+
+#define S3C64XX_SPI_INT_TRAILING_EN		(1<<6)
+#define S3C64XX_SPI_INT_RX_OVERRUN_EN		(1<<5)
+#define S3C64XX_SPI_INT_RX_UNDERRUN_EN		(1<<4)
+#define S3C64XX_SPI_INT_TX_OVERRUN_EN		(1<<3)
+#define S3C64XX_SPI_INT_TX_UNDERRUN_EN		(1<<2)
+#define S3C64XX_SPI_INT_RX_FIFORDY_EN		(1<<1)
+#define S3C64XX_SPI_INT_TX_FIFORDY_EN		(1<<0)
+
+#define S3C64XX_SPI_ST_RX_OVERRUN_ERR		(1<<5)
+#define S3C64XX_SPI_ST_RX_UNDERRUN_ERR	(1<<4)
+#define S3C64XX_SPI_ST_TX_OVERRUN_ERR		(1<<3)
+#define S3C64XX_SPI_ST_TX_UNDERRUN_ERR	(1<<2)
+#define S3C64XX_SPI_ST_RX_FIFORDY		(1<<1)
+#define S3C64XX_SPI_ST_TX_FIFORDY		(1<<0)
+
+#define S3C64XX_SPI_PACKET_CNT_EN		(1<<16)
+
+#define S3C64XX_SPI_PND_TX_UNDERRUN_CLR		(1<<4)
+#define S3C64XX_SPI_PND_TX_OVERRUN_CLR		(1<<3)
+#define S3C64XX_SPI_PND_RX_UNDERRUN_CLR		(1<<2)
+#define S3C64XX_SPI_PND_RX_OVERRUN_CLR		(1<<1)
+#define S3C64XX_SPI_PND_TRAILING_CLR		(1<<0)
+
+#define S3C64XX_SPI_SWAP_RX_HALF_WORD		(1<<7)
+#define S3C64XX_SPI_SWAP_RX_BYTE		(1<<6)
+#define S3C64XX_SPI_SWAP_RX_BIT			(1<<5)
+#define S3C64XX_SPI_SWAP_RX_EN			(1<<4)
+#define S3C64XX_SPI_SWAP_TX_HALF_WORD		(1<<3)
+#define S3C64XX_SPI_SWAP_TX_BYTE		(1<<2)
+#define S3C64XX_SPI_SWAP_TX_BIT			(1<<1)
+#define S3C64XX_SPI_SWAP_TX_EN			(1<<0)
+
+#define S3C64XX_SPI_FBCLK_MSK		(3<<0)
+
+#define S3C64XX_SPI_ST_TRLCNTZ(v, i) ((((v) >> (i)->rx_lvl_offset) & \
+					(((i)->fifo_lvl_mask + 1))) \
+					? 1 : 0)
+
+#define S3C64XX_SPI_ST_TX_DONE(v, i) ((((v) >> (i)->rx_lvl_offset) & \
+					(((i)->fifo_lvl_mask + 1) << 1)) \
+					? 1 : 0)
+#define TX_FIFO_LVL(v, i) (((v) >> 6) & (i)->fifo_lvl_mask)
+#define RX_FIFO_LVL(v, i) (((v) >> (i)->rx_lvl_offset) & (i)->fifo_lvl_mask)
+
+#define S3C64XX_SPI_MAX_TRAILCNT	0x3ff
+#define S3C64XX_SPI_TRAILCNT_OFF	19
+
+#define S3C64XX_SPI_TRAILCNT		S3C64XX_SPI_MAX_TRAILCNT
+
+#define SUSPND     (1<<0)
+#define XFERBUSY   (1<<1)
+#define IRQERR     (1<<2)
+#define TOUTERR    (1<<3)
+#define INTERR     (1<<4)
+#define IOERR      (1<<5)
+#define ERRS       (IRQERR | TOUTERR | INTERR | IOERR)
+
+enum xfer_state {
+	PASS,
+	FAIL,
+	BUSY,
+};
+
+/**
+ * struct 3c64xx_spi_driver_data - Runtime info holder for SPI driver.
+ * @clk: Pointer to the spi clock.
+ * @master: Pointer to the SPI Protocol master.
+ * @workqueue: Work queue for the SPI xfer requests.
+ * @cntrlr_info: Platform specific data for the controller this driver manages.
+ * @tgl_spi: Pointer to the last CS left untoggled by the cs_change hint.
+ * @work: Work
+ * @queue: To log SPI xfer requests.
+ * @lock: Controller specific lock.
+ * @state: Set of FLAGS to indicate status.
+ * @rx_dmach: Controller's DMA channel for Rx.
+ * @tx_dmach: Controller's DMA channel for Tx.
+ * @sfr_start: BUS address of SPI controller regs.
+ * @regs: Pointer to ioremap'ed controller registers.
+ * @tx_dma_cpu: CPU address of the DMA alloc'ed Tx buffer.
+ * @rx_dma_cpu: CPU address of the DMA alloc'ed Tx buffer.
+ * @tx_dma_phys: PHYS address of the DMA alloc'ed Tx buffer.
+ * @rx_dma_phys: PHYS address of the DMA alloc'ed Rx buffer.
+ * @xfer_completion: To indicate completion of xfer task.
+ * @tx_done: FLAG to indicate status of TX.
+ * @rx_done: FLAG to indicate status of RX.
+ * @max_speed: Maximum possible SPI clock given the source of clock.
+ * @min_speed: Minimum possible SPI clock given the source of clock.
+ * @cur_mode: Stores the active configuration of the controller.
+ * @cur_bpw: Stores the active bits per word settings.
+ * @cur_speed: Stores the active xfer clock speed.
+ */
+struct s3c64xx_spi_driver_data {
+	void __iomem                    *regs;
+	struct clk                      *clk;
+	struct platform_device          *pdev;
+	struct spi_master               *master;
+	struct workqueue_struct	        *workqueue;
+	struct s3c64xx_spi_cntrlr_info  *cntrlr_info;
+	struct spi_device               *tgl_spi;
+	struct work_struct              work;
+	struct list_head                queue;
+	spinlock_t                      lock;
+	atomic_t                        state;
+	enum dma_ch                     rx_dmach;
+	enum dma_ch                     tx_dmach;
+	unsigned long                   sfr_start;
+	struct completion               xfer_completion;
+	enum xfer_state                 tx_done;
+	enum xfer_state                 rx_done;
+	unsigned                        cur_mode, cur_bpw;
+	unsigned                        max_speed, min_speed;
+	unsigned                        cur_speed;
+};
+
+#endif 	/* __S3C64XX_SPI_H */
-- 
1.6.2.5

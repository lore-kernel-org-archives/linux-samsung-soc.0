From: thomas.ab@samsung.com
Subject: [PATCH] S3C: ide: Add Samsung S3C IDE controller driver
Date: Thu,  8 Oct 2009 15:59:28 +0900
Message-ID: <1254985168-21720-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:54862 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754231AbZJHHBW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Oct 2009 03:01:22 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Thomas Abraham <thomas.ab@samsung.com>, Abhilash Kesavan <a.kesavan@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

This patch adds Samsung S3C IDE controller driver. This IDE controller
currently supports PIO mode. UDMA mode support will be added later.

Note: This patch depends on the following patch set.
[PATCH 0/7] S3C64XX: Add platform support for Samsung S3C IDE controller driver

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 drivers/ide/Kconfig    |   14 ++
 drivers/ide/Makefile   |    1 +
 drivers/ide/ide-proc.c |    1 +
 drivers/ide/s3c-ide.c  |  486 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/ide.h    |    2 +-
 5 files changed, 503 insertions(+), 1 deletions(-)
 create mode 100644 drivers/ide/s3c-ide.c

diff --git a/drivers/ide/Kconfig b/drivers/ide/Kconfig
index 9a5d0aa..1c9580d 100644
--- a/drivers/ide/Kconfig
+++ b/drivers/ide/Kconfig
@@ -292,6 +292,20 @@ config BLK_DEV_IDEPNP
 	  would like the kernel to automatically detect and activate
 	  it, say Y here.
 
+config BLK_DEV_IDE_S3C
+        tristate "Samsung S3C IDE Controller"
+	depends on PLAT_S3C64XX
+        help
+          Say Y here if you want to support using CF controller on SMDK(Samsung)
+	  development board. It will be configured for true IDE mode.
+
+config BLK_DEV_IDE_S3C_PIO
+	bool "Use PIO Mode"
+	depends on BLK_DEV_IDE_S3C
+	select IDE_XFER_MODE
+	help
+	  Say Y here if you want to support PIO Mode.
+
 config BLK_DEV_IDEDMA_SFF
 	bool
 
diff --git a/drivers/ide/Makefile b/drivers/ide/Makefile
index 81df925..a64a723 100644
--- a/drivers/ide/Makefile
+++ b/drivers/ide/Makefile
@@ -64,6 +64,7 @@ obj-$(CONFIG_BLK_DEV_SIIMAGE)		+= siimage.o
 obj-$(CONFIG_BLK_DEV_SIS5513)		+= sis5513.o
 obj-$(CONFIG_BLK_DEV_SL82C105)		+= sl82c105.o
 obj-$(CONFIG_BLK_DEV_SLC90E66)		+= slc90e66.o
+obj-$(CONFIG_BLK_DEV_IDE_S3C)		+= s3c-ide.o
 obj-$(CONFIG_BLK_DEV_TC86C001)		+= tc86c001.o
 obj-$(CONFIG_BLK_DEV_TRIFLEX)		+= triflex.o
 obj-$(CONFIG_BLK_DEV_TRM290)		+= trm290.o
diff --git a/drivers/ide/ide-proc.c b/drivers/ide/ide-proc.c
index 3242698..d18478f 100644
--- a/drivers/ide/ide-proc.c
+++ b/drivers/ide/ide-proc.c
@@ -51,6 +51,7 @@ static int proc_ide_read_imodel
 	case ide_au1xxx:	name = "au1xxx";	break;
 	case ide_palm3710:      name = "palm3710";      break;
 	case ide_acorn:		name = "acorn";		break;
+	case ide_s3c: 		name = "s3c-ide";	break;
 	default:		name = "(unknown)";	break;
 	}
 	len = sprintf(page, "%s\n", name);
diff --git a/drivers/ide/s3c-ide.c b/drivers/ide/s3c-ide.c
new file mode 100644
index 0000000..5ebfe98
--- /dev/null
+++ b/drivers/ide/s3c-ide.c
@@ -0,0 +1,486 @@
+/*
+ * s3c-ide.c - Samsung S3C IDE controller Driver
+ *
+ * Copyright (C) 2009 Samsung Electronics
+ *      http://samsungsemi.com/
+ *
+ * The Samsung S3C IDE controller driver provides low-level support for
+ * interfacing with IDE disks. This supports only PIO mode of operation.
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
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ */
+
+#include <linux/types.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/init.h>
+#include <linux/ide.h>
+#include <linux/sysdev.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <plat/regs-ide.h>
+#include <plat/ide.h>
+
+/*
+ * This structure represents one instance of the IDE controller driver.
+ */
+struct s3c_ide_device {
+	struct platform_device	*pdev;
+	ide_hwif_t 		*hwif;
+	int 			irq;
+	ulong 			piotime[5];
+	void __iomem            *regbase;
+};
+
+/* Global Declarations */
+static struct s3c_ide_device s3c_ide_dev;
+
+#define ide_writel(value, reg) writel(value, ide_dev->regbase + (reg))
+#define ide_readl(reg) readl(ide_dev->regbase + (reg))
+
+/*
+ * This function waits until the IDE controller is able to perform next
+ * read/write operation to the disk.
+ */
+static void wait_for_host_ready(struct s3c_ide_device *ide_dev)
+{
+	u32 count = 1000000;
+	while (ide_readl(S3C_ATA_FIFO_STATUS) >> 28) {
+		if (!(count--)) {
+			dev_err(&ide_dev->pdev->dev,
+			"ide controller not ready for next taskfile operation");
+			return;
+		}
+	}
+}
+
+/*
+ * This function writes to one of the rask file registers.
+ */
+static void s3c_ide_OUTB(ide_hwif_t *hwif, u8 addr, ulong reg)
+{
+	struct s3c_ide_device *ide_dev =
+			(struct s3c_ide_device *)hwif->hwif_data;
+
+	wait_for_host_ready(ide_dev);
+	__raw_writeb(addr, reg);
+}
+
+/*
+ * This function reads from one of the task file registers.
+ */
+static u8 s3c_ide_INB(ide_hwif_t *hwif, ulong reg)
+{
+	struct s3c_ide_device *ide_dev =
+			(struct s3c_ide_device *)hwif->hwif_data;
+	u8 temp;
+
+	wait_for_host_ready(ide_dev);
+	temp = __raw_readb(reg);
+	wait_for_host_ready(ide_dev);
+	temp = __raw_readb(ide_dev->regbase + S3C_ATA_PIO_RDATA);
+	return temp;
+}
+
+/*
+ * The following are ide_tp_ops functions implemented by the IDE
+ * cotnroller driver.
+ */
+static void s3c_ide_exec_command(ide_hwif_t *hwif, u8 cmd)
+{
+	s3c_ide_OUTB(hwif, cmd, hwif->io_ports.command_addr);
+}
+
+static u8 s3c_ide_read_status(ide_hwif_t *hwif)
+{
+	return s3c_ide_INB(hwif, hwif->io_ports.status_addr);
+}
+
+static u8 s3c_ide_read_altstatus(ide_hwif_t *hwif)
+{
+	return s3c_ide_INB(hwif, hwif->io_ports.ctl_addr);
+}
+
+static void s3c_ide_write_devctl(ide_hwif_t *hwif, u8 ctl)
+{
+	s3c_ide_OUTB(hwif, ctl, hwif->io_ports.ctl_addr);
+}
+
+static void s3c_ide_dev_select(ide_drive_t *drive)
+{
+	ide_hwif_t *hwif = drive->hwif;
+	u8 select = drive->select | ATA_DEVICE_OBS;
+	s3c_ide_OUTB(hwif, select, hwif->io_ports.device_addr);
+}
+
+static void s3c_ide_input_data(ide_drive_t *drive, struct ide_cmd *cmd,
+					void *buf, unsigned int len)
+{
+	ide_hwif_t *hwif = drive->hwif;
+	struct s3c_ide_device *ide_dev =
+			(struct s3c_ide_device *)hwif->hwif_data;
+	struct ide_io_ports *io_ports = &hwif->io_ports;
+	unsigned long data_addr = io_ports->data_addr;
+	unsigned int words = (len + 1) >> 1, i;
+	u16 *temp_addr = (u16 *)buf;
+
+	for (i = 0; i < words; i++, temp_addr++) {
+		wait_for_host_ready(ide_dev);
+		*temp_addr = __raw_readw(data_addr);
+		wait_for_host_ready(ide_dev);
+		*temp_addr = __raw_readw(ide_dev->regbase + S3C_ATA_PIO_RDATA);
+	}
+}
+
+static void s3c_ide_output_data(ide_drive_t *drive, struct ide_cmd *cmd,
+					void *buf, unsigned int len)
+{
+	ide_hwif_t *hwif = drive->hwif;
+	struct s3c_ide_device *ide_dev =
+			(struct s3c_ide_device *)hwif->hwif_data;
+	struct ide_io_ports *io_ports = &hwif->io_ports;
+	unsigned long data_addr = io_ports->data_addr;
+	unsigned int words = (len + 1) >> 1, i;
+	u16 *temp_addr = (u16 *)buf;
+
+	for (i = 0; i < words; i++, temp_addr++) {
+		wait_for_host_ready(ide_dev);
+		writel(*temp_addr, data_addr);
+	}
+}
+
+static void s3c_ide_tf_load(ide_drive_t *drive, struct ide_taskfile *tf,
+				u8 valid)
+{
+	ide_hwif_t *hwif = drive->hwif;
+	struct ide_io_ports *io_ports = &hwif->io_ports;
+
+	if (valid & IDE_VALID_FEATURE)
+		s3c_ide_OUTB(hwif, tf->feature, io_ports->feature_addr);
+	if (valid & IDE_VALID_NSECT)
+		s3c_ide_OUTB(hwif, tf->nsect, io_ports->nsect_addr);
+	if (valid & IDE_VALID_LBAL)
+		s3c_ide_OUTB(hwif, tf->lbal, io_ports->lbal_addr);
+	if (valid & IDE_VALID_LBAM)
+		s3c_ide_OUTB(hwif, tf->lbam, io_ports->lbam_addr);
+	if (valid & IDE_VALID_LBAH)
+		s3c_ide_OUTB(hwif, tf->lbah, io_ports->lbah_addr);
+	if (valid & IDE_VALID_DEVICE)
+		s3c_ide_OUTB(hwif, tf->device, io_ports->device_addr);
+}
+
+void s3c_ide_tf_read(ide_drive_t *drive, struct ide_taskfile *tf, u8 valid)
+{
+	ide_hwif_t *hwif = drive->hwif;
+	struct ide_io_ports *io_ports = &hwif->io_ports;
+
+	if (valid & IDE_VALID_ERROR)
+		tf->error  = s3c_ide_INB(hwif, io_ports->feature_addr);
+	if (valid & IDE_VALID_NSECT)
+		tf->nsect  = s3c_ide_INB(hwif, io_ports->nsect_addr);
+	if (valid & IDE_VALID_LBAL)
+		tf->lbal   = s3c_ide_INB(hwif, io_ports->lbal_addr);
+	if (valid & IDE_VALID_LBAM)
+		tf->lbam   = s3c_ide_INB(hwif, io_ports->lbam_addr);
+	if (valid & IDE_VALID_LBAH)
+		tf->lbah   = s3c_ide_INB(hwif, io_ports->lbah_addr);
+	if (valid & IDE_VALID_DEVICE)
+		tf->device = s3c_ide_INB(hwif, io_ports->device_addr);
+}
+
+static void set_ata_enable(struct s3c_ide_device *ide_dev, u8 state)
+{
+	u32 temp = ide_readl(S3C_ATA_CTRL);
+	temp = state ? temp | 1 : temp & ~1;
+	ide_writel(temp , S3C_ATA_CTRL);
+}
+
+static void set_endian_mode(struct s3c_ide_device *ide_dev, u8 mode)
+{
+	u32 reg = ide_readl(S3C_ATA_CFG);
+	reg = mode ? (reg & ~S3C_ATA_CFG_SWAP) : (reg | S3C_ATA_CFG_SWAP);
+	ide_writel(reg, S3C_ATA_CFG);
+}
+
+/*
+ * This function selects the maximum possible transfer speed.
+ */
+static u8 s3c_ide_ratefilter(u8 speed)
+{
+	return min(speed, (u8)XFER_PIO_4);
+}
+
+/*
+ * This function selects the best possible transfer speed.
+ */
+static void s3c_ide_tune_chipset(ide_drive_t *drive, u8 xferspeed)
+{
+	ide_hwif_t *hwif = (ide_hwif_t *)drive->hwif;
+	struct s3c_ide_device *ide_dev =
+			(struct s3c_ide_device *)hwif->hwif_data;
+	u8 speed = s3c_ide_ratefilter(xferspeed);
+
+	/* IORDY is enabled for modes > PIO2 */
+	if (XFER_PIO_0 >= speed && speed <= XFER_PIO_4) {
+		ulong ata_cfg = ide_readl(S3C_ATA_CFG);
+
+		switch (speed) {
+		case XFER_PIO_0:
+		case XFER_PIO_1:
+		case XFER_PIO_2:
+			ata_cfg &= (~S3C_ATA_CFG_IORDYEN);
+			break;
+		case XFER_PIO_3:
+		case XFER_PIO_4:
+			ata_cfg |= S3C_ATA_CFG_IORDYEN;
+			break;
+		}
+
+		ide_writel(ata_cfg, S3C_ATA_CFG);
+		ide_writel(ide_dev->piotime[speed - XFER_PIO_0],
+				S3C_ATA_PIO_TIME);
+	}
+	ide_config_drive_speed(drive, speed);
+}
+
+static void s3c_ide_tune_drive(ide_drive_t *drive, u8 pio)
+{
+	pio = ide_get_best_pio_mode(drive, 255, pio);
+	(void)s3c_ide_tune_chipset(drive, (XFER_PIO_0 + pio));
+}
+
+irqreturn_t s3c_irq_handler(int irq, void *dev_id)
+{
+	ide_hwif_t *hwif = (ide_hwif_t *)dev_id;
+	struct s3c_ide_device *ide_dev =
+			(struct s3c_ide_device *)hwif->hwif_data;
+	u32 reg = ide_readl(S3C_ATA_IRQ);
+
+	ide_writel(reg, S3C_ATA_IRQ);
+	return ide_intr(irq, dev_id);
+}
+
+static void s3c_ide_setup_timing_value(struct s3c_ide_device *ide_dev,
+						u32 clk_rate)
+{
+	uint t1, t2, teoc, i;
+	uint pio_t1[5] = { 70, 50, 30, 30, 30 };
+	uint pio_t2[5] = { 290, 290, 290, 80, 70 };
+	uint pio_teoc[5] = { 20, 20, 10, 10, 10 };
+	ulong cycle_time = (uint) (1000000000 / clk_rate);
+
+	for (i = 0; i < 5; i++) {
+		t1 = (pio_t1[i] / cycle_time) & 0x0f;
+		t2 = (pio_t2[i] / cycle_time) & 0xff;
+		teoc = (pio_teoc[i] / cycle_time) & 0xff;
+		ide_dev->piotime[i] = (teoc << 12) | (t2 << 4) | t1;
+	}
+}
+
+static void change_mode_to_ata(struct s3c_ide_device *ide_dev)
+{
+	ide_writel(ide_readl(S3C_CFATA_MUX) | S3C_CFATA_MUX_TRUEIDE,
+			S3C_CFATA_MUX);
+}
+
+static void init_ide_device(struct s3c_ide_device *ide_dev)
+{
+	change_mode_to_ata(ide_dev);
+	set_endian_mode(ide_dev, 1);
+	set_ata_enable(ide_dev, 1);
+}
+
+static void s3c_ide_setup_ports(struct ide_hw *hw,
+				struct s3c_ide_device *ide_dev)
+{
+	int i;
+	unsigned long *ata_regs = hw->io_ports_array;
+
+	/* S3C IDE controller does not include irq_addr port */
+	for (i = 0; i < IDE_NR_PORTS-1; i++)
+		*ata_regs++ = (ulong)ide_dev->regbase +
+				S3C_ATA_PIO_DTR + (i << 2);
+}
+
+static u8 s3c_cable_detect(ide_hwif_t *hwif)
+{
+	return ATA_CBL_PATA40;
+}
+
+static const struct ide_port_ops s3c_port_ops = {
+	.set_pio_mode = s3c_ide_tune_drive,
+	.set_dma_mode = s3c_ide_tune_chipset,
+	.cable_detect = s3c_cable_detect,
+};
+
+static const struct ide_tp_ops s3c_ide_tp_ops = {
+	.exec_command   = s3c_ide_exec_command,
+	.read_status    = s3c_ide_read_status,
+	.read_altstatus = s3c_ide_read_altstatus,
+	.write_devctl   = s3c_ide_write_devctl,
+	.dev_select     = s3c_ide_dev_select,
+	.tf_load        = s3c_ide_tf_load,
+	.tf_read        = s3c_ide_tf_read,
+	.input_data     = s3c_ide_input_data,
+	.output_data    = s3c_ide_output_data,
+};
+
+
+static const struct ide_port_info s3c_port_info = {
+	.name		= "s3c-ide",
+	.port_ops	= &s3c_port_ops,
+	.tp_ops         = &s3c_ide_tp_ops,
+	.chipset	= ide_s3c,
+	.host_flags	= IDE_HFLAG_MMIO | IDE_HFLAG_NO_IO_32BIT |
+				IDE_HFLAG_UNMASK_IRQS,
+	.pio_mask	= ATA_PIO4,
+};
+
+static int __devinit s3c_ide_probe(struct platform_device *pdev)
+{
+	struct resource	*res;
+	struct clk *ide_clk;
+	struct s3c_ide_device *ide_dev = &s3c_ide_dev;
+	struct s3c_ide_platdata *pdata;
+	struct ide_host *host;
+	int ret = 0;
+	struct ide_hw hw, *hws[] = { &hw };
+
+	memset(&s3c_ide_dev, 0, sizeof(s3c_ide_dev));
+	ide_dev->pdev = pdev;
+	pdata = pdev->dev.platform_data;
+	ide_dev->irq = platform_get_irq(pdev, 0);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (res == NULL) {
+		dev_err(&pdev->dev, "could not obtain base address \
+					of controller\n");
+		ret = -ENODEV;
+		goto out;
+	}
+
+	if (ide_dev->irq < 0) {
+		dev_err(&pdev->dev, "could not obtain irq number\n");
+		ret = -ENODEV;
+		goto out;
+	}
+
+	if (!request_mem_region(res->start, res->end - res->start + 1,
+		pdev->name)) {
+		dev_err(&pdev->dev, "could not obtain i/o address\n");
+		ret = -EBUSY;
+		goto out;
+	}
+
+	ide_dev->regbase = ioremap(res->start, res->end - res->start + 1);
+	if (ide_dev->regbase == 0) {
+		dev_err(&pdev->dev, "could not remap i/o address\n");
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	ide_clk = clk_get(&pdev->dev, "cfcon");
+	if (IS_ERR(ide_clk)) {
+		dev_err(&pdev->dev, "failed to find clock source\n");
+		ret = PTR_ERR(ide_clk);
+		ide_clk = NULL;
+		goto out;
+	}
+
+	if (clk_enable(ide_clk)) {
+		dev_err(&pdev->dev, "failed to enable clock source.\n");
+		goto out;
+	}
+
+	s3c_ide_setup_timing_value(ide_dev, clk_get_rate(ide_clk));
+	if (pdata->setup_gpio)
+		pdata->setup_gpio();
+	init_ide_device(ide_dev);
+
+	ide_writel(0x1f, S3C_ATA_IRQ);
+	ide_writel(0x1b, S3C_ATA_IRQ_MSK);
+
+	memset(&hw, 0, sizeof(hw));
+	s3c_ide_setup_ports(&hw, ide_dev);
+	hw.irq = ide_dev->irq;
+	hw.dev = &pdev->dev;
+
+	host = ide_host_alloc(&s3c_port_info, hws, 1);
+	if (!host) {
+		dev_err(&pdev->dev, "failed to allocate ide host\n");
+		goto out;
+	}
+
+	host->irq_handler = s3c_irq_handler;
+	host->ports[0]->hwif_data = (void *)ide_dev;
+
+	ret = ide_host_register(host, &s3c_port_info, hws);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register ide host\n");
+		ide_host_free(host);
+		goto out;
+	}
+
+	s3c_ide_dev.hwif = host->ports[0];
+	platform_set_drvdata(pdev, host);
+	printk(KERN_INFO "S3C IDE driver configured for PIO_ONLY mode\n");
+
+out:
+	return ret;
+}
+
+static int __devexit s3c_ide_remove(struct platform_device *pdev)
+{
+	struct ide_host *host = platform_get_drvdata(pdev);
+	struct resource *res;
+	struct s3c_ide_device *ide_dev = host->ports[0]->hwif_data;
+
+	ide_host_remove(host);
+	iounmap(ide_dev->regbase);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	release_resource(res);
+	kfree(res);
+
+	return 0;
+}
+
+static struct platform_driver s3c_ide_driver = {
+	.probe		= s3c_ide_probe,
+	.remove		= __devexit_p(s3c_ide_remove),
+	.driver = {
+		.name	= "s3c-ide",
+		.owner	= THIS_MODULE,
+	},
+};
+
+static int __init s3c_ide_init(void)
+{
+	return platform_driver_register(&s3c_ide_driver);
+}
+
+static void __exit s3c_ide_exit(void)
+{
+	platform_driver_unregister(&s3c_ide_driver);
+}
+
+module_init(s3c_ide_init);
+module_exit(s3c_ide_exit);
+
+MODULE_DESCRIPTION("Samsung S3C IDE Controller Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:s3c-cfcon");
diff --git a/include/linux/ide.h b/include/linux/ide.h
index edc93a6..ff9eb0e 100644
--- a/include/linux/ide.h
+++ b/include/linux/ide.h
@@ -164,7 +164,7 @@ enum {		ide_unknown,	ide_generic,	ide_pci,
 		ide_cmd640,	ide_dtc2278,	ide_ali14xx,
 		ide_qd65xx,	ide_umc8672,	ide_ht6560b,
 		ide_4drives,	ide_pmac,	ide_acorn,
-		ide_au1xxx,	ide_palm3710
+		ide_au1xxx,	ide_palm3710,	ide_s3c
 };
 
 typedef u8 hwif_chipset_t;
-- 
1.5.3.4


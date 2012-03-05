From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [RESEND 1/4] onenand:samsung Target dependent OneNAND chip probe
 function
Date: Mon, 05 Mar 2012 17:41:28 +0100
Message-ID: <1330965691-10301-2-git-send-email-l.majewski@samsung.com>
References: <1320914477-27885-1-git-send-email-l.majewski@samsung.com>
 <1330965691-10301-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:22343 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753957Ab2CEQlj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Mar 2012 11:41:39 -0500
Received: from euspt2 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M0F00K3T7PCRT10@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Mar 2012 16:41:36 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M0F00DXO7PBAI@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Mar 2012 16:41:36 +0000 (GMT)
In-reply-to: <1330965691-10301-1-git-send-email-l.majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Scott Wood <scottwood@freescale.com>, Minkyu Kang <mk7.kang@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Separate callback for probing OneNAND memory chip.
If no special function is defined, default implementation will be used.

This approach gives more flexibility for OneNAND device probing.

Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mtd/onenand/onenand_base.c  |   43 +++++++++++++++++++++++++++++-----
 drivers/mtd/onenand/samsung.c       |   10 ++++++++
 include/linux/mtd/onenand.h         |    1 +
 include/linux/mtd/samsung_onenand.h |    2 +
 4 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 06f187f..0b375e6 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -2501,23 +2501,24 @@ out:
 }
 
 /**
- * onenand_probe - [OneNAND Interface] Probe the OneNAND device
+ * onenand_chip_probe - [OneNAND Interface] Probe the OneNAND chip
  * @param mtd		MTD device structure
  *
  * OneNAND detection method:
  *   Compare the the values from command with ones from register
  */
-static int onenand_probe(struct mtd_info *mtd)
+static int onenand_chip_probe(struct mtd_info *mtd)
 {
 	struct onenand_chip *this = mtd->priv;
-	int bram_maf_id, bram_dev_id, maf_id, dev_id, ver_id;
-	int density;
+	int bram_maf_id, bram_dev_id, maf_id, dev_id;
 	int syscfg;
 
 	/* Save system configuration 1 */
 	syscfg = this->read_word(this->base + ONENAND_REG_SYS_CFG1);
+
 	/* Clear Sync. Burst Read mode to read BootRAM */
-	this->write_word((syscfg & ~ONENAND_SYS_CFG1_SYNC_READ), this->base + ONENAND_REG_SYS_CFG1);
+	this->write_word((syscfg & ~ONENAND_SYS_CFG1_SYNC_READ),
+			 this->base + ONENAND_REG_SYS_CFG1);
 
 	/* Send the command for reading device ID from BootRAM */
 	this->write_word(ONENAND_CMD_READID, this->base + ONENAND_BOOTRAM);
@@ -2542,13 +2543,38 @@ static int onenand_probe(struct mtd_info *mtd)
 	/* Read manufacturer and device IDs from Register */
 	maf_id = this->read_word(this->base + ONENAND_REG_MANUFACTURER_ID);
 	dev_id = this->read_word(this->base + ONENAND_REG_DEVICE_ID);
-	ver_id = this->read_word(this->base + ONENAND_REG_VERSION_ID);
-	this->technology = this->read_word(this->base + ONENAND_REG_TECHNOLOGY);
 
 	/* Check OneNAND device */
 	if (maf_id != bram_maf_id || dev_id != bram_dev_id)
 		return -ENXIO;
 
+	return 0;
+}
+
+/**
+ * onenand_probe - [OneNAND Interface] Probe the OneNAND device
+ * @param mtd		MTD device structure
+ *
+ * OneNAND detection method:
+ *   Compare the the values from command with ones from register
+ */
+int onenand_probe(struct mtd_info *mtd)
+{
+	struct onenand_chip *this = mtd->priv;
+	int maf_id, dev_id, ver_id;
+	int density;
+	int ret;
+
+	ret = this->chip_probe(mtd);
+	if (ret)
+		return ret;
+
+	/* Read manufacturer and device IDs from Register */
+	maf_id = this->read_word(this->base + ONENAND_REG_MANUFACTURER_ID);
+	dev_id = this->read_word(this->base + ONENAND_REG_DEVICE_ID);
+	ver_id = this->read_word(this->base + ONENAND_REG_VERSION_ID);
+	this->technology = this->read_word(this->base + ONENAND_REG_TECHNOLOGY);
+
 	/* Flash device information */
 	mtd->name = onenand_print_device_info(dev_id, ver_id);
 	this->device_id = dev_id;
@@ -2655,6 +2681,9 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	if (!this->write_bufferram)
 		this->write_bufferram = onenand_write_bufferram;
 
+	if (!this->chip_probe)
+		this->chip_probe = onenand_chip_probe;
+
 	if (!this->block_markbad)
 		this->block_markbad = onenand_default_block_markbad;
 	if (!this->scan_bbt)
diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index ff59064..c9d33ec 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -589,6 +589,16 @@ static void s3c_set_width_regs(struct onenand_chip *this)
 }
 #endif
 
+int s5pc110_chip_probe(struct mtd_info *mtd)
+{
+	return 0;
+}
+
+int s5pc210_chip_probe(struct mtd_info *mtd)
+{
+	return 0;
+}
+
 void s3c_onenand_init(struct mtd_info *mtd)
 {
 	struct onenand_chip *this = mtd->priv;
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index 5465562..dea42f4 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -101,6 +101,7 @@ struct onenand_chip {
 				size_t count);
 	unsigned short (*read_word) (void __iomem *addr);
 	void (*write_word) (unsigned short value, void __iomem *addr);
+	int (*chip_probe)(struct mtd_info *mtd);
 	void (*mmcontrol) (struct mtd_info *mtd, int sync_read);
 	int (*block_markbad)(struct mtd_info *mtd, loff_t ofs);
 	int (*scan_bbt)(struct mtd_info *mtd);
diff --git a/include/linux/mtd/samsung_onenand.h b/include/linux/mtd/samsung_onenand.h
index 021fa27..ddb29bb 100644
--- a/include/linux/mtd/samsung_onenand.h
+++ b/include/linux/mtd/samsung_onenand.h
@@ -127,5 +127,7 @@ struct samsung_onenand {
 
 /* common initialize function */
 extern void s3c_onenand_init(struct mtd_info *);
+extern int s5pc110_chip_probe(struct mtd_info *);
+extern int s5pc210_chip_probe(struct mtd_info *);
 
 #endif
-- 
1.7.2.3

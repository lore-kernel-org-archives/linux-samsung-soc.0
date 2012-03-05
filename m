From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [RESEND 3/4] onenand: Replace ONENAND_IS_MLC() test with
 ONENAND_HAS_4KB()
Date: Mon, 05 Mar 2012 17:41:30 +0100
Message-ID: <1330965691-10301-4-git-send-email-l.majewski@samsung.com>
References: <1320914477-27885-1-git-send-email-l.majewski@samsung.com>
 <1330965691-10301-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:22343 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752933Ab2CEQlk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Mar 2012 11:41:40 -0500
Received: from euspt2 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M0F00K3T7PCRT10@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Mar 2012 16:41:36 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M0F00DXP7PBAI@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Mar 2012 16:41:36 +0000 (GMT)
In-reply-to: <1330965691-10301-1-git-send-email-l.majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Scott Wood <scottwood@freescale.com>, Minkyu Kang <mk7.kang@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This replacement is for causing 4KB page size devices to work properly
with u-boot.

The old ONENAND_IS_MLC() behavior has been preserved by explicitly
setting ONENAND_HAS_4KB_PAGE for those devices.

This change makes the onenand_base.c file more resembling the respective
kernel sources.

Tested at:
       Samsung S5PC110 GONI
       Samsung S5PC210 Universal

Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mtd/onenand/onenand_base.c |   45 +++++++++++++++++++++++------------
 include/linux/mtd/onenand.h        |    4 +++
 2 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 0b375e6..480ae7a 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -367,7 +367,7 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr,
 		this->write_word(value,
 				 this->base + ONENAND_REG_START_ADDRESS2);
 
-		if (ONENAND_IS_MLC(this))
+		if (ONENAND_IS_4KB_PAGE(this))
 			ONENAND_SET_BUFFERRAM0(this);
 		else
 			/* Switch to the next data buffer */
@@ -395,7 +395,7 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr,
 		case FLEXONENAND_CMD_RECOVER_LSB:
 		case ONENAND_CMD_READ:
 		case ONENAND_CMD_READOOB:
-			if (ONENAND_IS_MLC(this))
+			if (ONENAND_IS_4KB_PAGE(this))
 				dataram = ONENAND_SET_BUFFERRAM0(this);
 			else
 				dataram = ONENAND_SET_NEXT_BUFFERRAM(this);
@@ -893,7 +893,7 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 	while (!ret) {
 		/* If there is more to load then start next load */
 		from += thislen;
-		if (!ONENAND_IS_MLC(this) && read + thislen < len) {
+		if (!ONENAND_IS_4KB_PAGE(this) && read + thislen < len) {
 			this->main_buf = buf + thislen;
 			this->command(mtd, ONENAND_CMD_READ, from, writesize);
 			/*
@@ -927,7 +927,7 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 			oobcolumn = 0;
 		}
 
-		if (ONENAND_IS_MLC(this) && (read + thislen < len)) {
+		if (ONENAND_IS_4KB_PAGE(this) && (read + thislen < len)) {
 			this->command(mtd, ONENAND_CMD_READ, from, writesize);
 			ret = this->wait(mtd, FL_READING);
 			if (unlikely(ret))
@@ -944,13 +944,13 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 		/* Set up for next read from bufferRAM */
 		if (unlikely(boundary))
 			this->write_word(ONENAND_DDP_CHIP1, this->base + ONENAND_REG_START_ADDRESS2);
-		if (!ONENAND_IS_MLC(this))
+		if (!ONENAND_IS_4KB_PAGE(this))
 			ONENAND_SET_NEXT_BUFFERRAM(this);
 		buf += thislen;
 		thislen = min_t(int, writesize, len - read);
 		column = 0;
 
-		if (!ONENAND_IS_MLC(this)) {
+		if (!ONENAND_IS_4KB_PAGE(this)) {
 			/* Now wait for load */
 			ret = this->wait(mtd, FL_READING);
 			onenand_update_bufferram(mtd, from, !ret);
@@ -1024,7 +1024,8 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 
 	stats = mtd->ecc_stats;
 
-	readcmd = ONENAND_IS_MLC(this) ? ONENAND_CMD_READ : ONENAND_CMD_READOOB;
+	readcmd = ONENAND_IS_4KB_PAGE(this) ?
+		ONENAND_CMD_READ : ONENAND_CMD_READOOB;
 
 	while (read < len) {
 		thislen = oobsize - column;
@@ -1202,7 +1203,8 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
 
 	MTDDEBUG(MTD_DEBUG_LEVEL3, "onenand_bbt_read_oob: from = 0x%08x, len = %zi\n", (unsigned int) from, len);
 
-	readcmd = ONENAND_IS_MLC(this) ? ONENAND_CMD_READ : ONENAND_CMD_READOOB;
+	readcmd = ONENAND_IS_4KB_PAGE(this) ?
+		ONENAND_CMD_READ : ONENAND_CMD_READOOB;
 
 	/* Initialize return value */
 	ops->oobretlen = 0;
@@ -1271,7 +1273,8 @@ static int onenand_verify_oob(struct mtd_info *mtd, const u_char *buf, loff_t to
 	u_char *oob_buf = this->oob_buf;
 	int status, i, readcmd;
 
-	readcmd = ONENAND_IS_MLC(this) ? ONENAND_CMD_READ : ONENAND_CMD_READOOB;
+	readcmd = ONENAND_IS_4KB_PAGE(this) ?
+		ONENAND_CMD_READ : ONENAND_CMD_READOOB;
 
 	this->command(mtd, readcmd, to, mtd->oobsize);
 	onenand_update_bufferram(mtd, to, 0);
@@ -1560,7 +1563,8 @@ static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to,
 
 	oobbuf = this->oob_buf;
 
-	oobcmd = ONENAND_IS_MLC(this) ? ONENAND_CMD_PROG : ONENAND_CMD_PROGOOB;
+	oobcmd = ONENAND_IS_4KB_PAGE(this) ?
+		ONENAND_CMD_PROG : ONENAND_CMD_PROGOOB;
 
 	/* Loop until all data write */
 	while (written < len) {
@@ -1577,7 +1581,7 @@ static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to,
 			memcpy(oobbuf + column, buf, thislen);
 		this->write_bufferram(mtd, 0, ONENAND_SPARERAM, oobbuf, 0, mtd->oobsize);
 
-		if (ONENAND_IS_MLC(this)) {
+		if (ONENAND_IS_4KB_PAGE(this)) {
 			/* Set main area of DataRAM to 0xff*/
 			memset(this->page_buf, 0xff, mtd->writesize);
 			this->write_bufferram(mtd, 0, ONENAND_DATARAM,
@@ -2140,7 +2144,10 @@ static void onenand_check_features(struct mtd_info *mtd)
 	/* Lock scheme */
 	switch (density) {
 	case ONENAND_DEVICE_DENSITY_4Gb:
-		this->options |= ONENAND_HAS_2PLANE;
+		if (ONENAND_IS_DDP(this))
+			this->options |= ONENAND_HAS_2PLANE;
+		else
+			this->options |= ONENAND_HAS_4KB_PAGE;
 
 	case ONENAND_DEVICE_DENSITY_2Gb:
 		/* 2Gb DDP don't have 2 plane */
@@ -2162,6 +2169,9 @@ static void onenand_check_features(struct mtd_info *mtd)
 	}
 
 	if (ONENAND_IS_MLC(this))
+		this->options |= ONENAND_HAS_4KB_PAGE;
+
+	if (ONENAND_IS_4KB_PAGE(this))
 		this->options &= ~ONENAND_HAS_2PLANE;
 
 	if (FLEXONENAND(this)) {
@@ -2175,6 +2185,9 @@ static void onenand_check_features(struct mtd_info *mtd)
 		printk(KERN_DEBUG "Chip support all block unlock\n");
 	if (this->options & ONENAND_HAS_2PLANE)
 		printk(KERN_DEBUG "Chip has 2 plane\n");
+	if (this->options & ONENAND_HAS_4KB_PAGE)
+		printk(KERN_DEBUG "Chip has 4KiB pagesize\n");
+
 }
 
 /**
@@ -2580,6 +2593,9 @@ int onenand_probe(struct mtd_info *mtd)
 	this->device_id = dev_id;
 	this->version_id = ver_id;
 
+	/* Check OneNAND features */
+	onenand_check_features(mtd);
+
 	density = onenand_get_density(dev_id);
 	if (FLEXONENAND(this)) {
 		this->dies = ONENAND_IS_DDP(this) ? 2 : 1;
@@ -2602,7 +2618,7 @@ int onenand_probe(struct mtd_info *mtd)
 	mtd->writesize =
 	    this->read_word(this->base + ONENAND_REG_DATA_BUFFER_SIZE);
 	/* We use the full BufferRAM */
-	if (ONENAND_IS_MLC(this))
+	if (ONENAND_IS_4KB_PAGE(this))
 		mtd->writesize <<= 1;
 
 	mtd->oobsize = mtd->writesize >> 5;
@@ -2633,9 +2649,6 @@ int onenand_probe(struct mtd_info *mtd)
 	else
 		mtd->size = this->chipsize;
 
-	/* Check OneNAND features */
-	onenand_check_features(mtd);
-
 	mtd->flags = MTD_CAP_NANDFLASH;
 	mtd->erase = onenand_erase;
 	mtd->read = onenand_read;
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index dea42f4..bb4a4a6 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -140,6 +140,9 @@ struct onenand_chip {
 #define ONENAND_IS_DDP(this)						\
 	(this->device_id & ONENAND_DEVICE_IS_DDP)
 
+#define ONENAND_IS_4KB_PAGE(this)					\
+	(this->options & ONENAND_HAS_4KB_PAGE)
+
 #define ONENAND_IS_2PLANE(this)			(0)
 
 /*
@@ -148,6 +151,7 @@ struct onenand_chip {
 #define ONENAND_HAS_CONT_LOCK		(0x0001)
 #define ONENAND_HAS_UNLOCK_ALL		(0x0002)
 #define ONENAND_HAS_2PLANE		(0x0004)
+#define ONENAND_HAS_4KB_PAGE            (0x0008)
 #define ONENAND_RUNTIME_BADBLOCK_CHECK	(0x0200)
 #define ONENAND_PAGEBUF_ALLOC		(0x1000)
 #define ONENAND_OOBBUF_ALLOC		(0x2000)
-- 
1.7.2.3

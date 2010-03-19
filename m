From: Atul Dahiya <atul.dahiya@samsung.com>
Subject: [PATCH 1/3] ARM: S5P6440: Added PL330 support in plat-samsung for
 samsung S5P6440 soc.
Date: Fri, 19 Mar 2010 16:32:20 +0530
Message-ID: <1268996540-15473-1-git-send-email-atul.dahiya@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:56078 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751068Ab0CSLDN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Mar 2010 07:03:13 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KZJ00JIA0192Q@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Mar 2010 20:03:09 +0900 (KST)
Received: from localhost.localdomain ([107.108.83.112])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KZJ00E5M0129U@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Mar 2010 20:03:09 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, atul.dahiya@samsung.com

This patch adds DMA pl330 mico code for S5P series in plat-samsung.This patch also
moves some common code from s3c2410 to plat-samsung which can also be used by pl330.

Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
---
 arch/arm/mach-s3c2410/include/mach/dma.h           |   12 +-
 arch/arm/plat-samsung/Kconfig                      |    5 +
 arch/arm/plat-samsung/Makefile                     |    2 +-
 arch/arm/plat-samsung/dma-pl330-mcode.c            |  671 ++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/cpu.h           |    1 +
 .../plat-samsung/include/plat/dma-pl330-mcode.h    |  103 +++
 arch/arm/plat-samsung/include/plat/dma.h           |   59 ++-
 7 files changed, 843 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm/plat-samsung/dma-pl330-mcode.c
 create mode 100644 arch/arm/plat-samsung/include/plat/dma-pl330-mcode.h

diff --git a/arch/arm/mach-s3c2410/include/mach/dma.h b/arch/arm/mach-s3c2410/include/mach/dma.h
index 08ac5f9..316e0cc 100644
--- a/arch/arm/mach-s3c2410/include/mach/dma.h
+++ b/arch/arm/mach-s3c2410/include/mach/dma.h
@@ -61,13 +61,13 @@ enum dma_ch {
 #endif
 
 /* types */
-
+/*
 enum s3c2410_dma_state {
 	S3C2410_DMA_IDLE,
 	S3C2410_DMA_RUNNING,
 	S3C2410_DMA_PAUSED
 };
-
+*/
 /* enum s3c2410_dma_loadst
  *
  * This represents the state of the DMA engine, wrt to the loaded / running
@@ -95,14 +95,14 @@ enum s3c2410_dma_state {
  * There is a buffer waiting to be loaded by the DMA engine, and one
  * currently running.
 */
-
+/*
 enum s3c2410_dma_loadst {
 	S3C2410_DMALOAD_NONE,
 	S3C2410_DMALOAD_1LOADED,
 	S3C2410_DMALOAD_1RUNNING,
 	S3C2410_DMALOAD_1LOADED_1RUNNING,
 };
-
+*/
 
 /* flags */
 
@@ -132,7 +132,7 @@ struct s3c2410_dma_buf {
 };
 
 /* [1] is this updated for both recv/send modes? */
-
+/*
 struct s3c2410_dma_stats {
 	unsigned long		loads;
 	unsigned long		timeout_longest;
@@ -140,7 +140,7 @@ struct s3c2410_dma_stats {
 	unsigned long		timeout_avg;
 	unsigned long		timeout_failed;
 };
-
+*/
 struct s3c2410_dma_map;
 
 /* struct s3c2410_dma_chan
diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index d552c65..39b42eb 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -69,6 +69,11 @@ config SAMSUNG_IRQ_UART
        help
          Internal configuration to build the IRQ UART demux code.
 
+config SAMSUNG_PL_330
+	bool
+	help
+	Select pl-330 code for all SAMSUNG S5P SOCs.
+
 # options for gpio configuration support
 
 config SAMSUNG_GPIOLIB_4BIT
diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Makefile
index 22c89d0..32c57b0 100644
--- a/arch/arm/plat-samsung/Makefile
+++ b/arch/arm/plat-samsung/Makefile
@@ -44,7 +44,7 @@ obj-$(CONFIG_S3C_DEV_NAND)	+= dev-nand.o
 # DMA support
 
 obj-$(CONFIG_S3C_DMA)		+= dma.o
-
+obj-$(CONFIG_SAMSUNG_PL_330)	+= dma-pl330-mcode.o
 # PM support
 
 obj-$(CONFIG_PM)		+= pm.o
diff --git a/arch/arm/plat-samsung/dma-pl330-mcode.c b/arch/arm/plat-samsung/dma-pl330-mcode.c
new file mode 100644
index 0000000..ec6e8e7
--- /dev/null
+++ b/arch/arm/plat-samsung/dma-pl330-mcode.c
@@ -0,0 +1,671 @@
+/* linux/arch/arm/plat-s5p/dma-pl330-mcode.c
+ *
+ * Copyright (c) 2010 Samsung Electronics
+ * 		http://www.samsung.com/
+ *
+ * DMA PL330 microcode
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#include <linux/io.h>
+#include "plat/dma-pl330-mcode.h"
+
+/* DMAMOV CCR, ...  */
+int encode_dma_move_ch_ctrl(u8 *mcode_ptr, u32 dmacon)
+{
+	writeb(DMAMOV, mcode_ptr++);
+	writeb(0x1, mcode_ptr++);
+	writel(dmacon, mcode_ptr);
+	return 6;
+}
+
+/* DMAMOV SAR, uStAddr
+ * DMAMOV DAR, uStAddr
+ * DMAMOV CCR,  */
+int encode_dma_move(u8 *mcode_ptr, u8 uDir, u32 uStAddr)
+{
+	writeb(DMAMOV, mcode_ptr++);
+	writeb(uDir, mcode_ptr++);
+	writel(uStAddr, mcode_ptr);
+	return 6;
+}
+
+/* DMALD */
+int encode_dma_load(u8 *mcode_ptr)
+{
+	writeb(DMALD, mcode_ptr);
+	return 1;
+
+}
+
+/* DMALDS */
+int encode_dma_load_s(u8 *mcode_ptr)
+{
+	writeb(DMALDS, mcode_ptr);
+	return 1;
+
+}
+
+/* DMALDB  */
+int encode_dma_load_b(u8 *mcode_ptr)
+{
+	 writeb(DMALDB, mcode_ptr);
+	return 1;
+
+}
+
+/* DMALDPS, DMALDPB (Load Peripheral)  */
+int encode_dma_load_peri(u8 *mcode_ptr, u8 mPeriNum, u8 m_uBurstSz)
+{
+	u8 bs;
+	if (mPeriNum > PL330_MAX_PERIPHERAL_NUM) {
+		print_warning("[%s] The peripheral number is"
+				"too big ! : %d\n", __func__, mPeriNum);
+		return 0;
+	}
+	bs = (m_uBurstSz == 1) ? 0 : 1; /* single -> 0, burst -> 1 */
+	writeb((DMALDPS|(bs<<1)), mcode_ptr++);
+	writeb(mPeriNum << 3, mcode_ptr);
+
+	return 2;
+}
+
+/* DMAST  */
+static int encode_dma_store(u8 *mcode_ptr)
+{
+	u8 opcode = DMAST;
+	writeb(opcode, mcode_ptr);
+	return 1;
+}
+
+/* DMASTS */
+static int encode_dma_store_single(u8 *mcode_ptr)
+{
+	u8 opcode = DMASTS;
+	writeb(opcode, mcode_ptr);
+	return 1;
+}
+
+/*DMASTB  */
+static int encode_dma_store_brust(u8 *mcode_ptr)
+{
+	u8 opcode = DMASTB;
+	writeb(opcode, mcode_ptr);
+	return 1;
+}
+
+/* DMASTPS, DMASTPB (Store and notify Peripheral)  */
+int encode_dma_store_peri(u8 *mcode_ptr, u8 mPeriNum, u8 m_uBurstSz)
+{
+	u8 bs;
+	if (mPeriNum > PL330_MAX_PERIPHERAL_NUM) {
+		print_warning("[%s] The peripheral number is too"
+					"big ! : %d\n", __func__, mPeriNum);
+		return 0;
+	}
+	bs = (m_uBurstSz == 1) ? 0 : 1; /* single:0, burst:1 */
+	writeb((DMASTPS|(bs<<1)), mcode_ptr++);
+	writeb(mPeriNum << 3, mcode_ptr);
+	return 2;
+}
+
+/* DMASTZ  */
+int encode_dma_store_zero(u8 *mcode_ptr)
+{
+	writeb(DMASTZ , mcode_ptr);
+	return 1;
+}
+
+/* DMALP  */
+static int encode_dma_loop(u8 *mcode_ptr, u8 uLoopCnt, u8 uIteration)
+{
+	u8 opcode = DMALP | (uLoopCnt << 1);
+	writeb(opcode, mcode_ptr++);
+	writeb(uIteration, mcode_ptr);
+	return 2;
+}
+
+/* DMALPFE  */
+static int encode_dma_loop_forever(u8 *mcode_ptr, u8 uBwJump)
+{
+	writeb(DMALPFE, mcode_ptr++);
+	writeb(uBwJump, mcode_ptr);
+	return 2;
+}
+
+/* DMALPEND */
+static int encode_dma_loop_end(u8 *mcode_ptr, u8 uLoopCnt, u8 uBwJump)
+{
+	u8 opcode = DMALPEND | (uLoopCnt << 2);
+	writeb(opcode, mcode_ptr++);
+	writeb(uBwJump, mcode_ptr);
+	return 2;
+}
+
+/* DMALPENDS */
+static int encode_dma_loop_ends(u8 *mcode_ptr, u8 uLoopCnt, u8 uBwJump)
+{
+	u8 opcode = DMALPENDS | (uLoopCnt << 2);
+	writeb(opcode, mcode_ptr++);
+	writeb(uBwJump, mcode_ptr);
+	return 2;
+}
+
+/* DMALPENDB  */
+static int encode_dma_loop_endb(u8 *mcode_ptr, u8 uLoopCnt, u8 uBwJump)
+{
+	u8 opcode = DMALPENDB | (uLoopCnt << 2);
+	writeb(opcode, mcode_ptr++);
+	writeb(uBwJump, mcode_ptr);
+	return 2;
+}
+
+/*  DMAWFPS (Wait For Peripheral) */
+static int encode_dma_wait_for_peri(u8 *mcode_ptr, u8 mPeriNum)
+{
+	u8 opcode = DMAWFPS;
+	writeb(opcode, mcode_ptr++);
+	writeb(mPeriNum << 3, mcode_ptr);
+	return 2;
+}
+
+/*  DMAWFPB (Wait For Peripheral)
+static int encode_dma_wait_for_peri(u8 *mcode_ptr, u8 mPeriNum)
+{
+	u8 opcode = DMAWFPB;
+	writeb(opcode, mcode_ptr++);
+	writeb(mPeriNum << 3, mcode_ptr);
+	return 2;
+}
+
+/  DMAWFP (Wait For Peripheral) /
+static int encode_dma_wait_for_peri(u8 *mcode_ptr, u8 mPeriNum)
+{
+	u8 opcode = DMAWFP;
+	writeb(opcode, mcode_ptr++);
+	writeb(mPeriNum << 3, mcode_ptr);
+	return 2;
+}
+
+  DMAFLUSHP (Flush and notify Peripheral) */
+static int encode_dma_flush_peri(u8 *mcode_ptr, u8 mPeriNum)
+{
+	u8 opcode = DMAFLUSHP;
+	writeb(opcode, mcode_ptr++);
+	writeb(mPeriNum << 3, mcode_ptr);
+	return 2;
+}
+
+/* DMAEND */
+static int encode_dma_end(u8 *mcode_ptr)
+{
+	u8 opcode = DMAEND;
+	writeb(opcode, mcode_ptr);
+	return 1;
+}
+
+/* DMARMB (Read Memory Barrier) */
+static int encode_dma_read_mem_barrier(u8 *mcode_ptr)
+{
+	u8 opcode = DMARMB;
+	writeb(opcode, mcode_ptr);
+	return 1;
+}
+
+/* DMASEV (Send Event) : 0 ~ 31 */
+static int encode_dma_send_event(u8 *mcode_ptr, u8 uEventNum)
+{
+	u8 opcode = DMASEV;
+	writeb(opcode, mcode_ptr++);
+	writeb(uEventNum << 3, mcode_ptr);
+	return 2;
+}
+
+/* DMAGO over DBGINST[0:1] registers */
+static void encode_dma_go_over_dbginst(u32 *mcode_ptr, u8 chanNum,
+					u32 mbufAddr, u8 m_secureBit)
+{
+	u32 x;
+	u8 uDmaGo;		/* DMAGO instruction */
+	if (chanNum > PL330_MAX_CHANNEL_NUM) {
+		print_warning("[%s] Channel num big: %d\n", __func__, chanNum);
+		return;
+	}
+	do {
+		x = Inp32(mcode_ptr+DMA_DBGSTATUS);
+	} while ((x&0x1) == 0x1);
+	uDmaGo = (m_secureBit == 0) ?
+		(0xa0|(0<<1)) : 	/* secure mode : M2M DMA only   */
+		(0xa0|(1<<1));  	/* non-secure mode : M2P/P2M DMA only */
+	Outp32(mcode_ptr+DMA_DBGINST0,
+		(chanNum<<24)|(uDmaGo<<16)|(chanNum<<8)|(0<<0));
+	Outp32(mcode_ptr+DMA_DBGINST1, mbufAddr);
+	Outp32(mcode_ptr+DMA_DBGCMD, 0);
+
+}
+
+/* DMAKILL over DBGINST[0:1] registers - Stop a DMA channel */
+static void encode_dma_kill_channel_over_dbginst(u32 *mcode_ptr, u8 chanNum)
+{
+	u32 x;
+	if (chanNum > PL330_MAX_CHANNEL_NUM) {
+		print_warning("[%s] Channel num big: %d\n", __func__, chanNum);
+		return;
+	}
+	do {
+		x = Inp32(mcode_ptr+DMA_DBGSTATUS);
+	} while ((x&0x1) == 0x1);
+	Outp32(mcode_ptr+DMA_DBGINST0, (0<<24)|(1<<16)|(chanNum<<8)|(1<<0));
+	Outp32(mcode_ptr+DMA_DBGINST1, 0);
+	Outp32(mcode_ptr+DMA_DBGCMD, 0);
+	do {
+		x = Inp32(mcode_ptr+DMA_DBGSTATUS);
+	} while ((x&0x1) == 0x1);
+}
+
+/* DMAKILL over DBGINST[0:1] registers - Stop a DMA controlle*/
+static void encode_dma_kill_dmac_over_dbginst(u32 *mcode_ptr)
+{
+	u32 x;
+	do {
+		x = Inp32(mcode_ptr+DMA_DBGSTATUS);
+	} while ((x&0x1) == 0x1);
+
+	Outp32(mcode_ptr+DMA_DBGINST0, (0<<24)|(1<<16)|(0<<8)|(0<<0));
+	Outp32(mcode_ptr+DMA_DBGINST1, 0);
+	Outp32(mcode_ptr+DMA_DBGCMD, 0); 	/* 0 : execute the instruction*/
+
+	do {
+		x = Inp32(mcode_ptr+DMA_DBGSTATUS);
+	} while ((x&0x1) == 0x1);
+}
+
+/* config_dma_start_address
+ * - set the DMA start address
+ *
+ *	mcode_ptr	the pointer to the buffer for PL330 DMAMOVE micro code
+ *			to be stored into
+ *	uStAddr		the DMA start address
+ */
+static int config_dma_start_address(u8 *mcode_ptr, int uStAddr)
+{
+	return encode_dma_move(mcode_ptr, 0, (u32)uStAddr);
+}
+
+/* config_dma_destination_address
+ * - set the DMA destination address
+ *	mcode_ptr	the pointer to the buffer for PL330 DMAMOVE micro
+ *			code to be stored into
+ *	uStAddr		the DMA destination address
+ */
+static int config_dma_destination_address(u8 *mcode_ptr, int uStAddr)
+{
+	return encode_dma_move(mcode_ptr, 2, (u32)uStAddr);
+}
+
+/* config_dma_control
+ * - set the burst length, burst size, source and destination increment/fixed
+ *   field
+ *	mcode_ptr	the pointer to the buffer for PL330 DMAMOVE micro
+ *			code to be stored into
+ *	dmacon		the value for the DMA channel control register
+ */
+static int config_dma_control(u8 *mcode_ptr,  struct DMA_control dmacon)
+{
+	return encode_dma_move(mcode_ptr, 1, *(u32 *)&dmacon);
+}
+
+/* config_dma_transfer_remainder
+ * - set the transfer size of the remainder
+ *	mcode_ptr	the pointer to the buffer for PL330 DMADMA micro code
+ *			to be stored into
+ *	lcRemainder	the remainder except for the LC-aligned transfers
+ *	dma_param	the parameter set for a DMA operation
+ */
+static int config_dma_transfer_remainder(u8 *mcode_ptr, int lcRemainder,
+					struct DMA_parameters dma_param)
+{
+	int mcode_size = 0, msize = 0;
+	int lc0 = 0, lcSize = 0, mLoopStart0 = 0, dmaSent = 0;
+	dmaSent = dma_param.mTrSize - lcRemainder;
+	msize = config_dma_start_address(mcode_ptr+mcode_size,
+					dma_param.mSrcAddr+dmaSent);
+	mcode_size += msize;
+	msize = config_dma_destination_address(mcode_ptr+mcode_size,
+					dma_param.mDstAddr+dmaSent);
+	mcode_size += msize;
+	dma_param.mControl.uSBSize = 0x2;	/* 4 bytes    */
+	dma_param.mControl.uSBLength = 0x0;	/* 1 transfer */
+	dma_param.mControl.uDBSize = 0x2;	/* 4 bytes    */
+	dma_param.mControl.uDBLength = 0x0;	/* 1 transfer */
+	msize = config_dma_control(mcode_ptr+mcode_size,
+					dma_param.mControl);
+	mcode_size += msize;
+	lcSize = (dma_param.mControl.uSBLength+1)*
+			(1<<dma_param.mControl.uSBSize);
+	lc0 = lcRemainder/lcSize;
+	msize = encode_dma_loop(mcode_ptr+mcode_size, 0, lc0-1);
+	mcode_size += msize;
+	mLoopStart0 = mcode_size;
+	switch (dma_param.mDirection) {
+	case PL330_M2M_DMA:
+		msize = encode_dma_load(mcode_ptr+mcode_size);
+		mcode_size += msize;
+		msize = encode_dma_store(mcode_ptr+mcode_size);
+		mcode_size += msize;
+		break;
+	case PL330_M2P_DMA:
+		msize = encode_dma_wait_for_peri(mcode_ptr+mcode_size,
+						(u8)dma_param.mPeriNum);
+		mcode_size += msize;
+		msize = encode_dma_load(mcode_ptr+mcode_size);
+		mcode_size += msize;
+		msize = encode_dma_store_peri(mcode_ptr+mcode_size,
+					(u8)dma_param.mPeriNum, 1);
+		mcode_size += msize;
+		msize = encode_dma_flush_peri(mcode_ptr+mcode_size,
+						(u8)dma_param.mPeriNum);
+		mcode_size += msize;
+		break;
+	case PL330_P2M_DMA:
+		msize = encode_dma_wait_for_peri(mcode_ptr+mcode_size,
+						(u8)dma_param.mPeriNum);
+		mcode_size += msize;
+		msize = encode_dma_load_peri(mcode_ptr+mcode_size,
+						(u8)dma_param.mPeriNum, 1);
+		mcode_size += msize;
+		msize = encode_dma_store(mcode_ptr+mcode_size);
+		mcode_size += msize;
+		msize = encode_dma_flush_peri(mcode_ptr+mcode_size,
+					(u8)dma_param.mPeriNum);
+		mcode_size += msize;
+		break;
+	case PL330_P2P_DMA:
+		print_warning("[%s] P2P DMA selected !\n", __func__);
+		break;
+	default:
+		print_warning("[%s] Invaild DMA direction"
+					"selected !\n", __func__);
+		break;
+	}
+	msize = encode_dma_loop_end(mcode_ptr+mcode_size, 0,
+				(u8)(mcode_size-mLoopStart0));
+	mcode_size += msize;
+	return mcode_size;
+}
+
+/* config_dma_transfer_size
+ * - set the transfer size
+ *	mcode_ptr	the pointer to the buffer for PL330 DMA micro code into
+ *	dma_param	the parameter set for a DMA operation
+ */
+static int config_dma_transfer_size(u8 *mcode_ptr,
+			struct DMA_parameters dma_param)
+{
+	int mcode_size = 0, msize = 0;
+	int lc0 = 0, lc1 = 0, lcRemainder = 0, lcSize = 0;
+	int mLoopStart0 = 0, mLoopStart1 = 0;
+	switch (dma_param.mDirection) {
+	case PL330_M2M_DMA:
+		if (dma_param.mTrSize > (8*1024*1024)) {
+			print_warning("[%s] The chunk size is too big"
+					"%lu\n", __func__, dma_param.mTrSize);
+			return 0;
+		}
+		break;
+	case PL330_M2P_DMA:
+	case PL330_P2M_DMA:
+		if (dma_param.mTrSize > (2*1024*1024)) {
+			print_warning("[%s] The chunk size is too"
+				"big !: %lu\n", __func__, dma_param.mTrSize);
+			return 0;
+		}
+		break;
+	case PL330_P2P_DMA:
+		print_warning("[%s] P2P DMA selected !\n", __func__);
+		break;
+	default:
+		print_warning("[%s] Invaild DMA direction entered\n", __func__);
+		break;
+	}
+	lcSize = (dma_param.mControl.uSBLength+1)*
+			(1<<dma_param.mControl.uSBSize);
+	lc0 = dma_param.mTrSize/lcSize;
+	lcRemainder = dma_param.mTrSize - (lc0*lcSize);
+	if (lc0 > PL330_MAX_ITERATION_NUM) {
+		lc1 = lc0/PL330_MAX_ITERATION_NUM;
+		if (lc1 <= PL330_MAX_ITERATION_NUM) {
+			msize = encode_dma_loop(mcode_ptr+mcode_size, 1, lc1-1);
+			mcode_size += msize;
+			mLoopStart1 = mcode_size;
+			msize = encode_dma_loop(mcode_ptr+mcode_size, 0,
+						PL330_MAX_ITERATION_NUM-1);
+			mcode_size += msize;
+			mLoopStart0 = mcode_size;
+			switch (dma_param.mDirection) {
+			case PL330_M2M_DMA:
+				msize = encode_dma_load(mcode_ptr+mcode_size);
+				mcode_size += msize;
+				msize = encode_dma_read_mem_barrier(mcode_ptr+
+								mcode_size);
+				mcode_size += msize;
+				msize = encode_dma_store(mcode_ptr+mcode_size);
+				mcode_size += msize;
+				break;
+			case PL330_M2P_DMA:
+				msize = encode_dma_wait_for_peri(mcode_ptr +
+					mcode_size, (u8)dma_param.mPeriNum);
+				mcode_size += msize;
+				msize = encode_dma_load(mcode_ptr+mcode_size);
+				mcode_size += msize;
+				msize = encode_dma_store_peri(mcode_ptr +
+					mcode_size, (u8)dma_param.mPeriNum, 1);
+				mcode_size += msize;
+				msize = encode_dma_flush_peri(mcode_ptr +
+					mcode_size, (u8)dma_param.mPeriNum);
+				mcode_size += msize;
+				break;
+			case PL330_P2M_DMA:
+			msize = encode_dma_wait_for_peri(mcode_ptr + mcode_size,
+						(u8)dma_param.mPeriNum);
+				mcode_size += msize;
+				msize = encode_dma_load_peri(mcode_ptr +
+					mcode_size, (u8)dma_param.mPeriNum, 1);
+				mcode_size += msize;
+				msize = encode_dma_store(mcode_ptr +
+								mcode_size);
+				mcode_size += msize;
+				msize = encode_dma_flush_peri(mcode_ptr +
+					mcode_size, (u8)dma_param.mPeriNum);
+				mcode_size += msize;
+				break;
+			case PL330_P2P_DMA:
+				print_warning("[%s] P2P DMA!\n", __func__);
+				break;
+			default:
+				print_warning("[%s] Invaild DMA direction"
+						"selected !\n", __func__);
+				break;
+			}
+			msize = encode_dma_loop_end(mcode_ptr + mcode_size, 0,
+						(u8)(mcode_size-mLoopStart0));
+			mcode_size += msize;
+			msize = encode_dma_loop_end(mcode_ptr + mcode_size, 1,
+						(u8)(mcode_size-mLoopStart1));
+			mcode_size += msize;
+			lc0 = lc0 - (lc1*PL330_MAX_ITERATION_NUM);
+		} else {
+			print_warning("[%s] The transfer size is over the"
+					"limit (lc1=%d)\n", __func__, lc1);
+		}
+	}
+
+	if (lc0 > 0) {
+		msize = encode_dma_loop(mcode_ptr+mcode_size, 0, lc0-1);
+		mcode_size += msize;
+		mLoopStart0 = mcode_size;
+		switch (dma_param.mDirection) {
+		case PL330_M2M_DMA:
+			msize = encode_dma_load(mcode_ptr + mcode_size);
+			mcode_size += msize;
+			msize = encode_dma_store(mcode_ptr + mcode_size);
+			mcode_size += msize;
+			break;
+		case PL330_M2P_DMA:
+			msize = encode_dma_wait_for_peri(mcode_ptr + mcode_size,
+							(u8)dma_param.mPeriNum);
+			mcode_size += msize;
+			msize = encode_dma_load(mcode_ptr + mcode_size);
+			mcode_size += msize;
+			msize = encode_dma_store_peri(mcode_ptr + mcode_size,
+						(u8)dma_param.mPeriNum, 1);
+			mcode_size += msize;
+			msize = encode_dma_flush_peri(mcode_ptr+mcode_size,
+						(u8)dma_param.mPeriNum);
+			mcode_size += msize;
+			break;
+		case PL330_P2M_DMA:
+			msize = encode_dma_wait_for_peri(mcode_ptr + mcode_size,
+							(u8)dma_param.mPeriNum);
+			mcode_size += msize;
+			msize = encode_dma_load_peri(mcode_ptr + mcode_size,
+						(u8)dma_param.mPeriNum, 1);
+			mcode_size += msize;
+			msize = encode_dma_store(mcode_ptr+mcode_size);
+			mcode_size += msize;
+			msize = encode_dma_flush_peri(mcode_ptr+mcode_size,
+						(u8)dma_param.mPeriNum);
+			mcode_size += msize;
+			break;
+		case PL330_P2P_DMA:
+			print_warning("[%s] P2P DMA selected !\n", __func__);
+			break;
+		default:
+			break;
+		}
+		msize = encode_dma_loop_end(mcode_ptr+mcode_size, 0,
+					(u8)(mcode_size-mLoopStart0));
+		mcode_size += msize;
+	}
+	if (lcRemainder != 0) {
+		msize = config_dma_transfer_remainder(mcode_ptr+mcode_size,
+							lcRemainder, dma_param);
+		mcode_size += msize;
+	}
+	return mcode_size;
+}
+
+/* register_irq_to_dma_channel
+ * - register an event with the DMA channel
+ *	mcode_ptr	the pointer to the buffer for PL330 DMASEV micro code
+ *			to be stored into
+ *	uEventNum	the event number to be assigned to this DMA channel
+ */
+static int register_irq_to_dma_channel(u8 *mcode_ptr, int uEventNum)
+{
+	return encode_dma_send_event(mcode_ptr, (u8)uEventNum);
+}
+
+/* config_dma_set_infinite_loop
+ * - set an infinite loop
+ *	mcode_ptr	the pointer to the buffer for PL330 DMAPLPEND micro
+ *			code to be stored into
+ *	bBwJump		the relative location of the first instruction in the
+ *			the program loop
+ */
+static int config_dma_set_infinite_loop(u8 *mcode_ptr, int uBwJump)
+{
+	return encode_dma_loop_forever(mcode_ptr, (u8)uBwJump);
+}
+
+/* config_dma_mark_end
+ * - mark the end of the DMA request
+ *	mcode_ptr	the pointer to the buffer for PL330 DMAEND micro code
+ *			to be stored into
+ */
+static int config_dma_mark_end(u8 *mcode_ptr)
+{
+	return encode_dma_end(mcode_ptr);
+}
+
+/* start_dma_controller
+ * - start the DMA controller
+ */
+void start_dma_controller(u32 *mbuf)
+{
+	return;
+}
+
+/* stop_dma_controller
+ * - stop the DMA controller
+ *
+ *	mbuf	the address of the buffer for DMAKILL micro code to be stored
+ */
+void stop_dma_controller(u32 *mbuf)
+{
+	encode_dma_kill_dmac_over_dbginst(mbuf);
+}
+
+/* setup_dma_channel
+ * - set up a DMA channel for the DMA operation
+ *
+ *	mbuf		the address of the buffer that will contain PL330
+ *			D MA micro codes
+ *	dma_param	the parameter set for a DMA operation
+ *	chanNum		the DMA channel number to be started
+ */
+int setup_dma_channel(u8 *mbuf, struct DMA_parameters dma_param, int chanNum)
+{
+	int mcode_size = 0, msize = 0;
+	msize = config_dma_start_address(mbuf, dma_param.mSrcAddr);
+	mcode_size += msize;
+	msize = config_dma_destination_address(mbuf + mcode_size,
+						dma_param.mDstAddr);
+	mcode_size += msize;
+	msize = config_dma_control(mbuf+mcode_size, dma_param.mControl);
+	mcode_size += msize;
+	msize = config_dma_transfer_size(mbuf+mcode_size, dma_param);
+	mcode_size += msize;
+	if (dma_param.mIrqEnable) {
+		msize = register_irq_to_dma_channel(mbuf+mcode_size, chanNum);
+		mcode_size += msize;
+	}
+	if (dma_param.mLoop) {
+		msize = config_dma_set_infinite_loop(mbuf+mcode_size,
+					dma_param.mBwJump+mcode_size);
+		mcode_size += msize;
+	}
+	if (dma_param.mLastReq) {
+		msize = config_dma_mark_end(mbuf+mcode_size);
+		mcode_size += msize;
+	}
+	return mcode_size;
+}
+
+/* start_dma_channel
+ * - get the DMA channel started
+ * mbuf		the address of the buffer for DMAGO micro
+ *		code to be stored at
+ * chanNum	the DMA channel number to be started
+ * mbufAddr	the start address of the buffer containing
+ *		PL330 DMA micro codes
+*/
+void start_dma_channel(u32 *mbuf, int chanNum, u32 mbufAddr, int secureMode)
+{
+	encode_dma_go_over_dbginst(mbuf, (u8)chanNum, mbufAddr,
+							(u8)secureMode);
+}
+
+/* stop_dma_channel
+ * - get the DMA channel stopped
+ * mbuf		the address of the buffer for DMAKILL micro code to be stored
+ * chanNum 	the DMA channel number to be stopped
+*/
+
+void stop_dma_channel(u32 *mbuf, int chanNum)
+{
+	 encode_dma_kill_channel_over_dbginst(mbuf, (u8)chanNum);
+
+}
diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat-samsung/include/plat/cpu.h
index d316b4a..1f8af60 100644
--- a/arch/arm/plat-samsung/include/plat/cpu.h
+++ b/arch/arm/plat-samsung/include/plat/cpu.h
@@ -78,6 +78,7 @@ extern struct sysdev_class s3c2442_sysclass;
 extern struct sysdev_class s3c2443_sysclass;
 extern struct sysdev_class s3c6410_sysclass;
 extern struct sysdev_class s3c64xx_sysclass;
+extern struct sysdev_class s5p6440_sysclass;
 
 extern void (*s5pc1xx_idle)(void);
 
diff --git a/arch/arm/plat-samsung/include/plat/dma-pl330-mcode.h b/arch/arm/plat-samsung/include/plat/dma-pl330-mcode.h
new file mode 100644
index 0000000..1b21477
--- /dev/null
+++ b/arch/arm/plat-samsung/include/plat/dma-pl330-mcode.h
@@ -0,0 +1,103 @@
+/* linux/arch/arm/plat-s5p/dma-pl330-mcode.h
+ *
+ *  Copyright (c) 2010 Samsung Electronics
+ *             http://www.samsung.com/
+ *
+ * DMA PL330 microcode
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __ARM_PLAT_DMA_PL330_MCODE_H
+#define __ARM_PLAT_DMA_PL330_MCODE_H __FILE__
+
+#include <linux/sysdev.h>
+
+#define print_warning(fmt...)		printk(fmt)
+
+#define PL330_P2M_DMA			0
+#define PL330_M2P_DMA			1
+#define PL330_M2M_DMA			2
+#define PL330_P2P_DMA			3
+
+#define	PL330_MAX_ITERATION_NUM		256
+#define	PL330_MAX_JUMPBACK_NUM		256
+#define	PL330_MAX_EVENT_NUM		32
+#define	PL330_MAX_PERIPHERAL_NUM	32
+#define	PL330_MAX_CHANNEL_NUM		8
+
+#define DMA_DBGSTATUS			0x0
+#define DMA_DBGCMD			0x1
+#define DMA_DBGINST0			0x2
+#define DMA_DBGINST1			0x3
+
+#define DMAMOV 		(0xbc)
+#define DMALD 		(0x04)
+#define DMALDS 		(0x05)
+#define DMALDB 		(0x07)
+#define DMALDPS 	(0x25)
+#define DMAST 		(0x08)
+#define DMASTS 		(0x09)
+#define DMASTB 		(0x0b)
+#define DMASTPS 	(0x29)
+#define DMASTZ 		(0x0c)
+#define DMALP 		(0x20)
+#define DMALPFE 	(0x28)
+#define DMALPEND 	(0x38)
+#define DMALPENDS 	(0x39)
+#define DMALPENDB 	(0x3b)
+#define DMAWFPS 	(0x30)
+#define DMAWFPB 	(0x32)
+#define DMAWFP 		(0x31)
+#define DMAFLUSHP 	(0x35)
+#define DMAEND 		(0x00)
+#define DMARMB 		(0x12)
+#define DMASEV 		(0x34)
+
+#define Outp32(addr, data)		(*(u32 *)(addr) = (data))
+#define Inp32(addr)			(*(u32 *)(addr))
+
+/* Parameter set for Channel Control Register */
+struct DMA_control{
+	unsigned 	uSI;/* [0] Transfer size not count*/
+	unsigned 	uSBSize;/* [3:1] Source 1 transfer size*/
+	unsigned 	uSBLength;/* [7:4] Sourse burst len*/
+	unsigned 	uSProt;/* [10:8] Source Protection set 101b=5*/
+	unsigned 	uSCache;/* [13:11] Source Cache control*/
+	unsigned 	uDI;/* [14] Destination increment*/
+	unsigned 	uDBSize;/* [17:15] Destination 1 transfer size*/
+	unsigned 	uDBLength;/* [21:18] Destination burst len*/
+	unsigned	 uDProt;/* [24:22] Source Protection set 101b=5*/
+	unsigned 	uDCache;/* [27:25] Source Cache control*/
+	unsigned 	uESSize;/* [31:28] endian_swap_size	*/
+};
+
+/* Parameter list for a DMA operation */
+struct DMA_parameters{
+	unsigned long		mDirection;/* DMA direction */
+	unsigned long		mPeriNum;/* DMA Peripheral number */
+	unsigned long		mSrcAddr;/* DMA source address */
+	unsigned long		mDstAddr;/* DMA destination address */
+	unsigned long		mTrSize;/* DMA Transfer size */
+	struct DMA_control	mControl;
+	unsigned long		mIrqEnable;/* DMA Send IRQ */
+	unsigned long		mLoop;	/* DMA Infinite Loop - 0(off) */
+	unsigned long		mBwJump;/* DMA backward relative offset */
+	unsigned long		mLastReq;/* The last DMA Req.  */
+};
+
+extern void start_dma_controller(u32 *mbuf);
+
+extern void stop_dma_controller(u32 *mbuf);
+
+extern int setup_dma_channel(u8 *mbuf,
+		struct DMA_parameters dma_param, int chanNum);
+
+extern void start_dma_channel(u32 *mbuf, int chanNum,
+					u32 mbufAddr, int secureMode);
+
+extern void stop_dma_channel(u32 *mbuf, int chanNum);
+
+#endif
diff --git a/arch/arm/plat-samsung/include/plat/dma.h b/arch/arm/plat-samsung/include/plat/dma.h
index 7584d75..a71897d 100644
--- a/arch/arm/plat-samsung/include/plat/dma.h
+++ b/arch/arm/plat-samsung/include/plat/dma.h
@@ -10,6 +10,61 @@
  * published by the Free Software Foundation.
 */
 
+
+/* types */
+#ifndef __ARM_PLAT_SAMSUNG_DMA_H
+#define __ARM_PLAT_SAMSUNG_DMA_H
+
+enum s3c2410_dma_state {
+	S3C2410_DMA_IDLE,
+	S3C2410_DMA_RUNNING,
+	S3C2410_DMA_PAUSED
+};
+
+/* enum s3c2410_dma_loadst
+ *
+ * This represents the state of the DMA engine, wrt to the loaded / running
+ * transfers. Since we don't have any way of knowing exactly the state of
+ * the DMA transfers, we need to know the state to make decisions on wether
+ * we can
+ *
+ * S3C2410_DMA_NONE
+ *
+ * There are no buffers loaded (the channel should be inactive)
+ *
+ * S3C2410_DMA_1LOADED
+ *
+ * There is one buffer loaded, however it has not been confirmed to be
+ * loaded by the DMA engine. This may be because the channel is not
+ * yet running, or the DMA driver decided that it was too costly to
+ * sit and wait for it to happen.
+ *
+ * S3C2410_DMA_1RUNNING
+ *
+ * The buffer has been confirmed running, and not finisged
+ *
+ * S3C2410_DMA_1LOADED_1RUNNING
+ *
+ * There is a buffer waiting to be loaded by the DMA engine, and one
+ * currently running.
+*/
+
+
+enum s3c2410_dma_loadst {
+	S3C2410_DMALOAD_NONE,
+	S3C2410_DMALOAD_1LOADED,
+	S3C2410_DMALOAD_1RUNNING,
+	S3C2410_DMALOAD_1LOADED_1RUNNING,
+};
+
+struct s3c2410_dma_stats {
+	unsigned long		loads;
+	unsigned long		timeout_longest;
+	unsigned long		timeout_shortest;
+	unsigned long		timeout_avg;
+	unsigned long		timeout_failed;
+};
+
 enum s3c2410_dma_buffresult {
 	S3C2410_RES_OK,
 	S3C2410_RES_ERR,
@@ -56,7 +111,6 @@ typedef int  (*s3c2410_dma_opfn_t)(struct s3c2410_dma_chan *,
 				   enum s3c2410_chan_op );
 
 
-
 /* s3c2410_dma_request
  *
  * request a dma channel exclusivley
@@ -120,8 +174,7 @@ extern int s3c2410_dma_devconfig(int channel, enum s3c2410_dmasrc source,
 
 extern int s3c2410_dma_getposition(unsigned int channel,
 				   dma_addr_t *src, dma_addr_t *dest);
-
 extern int s3c2410_dma_set_opfn(unsigned int, s3c2410_dma_opfn_t rtn);
 extern int s3c2410_dma_set_buffdone_fn(unsigned int, s3c2410_dma_cbfn_t rtn);
 
-
+#endif
-- 
1.6.6

From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] ARM: S3C64XX: Add a new dma request id for device tree based
 dma channel lookup
Date: Mon, 04 Jun 2012 08:16:31 +0530
Message-ID: <1338777991-27194-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:19693 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755323Ab2FDCbi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Jun 2012 22:31:38 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5200MMKN0PDI50@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jun 2012 11:31:37 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5200I9BN0J6830@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jun 2012 11:31:36 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, jaswinder.singh@linaro.org, broonie@opensource.wolfsonmicro.com, linux-arm-kernel@lists.infradead.org

Commit 4972a80e16a2 (ARM: SAMSUNG: Add device tree support for pl330 dma engine
wrappers) introduced a new member 'dt_dmach_prop' in the struct samsung_dma_info
which is used to specify the dma channel number property as obtained from the
device tree. It also introduced a new dma request id 'DMACH_DT_PROP' to indicate
that a device tree node property represting the dma channel is available in
'struct samsung_dma_info'.

Add dma request id 'DMACH_DT_PROP' in s3c64xx dma channel id list in order to
maintain compatibility to the changes in the Samsung dma wrappper operations.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-s3c64xx/include/mach/dma.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/include/mach/dma.h b/arch/arm/mach-s3c64xx/include/mach/dma.h
index fe1a98c..57b1ff4 100644
--- a/arch/arm/mach-s3c64xx/include/mach/dma.h
+++ b/arch/arm/mach-s3c64xx/include/mach/dma.h
@@ -21,6 +21,7 @@
  */
 enum dma_ch {
 	/* DMA0/SDMA0 */
+	DMACH_DT_PROP = -1, /* not yet supported, do not use */
 	DMACH_UART0 = 0,
 	DMACH_UART0_SRC2,
 	DMACH_UART1,
-- 
1.6.6.rc2

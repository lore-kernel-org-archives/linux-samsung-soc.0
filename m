From: Sangwook Lee <sangwook.lee@linaro.org>
Subject: [PATCH] ARM:SAMSUNG: DMA Cleanup as per sparse
Date: Thu, 30 Jun 2011 11:16:20 +0100
Message-ID: <1309428980-20176-1-git-send-email-sangwook.lee@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:41676 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753439Ab1F3KS2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 06:18:28 -0400
Received: by wyg8 with SMTP id 8so1434005wyg.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2011 03:18:27 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org
Cc: Sangwook Lee <sangwook.lee@linaro.org>

Function declaration differs between file:s3c-pl330.c and file:dma.h
and SPARSE (Documentation/sparse.txt) gives error messages

Signed-off-by: Sangwook Lee <sangwook.lee@linaro.org>
---
 arch/arm/plat-samsung/include/plat/dma.h |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/dma.h b/arch/arm/plat-samsung/include/plat/dma.h
index 2e8f8c6..7365f46 100644
--- a/arch/arm/plat-samsung/include/plat/dma.h
+++ b/arch/arm/plat-samsung/include/plat/dma.h
@@ -62,7 +62,7 @@ typedef int  (*s3c2410_dma_opfn_t)(struct s3c2410_dma_chan *,
  * request a dma channel exclusivley
 */
 
-extern int s3c2410_dma_request(unsigned int channel,
+extern int s3c2410_dma_request(enum dma_ch id,
 			       struct s3c2410_dma_client *, void *dev);
 
 
@@ -71,14 +71,14 @@ extern int s3c2410_dma_request(unsigned int channel,
  * change the state of the dma channel
 */
 
-extern int s3c2410_dma_ctrl(unsigned int channel, enum s3c2410_chan_op op);
+extern int s3c2410_dma_ctrl(enum dma_ch id, enum s3c2410_chan_op op);
 
 /* s3c2410_dma_setflags
  *
  * set the channel's flags to a given state
 */
 
-extern int s3c2410_dma_setflags(unsigned int channel,
+extern int s3c2410_dma_setflags(enum dma_ch id,
 				unsigned int flags);
 
 /* s3c2410_dma_free
@@ -86,7 +86,7 @@ extern int s3c2410_dma_setflags(unsigned int channel,
  * free the dma channel (will also abort any outstanding operations)
 */
 
-extern int s3c2410_dma_free(unsigned int channel, struct s3c2410_dma_client *);
+extern int s3c2410_dma_free(enum dma_ch id, struct s3c2410_dma_client *);
 
 /* s3c2410_dma_enqueue
  *
@@ -95,7 +95,7 @@ extern int s3c2410_dma_free(unsigned int channel, struct s3c2410_dma_client *);
  * drained before the buffer is given to the DMA system.
 */
 
-extern int s3c2410_dma_enqueue(unsigned int channel, void *id,
+extern int s3c2410_dma_enqueue(enum dma_ch idx, void *id,
 			       dma_addr_t data, int size);
 
 /* s3c2410_dma_config
@@ -103,14 +103,14 @@ extern int s3c2410_dma_enqueue(unsigned int channel, void *id,
  * configure the dma channel
 */
 
-extern int s3c2410_dma_config(unsigned int channel, int xferunit);
+extern int s3c2410_dma_config(enum dma_ch id, int xferunit);
 
 /* s3c2410_dma_devconfig
  *
  * configure the device we're talking to
 */
 
-extern int s3c2410_dma_devconfig(unsigned int channel,
+extern int s3c2410_dma_devconfig(enum dma_ch id,
 		enum s3c2410_dmasrc source, unsigned long devaddr);
 
 /* s3c2410_dma_getposition
@@ -118,7 +118,7 @@ extern int s3c2410_dma_devconfig(unsigned int channel,
  * get the position that the dma transfer is currently at
 */
 
-extern int s3c2410_dma_getposition(unsigned int channel,
+extern int s3c2410_dma_getposition(enum dma_ch id,
 				   dma_addr_t *src, dma_addr_t *dest);
 
 extern int s3c2410_dma_set_opfn(unsigned int, s3c2410_dma_opfn_t rtn);
-- 
1.7.4.1

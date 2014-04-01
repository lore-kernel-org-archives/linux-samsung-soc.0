From: Jungseok Lee <jays.lee@samsung.com>
Subject: [PATCH] swiotlb: Correct kernel command line handler
Date: Tue, 01 Apr 2014 10:51:58 +0900
Message-ID: <011801cf4d4c$f7ba51f0$e72ef5d0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38714 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751098AbaDABwA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 Mar 2014 21:52:00 -0400
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: konrad.wilk@oracle.com, linux-kernel@vger.kernel.org
Cc: sungjinn.chung@samsung.com, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

This patch corrects kernel command line handler when io_tlb_nslabs
is set to 0.

A current implementation allocates default size memory (64MB) when
0 is given to io_tlb_nslabs ("swiotlb=0") by kernel command line.
In other words, memory is allocated unintentionally.

Signed-off-by: Jungseok Lee <jays.lee@samsung.com>
Signed-off-by: Sungjinn Chung <sungjinn.chung@samsung.com>
---
 lib/swiotlb.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/swiotlb.c b/lib/swiotlb.c
index b604b83..9fe9f71 100644
--- a/lib/swiotlb.c
+++ b/lib/swiotlb.c
@@ -55,6 +55,8 @@
 
 int swiotlb_force;
 
+static int swiotlb_no_use;
+
 /*
  * Used to do a quick range check in swiotlb_tbl_unmap_single and
  * swiotlb_tbl_sync_single_*, to see if the memory was in fact allocated by this
@@ -102,6 +104,8 @@ setup_io_tlb_npages(char *str)
 		io_tlb_nslabs = simple_strtoul(str, &str, 0);
 		/* avoid tail segment of size < IO_TLB_SEGSIZE */
 		io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
+		if (!io_tlb_nslabs)
+			swiotlb_no_use = 1;
 	}
 	if (*str == ',')
 		++str;
@@ -212,7 +216,7 @@ swiotlb_init(int verbose)
 	unsigned char *vstart;
 	unsigned long bytes;
 
-	if (!io_tlb_nslabs) {
+	if (!swiotlb_no_use && !io_tlb_nslabs) {
 		io_tlb_nslabs = (default_size >> IO_TLB_SHIFT);
 		io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
 	}
@@ -244,7 +248,7 @@ swiotlb_late_init_with_default_size(size_t default_size)
 	unsigned int order;
 	int rc = 0;
 
-	if (!io_tlb_nslabs) {
+	if (!swiotlb_no_use && !io_tlb_nslabs) {
 		io_tlb_nslabs = (default_size >> IO_TLB_SHIFT);
 		io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
 	}
-- 
1.7.10.4

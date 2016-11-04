From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH RFC 1/7] dma: pl08x: Add support for the DMA slave map
Date: Fri, 04 Nov 2016 17:14:48 +0100
Message-ID: <1478276094-19135-3-git-send-email-s.nawrocki@samsung.com>
References: <1478276094-19135-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:60794 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934706AbcKDQRH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Nov 2016 12:17:07 -0400
In-reply-to: <1478276094-19135-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org
Cc: vinod.koul@intel.com, broonie@kernel.org, ckeepax@opensource.wolfsonmicro.com, ym0914@gmail.com, arnd@arndb.de, kgene@kernel.org, javier@osg.samsung.com, andi.shyti@samsung.com, sbkim73@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch add support for the new channel request API
introduced in commit a8135d0d79e9d0ad3a4ff494fceeaae83
"dmaengine: core: Introduce new, universal API to request a channel"

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/dma/amba-pl08x.c   | 3 +++
 include/linux/amba/pl08x.h | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index 939a7c3..d5c75c8 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -2307,6 +2307,9 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 			ret = -EINVAL;
 			goto out_no_platdata;
 		}
+	} else {
+		pl08x->slave.filter.map = pl08x->pd->slave_map;
+		pl08x->slave.filter.mapcnt = pl08x->pd->slave_map_len;
 	}
 
 	/* By default, AHB1 only.  If dualmaster, from platform */
diff --git a/include/linux/amba/pl08x.h b/include/linux/amba/pl08x.h
index 27e9ec8..5308eae 100644
--- a/include/linux/amba/pl08x.h
+++ b/include/linux/amba/pl08x.h
@@ -84,6 +84,8 @@ struct pl08x_channel_data {
  * running any DMA transfer and multiplexing can be recycled
  * @lli_buses: buses which LLIs can be fetched from: PL08X_AHB1 | PL08X_AHB2
  * @mem_buses: buses which memory can be accessed from: PL08X_AHB1 | PL08X_AHB2
+ * @slave_map: DMA slave matching table
+ * @slave_map_len: number of elements in @slave_map
  */
 struct pl08x_platform_data {
 	struct pl08x_channel_data *slave_channels;
@@ -93,6 +95,8 @@ struct pl08x_platform_data {
 	void (*put_xfer_signal)(const struct pl08x_channel_data *, int);
 	u8 lli_buses;
 	u8 mem_buses;
+	const struct dma_slave_map *slave_map;
+	int slave_map_len;
 };
 
 #ifdef CONFIG_AMBA_PL08X
-- 
1.9.1

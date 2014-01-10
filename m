From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 1/1] drivers: net: silence compiler warning in smc91x.c
Date: Fri, 10 Jan 2014 12:04:06 +0900
Message-ID: <1389323046-4521-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44387 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751490AbaAJCtQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jan 2014 21:49:16 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, "David S. Miller" <davem@davemloft.net>, Jingoo Han <jg1.han@samsung.com>, netdev@vger.kernel.org

If used 64 bit compiler GCC warns that:

drivers/net/ethernet/smsc/smc91x.c:1897:7:
warning: cast from pointer to integer of different
size [-Wpointer-to-int-cast]

This patch fixes this by changing typecase from "unsigned int" to "unsigned long"

CC: "David S. Miller" <davem@davemloft.net>
CC: Jingoo Han <jg1.han@samsung.com> 
CC: netdev@vger.kernel.org
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 drivers/net/ethernet/smsc/smc91x.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/smsc/smc91x.c b/drivers/net/ethernet/smsc/smc91x.c
index 0c9b5d9..42e79b4 100644
--- a/drivers/net/ethernet/smsc/smc91x.c
+++ b/drivers/net/ethernet/smsc/smc91x.c
@@ -1894,7 +1894,7 @@ static int smc_probe(struct net_device *dev, void __iomem *ioaddr,
 	SMC_SELECT_BANK(lp, 1);
 	val = SMC_GET_BASE(lp);
 	val = ((val & 0x1F00) >> 3) << SMC_IO_SHIFT;
-	if (((unsigned int)ioaddr & (0x3e0 << SMC_IO_SHIFT)) != val) {
+	if (((unsigned long)ioaddr & (0x3e0 << SMC_IO_SHIFT)) != val) {
 		netdev_warn(dev, "%s: IOADDR %p doesn't match configuration (%x).\n",
 			    CARDNAME, ioaddr, val);
 	}
-- 
1.7.10.4

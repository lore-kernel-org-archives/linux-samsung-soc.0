From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v3 4/4] drivers: clk: use COMMON_CLK_SAMSUNG for Samsung clock
 support
Date: Thu, 20 Mar 2014 13:55:25 +0900
Message-ID: <1395291325-4043-5-git-send-email-pankaj.dubey@samsung.com>
References: <1394598781-3848-1-git-send-email-pankaj.dubey@samsung.com>
 <1395291325-4043-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56471 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750840AbaCTEjB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Mar 2014 00:39:01 -0400
In-reply-to: <1395291325-4043-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, Tomasz Figa <t.figa@samsung.com>

This patch replaces PLAT_SAMSUNG with COMMON_CLK_SAMSUNG for Samsung
common clock support. Any Samsung SoC want to use Samsung common clock
infrastructure can simply select COMMON_CLK_SAMSUNG.

CC: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 drivers/clk/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index a367a98..f1da6ee 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -38,7 +38,7 @@ obj-$(CONFIG_PLAT_ORION)		+= mvebu/
 obj-$(CONFIG_ARCH_MXS)			+= mxs/
 obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
 obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
-obj-$(CONFIG_PLAT_SAMSUNG)		+= samsung/
+obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
 obj-$(CONFIG_ARCH_SHMOBILE_MULTI)	+= shmobile/
 obj-$(CONFIG_ARCH_SIRF)			+= sirf/
 obj-$(CONFIG_ARCH_SOCFPGA)		+= socfpga/
-- 
1.7.10.4

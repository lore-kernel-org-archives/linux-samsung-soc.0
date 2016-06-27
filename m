From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ARM: s3c64xx: avoid warning about 'struct device_node'
Date: Mon, 27 Jun 2016 13:02:50 +0200
Message-ID: <20160627110303.3391769-1-arnd@arndb.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:52223 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751870AbcF0LBQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jun 2016 07:01:16 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

The change to simplify of_platform_populate() had an unintended
side-effect of introducing a build warning on s3c64xx:

In file included from arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c:18:0:
arch/arm/mach-s3c64xx/common.h:27:30: error: 'struct device_node' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]

This adds a forward-declaration for the structure name in the
header to avoid the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 850bea2335e4 ("arm: Remove unnecessary of_platform_populate with default match table")
---
Rob, can you apply this on top of the devicetree git so we don't
have to coordinate the merges?
---
 arch/arm/mach-s3c64xx/common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-s3c64xx/common.h b/arch/arm/mach-s3c64xx/common.h
index 9eb864412911..4f204668f00e 100644
--- a/arch/arm/mach-s3c64xx/common.h
+++ b/arch/arm/mach-s3c64xx/common.h
@@ -24,6 +24,7 @@ void s3c64xx_init_io(struct map_desc *mach_desc, int size);
 
 void s3c64xx_restart(enum reboot_mode mode, const char *cmd);
 
+struct device_node;
 void s3c64xx_clk_init(struct device_node *np, unsigned long xtal_f,
 	unsigned long xusbxti_f, bool is_s3c6400, void __iomem *reg_base);
 void s3c64xx_set_xtal_freq(unsigned long freq);
-- 
2.9.0

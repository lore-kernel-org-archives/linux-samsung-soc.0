From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 12/38] ARM: EXYNOS: firmware: Remove check for device tree
 presence
Date: Mon, 17 Jun 2013 18:33:57 +0200
Message-ID: <1371486863-12398-13-git-send-email-t.figa@samsung.com>
References: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:41745 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752090Ab3FQQev (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 12:34:51 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOJ00MBNQ1N6260@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Jun 2013 17:34:45 +0100 (BST)
In-reply-to: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch makes the firmware setup code assume presence of DT, since it
is now the only way of booting supported for Exynos.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/firmware.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
index ed11f10..932129e 100644
--- a/arch/arm/mach-exynos/firmware.c
+++ b/arch/arm/mach-exynos/firmware.c
@@ -48,20 +48,18 @@ static const struct firmware_ops exynos_firmware_ops = {
 
 void __init exynos_firmware_init(void)
 {
-	if (of_have_populated_dt()) {
-		struct device_node *nd;
-		const __be32 *addr;
+	struct device_node *nd;
+	const __be32 *addr;
 
-		nd = of_find_compatible_node(NULL, NULL,
-						"samsung,secure-firmware");
-		if (!nd)
-			return;
+	nd = of_find_compatible_node(NULL, NULL,
+					"samsung,secure-firmware");
+	if (!nd)
+		return;
 
-		addr = of_get_address(nd, 0, NULL, NULL);
-		if (!addr) {
-			pr_err("%s: No address specified.\n", __func__);
-			return;
-		}
+	addr = of_get_address(nd, 0, NULL, NULL);
+	if (!addr) {
+		pr_err("%s: No address specified.\n", __func__);
+		return;
 	}
 
 	pr_info("Running under secure firmware.\n");
-- 
1.8.2.1

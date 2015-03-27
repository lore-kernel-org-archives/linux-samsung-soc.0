From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [RESEND PATCH 2/2] ARM: EXYNOS: Handle of_find_device_by_node and
 kstrdup failures
Date: Fri, 27 Mar 2015 11:43:56 +0100
Message-ID: <1427453036-6808-2-git-send-email-k.kozlowski@samsung.com>
References: <1427453036-6808-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:13395 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752091AbbC0KoH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Mar 2015 06:44:07 -0400
In-reply-to: <1427453036-6808-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Prevent possible NULL pointer dereference of pointer returned by
of_find_device_by_node(). Handle this by skipping such power domain.

Additionally fail the init on kstrdup() failure. Such case is actually
not fatal because the name for power domain allocated by kstrdup() is
used only in printk. Still as a precaution handle this as an error
condition.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/mach-exynos/pm_domains.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
index 2c5c206f3ea9..b20d228566b9 100644
--- a/arch/arm/mach-exynos/pm_domains.c
+++ b/arch/arm/mach-exynos/pm_domains.c
@@ -126,6 +126,12 @@ static __init int exynos4_pm_init_power_domain(void)
 		struct device *dev;
 
 		pdev = of_find_device_by_node(np);
+		if (!pdev) {
+			pr_err("%s: failed to find device for node %s\n",
+					__func__, np->name);
+			of_node_put(np);
+			continue;
+		}
 		dev = &pdev->dev;
 
 		pd = kzalloc(sizeof(*pd), GFP_KERNEL);
@@ -136,6 +142,12 @@ static __init int exynos4_pm_init_power_domain(void)
 		}
 
 		pd->pd.name = kstrdup(dev_name(dev), GFP_KERNEL);
+		if (!pd->pd.name) {
+			kfree(pd);
+			of_node_put(np);
+			return -ENOMEM;
+		}
+
 		pd->name = pd->pd.name;
 		pd->base = of_iomap(np, 0);
 		if (!pd->base) {
-- 
1.9.1

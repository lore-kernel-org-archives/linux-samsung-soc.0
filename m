From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH v2 2/2] ARM: EXYNOS: fix double of_node_put() on error path
Date: Fri, 31 Jul 2015 03:09:50 +0300
Message-ID: <1438301390-7397-3-git-send-email-vz@mleia.com>
References: <1438301390-7397-1-git-send-email-vz@mleia.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from li271-223.members.linode.com ([178.79.152.223]:42177 "EHLO
	mail.mleia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751120AbbGaAJ5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jul 2015 20:09:57 -0400
In-Reply-To: <1438301390-7397-1-git-send-email-vz@mleia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Russell King <linux@arm.linux.org.uk>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

The change removes the second of_node_put(), if
for_each_compatible_node() body execution is not terminated. This
prevents from object refcounter overflow over zero in OF_DYNAMIC
build.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
Changes from v1 to v2:
* split a single change v1 into two

 arch/arm/mach-exynos/pm_domains.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
index 5121baa..4a87e86 100644
--- a/arch/arm/mach-exynos/pm_domains.c
+++ b/arch/arm/mach-exynos/pm_domains.c
@@ -148,7 +148,6 @@ static __init int exynos4_pm_init_power_domain(void)
 			pr_warn("%s: failed to map memory\n", __func__);
 			kfree_const(pd->pd.name);
 			kfree(pd);
-			of_node_put(np);
 			continue;
 		}
 
-- 
2.1.4

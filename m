From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 3/4] ARM: exynos: Clear global variable on init error path
Date: Tue, 24 Jul 2018 18:49:45 +0200
Message-ID: <20180724164946.6274-3-krzk@kernel.org>
References: <20180724164946.6274-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724164946.6274-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Russell King <linux@armlinux.org.uk>, Alim Akhtar <alim.akhtar@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

For most of Exynos SoCs, Power Management Unit (PMU) address space is
mapped into global variable 'pmu_base_addr' very early when initializing
PMU interrupt controller.  A lot of other machine code depends on it so
when doing iounmap() on this address, clear the global as well to avoid
usage of invalid value (pointing to unmapped memory region).

Properly mapped PMU address space is a requirement for all other machine
code so this fix is purely theoretical.  Boot will fail immediately in
many other places after following this error path.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
New patch.
---
 arch/arm/mach-exynos/suspend.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
index 5d4822e5d0ba..d42ef1be2c70 100644
--- a/arch/arm/mach-exynos/suspend.c
+++ b/arch/arm/mach-exynos/suspend.c
@@ -207,6 +207,7 @@ static int __init exynos_pmu_irq_init(struct device_node *node,
 					  NULL);
 	if (!domain) {
 		iounmap(pmu_base_addr);
+		pmu_base_addr = NULL;
 		return -ENOMEM;
 	}
 
-- 
2.14.1

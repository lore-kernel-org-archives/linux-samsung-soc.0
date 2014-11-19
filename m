From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 05/19] arm: exynos: pm_domains: add support for devices
 registered before arch_initcall
Date: Wed, 19 Nov 2014 12:15:34 +0100
Message-ID: <1416395748-10731-6-git-send-email-m.szyprowski@samsung.com>
References: <1416395748-10731-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:23330 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751204AbaKSLQ1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 06:16:27 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NFA00KPXA46BZ40@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Nov 2014 11:19:18 +0000 (GMT)
In-reply-to: <1416395748-10731-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: iommu@lists.linux-foundation.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linaro-mm-sig@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>, Shaik Ameer Basha <shaik.ameer@samsung.com>, Cho KyongHo <pullip.cho@samsung.com>, Joerg Roedel <joro@8bytes.org>, Thierry Reding <treding@nvidia.com>, Olof Johansson <olof@lixom.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, Will Deacon <will.deacon@arm.com>, David Wodhouse <dwmw2@infradead.org>, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>

SYSMMU devices will be registered early before any other devices and
before calling arch_initcall. To add them to respective power domains,
additional scan of all platform devices is needed.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-exynos/pm_domains.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
index 20f267121b3e..8f1f239ee424 100644
--- a/arch/arm/mach-exynos/pm_domains.c
+++ b/arch/arm/mach-exynos/pm_domains.c
@@ -105,6 +105,12 @@ static int exynos_pd_power_off(struct generic_pm_domain *domain)
 	return exynos_pd_power(domain, false);
 }
 
+static __init int exynos_pd_init_platform_dev(struct device *dev, void *data)
+{
+	dev_pm_domain_attach(dev, true);
+	return 0;
+}
+
 static __init int exynos4_pm_init_power_domain(void)
 {
 	struct platform_device *pdev;
@@ -161,6 +167,7 @@ no_clk:
 		of_genpd_add_provider_simple(np, &pd->pd);
 	}
 
-	return 0;
+	return bus_for_each_dev(&platform_bus_type, NULL, NULL,
+				exynos_pd_init_platform_dev);
 }
 arch_initcall(exynos4_pm_init_power_domain);
-- 
1.9.2

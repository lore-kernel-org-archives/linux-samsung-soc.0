From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v7 17/25] iommu/exynos: Add callback for initializing devices
 from device tree
Date: Tue, 19 May 2015 15:20:37 +0200
Message-ID: <1432041645-11172-18-git-send-email-m.szyprowski@samsung.com>
References: <1432041645-11172-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:41290 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755925AbbESNVP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 May 2015 09:21:15 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NOL003NPMFE7E10@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 May 2015 14:21:14 +0100 (BST)
In-reply-to: <1432041645-11172-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: iommu@lists.linux-foundation.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linaro-mm-sig@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>, Shaik Ameer Basha <shaik.ameer@samsung.com>, Cho KyongHo <pullip.cho@samsung.com>, Joerg Roedel <joro@8bytes.org>, Thierry Reding <treding@nvidia.com>, Olof Johansson <olof@lixom.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, Will Deacon <will.deacon@arm.com>, David Wodhouse <dwmw2@infradead.org>, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

This patch adds implementation of of_xlate callback, which prepares
masters device for attaching to IOMMU. This callback is called during
creating devices from device tree.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/iommu/exynos-iommu.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index a157e43bd113..27143f1cbc27 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -1145,6 +1145,33 @@ static void exynos_iommu_remove_device(struct device *dev)
 	iommu_group_remove_device(dev);
 }
 
+static int exynos_iommu_of_xlate(struct device *dev,
+				 struct of_phandle_args *spec)
+{
+	struct exynos_iommu_owner *owner = dev->archdata.iommu;
+	struct platform_device *sysmmu = of_find_device_by_node(spec->np);
+	struct sysmmu_drvdata *data;
+
+	if (!sysmmu)
+		return -ENODEV;
+
+	data = platform_get_drvdata(sysmmu);
+	if (!data)
+		return -ENODEV;
+
+	if (!owner) {
+		owner = kzalloc(sizeof(*owner), GFP_KERNEL);
+		if (!owner)
+			return -ENOMEM;
+
+		INIT_LIST_HEAD(&owner->controllers);
+		dev->archdata.iommu = owner;
+	}
+
+	list_add_tail(&data->owner_node, &owner->controllers);
+	return 0;
+}
+
 static struct iommu_ops exynos_iommu_ops = {
 	.domain_alloc = exynos_iommu_domain_alloc,
 	.domain_free = exynos_iommu_domain_free,
@@ -1157,6 +1184,7 @@ static struct iommu_ops exynos_iommu_ops = {
 	.add_device = exynos_iommu_add_device,
 	.remove_device = exynos_iommu_remove_device,
 	.pgsize_bitmap = SECT_SIZE | LPAGE_SIZE | SPAGE_SIZE,
+	.of_xlate = exynos_iommu_of_xlate,
 };
 
 static bool init_done;
-- 
1.9.2

From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v6 15/25] iommu: exynos: document internal structures
Date: Mon, 04 May 2015 10:16:10 +0200
Message-ID: <1430727380-10912-16-git-send-email-m.szyprowski@samsung.com>
References: <1430727380-10912-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:42401 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752081AbbEDIRS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 May 2015 04:17:18 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NNT004V6GCS1550@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 May 2015 09:17:16 +0100 (BST)
In-reply-to: <1430727380-10912-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: iommu@lists.linux-foundation.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linaro-mm-sig@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>, Shaik Ameer Basha <shaik.ameer@samsung.com>, Cho KyongHo <pullip.cho@samsung.com>, Joerg Roedel <joro@8bytes.org>, Thierry Reding <treding@nvidia.com>, Olof Johansson <olof@lixom.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, Will Deacon <will.deacon@arm.com>, David Wodhouse <dwmw2@infradead.org>, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>

Add a few words of comment to all internal structures used by the driver.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/iommu/exynos-iommu.c | 49 +++++++++++++++++++++++++++++---------------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 67e0633b8080..6a0199570b00 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -184,33 +184,50 @@ static char *sysmmu_fault_name[SYSMMU_FAULTS_NUM] = {
 	"UNKNOWN FAULT"
 };
 
-/* attached to dev.archdata.iommu of the master device */
+/*
+ * This structure is attached to dev.archdata.iommu of the master device
+ * on device add, contains a list of SYSMMU controllers defined by device tree,
+ * which are bound to given master device. It is usually referenced by 'owner'
+ * pointer.
+*/
 struct exynos_iommu_owner {
-	struct list_head clients;
+	struct list_head clients; /* list of sysmmu_drvdata.owner_node */
 };
 
+/*
+ * This structure exynos specific generalization of struct iommu_domain.
+ * It contains list of SYSMMU controllers from all master devices, which has
+ * been attached to this domain and page tables of IO address space defined by
+ * it. It is usually referenced by 'domain' pointer.
+ */
 struct exynos_iommu_domain {
-	struct list_head clients; /* list of sysmmu_drvdata.node */
+	struct list_head clients; /* list of sysmmu_drvdata.domain_node */
 	sysmmu_pte_t *pgtable; /* lv1 page table, 16KB */
 	short *lv2entcnt; /* free lv2 entry counter for each section */
-	spinlock_t lock; /* lock for this structure */
+	spinlock_t lock; /* lock for modyfying list of clients */
 	spinlock_t pgtablelock; /* lock for modifying page table @ pgtable */
 	struct iommu_domain domain; /* generic domain data structure */
 };
 
+/*
+ * This structure hold all data of a single SYSMMU controller, this includes
+ * hw resources like registers and clocks, pointers and list nodes to connect
+ * it to all other structures, internal state and parameters read from device
+ * tree. It is usually referenced by 'data' pointer.
+ */
 struct sysmmu_drvdata {
-	struct device *sysmmu;	/* System MMU's device descriptor */
-	struct device *master;	/* Owner of system MMU */
-	void __iomem *sfrbase;
-	struct clk *clk;
-	struct clk *clk_master;
-	int activations;
-	spinlock_t lock;
-	struct exynos_iommu_domain *domain;
-	struct list_head domain_node;
-	struct list_head owner_node;
-	phys_addr_t pgtable;
-	int version;
+	struct device *sysmmu; /* SYSMMU controller device */
+	struct device *master; /* master device (owner of given SYSMMU) */
+	void __iomem *sfrbase; /* our registers */
+	struct clk *clk; /* SYSMMU's clock */
+	struct clk *clk_master; /* master's device clock */
+	int activations; /* number of calls to sysmmu_enable */
+	spinlock_t lock; /* lock for modyfying enable/disable state */
+	struct exynos_iommu_domain *domain; /* domain we belong to */
+	struct list_head domain_node; /* node for domain clients list */
+	struct list_head owner_node; /* node for owner clients list */
+	phys_addr_t pgtable; /* assigned page table structure */
+	int version; /* our version */
 };
 
 static struct exynos_iommu_domain *to_exynos_domain(struct iommu_domain *dom)
-- 
1.9.2

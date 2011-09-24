From: KyongHo Cho <pullip.cho@samsung.com>
Subject: [PATCH 4/4] iommu/exynos: Use bus_set_iommu instead of register_iommu
Date: Sat, 24 Sep 2011 11:02:50 +0900
Message-ID: <1316829770-21949-5-git-send-email-pullip.cho@samsung.com>
References: <1316829770-21949-1-git-send-email-pullip.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1316829770-21949-1-git-send-email-pullip.cho@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Kukjin Kim <kgene.kim@samsung.com>, Joerg Roedel <joerg.roedel@amd.com>, Joerg Roedel <joro@8bytes.org>, YoungLak Kim <younglak1004.kim@samsung.com>, Sanghyun Lee <sanghyun75.lee@samsung.com>, KyongHo Cho <pullip.cho@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This replaces register_iommu() with bus_set_iommu() according to the
suggestion of Joerg Roedel.

Cc: Joerg Roedel <joerg.roedel@amd.com>
Signed-off-by: KyongHo Cho <pullip.cho@samsung.com>
---
 drivers/iommu/exynos_iommu.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/iommu/exynos_iommu.c b/drivers/iommu/exynos_iommu.c
index fe5b5d8..148e238 100644
--- a/drivers/iommu/exynos_iommu.c
+++ b/drivers/iommu/exynos_iommu.c
@@ -852,7 +852,7 @@ static int __init exynos_iommu_init(void)
 	if (!l2table_cachep)
 		return -ENOMEM;
 
-	register_iommu(&exynos_iommu_ops);
+	bus_set_iommu(&platform_bus_type, &omap_iommu_ops);
 
 	return 0;
 }
-- 
1.7.1

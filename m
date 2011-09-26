From: KyongHo Cho <pullip.cho@samsung.com>
Subject: [PATCH 4/4 v2] iommu/exynos: Use bus_set_iommu instead of
	register_iommu
Date: Mon, 26 Sep 2011 13:42:50 +0900
Message-ID: <1317012170-28597-5-git-send-email-pullip.cho@samsung.com>
References: <1317012170-28597-1-git-send-email-pullip.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1317012170-28597-1-git-send-email-pullip.cho@samsung.com>
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Joerg Roedel <joerg.roedel@amd.com>, YoungLak Kim <younglak1004.kim@samsung.com>, Sanghyun Lee <sanghyun75.lee@samsung.com>, KyongHo Cho <pullip.cho@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This replaces register_iommu() with bus_set_iommu() according to the
suggestion of Joerg Roedel.

Cc: Joerg Roedel <joerg.roedel@amd.com>
Signed-off-by: KyongHo Cho <pullip.cho@samsung.com>
---
 drivers/iommu/exynos_iommu.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/iommu/exynos_iommu.c b/drivers/iommu/exynos_iommu.c
index 9b3f108..34e673f 100644
--- a/drivers/iommu/exynos_iommu.c
+++ b/drivers/iommu/exynos_iommu.c
@@ -926,7 +926,7 @@ static int __init exynos_iommu_init(void)
 	if (!l2table_cachep)
 		return -ENOMEM;
 
-	register_iommu(&exynos_iommu_ops);
+	bus_set_iommu(&platform_bus_type, &exynos_iommu_ops);
 
 	return 0;
 }
-- 
1.7.1

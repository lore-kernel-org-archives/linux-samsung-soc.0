From: KyongHo Cho <pullip.cho@samsung.com>
Subject: [PATCH] iommu: Initialize domain->handler in iommu_domain_alloc()
Date: Tue, 13 Dec 2011 16:14:26 +0900
Message-ID: <1323760466-30333-1-git-send-email-pullip.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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
Cc: Younglak Kim <younglak1004.kim@samsung.com>, Joerg Roedel <joro@8bytes.org>, Kukjin Kim <kgene.kim@samsung.com>, Sanghyun Lee <sanghyun75.lee@samsung.com>, KyongHo Cho <pullip.cho@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Since it is not guaranteed that an iommu driver initializes in its
domain_init() function, it must be initialized with NULL to prevent
calling a function in an arbitrary location when iommu fault occurred.

Signed-off-by: KyongHo Cho <pullip.cho@samsung.com>
---
 drivers/iommu/iommu.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 7cc3c65..1afb896 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -148,6 +148,7 @@ struct iommu_domain *iommu_domain_alloc(struct bus_type *bus)
 		return NULL;
 
 	domain->ops = bus->iommu_ops;
+	domain->handler = NULL;
 
 	ret = domain->ops->domain_init(domain);
 	if (ret)
-- 
1.7.1

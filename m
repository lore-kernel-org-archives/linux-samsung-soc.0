Return-Path: <SRS0=UMxf=C3=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C6CBC43464
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 18 Sep 2020 01:12:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5486208DB
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 18 Sep 2020 01:12:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbgIRBMh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 17 Sep 2020 21:12:37 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:13244 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725987AbgIRBMh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 21:12:37 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id CA5C5D147F08C0996032;
        Fri, 18 Sep 2020 09:12:34 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Fri, 18 Sep 2020
 09:12:24 +0800
From:   Yu Kuai <yukuai3@huawei.com>
To:     <m.szyprowski@samsung.com>, <joro@8bytes.org>, <kgene@kernel.org>,
        <krzk@kernel.org>
CC:     <iommu@lists.linux-foundation.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>,
        <yi.zhang@huawei.com>
Subject: [PATCH] iommu/exynos: add missing put_device() call in exynos_iommu_of_xlate()
Date:   Fri, 18 Sep 2020 09:13:35 +0800
Message-ID: <20200918011335.909141-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

if of_find_device_by_node() succeed, exynos_iommu_of_xlate() doesn't have
a corresponding put_device(). Thus add put_device() to fix the exception
handling for this function implementation.

Fixes: aa759fd376fb ("iommu/exynos: Add callback for initializing devices from device tree")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/iommu/exynos-iommu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index bad3c0ce10cb..de324b4eedfe 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -1295,13 +1295,17 @@ static int exynos_iommu_of_xlate(struct device *dev,
 		return -ENODEV;
 
 	data = platform_get_drvdata(sysmmu);
-	if (!data)
+	if (!data) {
+		put_device(&sysmmu->dev);
 		return -ENODEV;
+	}
 
 	if (!owner) {
 		owner = kzalloc(sizeof(*owner), GFP_KERNEL);
-		if (!owner)
+		if (!owner) {
+			put_device(&sysmmu->dev);
 			return -ENOMEM;
+		}
 
 		INIT_LIST_HEAD(&owner->controllers);
 		mutex_init(&owner->rpm_lock);
-- 
2.25.4


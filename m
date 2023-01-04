Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0442DC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Jan 2023 09:39:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233995AbjADJjG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 Jan 2023 04:39:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234644AbjADJi2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Jan 2023 04:38:28 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 598DDE83
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Jan 2023 01:38:26 -0800 (PST)
Received: from dggpemm500007.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Nn4Dv2Q8hzJpwT;
        Wed,  4 Jan 2023 17:34:23 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 17:38:23 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <iommu@lists.linux.dev>, <linux-samsung-soc@vger.kernel.org>
CC:     <m.szyprowski@samsung.com>, <semen.protsenko@linaro.org>,
        <jroedel@suse.de>, <yangyingliang@huawei.com>
Subject: [PATCH] iommu/exynos: fix error handling in exynos_iommu_init()
Date:   Wed, 4 Jan 2023 17:57:02 +0800
Message-ID: <20230104095702.2591122-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

If platform_driver_register() fails, it don't need unregister and call
kmem_cache_free() to free the memory allocated before calling register.

Fixes: bbc4d205d93f ("iommu/exynos: Fix driver initialization sequence")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/iommu/exynos-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index b0cde2211987..c1d579c24740 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -1446,7 +1446,7 @@ static int __init exynos_iommu_init(void)
 
 	return 0;
 err_reg_driver:
-	platform_driver_unregister(&exynos_sysmmu_driver);
+	kmem_cache_free(lv2table_kmem_cache, zero_lv2_table);
 err_zero_lv2:
 	kmem_cache_destroy(lv2table_kmem_cache);
 	return ret;
-- 
2.25.1


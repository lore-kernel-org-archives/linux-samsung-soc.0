Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFB2C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Apr 2022 13:13:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232827AbiDFNPs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Apr 2022 09:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233072AbiDFNOD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Apr 2022 09:14:03 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DEA31D66DF;
        Wed,  6 Apr 2022 02:52:31 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4KYJbY3GntzBrxP;
        Wed,  6 Apr 2022 17:08:57 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 6 Apr 2022 17:13:02 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Wed, 6 Apr
 2022 17:13:07 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <dri-devel@lists.freedesktop.org>
CC:     <jagan@amarulasolutions.com>, <m.szyprowski@samsung.com>,
        <robert.foss@linaro.org>
Subject: [PATCH -next] drm/exynos: mic: fix return value check in exynos_mic_probe()
Date:   Wed, 6 Apr 2022 17:22:00 +0800
Message-ID: <20220406092200.2581262-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

If of_graph_get_remote_node() fails, it returns NULL pointer, replaces
IS_ERR() check with NULL pointer check.

Fixes: dd8b6803bc49 ("exynos: drm: dsi: Attach in_bridge in MIC driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index 9e06f8e2a863..43fc357a6682 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -434,9 +434,9 @@ static int exynos_mic_probe(struct platform_device *pdev)
 
 	remote = of_graph_get_remote_node(dev->of_node, 1, 0);
 	mic->next_bridge = of_drm_find_bridge(remote);
-	if (IS_ERR(mic->next_bridge)) {
+	if (!mic->next_bridge) {
 		DRM_DEV_ERROR(dev, "mic: Failed to find next bridge\n");
-		ret = PTR_ERR(mic->next_bridge);
+		ret = -EINVAL;
 		goto err;
 	}
 
-- 
2.25.1


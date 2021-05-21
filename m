Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BCBC433ED
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 21 May 2021 09:06:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A319613BE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 21 May 2021 09:06:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234966AbhEUJHg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 21 May 2021 05:07:36 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3612 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234628AbhEUJHg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 May 2021 05:07:36 -0400
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fmgby2ykFzQqdm;
        Fri, 21 May 2021 17:02:38 +0800 (CST)
Received: from dggeme759-chm.china.huawei.com (10.3.19.105) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 21 May 2021 17:06:10 +0800
Received: from localhost.localdomain (10.69.192.56) by
 dggeme759-chm.china.huawei.com (10.3.19.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 21 May 2021 17:06:10 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <inki.dae@samsung.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <krzysztof.kozlowski@canonical.com>
CC:     <dri-devel@lists.freedesktop.org>,
        <linux-samsung-soc@vger.kernel.org>,
        Tian Tao <tiantao6@hisilicon.com>
Subject: [PATCH v2] drm/exynos: Use pm_runtime_resume_and_get() to replace open coding
Date:   Fri, 21 May 2021 17:06:06 +0800
Message-ID: <1621587966-62687-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeme759-chm.china.huawei.com (10.3.19.105)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

use pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
pm_runtime_put_noidle.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---

v2: drop unnecessary change about if condition.
---
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index 3821ea7..32672bf 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -268,11 +268,9 @@ static void mic_pre_enable(struct drm_bridge *bridge)
 	if (mic->enabled)
 		goto unlock;
 
-	ret = pm_runtime_get_sync(mic->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(mic->dev);
+	ret = pm_runtime_resume_and_get(mic->dev);
+	if (ret < 0)
 		goto unlock;
-	}
 
 	mic_set_path(mic, 1);
 
-- 
2.7.4


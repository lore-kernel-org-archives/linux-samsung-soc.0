Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D716C47087
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 May 2021 07:22:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 818386135F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 May 2021 07:22:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235179AbhE1HXw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 28 May 2021 03:23:52 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2445 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235763AbhE1HXp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 May 2021 03:23:45 -0400
Received: from dggeml766-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FrwzR576Zz66WK;
        Fri, 28 May 2021 15:19:15 +0800 (CST)
Received: from dggema769-chm.china.huawei.com (10.1.198.211) by
 dggeml766-chm.china.huawei.com (10.1.199.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 28 May 2021 15:22:09 +0800
Received: from localhost (10.174.179.215) by dggema769-chm.china.huawei.com
 (10.1.198.211) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 28
 May 2021 15:22:08 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <inki.dae@samsung.com>, <jy0922.shim@samsung.com>,
        <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>,
        <airlied@linux.ie>, <daniel@ffwll.ch>,
        <krzysztof.kozlowski@canonical.com>, <yuehaibing@huawei.com>
CC:     <dri-devel@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] drm/exynos-vidi: use DEVICE_ATTR_RW macro
Date:   Fri, 28 May 2021 15:21:20 +0800
Message-ID: <20210528072120.21332-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggema769-chm.china.huawei.com (10.1.198.211)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use DEVICE_ATTR_RW() helper instead of plain DEVICE_ATTR(),
which makes the code a bit shorter and easier to read.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index e5662bdcbbde..a3a95a2c0bae 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -165,8 +165,8 @@ static void vidi_fake_vblank_timer(struct timer_list *t)
 			jiffies + msecs_to_jiffies(VIDI_REFRESH_TIME) - 1);
 }
 
-static ssize_t vidi_show_connection(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t connection_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
 	int rc;
@@ -180,7 +180,7 @@ static ssize_t vidi_show_connection(struct device *dev,
 	return rc;
 }
 
-static ssize_t vidi_store_connection(struct device *dev,
+static ssize_t connection_store(struct device *dev,
 				struct device_attribute *attr,
 				const char *buf, size_t len)
 {
@@ -211,8 +211,7 @@ static ssize_t vidi_store_connection(struct device *dev,
 	return len;
 }
 
-static DEVICE_ATTR(connection, 0644, vidi_show_connection,
-			vidi_store_connection);
+static DEVICE_ATTR_RW(connection);
 
 static struct attribute *vidi_attrs[] = {
 	&dev_attr_connection.attr,
-- 
2.17.1


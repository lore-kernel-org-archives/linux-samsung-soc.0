Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B474EC433E6
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Mar 2021 11:49:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7983664E45
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Mar 2021 11:49:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbhCOLtO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 15 Mar 2021 07:49:14 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:13606 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbhCOLtC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 07:49:02 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DzZQh055qz17LYr;
        Mon, 15 Mar 2021 19:47:08 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Mon, 15 Mar 2021 19:48:55 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <inki.dae@samsung.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <krzk@kernel.org>
CC:     <dri-devel@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>
Subject: [PATCH v2] drm/exynos: move to use request_irq by IRQF_NO_AUTOEN flag
Date:   Mon, 15 Mar 2021 19:49:37 +0800
Message-ID: <1615808977-36044-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

After this patch cbe16f35bee68 genirq: Add IRQF_NO_AUTOEN for
request_irq/nmi() is merged. request_irq() after setting
IRQ_NOAUTOEN as below

irq_set_status_flags(irq, IRQ_NOAUTOEN);
request_irq(dev, irq...);
can be replaced by request_irq() with IRQF_NO_AUTOEN flag.

v2:
Fix the problem of using wrong flags

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 4 ++--
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 1f79bc2..c277d2f 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -775,8 +775,8 @@ static int decon_conf_irq(struct decon_context *ctx, const char *name,
 			return irq;
 		}
 	}
-	irq_set_status_flags(irq, IRQ_NOAUTOEN);
-	ret = devm_request_irq(ctx->dev, irq, handler, flags, "drm_decon", ctx);
+	ret = devm_request_irq(ctx->dev, irq, handler,
+			       flags | IRQF_NO_AUTOEN, "drm_decon", ctx);
 	if (ret < 0) {
 		dev_err(ctx->dev, "IRQ %s request failed\n", name);
 		return ret;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 83ab6b3..44e402b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1352,10 +1352,9 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
 	}
 
 	te_gpio_irq = gpio_to_irq(dsi->te_gpio);
-	irq_set_status_flags(te_gpio_irq, IRQ_NOAUTOEN);
 
 	ret = request_threaded_irq(te_gpio_irq, exynos_dsi_te_irq_handler, NULL,
-					IRQF_TRIGGER_RISING, "TE", dsi);
+				   IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN, "TE", dsi);
 	if (ret) {
 		dev_err(dsi->dev, "request interrupt failed with %d\n", ret);
 		gpio_free(dsi->te_gpio);
@@ -1802,9 +1801,9 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (dsi->irq < 0)
 		return dsi->irq;
 
-	irq_set_status_flags(dsi->irq, IRQ_NOAUTOEN);
 	ret = devm_request_threaded_irq(dev, dsi->irq, NULL,
-					exynos_dsi_irq, IRQF_ONESHOT,
+					exynos_dsi_irq,
+					IRQF_ONESHOT | IRQF_NO_AUTOEN,
 					dev_name(dev), dsi);
 	if (ret) {
 		dev_err(dev, "failed to request dsi irq\n");
-- 
2.7.4


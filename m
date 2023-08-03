Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D38C41513
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Aug 2023 02:47:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233618AbjHCCrr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Aug 2023 22:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233045AbjHCCro (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Aug 2023 22:47:44 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CAE926BD;
        Wed,  2 Aug 2023 19:47:31 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RGYBp1kcqzrS6m;
        Thu,  3 Aug 2023 10:46:26 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 10:47:29 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <sylvester.nawrocki@gmail.com>, <mchehab@kernel.org>,
        <ezequiel@vanguardiasur.com.ar>, <p.zabel@pengutronix.de>,
        <linux-media@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next 1/2] media: camif-core: Do not check for 0 return after calling platform_get_irq()
Date:   Thu, 3 Aug 2023 10:46:44 +0800
Message-ID: <20230803024645.2716057-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230803024645.2716057-1-ruanjinjie@huawei.com>
References: <20230803024645.2716057-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

It is not possible for platform_get_irq() to return 0. Use the
return value from platform_get_irq().

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/media/platform/samsung/s3c-camif/camif-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/s3c-camif/camif-core.c b/drivers/media/platform/samsung/s3c-camif/camif-core.c
index afe1fcc37354..e4529f666e20 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-core.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-core.c
@@ -381,8 +381,8 @@ static int camif_request_irqs(struct platform_device *pdev,
 		init_waitqueue_head(&vp->irq_queue);
 
 		irq = platform_get_irq(pdev, i);
-		if (irq <= 0)
-			return -ENXIO;
+		if (irq < 0)
+			return irq;
 
 		ret = devm_request_irq(&pdev->dev, irq, s3c_camif_irq_handler,
 				       0, dev_name(&pdev->dev), vp);
-- 
2.34.1


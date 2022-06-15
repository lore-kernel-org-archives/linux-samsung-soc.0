Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ACB7CCA473
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Jun 2022 09:26:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241256AbiFOJ0b (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Jun 2022 05:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238242AbiFOJ0a (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Jun 2022 05:26:30 -0400
X-Greylist: delayed 1852 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 15 Jun 2022 02:26:29 PDT
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8241715837
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jun 2022 02:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=FoyvE
        K5+1pRTQLkW/X2jHCeq//YHVhfHZeoFpXlqC70=; b=DXsrAcd8CxV3E3fiHvBps
        7rgQktf3PyXCdjGAVDn7xU4wTWmO1bp889/baGnPZbDevFiCL82MI7GIBOyD0Lb8
        wg/J8NMAB+mLKY68Xh+4ZPpylpCjz1ScVKEHwSYwRsNR9dc159Vvw/klBCLQeaZd
        CCZ0MVrJRJcBUyY+DRtemg=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp9 (Coremail) with SMTP id NeRpCgCXNXt+nqliOj0dEw--.42832S2;
        Wed, 15 Jun 2022 16:55:27 +0800 (CST)
From:   heliang <windhl@126.com>
To:     krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        windhl@126.com
Subject: [PATCH] soc: samsung: Add missing of_node_put in exynos-pmu.c
Date:   Wed, 15 Jun 2022 16:55:25 +0800
Message-Id: <20220615085525.3961330-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NeRpCgCXNXt+nqliOj0dEw--.42832S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZry8Xry3Gw17uw1kZr13Arb_yoWDKrb_G3
        W8urW7XF4jqw4xXw4DCF9xu3s09F1fWasaqFWIqF9xAw4DZr4UJFWvvrnxA34xXrWUZFyD
        Ar4DZr4xCr47tjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_znQ7UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizgMhF18RPS+3oQABsw
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

In exynos_get_pmu_regmap(), of_find_matching_node() will return a
node pointer with refcount incremented. We should use of_node_put()
for that node pointer. We need a similar code logic in the function
syscon_regmap_lookup_by_compatible().

Signed-off-by: heliang <windhl@126.com>
---
 drivers/soc/samsung/exynos-pmu.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 732c86ce2be8..a44862c405a4 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -108,9 +108,13 @@ struct regmap *exynos_get_pmu_regmap(void)
 {
 	struct device_node *np = of_find_matching_node(NULL,
 						      exynos_pmu_of_device_ids);
-	if (np)
-		return syscon_node_to_regmap(np);
-	return ERR_PTR(-ENODEV);
+	struct regmap *regmap;
+	if (!np)
+		return ERR_PTR(-ENODEV);
+	
+	regmap = syscon_node_to_regmap(np);
+	of_node_put(np);
+	return regmap;
 }
 EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap);
 
-- 
2.25.1


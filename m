Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730F8C8300F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Dec 2020 20:01:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15FC022241
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Dec 2020 20:01:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388166AbgLBUBS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Dec 2020 15:01:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:58030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388036AbgLBUBS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Dec 2020 15:01:18 -0500
From:   Krzysztof Kozlowski <krzk@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 2/2] soc: samsung: exynos-chipid: initialize later - with arch_initcall
Date:   Wed,  2 Dec 2020 21:59:55 +0200
Message-Id: <20201202195955.128633-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202195955.128633-1-krzk@kernel.org>
References: <20201202195955.128633-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Exynos ChipID driver on Exynos SoCs has only informational
purpose - to expose the SoC device in sysfs.  No other drivers
depend on it so there is really no benefit of initializing it early.

Instead, initialize everything with arch_initcall which:
1. Allows to use dev_info() as the SoC bus is present (since
   core_initcall),
2. Could speed things up because of execution in a SMP environment
   (after bringing up secondary CPUs, unlike early_initcall),
3. Reduces the amount of work to be done early, when the kernel has to
   bring up critical devices.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/soc/samsung/exynos-chipid.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index b4cd0cc00f45..1a76eade2ed6 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -99,9 +99,9 @@ static int __init exynos_chipid_early_init(void)
 		goto err;
 	}
 
-	/* it is too early to use dev_info() here (soc_dev is NULL) */
-	pr_info("soc soc0: Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
-		soc_dev_attr->soc_id, product_id, revision);
+	dev_info(soc_device_to_device(soc_dev),
+		 "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
+		 soc_dev_attr->soc_id, product_id, revision);
 
 	return 0;
 
@@ -111,4 +111,4 @@ static int __init exynos_chipid_early_init(void)
 	return ret;
 }
 
-early_initcall(exynos_chipid_early_init);
+arch_initcall(exynos_chipid_early_init);
-- 
2.25.1


Return-Path: <SRS0=2c9Z=DI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445BBC4741F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  1 Oct 2020 16:57:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EFFC4208B6
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  1 Oct 2020 16:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601571429;
	bh=7aS47hyWVPzM2FOSyLz/dbb6z+WLaI/DDtFRbtnS01M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ZBrLJf8LcWYwA1WCLWV9T4kYm3Dmn2smZXAcllu8Zd1sPb25Ug27O148WoPxtRk5r
	 jnwkLrtY19IkKjqxoxW5KPsEkHsi64S+vPvjqYcry+Fg/K/sMVNgV2rpnpFkduE1dt
	 mp8jtZsGRhad1NFGqvWNtKqWfuVEoD5p+HOj/9hY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732096AbgJAQ5I (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 1 Oct 2020 12:57:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:34560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732642AbgJAQ5H (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Oct 2020 12:57:07 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.194])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EBFD220872;
        Thu,  1 Oct 2020 16:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601571427;
        bh=7aS47hyWVPzM2FOSyLz/dbb6z+WLaI/DDtFRbtnS01M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p10ja8kQugkWnEQ8ppSUuDgBeFdJpiuH7SskLjgzN7fFSLM+EFUJeXa64gMX8Pcxl
         xN2KBBX3baZW9zZIHdIsfflXSYlWsqXEdwZWXCZGLUc6xM8t2spjAfHu82qcq28z6j
         zAgZ0MG3ssa0lcHtINmR5O/K/UmgqT0eTp16ZwRk=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/2] soc: samsung: exynos-pmu: instantiate clkout driver as MFD
Date:   Thu,  1 Oct 2020 18:56:45 +0200
Message-Id: <20201001165646.32279-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201001165646.32279-1-krzk@kernel.org>
References: <20201001165646.32279-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Exynos clock output (clkout) driver uses same register address space
(Power Management Unit address space) as Exynos PMU driver and same set
of compatibles.  It was modeled as clock provider instantiated with
CLK_OF_DECLARE_DRIVE().

This however brings ordering problems and lack of probe deferral,
therefore clkout driver should be converted to a regular module and
instantiated as a child of PMU driver to be able to use existing
compatibles and address space.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/soc/samsung/exynos-pmu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 17304fa18429..a18c93a4646c 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -8,6 +8,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
+#include <linux/mfd/core.h>
 #include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
@@ -97,6 +98,10 @@ static const struct of_device_id exynos_pmu_of_device_ids[] = {
 	{ /*sentinel*/ },
 };
 
+static const struct mfd_cell exynos_pmu_devs[] = {
+	{ .name = "exynos-clkout", },
+};
+
 struct regmap *exynos_get_pmu_regmap(void)
 {
 	struct device_node *np = of_find_matching_node(NULL,
@@ -110,6 +115,7 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap);
 static int exynos_pmu_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	int ret;
 
 	pmu_base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pmu_base_addr))
@@ -128,6 +134,11 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pmu_context);
 
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, exynos_pmu_devs,
+				   ARRAY_SIZE(exynos_pmu_devs), NULL, 0, NULL);
+	if (ret)
+		return ret;
+
 	if (devm_of_platform_populate(dev))
 		dev_err(dev, "Error populating children, reboot and poweroff might not work properly\n");
 
-- 
2.17.1


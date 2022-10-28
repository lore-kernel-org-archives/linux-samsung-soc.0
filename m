Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57CC5ECAAA1
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 Oct 2022 19:13:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbiJ1TNC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 28 Oct 2022 15:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbiJ1TMz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Oct 2022 15:12:55 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3585522C453
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Oct 2022 12:12:53 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id v27so9267824eda.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Oct 2022 12:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ce4G8W5n1Lw9GJ2OPzfRvhL8Ar7JfIK4yfZO67gLs8o=;
        b=USP77o4Kj2PXkea5iju4USuaykmQfPyYjmvznDQakbS8TtPG6SAAgBqdEnSwNoevF2
         9/MX/qCCFNYzLoU8S55oAFU4v3FXisMLnhwxhZE34gQSNi7Nh5ffwJNiNHW+ZGnIwjdt
         5aVCxJdIEFHlacrIJJ0tIfaoOAbetXlbZmi9sRAWGTjVXLt7Az796qbPtToLaUDVkK0O
         uRUMhOePJ0xuK4nt1CshdgJXZHiYpRUWgiAI1FtQw+k/U4IGZD92SPs+gtu30naDO3hJ
         vk/pVENy7WDuEPyvq5+PPbKqwzI+wI0tCiZ76IYjhi46RsCLGdKsqCyoOTDVEdSPN7Sa
         HeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ce4G8W5n1Lw9GJ2OPzfRvhL8Ar7JfIK4yfZO67gLs8o=;
        b=8K8SeNu7gu0HkdLkIlTwFx1Poa6ZEPSRA+H0uRsRlYA0Bxh0yBVml4/nZB5y0bMcMY
         Kg7h+Wf7Zi9xvYhafock8I9CLGwSlUkEuyiTvEcQxfqveOxZlUd2Lj20RmMZ3/yJrFd/
         kVBBr+cNptPZHx5PVAzxzQEVPfTpHPq9rZV9BIflQ45//bTFztfWV4aJvnN7rP39GzCj
         ts4B4oVra2Qh9UV+5QGMpreQ7z4If1q+5AhCETKuCE6UNFGTPyn7rL5FaoHmjkGMBEsS
         SoPyXrySpxi6iXFHi1U+rQkexMk0Pk5fYgBkKFyb2HjlkaiP+baF2Wx3l3BLgaUaiRIa
         lV3Q==
X-Gm-Message-State: ACrzQf1PTR/B3lT1s4NdYyxrUCdnwVsd60VFasZL17ZoJF+9XY+aEKrA
        ZKANUy5FhCRHhg6L0/95SG0K3g==
X-Google-Smtp-Source: AMsMyM6fQx72vUp95PoUjSyByIOuAe4YYAUh6ucP84vWfDBeUQfZYGHasjqdWI7uR1/gJ5ciL2E5Cw==
X-Received: by 2002:a05:6402:448c:b0:457:52eb:b57e with SMTP id er12-20020a056402448c00b0045752ebb57emr948141edb.178.1666984371738;
        Fri, 28 Oct 2022 12:12:51 -0700 (PDT)
Received: from localhost (cgw.msart-bajzova4.ke.cust.o2bs.sk. [90.176.4.227])
        by smtp.gmail.com with ESMTPSA id fx1-20020a170906b74100b007a7f9b6318asm2569764ejb.50.2022.10.28.12.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 12:12:51 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Janghyuck Kim <janghyuck.kim@samsung.com>,
        Cho KyongHo <pullip.cho@samsung.com>,
        Daniel Mentz <danielmentz@google.com>,
        David Virag <virag.david003@gmail.com>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 3/4] iommu/exynos: Modularize the driver
Date:   Fri, 28 Oct 2022 21:12:42 +0200
Message-Id: <20221028191243.31721-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221028191243.31721-1-semen.protsenko@linaro.org>
References: <20221028191243.31721-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Rework the driver so it can be built as a loadable module. That can be
useful as not all ARM64 platforms need it. And that's ok for it to be a
module because it's not a critical driver (platform can work when it's
disabled).

Also add the shutdown driver method, while at it. That was inspired by
other IOMMU drivers, and can be useful e.g. for performing a kexec. See
commit 1a4e90f25b2c ("iommu/rockchip: Perform a reset on shutdown") for
example.

Remove method and module exit function are not implemented, as the
removal of IOMMUs cannot be done reliably. As Robin Murphy mentioned in
[1]:

    ...it's better not to even pretend that removing an IOMMU's driver
    while other drivers are using it (usually via DMA ops without even
    realising) is going to have anything other than catastrophic
    results.

[1] https://lore.kernel.org/lkml/20220702213724.3949-2-semen.protsenko@linaro.org/T/#md7e1e3f5b2c9e7fa5bc28fe33e818b6aa4a7237c

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/iommu/Kconfig        |  2 +-
 drivers/iommu/exynos-iommu.c | 18 +++++++++++++++++-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index dc5f7a156ff5..6f7055606679 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -259,7 +259,7 @@ config TEGRA_IOMMU_SMMU
 	  SoCs (Tegra30 up to Tegra210).
 
 config EXYNOS_IOMMU
-	bool "Exynos IOMMU Support"
+	tristate "Exynos IOMMU Support"
 	depends on ARCH_EXYNOS || COMPILE_TEST
 	depends on !CPU_BIG_ENDIAN # revisit driver if we can enable big-endian ptes
 	select IOMMU_API
diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 0d150b383d04..57492db877e2 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -16,6 +16,7 @@
 #include <linux/interrupt.h>
 #include <linux/kmemleak.h>
 #include <linux/list.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
@@ -752,6 +753,16 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void exynos_sysmmu_shutdown(struct platform_device *pdev)
+{
+	struct sysmmu_drvdata *data = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+	int irq = platform_get_irq(pdev, 0);
+
+	devm_free_irq(dev, irq, data);
+	pm_runtime_force_suspend(dev);
+}
+
 static int __maybe_unused exynos_sysmmu_suspend(struct device *dev)
 {
 	struct sysmmu_drvdata *data = dev_get_drvdata(dev);
@@ -799,8 +810,9 @@ static const struct of_device_id sysmmu_of_match[] = {
 	{ },
 };
 
-static struct platform_driver exynos_sysmmu_driver __refdata = {
+static struct platform_driver exynos_sysmmu_driver = {
 	.probe	= exynos_sysmmu_probe,
+	.shutdown = exynos_sysmmu_shutdown,
 	.driver	= {
 		.name		= "exynos-sysmmu",
 		.of_match_table	= sysmmu_of_match,
@@ -1404,6 +1416,7 @@ static const struct iommu_ops exynos_iommu_ops = {
 	.release_device = exynos_iommu_release_device,
 	.pgsize_bitmap = SECT_SIZE | LPAGE_SIZE | SPAGE_SIZE,
 	.of_xlate = exynos_iommu_of_xlate,
+	.owner = THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= exynos_iommu_attach_device,
 		.detach_dev	= exynos_iommu_detach_device,
@@ -1454,3 +1467,6 @@ static int __init exynos_iommu_init(void)
 	return ret;
 }
 core_initcall(exynos_iommu_init);
+
+MODULE_DESCRIPTION("IOMMU driver for Exynos SoCs");
+MODULE_LICENSE("GPL");
-- 
2.35.1


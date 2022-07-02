Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F35CCA47B
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  2 Jul 2022 21:37:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbiGBVhh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 2 Jul 2022 17:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbiGBVhc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 2 Jul 2022 17:37:32 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74E38BC01
        for <linux-samsung-soc@vger.kernel.org>; Sat,  2 Jul 2022 14:37:31 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id fi2so10023311ejb.9
        for <linux-samsung-soc@vger.kernel.org>; Sat, 02 Jul 2022 14:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NerRWmIAqCEP1T7lOGIa0oD8kf3CJfnc5B6DWtDa2sE=;
        b=xsw6tvMIlFqstWxTvGLa4TpWz2DJ+yswH+8y8zk8yKzSNRHci0nEyC3BoHWzFaZV7f
         YkNV66s6p3f2RyRoAefnzdCAu3fjYzarXnk9kUmT9xcetm1kjqDEyXYV//sBpZYDjmOx
         1Bv66ppk5mjr+HngPMnZu7Z7fh6TQWlLQHzDXeJYt/R1Y0k+JjHSvzE2A6K05mUrzeuu
         oL6nqBiARDdsTcWRiGxmb6T0diWSYpnf8O5wkvHdcO+ask/LMhhsahwKKsB/ezAhQMOT
         iYwqlL0C/Wc5qu+pJCPcjusoOA7owcWSEHjnJpbv7bMsYVYqm+LgT2hM1q8YJE2+nrsK
         nZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NerRWmIAqCEP1T7lOGIa0oD8kf3CJfnc5B6DWtDa2sE=;
        b=r7kmme0eqgoxvTpmNuQvwM4s7wA/9HCBM4sasJ7BSMTANcfVhkxQCEVSQWIGXV8fyu
         GR8jeR4HFhHLgNAcc85L3A5WvW/BpIGjfHp/Ee6hYhRE4SJO5K+apCfOeG7NbGO67lgv
         FtXl0Mce7nUEGam29ZBI/907hOgxxz6dLRZoWHfjim4r/vxa2L+Vf64RnlKeJN1uxEIZ
         u2eys7Rm4jmIi1NMi8xtXDOJsAw0EXKzVFepW5LMlEtZKwbCKjb2VrzEcKVeiHzByC/3
         MGvpbO9WRSdeHBBicsvM20BJh+xurL/AvX/M75mfbyX1CH3XzbbCWqh/kIkSmGlZ7I7x
         rHdg==
X-Gm-Message-State: AJIora+jUU7skfWUdJbHS4BBMZoHOKbvroluzBJ93EXC6HnqcHsbLDqL
        /dHlN0N+v5jHx/3la1hF1e+NQw==
X-Google-Smtp-Source: AGRyM1vXXFFAKoyt7zObR5eXNjgaVHoYU0jAUJslw/5Qy5AQvNGbBV1vrhVRIPih14LXllVxYy7Bkg==
X-Received: by 2002:a17:906:9508:b0:723:ef49:fe4c with SMTP id u8-20020a170906950800b00723ef49fe4cmr21582570ejx.489.1656797850013;
        Sat, 02 Jul 2022 14:37:30 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090631d600b0072a3958ed33sm5021648ejf.63.2022.07.02.14.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 14:37:29 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Janghyuck Kim <janghyuck.kim@samsung.com>,
        Cho KyongHo <pullip.cho@samsung.com>,
        Daniel Mentz <danielmentz@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        iommu@lists.linux-foundation.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] iommu/exynos: Add minimal support for SysMMU v7 with VM registers
Date:   Sun,  3 Jul 2022 00:37:24 +0300
Message-Id: <20220702213724.3949-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220702213724.3949-1-semen.protsenko@linaro.org>
References: <20220702213724.3949-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add minimal viable support for SysMMU v7.x, which can be found in modern
Exynos chips (like Exynos850). SysMMU v7.x may implement VM register
set, and those registers should be initialized properly if present.
Usually 8 translation domains are supported via VM registers (0..7), but
only n=0 (default) is used for now.

Changes are as follows:
  - add enabling the default VID instance before enabling SysMMU
  - use v7 VM register for setting the page table base address
  - use v7 VM register for invalidation

Insights for those changes were taken by comparing the I/O dump
(writel() / readl() operations) for vendor driver and this upstream
driver.

It was tested on E850-96 board, which has SysMMU v7.4 with VM registers
present. The testing was done using "Emulated Translation" registers.
That allows initiating translations with no actual users of that IOMMU,
and checking the result by reading the TLB info from corresponding
registers.

Thanks to Marek, who did let me know it only takes a slight change of
registers to make this driver work with v7.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/iommu/exynos-iommu.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 47017e8945c5..b7b4833161bc 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -135,6 +135,8 @@ static u32 lv2ent_offset(sysmmu_iova_t iova)
 #define CFG_SYSSEL	(1 << 22) /* System MMU 3.2 only */
 #define CFG_FLPDCACHE	(1 << 20) /* System MMU 3.2+ only */
 
+#define CTRL_VM_ENABLE			BIT(0)
+#define CTRL_VM_FAULT_MODE_STALL	BIT(3)
 #define CAPA0_CAPA1_EXIST		BIT(11)
 #define CAPA1_VCR_ENABLED		BIT(14)
 
@@ -358,8 +360,10 @@ static void __sysmmu_tlb_invalidate(struct sysmmu_drvdata *data)
 {
 	if (MMU_MAJ_VER(data->version) < 5)
 		writel(0x1, data->sfrbase + REG_MMU_FLUSH);
-	else
+	else if (MMU_MAJ_VER(data->version) < 7)
 		writel(0x1, data->sfrbase + REG_V5_MMU_FLUSH_ALL);
+	else
+		writel(0x1, MMU_VM_REG(data, IDX_ALL_INV, 0));
 }
 
 static void __sysmmu_tlb_invalidate_entry(struct sysmmu_drvdata *data,
@@ -391,9 +395,11 @@ static void __sysmmu_set_ptbase(struct sysmmu_drvdata *data, phys_addr_t pgd)
 {
 	if (MMU_MAJ_VER(data->version) < 5)
 		writel(pgd, data->sfrbase + REG_PT_BASE_ADDR);
-	else
+	else if (MMU_MAJ_VER(data->version) < 7)
 		writel(pgd >> PAGE_SHIFT,
 			     data->sfrbase + REG_V5_PT_BASE_PFN);
+	else
+		writel(pgd >> SPAGE_ORDER, MMU_VM_REG(data, IDX_FLPT_BASE, 0));
 
 	__sysmmu_tlb_invalidate(data);
 }
@@ -571,6 +577,12 @@ static void __sysmmu_enable(struct sysmmu_drvdata *data)
 	writel(CTRL_BLOCK, data->sfrbase + REG_MMU_CTRL);
 	__sysmmu_init_config(data);
 	__sysmmu_set_ptbase(data, data->pgtable);
+	if (MMU_MAJ_VER(data->version) >= 7 && data->has_vcr) {
+		u32 ctrl = readl(MMU_VM_REG(data, IDX_CTRL_VM, 0));
+
+		ctrl |= CTRL_VM_ENABLE | CTRL_VM_FAULT_MODE_STALL;
+		writel(ctrl, MMU_VM_REG(data, IDX_CTRL_VM, 0));
+	}
 	writel(CTRL_ENABLE, data->sfrbase + REG_MMU_CTRL);
 	data->active = true;
 	spin_unlock_irqrestore(&data->lock, flags);
-- 
2.30.2


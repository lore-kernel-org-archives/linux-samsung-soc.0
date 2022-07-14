Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D81C43334
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Jul 2022 16:56:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239150AbiGNQ4P (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Jul 2022 12:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239841AbiGNQ4D (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Jul 2022 12:56:03 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55BCC55097
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jul 2022 09:56:02 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id z12so3369263wrq.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jul 2022 09:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nU0WVVbdgEc789G5a6s5LocA0QeCbC2E3DQ5sHk48Y8=;
        b=IYzHDmH6TgdKlf033EfO1Bg7jNq4Zm8uLryO7o6yzv6Ii23qReYyoXEWZNdJN4wNBz
         91CunxhQuK2D4gOwqIQIPlvaMskTJn7ZqteC4EL4/6gPBvpJkKZAGc3wGrtaJG9IxL1a
         CB6noJky+hMahbL7giTw4QO2UCSHzu3CTOHUm7EF2V1L2UClKHK+r40pTMyRCWXgwEcC
         +5R7j+/v2Xc3nW2EhkvgoQgVYu7cXbbRPBdQJqhy0NF2Ua1NcIxp2VMipbNQTsSp1Lfy
         2DWAETiTz1VZ9n+vIBEjZlwLH54b4etHBnO4sCojLtvP+erRugR8wUTqVr8wd9Mi967+
         yWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nU0WVVbdgEc789G5a6s5LocA0QeCbC2E3DQ5sHk48Y8=;
        b=OKVu3hzT534lbhB+kl9Nqx8Jvc5JwHdy6VtPybqy+CbBMg3fzBwP5g7KmybS7V99Xp
         Ai3cbg2mTOhFaW4QikZqYANUB849q34lSPjuLfgsyq2Q/5E1vqhL7+YkLyLN/kHJsman
         jRhnIoEMoIZbIFnSbCdqo1VCJ3JM0AChHCbPYLKdEkSL02Ufq95bn6rtbJu+48JmhyVa
         7tA+rfTqz6nOGuBNgNHlle6/pGwEos1dzruWlDlbsewkHWyT9HqrpOqSNQZtisEg3SZB
         1K6I+hCvoJND9+0GTFWjzVKQfg4RH6RKpaWusGsjiouGbalrRFH9EZsVWL+HQhkyYFvq
         TmQQ==
X-Gm-Message-State: AJIora/s+UwsMzF7rXol1J6Vwd0hfZ9fal01l/Lfdbp7oNvaY9YGBLWd
        /l5LdwtwmYtWodNW/4LSaceSiQ==
X-Google-Smtp-Source: AGRyM1s90qNS8RahfDcyAz6R2NLl80gXy4ylX6MoZ40JpBSVeuXHVLVvAuPqfZ3uGCFbPVq6lPH2Xw==
X-Received: by 2002:a5d:6da3:0:b0:21d:cde7:cb7 with SMTP id u3-20020a5d6da3000000b0021dcde70cb7mr227704wrs.683.1657817760912;
        Thu, 14 Jul 2022 09:56:00 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id l29-20020a05600c1d1d00b003a2e27fc275sm2797092wms.12.2022.07.14.09.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 09:56:00 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Janghyuck Kim <janghyuck.kim@samsung.com>,
        Cho KyongHo <pullip.cho@samsung.com>,
        Daniel Mentz <danielmentz@google.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] iommu/exynos: Enable default VM instance on SysMMU v7
Date:   Thu, 14 Jul 2022 19:55:50 +0300
Message-Id: <20220714165550.8884-7-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220714165550.8884-1-semen.protsenko@linaro.org>
References: <20220714165550.8884-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

In order to enable SysMMU v7 with VM register layout, at least the
default VM instance (n=0) must be enabled, in addition to enabling the
SysMMU itself. To do so, add corresponding write to MMU_CTRL_VM[0]
register, before writing to MMU_CTRL register.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
Changes in v3:
  - Reworked for using plain writel()
  - Added Marek's Acked-by tag

Changes in v2:
  - Extracted VM enabling code to the separate function
  - Used new SysMMU read/write functions to access the registers

 drivers/iommu/exynos-iommu.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index fc9ef3ff0057..8e18984a0c4f 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -135,6 +135,8 @@ static u32 lv2ent_offset(sysmmu_iova_t iova)
 #define CFG_SYSSEL	(1 << 22) /* System MMU 3.2 only */
 #define CFG_FLPDCACHE	(1 << 20) /* System MMU 3.2+ only */
 
+#define CTRL_VM_ENABLE			BIT(0)
+#define CTRL_VM_FAULT_MODE_STALL	BIT(3)
 #define CAPA0_CAPA1_EXIST		BIT(11)
 #define CAPA1_VCR_ENABLED		BIT(14)
 
@@ -163,6 +165,7 @@ static u32 lv2ent_offset(sysmmu_iova_t iova)
 /* v7.x registers */
 #define REG_V7_CAPA0		0x870
 #define REG_V7_CAPA1		0x874
+#define REG_V7_CTRL_VM		0x8000
 
 #define has_sysmmu(dev)		(dev_iommu_priv_get(dev) != NULL)
 
@@ -548,6 +551,18 @@ static void __sysmmu_init_config(struct sysmmu_drvdata *data)
 	writel(cfg, data->sfrbase + REG_MMU_CFG);
 }
 
+static void __sysmmu_enable_vid(struct sysmmu_drvdata *data)
+{
+	u32 ctrl;
+
+	if (MMU_MAJ_VER(data->version) < 7 || !data->has_vcr)
+		return;
+
+	ctrl = readl(data->sfrbase + REG_V7_CTRL_VM);
+	ctrl |= CTRL_VM_ENABLE | CTRL_VM_FAULT_MODE_STALL;
+	writel(ctrl, data->sfrbase + REG_V7_CTRL_VM);
+}
+
 static void __sysmmu_enable(struct sysmmu_drvdata *data)
 {
 	unsigned long flags;
@@ -558,6 +573,7 @@ static void __sysmmu_enable(struct sysmmu_drvdata *data)
 	writel(CTRL_BLOCK, data->sfrbase + REG_MMU_CTRL);
 	__sysmmu_init_config(data);
 	__sysmmu_set_ptbase(data, data->pgtable);
+	__sysmmu_enable_vid(data);
 	writel(CTRL_ENABLE, data->sfrbase + REG_MMU_CTRL);
 	data->active = true;
 	spin_unlock_irqrestore(&data->lock, flags);
-- 
2.30.2


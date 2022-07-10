Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4375C43334
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 10 Jul 2022 23:06:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbiGJXGP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 10 Jul 2022 19:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiGJXGM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 10 Jul 2022 19:06:12 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E6611C27
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Jul 2022 16:06:11 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id c131-20020a1c3589000000b003a2cc290135so2524030wma.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Jul 2022 16:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w2PeNTtURN4eXiGBF6CxKQXSRiBt5jDvHMJleZnMrb8=;
        b=SfvM5oJytjZQ0qgq6y6BcnOrkFe6G++JtjOTDQFIQy2kgaAxgwLpB5KAEhdQ4dKMz8
         HoBc+ochk9ozAdgUZ13Hd59aOuAajgWW+mcNk2uZta1Rod3/cklDhVfxVNBZLtY6j3n9
         DMs9Rfu47zEtjoLQm4yf2J0eUMwvOXkXwrh3RIy3Eavm7GoxQ85kk/KYwqOAe32aIaHr
         Hx4M1hZpVcUo0CZp3kcDklEjgh4BRVuFJR/GVf1kBEiFg4rxNH3WY6BU5dkBDHxSugGZ
         fxOCN3PTL3wdpk3L8tQiP5NSQwhY5JCCh1Lm4StdUnkpP2qNOUb7MtzEWBes5MwEu43z
         89Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w2PeNTtURN4eXiGBF6CxKQXSRiBt5jDvHMJleZnMrb8=;
        b=rvWG1tcyCn5/IEk7G2IXSOZAEcYmEaRES4GaoS4wbUtevOx5hqahaICfLFrztnqwmY
         t1FJ27P41rEi1R+JCq8qkfSqDkCh8j1u591faBVTk6ion0k0FQVUJ1i0uPBltWX1WFO7
         KfmQRXpwjFJqAlk/b6eV3GArN1qO9V+yR1ZubB4xuK7tAl3bgQ27zXVp9IJU1I797crO
         pmL5SUdHhvpcHdA94fGVdtEGdEsdfdhs2Luemjg2TMHuyqXc5XUfH5ifyuYsClOXNwaq
         WG9LueyFN6W9K+qNEYeL+CtjvSZIWUPorABYCMUXFxL+xwN9B/Zom04gekSyT6Mjwnfo
         8enQ==
X-Gm-Message-State: AJIora8aRzpBqO4DSF1cYuynX2n+3eGVM3AA0P3iYeZ8ygffWtLgnC81
        Ly6leB8VAebO2QXiSRA9DNLUog==
X-Google-Smtp-Source: AGRyM1sZmV2sI4U7V2nh9Zjsi3UJqRjqwe+PtYS7xEw2DVSpOkpBC8oL9Ojd/vLUIfssJW2LX5R2Pg==
X-Received: by 2002:a05:600c:210d:b0:3a2:e686:e14 with SMTP id u13-20020a05600c210d00b003a2e6860e14mr3277007wml.25.1657494370779;
        Sun, 10 Jul 2022 16:06:10 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id k1-20020adfd841000000b0021d73772c87sm4398867wrl.91.2022.07.10.16.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 16:06:10 -0700 (PDT)
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
Subject: [PATCH v2 5/7] iommu/exynos: Check if SysMMU v7 has VM registers
Date:   Mon, 11 Jul 2022 02:06:01 +0300
Message-Id: <20220710230603.13526-6-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220710230603.13526-1-semen.protsenko@linaro.org>
References: <20220710230603.13526-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

SysMMU v7 can have Virtual Machine registers, which implement multiple
translation domains. The driver should know if it's true or not, as VM
registers shouldn't be accessed if not present. Read corresponding
capabilities register to obtain that info, and store it in driver data.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Removed the 'const' qualifier for local non-pointer variables

 drivers/iommu/exynos-iommu.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 0cb1ce10db51..48681189ccf8 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -135,6 +135,9 @@ static u32 lv2ent_offset(sysmmu_iova_t iova)
 #define CFG_SYSSEL	(1 << 22) /* System MMU 3.2 only */
 #define CFG_FLPDCACHE	(1 << 20) /* System MMU 3.2+ only */
 
+#define CAPA0_CAPA1_EXIST		BIT(11)
+#define CAPA1_VCR_ENABLED		BIT(14)
+
 /* common registers */
 #define REG_MMU_VERSION		0x034
 
@@ -154,6 +157,10 @@ static u32 lv2ent_offset(sysmmu_iova_t iova)
 #define REG_V5_FAULT_AR_VA	0x070
 #define REG_V5_FAULT_AW_VA	0x080
 
+/* v7.x registers */
+#define REG_V7_CAPA0		0x870
+#define REG_V7_CAPA1		0x874
+
 #define has_sysmmu(dev)		(dev_iommu_priv_get(dev) != NULL)
 
 enum {
@@ -298,6 +305,9 @@ struct sysmmu_drvdata {
 
 	struct iommu_device iommu;	/* IOMMU core handle */
 	const unsigned int *regs;	/* register set */
+
+	/* v7 fields */
+	bool has_vcr;			/* virtual machine control register */
 };
 
 static struct exynos_iommu_domain *to_exynos_domain(struct iommu_domain *dom)
@@ -411,11 +421,27 @@ static void __sysmmu_get_version(struct sysmmu_drvdata *data)
 		MMU_MAJ_VER(data->version), MMU_MIN_VER(data->version));
 }
 
+static bool __sysmmu_has_capa1(struct sysmmu_drvdata *data)
+{
+	u32 capa0 = readl(data->sfrbase + REG_V7_CAPA0);
+
+	return capa0 & CAPA0_CAPA1_EXIST;
+}
+
+static void __sysmmu_get_vcr(struct sysmmu_drvdata *data)
+{
+	u32 capa1 = readl(data->sfrbase + REG_V7_CAPA1);
+
+	data->has_vcr = capa1 & CAPA1_VCR_ENABLED;
+}
+
 static void sysmmu_get_hw_info(struct sysmmu_drvdata *data)
 {
 	__sysmmu_enable_clocks(data);
 
 	__sysmmu_get_version(data);
+	if (MMU_MAJ_VER(data->version) >= 7 && __sysmmu_has_capa1(data))
+		__sysmmu_get_vcr(data);
 	if (MMU_MAJ_VER(data->version) < 5)
 		data->regs = sysmmu_regs[REG_SET_V1];
 	else
-- 
2.30.2


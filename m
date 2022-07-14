Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106E7C43334
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Jul 2022 16:56:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239382AbiGNQz6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Jul 2022 12:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239171AbiGNQz4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Jul 2022 12:55:56 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 523C84BD2A
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jul 2022 09:55:55 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id a5so3334154wrx.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jul 2022 09:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ay55aei4xTrkHOP8ZwisRNILeuMCaqkFFuCni3Xut2k=;
        b=n/n3e8j6bJWOXrP95ItdWQVXPuQ0bCFwqzgIEykBYyxN3XjVeTR1h2M0DL/r3D8+I3
         /wlwQamJPhfWq2SMEaES+gscw97bq95Af/SwrUZ2xpihPH0LoDtjSyx5KZ6OX7VHh74Y
         2ThjifUbf5gBCXdAxi6cnn/9ECyQgHcx/tFyUwbKgSYON23z/QjPXt+UL4mCPvkiiaZB
         BfzF+kdEOK7IsC22SKqdZgxtyODLUH00aerRHytO8EVmLyMQvKNSH8tlkSRlFMtdPxel
         VtKnZSYceBp0ZlmE4s7lh/U+Mu4GNt0iBnfIIbXLxlDhGzjC/okAk+Tc/d5AcgkHDnqB
         b8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ay55aei4xTrkHOP8ZwisRNILeuMCaqkFFuCni3Xut2k=;
        b=cpytjsbxWi1J6johqYaU6JQCF0N98GFlnpzbsQMAsPRo/zmasOCguOKTrxN86KZ/6R
         pJb5RameTuPhf26WeEBR8wXQMohReUbVlZP0DsCKJTy5CdqJr5jEmI0V+DI+SKyrE7qY
         UR9lX7SbYyP23TPL1WKpQeA9wQMl9EipyQYUzzkPT1aD9+EsMSAjW0kqMLP9lvXxJT+5
         idw818YBktza30fmIJ4Vml/BK1a7A0jkux0590i1Sg9zM9sBUgcdDd/iUmQagGj1Cj0J
         uXcXBLYSD8QgaCH91MFk2wQXrX/qm9w2cGyfqzeA/+cqVryzOTOOctuVkQmXq69D7UCq
         /BNw==
X-Gm-Message-State: AJIora8WE593GGiDnTme2p+p/fzG8sAKp5WxzD+pS5WgBkqmOIA6Tw9E
        KasEEeacymJ35g0MKf1b0W8IFA==
X-Google-Smtp-Source: AGRyM1vl2oDUNW33308hydkFGVWAVq3Dvpg9TwiwSGovoYQ89wJOF+Z1+82DoJM6Mkt65ij0+18yVw==
X-Received: by 2002:a05:6000:381:b0:21d:bb54:ae2c with SMTP id u1-20020a056000038100b0021dbb54ae2cmr8677229wrf.222.1657817753512;
        Thu, 14 Jul 2022 09:55:53 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id j9-20020a05600c190900b0039db31f6372sm7440915wmq.2.2022.07.14.09.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 09:55:53 -0700 (PDT)
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
Subject: [PATCH v3 1/6] iommu/exynos: Reuse SysMMU constants for page size and order
Date:   Thu, 14 Jul 2022 19:55:45 +0300
Message-Id: <20220714165550.8884-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220714165550.8884-1-semen.protsenko@linaro.org>
References: <20220714165550.8884-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Using SZ_4K in context of SysMMU driver is better than using PAGE_SIZE,
as PAGE_SIZE might have different value on different platforms. Though
it would be even better to use more specific constants, already existing
in SysMMU driver. Make the code more strict by using SPAGE_ORDER and
SPAGE_SIZE constants.

It also makes sense, as __sysmmu_tlb_invalidate_entry() also uses
SPAGE_* constants for further calculations with num_inv param, so it's
logical that num_inv should be previously calculated using also SPAGE_*
values.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
Changes in v3:
  - Added Marek's Acked-by tag
  - Added Krzysztof's R-b tag

Changes in v2:
  - (none) This patch is new and added in v2

 drivers/iommu/exynos-iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 79729892eb48..8f80aaa35092 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -340,7 +340,7 @@ static void __sysmmu_set_ptbase(struct sysmmu_drvdata *data, phys_addr_t pgd)
 	if (MMU_MAJ_VER(data->version) < 5)
 		writel(pgd, data->sfrbase + REG_PT_BASE_ADDR);
 	else
-		writel(pgd / SZ_4K, data->sfrbase + REG_V5_PT_BASE_PFN);
+		writel(pgd >> SPAGE_ORDER, data->sfrbase + REG_V5_PT_BASE_PFN);
 
 	__sysmmu_tlb_invalidate(data);
 }
@@ -550,7 +550,7 @@ static void sysmmu_tlb_invalidate_entry(struct sysmmu_drvdata *data,
 		 * 64KB page can be one of 16 consecutive sets.
 		 */
 		if (MMU_MAJ_VER(data->version) == 2)
-			num_inv = min_t(unsigned int, size / SZ_4K, 64);
+			num_inv = min_t(unsigned int, size / SPAGE_SIZE, 64);
 
 		if (sysmmu_block(data)) {
 			__sysmmu_tlb_invalidate_entry(data, iova, num_inv);
-- 
2.30.2


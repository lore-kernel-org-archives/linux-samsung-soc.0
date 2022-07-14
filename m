Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CD5C43334
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Jul 2022 16:56:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238905AbiGNQ4B (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Jul 2022 12:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239359AbiGNQz6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Jul 2022 12:55:58 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7AA454C99
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jul 2022 09:55:57 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id n185so1401965wmn.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jul 2022 09:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IZpjZAr4g1dpDBXrOrcfUkHPeUERh/JliRxp06JVucg=;
        b=W+Cm9cW/KqhsoUWLtK5lM2En6frOk3DnHTnfxJ1rLk8V1Yy7iqDT/XaD3KJvZtRB2s
         +wI1V2J9RGVol7di4+23oo12YHUhRPKldPKSV9YjJ5yjRhjrP2WaAN5WBs0dNPgnNpad
         HuJTHxC2yiT+rhVjRowuYazf0MbDsgo69VCsIM7HubxLF7kelLSkr0esfPhTrUxEUoAj
         qUDA/f2J+d74jP7aA8vMRl/XbZaIPTTn4CP/4jHqkfLZl09qcxuI9UEK/0ESchYUL1Bo
         wEKWTz5GNh1u+XnfmJpCtUYZJu5ERLefGE8Eh3Pylxz82X29Qo84Fi4d8pzdT2NYw5FK
         AGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IZpjZAr4g1dpDBXrOrcfUkHPeUERh/JliRxp06JVucg=;
        b=1SCIWrgitiXDqSjbjKrGdqBy4/TL0HnHHCHA7hEPHn2zAEYCxyxlKE4QLwuzgRa/yO
         4moVvtQCgohRS6u4PXf/Fp7hRrdC17Ol49HpfiVCQbK+XOZ/LnNGfRSU1rUB5NYoC8b4
         0GLi1zozihZ5iMaZfvzjg5Mq+/0e1EPCcbcAjK/c9kdMvhGXeqJMtQcKiZbb9JLYOZtD
         G6oGvB6oOUKLD0eSM0uYk634DYl1ibtE4CCP1g1Layhi9QskIsvUhBb8fQ5KG5IGzN69
         CTwV5XeypwaippqlpklLrfxhCRfLENf7JKUE7alOH0oIsUhckVTmIb+E5g/Gq9VUklfy
         e4UA==
X-Gm-Message-State: AJIora+7h1JWjPBKenUYUEwee57H1Ooo1Wr0n5NpvWmMbjfROBWRopx6
        N2CLLhij3iCgsND6Nv6qsJfZQQ==
X-Google-Smtp-Source: AGRyM1s5SKEFz/1UdqSHlysek2UsdEyn9+B60Wl05LPjeSEpx2hr6sr3sPBM4eoFrT1tNuALszo/rg==
X-Received: by 2002:a05:600c:1e87:b0:3a2:fd16:5934 with SMTP id be7-20020a05600c1e8700b003a2fd165934mr9028538wmb.25.1657817756378;
        Thu, 14 Jul 2022 09:55:56 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id l13-20020a05600c2ccd00b003a2f2bb72d5sm5516033wmc.45.2022.07.14.09.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 09:55:55 -0700 (PDT)
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
Subject: [PATCH v3 3/6] iommu/exynos: Set correct dma mask for SysMMU v5+
Date:   Thu, 14 Jul 2022 19:55:47 +0300
Message-Id: <20220714165550.8884-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220714165550.8884-1-semen.protsenko@linaro.org>
References: <20220714165550.8884-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

SysMMU v5+ supports 36 bit physical address space. Set corresponding DMA
mask to avoid falling back to SWTLBIO usage in dma_map_single() because
of failed dma_capable() check.

The original code for this fix was suggested by Marek.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Co-developed-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v3:
  - Added Krzysztof's Acked-by tag

Changes in v2:
  - Handled failed dma_set_mask() call
  - Replaced "Originally-by" tag by "Co-developed-by" + SoB tags

 drivers/iommu/exynos-iommu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index c85db9dab851..494f7d7aa9c5 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -646,6 +646,14 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (MMU_MAJ_VER(data->version) >= 5) {
+		ret = dma_set_mask(dev, DMA_BIT_MASK(36));
+		if (ret) {
+			dev_err(dev, "Unable to set DMA mask: %d\n", ret);
+			goto err_dma_set_mask;
+		}
+	}
+
 	/*
 	 * use the first registered sysmmu device for performing
 	 * dma mapping operations on iommu page tables (cpu cache flush)
@@ -657,6 +665,8 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_dma_set_mask:
+	iommu_device_unregister(&data->iommu);
 err_iommu_register:
 	iommu_device_sysfs_remove(&data->iommu);
 	return ret;
-- 
2.30.2


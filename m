Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF49DC43334
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 10 Jul 2022 23:06:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbiGJXGJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 10 Jul 2022 19:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbiGJXGI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 10 Jul 2022 19:06:08 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46215F597
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Jul 2022 16:06:07 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id y22-20020a7bcd96000000b003a2e2725e89so1782166wmj.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Jul 2022 16:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t3ZTmvONYAL3UmGbG2MULEJQEOXDk4bgL9Jsh2UKHR0=;
        b=shjCmOtmTJr3WRbag5oJo/fGtuTm1xqY1Edpx4CJaaiZU343eW60a+82utSz3xgQ6p
         aWRh/+ep3FFT5CK/PAucz0i721CP1Tv8cjbvbTE+AhRlyVXwHm1otNklh+FMTNdiFjGu
         55b4myBFjVznKA/z4iJAZwDdSIxXuSi6gp/LWCCvEsbgcxfUZ4MfqtLHHpblqvIri1yB
         4RSYvjtpzs5XMxP29a/xlpF8IaGDvpGJYFFUEVEiNzzzu5RYpUG3VKKrJ5x5b4C4v8W/
         VUvCmv7rG2tPfBge19Ypz0vXdpnvffjH4V94S0rjZ2GonwrfU21td/QHNbZRnyGdBDo1
         n0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t3ZTmvONYAL3UmGbG2MULEJQEOXDk4bgL9Jsh2UKHR0=;
        b=mNemuQhL48VXoynUz+bqE0MEjlmMi0AKzIfs6Tol5SXP1Rsowt4Zm+mc+RRTswBDbr
         5990Ttu1qQK0MfVDUNU4+3mmKCT6unLRxrA020E7Y9y2wMposjFLduGnPrjMr1Dezckf
         LxZZoKqn20q4Wx2yxp+z1Hz9bM4BaXu7+bmhr7G/KBNNEp0J2i1qnPFxxa1FeT2QKdJ+
         qyUlfxMEggN9PKyj/oMYfJm8tzsCu/aMoi7lYXENVAaDL6bqDiCIYtO2ucMau5mIN2bw
         NdcJlZordr6Ha7hp/cCBxFXd9SYrBF71iSHMOZmH1YFRP92q7o6aLAs0/20T3ngLie0G
         SPHA==
X-Gm-Message-State: AJIora8b+Z194970DzKzKx9hXQbmPThsXqTbV/D9k8WIwUnw0Vq4qign
        ery9n3Cv8TFAIeFvB8ym5w2eZQ==
X-Google-Smtp-Source: AGRyM1u43KlHkERt90c0V0mKxMDOvNBrf0leawFGzCy7FxHSo4Rkj7KffUTXFcFXeKS8Uks57TmrnA==
X-Received: by 2002:a05:600c:6024:b0:3a0:4ea4:cfa4 with SMTP id az36-20020a05600c602400b003a04ea4cfa4mr12564968wmb.119.1657494365850;
        Sun, 10 Jul 2022 16:06:05 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id n4-20020a5d6604000000b0021d650e4df4sm4436047wru.87.2022.07.10.16.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 16:06:05 -0700 (PDT)
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
Subject: [PATCH v2 1/7] iommu/exynos: Reuse SysMMU constants for page size and order
Date:   Mon, 11 Jul 2022 02:05:57 +0300
Message-Id: <20220710230603.13526-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220710230603.13526-1-semen.protsenko@linaro.org>
References: <20220710230603.13526-1-semen.protsenko@linaro.org>
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
---
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


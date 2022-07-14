Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB78CCA47C
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Jul 2022 16:56:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239238AbiGNQz7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Jul 2022 12:55:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238677AbiGNQz5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Jul 2022 12:55:57 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB9A4E851
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jul 2022 09:55:56 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id r14so3390982wrg.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jul 2022 09:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S2fOwRS7PBfoQ/JKwgWoKuZEaYFo7PU9A3pBuSjiPrw=;
        b=FJYTZoClCTlgrArGKeLYT8JUYfT6a60vzX4X3MgwAp51q4tyoTeo+z3gFLcTsZ2bEo
         j5hT5ULynZb3pQJxareXMpi7f4RSaQGIqIRmviSi/4Xus+TNZzAs7hp452FuzBLFcg7w
         ywRqEzWxw2c5kKbfm7iRwREbZpU/D9Jbff+gcPJmQI20iQSSqv+5mKOSIMME1uH6Csqf
         4IHfl34HFOIAJvzJabWhKe77UZiHWzC+CtPvYvqQXckMhS4zPEQZF4UX1Zw1vDU0/CAt
         dPiIkVHGtob3+NZ66Xeonz4SYNmBVvCx8iC2hnD+CoOV7FIha5uMQbJ52A7oHmZvbs3I
         60LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S2fOwRS7PBfoQ/JKwgWoKuZEaYFo7PU9A3pBuSjiPrw=;
        b=XBW2WiRduJKmSsvVLlLLJ2j8A30j4e/yPJy269hXXFfrg0ZI5p374NynX7/96/Rft3
         ukKX7PgBd3f9Zz+ejXXe3TJTVv6z42yIwnTuKHJEPL3k8lPZJTz8N8UYqMKLtxcnpAq+
         igOU02T9j9AU7Zhjm+Xvv+29qiTI1VEi2nU7m3nIvsLRVyUyPu5Nzf/UnXbzd9j9xpix
         PoQ2m+YYoZbjjOO5zU1QF1ZxLQrKG2OIvNv+zS4xvcyV5DWFF7XGPZDrJtoTKBRaAAqF
         ukY84YxWYjOelRsUdeaWYWG/1flQHrGZt2KdES4rJYRgvew3JDpaIYbA8NKLZLiVFcJg
         ajtQ==
X-Gm-Message-State: AJIora/fng5+kKydJ4vf9k8qnwPiTnsCOGahaqiwScVikIltgzad/pqf
        D6yGTsw9VNUTF9h+6MHch+2ECw==
X-Google-Smtp-Source: AGRyM1uOCE0ebi2E5Ao34myU6FQDDLS+28S7amW2//dWGnRsQjZ0isNECaLLQ5j97W3z0Vyo//ZQ7g==
X-Received: by 2002:a5d:6489:0:b0:21d:a9a1:3511 with SMTP id o9-20020a5d6489000000b0021da9a13511mr8725414wri.626.1657817754857;
        Thu, 14 Jul 2022 09:55:54 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id z8-20020a1c4c08000000b003942a244f40sm5706762wmf.25.2022.07.14.09.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 09:55:54 -0700 (PDT)
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
Subject: [PATCH v3 2/6] iommu/exynos: Handle failed IOMMU device registration properly
Date:   Thu, 14 Jul 2022 19:55:46 +0300
Message-Id: <20220714165550.8884-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220714165550.8884-1-semen.protsenko@linaro.org>
References: <20220714165550.8884-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

If iommu_device_register() fails in exynos_sysmmu_probe(), the previous
calls have to be cleaned up. In this case, the iommu_device_sysfs_add()
should be cleaned up, by calling its remove counterpart call.

Fixes: d2c302b6e8b1 ("iommu/exynos: Make use of iommu_device_register interface")
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
Changes in v3:
  - Added Marek's Acked-by tag
  - Added Krzysztof's R-b tag
  - Added "Fixes" tag, as suggested by Krzysztof

Changes in v2:
  - (none) This patch is new and added in v2

 drivers/iommu/exynos-iommu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 8f80aaa35092..c85db9dab851 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -629,7 +629,7 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 
 	ret = iommu_device_register(&data->iommu, &exynos_iommu_ops, dev);
 	if (ret)
-		return ret;
+		goto err_iommu_register;
 
 	platform_set_drvdata(pdev, data);
 
@@ -656,6 +656,10 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 
 	return 0;
+
+err_iommu_register:
+	iommu_device_sysfs_remove(&data->iommu);
+	return ret;
 }
 
 static int __maybe_unused exynos_sysmmu_suspend(struct device *dev)
-- 
2.30.2


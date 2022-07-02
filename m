Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A07EC43334
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  2 Jul 2022 21:37:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbiGBVh3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 2 Jul 2022 17:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiGBVh2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 2 Jul 2022 17:37:28 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0481B878
        for <linux-samsung-soc@vger.kernel.org>; Sat,  2 Jul 2022 14:37:27 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id mf9so10146594ejb.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 02 Jul 2022 14:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aWfZE2YpB25R+rCMwVNZi2s9IwZn0JfO+IgsGnjhYqY=;
        b=wVSILGBGUjVOC+cfuxxbSMyxpvn6GttZQpREPJStje8Jo1kxV0hOiJBQjYgcMjnGO8
         HzrlHKacg6/F0WF0UTTYxmtVqmcttqofFOrJX6K+BP9MvvRdIR7qYrVcD7+DFCx3EKT0
         v7Hte9vIx/BKEL3aPNq1az2t5Nf5ERiriNAhe4KwSJOAyDfa58FaLw+AHHh0SnQeL6jn
         UMtj1LphcAYF+SCg6rTx11cw/9TDH61FUx3QLb2jvIAt9clvxCy6iYOFU5DZ9Kgf8G9u
         J/kArGjS3bdmqxj4yPJLCgNcdbkBX/TWXfqGZSQ3YUT28PeuTlKYSuvKmAr01wazLM4f
         ZKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aWfZE2YpB25R+rCMwVNZi2s9IwZn0JfO+IgsGnjhYqY=;
        b=y/PUubIjFfRWzGRXdmbWVvQ+tlU2Jfk/cYcK8jNy/Zxu0V4km7i4j8pxFXjVd7MPdd
         mcc4zwnOknJbUMJ0Ez4ndbR+D1D1cVbVdNxHdw3476AM1iXN/smOeUiVgUF0ALKGXk1E
         0z+eO6ZnQ5g1uW8VcWBh8Q+c8cKLRsjG0PRWE9jp/wEwmltRdf5AXXXRzXLaQ05H0c3A
         yOzoLQdugyY0efqYEdKHoe8bCWvr6/j0yEBoC+UilERHwhemhNeERlrkwey8jM0Ypyoi
         nf/61mc5YRQFRwyXnZ682YXoqXUMMhGDx4itTmEhTt31ahLF0oAw14BYpXnPZmfcc0y5
         5aTQ==
X-Gm-Message-State: AJIora8i0yFkL+MPQiXl5qE0KhOI9Rth0dWWP/88eMGrkuRkOYMwnX+V
        IMvKej0h5IZ9T36Lk7J/7Z8GbA==
X-Google-Smtp-Source: AGRyM1sjE5ZjIaY+GfCnbQmj6BkapC2AnzQE+mzuISXF0GaEPi7w7Vucxh56Irz739GXVnorjZvvIA==
X-Received: by 2002:a17:906:1018:b0:718:dd3f:f28c with SMTP id 24-20020a170906101800b00718dd3ff28cmr21490786ejm.55.1656797846558;
        Sat, 02 Jul 2022 14:37:26 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id a18-20020a170906671200b00718e4e64b7bsm12214247ejp.79.2022.07.02.14.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 14:37:26 -0700 (PDT)
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
Subject: [PATCH 1/4] iommu/exynos: Set correct dma mask for SysMMU v5+
Date:   Sun,  3 Jul 2022 00:37:21 +0300
Message-Id: <20220702213724.3949-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220702213724.3949-1-semen.protsenko@linaro.org>
References: <20220702213724.3949-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

SysMMU v5+ supports 36 bit physical address space. Set corresponding DMA
mask to avoid falling back to SWTLBIO usage in dma_map_single() because
of failed dma_capable() check.

The original code for this fix was suggested by Marek.

Originally-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/iommu/exynos-iommu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 71f2018e23fe..28f8c8d93aa3 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -647,6 +647,14 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (MMU_MAJ_VER(data->version) >= 5) {
+		ret = dma_set_mask(dev, DMA_BIT_MASK(36));
+		if (ret) {
+			dev_err(dev, "Unable to set DMA mask: %d\n", ret);
+			return ret;
+		}
+	}
+
 	/*
 	 * use the first registered sysmmu device for performing
 	 * dma mapping operations on iommu page tables (cpu cache flush)
-- 
2.30.2


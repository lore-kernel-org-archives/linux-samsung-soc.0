Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC21C43217
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Nov 2022 19:52:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbiKCTwE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Nov 2022 15:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230157AbiKCTwC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Nov 2022 15:52:02 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E7D120185
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Nov 2022 12:52:00 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id v27so4717862eda.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Nov 2022 12:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C88yKCopssymOAMe7KHFSlCl2Lylr4sF9uZV7UHC95E=;
        b=JNnSWiaLPu25KnAyCNpaAD7Ly2+4NcVx1V6Eugxf+ijwsUjrFE9ecgyeuEgPFSEyxz
         FKf4DWokPxTymvXIRFJCPn0ZpWILr52tu/S0yEzdyMAff5tTSxtHw8Z8xhoPjTDU9tfD
         bBq9y1xE4YfD8UQu5ZFgRhYzuUzOytWCb9pbu4MovgFkctkLmV/L9dBwQ8vu1/YzszeC
         qDTCvEwTaxg5dBDp0D1xq8KrSAN8FLdNejgZRNeJu2qKXC7eNNhAdG7mQpbpyk3hnWKF
         BkgxrumY+6mwjvxtqef2jQAZ7+SHEv/MoZgYdsJWgK7ZznhFuWS87Nv3WmzoQd6o3Z4b
         Nx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C88yKCopssymOAMe7KHFSlCl2Lylr4sF9uZV7UHC95E=;
        b=XSaS1N++czXNhK2KqdEDyNqVgGZk+1QX2IKIK10FISFc9B2nnmIKhWRYK8Pn0KbAe7
         rCRCaYuAJqw1TdW6HW8qJMs2pFyboF3SRKOzdmx50td90biRUfEYitSVQz1aKS8yXATY
         Grj81H0M8EjBt7tGq6ed/+Pcv+DzdXxOJGDGBW1LWtaglpKLnmAFWnccgJPnuLUxnvaM
         REbIslJVLRihtLlVhQwUndIdS725fC9bYNz3BUYXBC9H9r0rfSodJrKI2olMtHrbGeEk
         zXoUJHGQjmYi0C4T6ewZM7g3fPRC1kaeSC9JsP95+tMsP5x+WGCiFTgLZXkIVv6SrGEv
         UPfg==
X-Gm-Message-State: ACrzQf1DskOynn8V1x7CljD0etZGUCqAbfZcwP5hSubYpLLaHZ5RHEJ8
        kzmJyRiCixJJ6MXwpzOj6q5ykA==
X-Google-Smtp-Source: AMsMyM6Y55R2EylxgpVkhefZzzu5RD8DbeFh1wK3GdXxJzvb2ejuoWCID5I4EuKnM999UShBLermFA==
X-Received: by 2002:aa7:de0a:0:b0:462:d2a0:93a with SMTP id h10-20020aa7de0a000000b00462d2a0093amr30786059edv.275.1667505119162;
        Thu, 03 Nov 2022 12:51:59 -0700 (PDT)
Received: from localhost (cgw.msart-bajzova4.ke.cust.o2bs.sk. [90.176.4.227])
        by smtp.gmail.com with ESMTPSA id tz14-20020a170907c78e00b0078ddb518a90sm834227ejc.223.2022.11.03.12.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 12:51:58 -0700 (PDT)
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
Subject: [PATCH v2 2/6] iommu/exynos: Fix retval on getting clocks in probe
Date:   Thu,  3 Nov 2022 20:51:50 +0100
Message-Id: <20221103195154.21495-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221103195154.21495-1-semen.protsenko@linaro.org>
References: <20221103195154.21495-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

checkpatch reports next warning for clock getting code in probe
function:

    WARNING: ENOSYS means 'invalid syscall nr' and nothing else

Replace it with -ENOINT to make checkpatch happy.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - (none)

 drivers/iommu/exynos-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 45fd4850bacb..0d150b383d04 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -689,7 +689,7 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 
 	if (!data->clk && (!data->aclk || !data->pclk)) {
 		dev_err(dev, "Failed to get device clock(s)!\n");
-		return -ENOSYS;
+		return -ENOENT;
 	}
 
 	data->clk_master = devm_clk_get(dev, "master");
-- 
2.35.1


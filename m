Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FF2C43217
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Nov 2022 19:52:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbiKCTwK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Nov 2022 15:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230473AbiKCTwI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Nov 2022 15:52:08 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35DF520369
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Nov 2022 12:52:06 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id r14so4683270edc.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Nov 2022 12:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVK/kV0R0vkenb2LDbscFxA0X0dByuia1tz97ff80yM=;
        b=yjqdzBc5QkyWO8tIOpyy1HtXjyZWn0cIpOjMTkb96S3bxh24aATJ8xyBB1R/B77CcN
         NObHEXqX95u/z65/XPcAc2WpVxQKcNaxILUDOynzEmr1ML60iu9C07+LqmPtznkychUZ
         U9kL90pOsziktU0wt5b2868dOA9QSFgj2X/BX+G6yE/NYEQYIYBP/r/DhrDopUiHidb2
         c39d5XT8elagWGepDKVNz/nymSi2onmOLUbPW85gTrTHZd6MnqlK+lVA2WT/cxSGl82j
         l9XHJYIoXhBrnlmf27/QcKjQSI8RtSLMN87uzifXjW670JH8PGoZxwEFBkTmWPyXeMLy
         F8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVK/kV0R0vkenb2LDbscFxA0X0dByuia1tz97ff80yM=;
        b=zXu4fNJ4qASUIUm3Gc/V/be2l02tj8IsLgTuOSr0K/ZVD8PHLc7yqTot+eGhzIU7Qf
         62QPcsl90P7mig7kGB7hOcNSIyZh4dzuxxqYBqQnco5M6mCTGroToN4dQnsKnJLm5oEt
         fkvFa+4O/HvS9XJug+3xrl+T+ex6DXMwVpH2+nGiXGOG8wesi6fKlurh5HZ967/TAHyi
         O1dtIfAjKZK9/GEKXKKzXPhspGCURpIlDT6xVwewgchhiXiBV8+JBOHRMHgEhrV/ovxi
         qdQUbliWsaoyLHBTCK7iYvhGVuUQpB4FNB/0usdJ0EXOd7GqZnAUGJ48ks6IIKfC/KvU
         g86w==
X-Gm-Message-State: ACrzQf1iJQ7pyPQYKatpYW3OwSRZI4yPy0JYg63pdY9k13/tMO8MQv7F
        +PXGenGuXf/bZ5aTry1/lrDRdQ==
X-Google-Smtp-Source: AMsMyM7ofQ+KeORNK7Xlf3qp7IJQwgQUB3P6e82hsOfsUmArPfMzYSqz5U1Wsk/ERagunutF5X6Uqg==
X-Received: by 2002:a05:6402:1c0a:b0:463:3cda:3750 with SMTP id ck10-20020a0564021c0a00b004633cda3750mr26374259edb.341.1667505125822;
        Thu, 03 Nov 2022 12:52:05 -0700 (PDT)
Received: from localhost (cgw.msart-bajzova4.ke.cust.o2bs.sk. [90.176.4.227])
        by smtp.gmail.com with ESMTPSA id n19-20020a170906165300b0078907275a44sm863484ejd.42.2022.11.03.12.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 12:52:05 -0700 (PDT)
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
Subject: [PATCH v2 6/6] media: platform: Use IS_ENABLED() to check EXYNOS_IOMMU in s5p_mfc
Date:   Thu,  3 Nov 2022 20:51:54 +0100
Message-Id: <20221103195154.21495-7-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221103195154.21495-1-semen.protsenko@linaro.org>
References: <20221103195154.21495-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Now that CONFIG_EXYNOS_IOMMU can be built as a module, it's not correct
anymore to check whether it's enabled or not just with #ifdef. Use
proper IS_ENABLED() macro to handle both built-in and module cases.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - New patch

 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_iommu.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_iommu.h b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_iommu.h
index 1a32266b7ddc..a8b48692d128 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_iommu.h
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_iommu.h
@@ -7,7 +7,9 @@
 #ifndef S5P_MFC_IOMMU_H_
 #define S5P_MFC_IOMMU_H_
 
-#if defined(CONFIG_EXYNOS_IOMMU)
+#include <linux/kconfig.h>
+
+#if IS_ENABLED(CONFIG_EXYNOS_IOMMU)
 
 #include <linux/iommu.h>
 
-- 
2.35.1


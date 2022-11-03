Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8E0C43217
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Nov 2022 19:52:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbiKCTwA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Nov 2022 15:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiKCTwA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Nov 2022 15:52:00 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F34E21E3D8
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Nov 2022 12:51:58 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id l11so4692469edb.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Nov 2022 12:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+MC8kK4zWQiBOS9TmUZzl813e7Kce9jFI4colJBhao=;
        b=qA13inhD1EP6l24EPFrU95U+zViK6UVln1wnFLBXMzU3guuv5XL87mQ657GGlBJDv5
         Ynobk1ef/cexQULn5sXQz2W0DyjHLeN7af3yGWh1e+lEc2Ci2EuKhObBAOHiQw202pbb
         R0A9SrGxiRDi2/BfD0GbOpeSesGZlhz1/w/9u3MExoFW2+fBs9XPOktTxlaIj5vZ3DA9
         wAsSWuQhV1ShmHc74HtGrM/RnLpTzmFNT3bIBaR/+Ty0SC55iaEr0ywSRpT1ZiP9Lele
         IsDff9Xm4w6mcr2mzhB53onaIFRvURcJExNk1TF372aT5uZ6RbcwgSWVohvYMIrkep41
         GRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+MC8kK4zWQiBOS9TmUZzl813e7Kce9jFI4colJBhao=;
        b=7V7VIr579IlF45qEjZ+c/9EfqM8KjbuFkwFO3jBxivHPVaDeL/DkSLRq9Vv2zC/UDU
         /bttlC7r0137PcXMayFiBkW2S/VIkNn21lKbSF+A7t0F+yAkJbdMVcyQG2saRS6qBbnL
         F9aLIrvJyuL/PTjmxdp/12h5YjFPAE2kihaR6BvmZLRkIcJ/BBphZ+o9PLyMD2adiBNA
         4e7R9T2iEPHRbdoZo9jdS2LJfW6rPaXfJg42BSVU4Oq9XDzpfLRxTjG/xLXPMgx0A4lc
         I9s/NYuo2ek0jbYFNizrKmDuhqoJu5Neutg2TEDuZLVop6qjAW8aS0FedOEyeqiH91Ht
         aE0Q==
X-Gm-Message-State: ACrzQf2rz9VmLSaVBKlBLz3q3g/w5soxZlnNBPmmyPJQXRLv8V0jnnK5
        ToWPQ77MTHgOPUvUnFuwkPVZeA==
X-Google-Smtp-Source: AMsMyM4XDFAXZNyMtBoTJ07WXs5ANJcqdCknrHoZzRGrPrQdaq9x5LBRX5LsVLVT4RaHWxBqe5ZMeA==
X-Received: by 2002:aa7:c1d9:0:b0:463:aeaf:3383 with SMTP id d25-20020aa7c1d9000000b00463aeaf3383mr16737337edp.253.1667505117553;
        Thu, 03 Nov 2022 12:51:57 -0700 (PDT)
Received: from localhost (cgw.msart-bajzova4.ke.cust.o2bs.sk. [90.176.4.227])
        by smtp.gmail.com with ESMTPSA id j1-20020a17090623e100b007030c97ae62sm847433ejg.191.2022.11.03.12.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 12:51:57 -0700 (PDT)
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
Subject: [PATCH v2 1/6] iommu: Export iommu_group_default_domain() API
Date:   Thu,  3 Nov 2022 20:51:49 +0100
Message-Id: <20221103195154.21495-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221103195154.21495-1-semen.protsenko@linaro.org>
References: <20221103195154.21495-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

iommu_group_default_domain() may be needed for module users. E.g.
exynos-iommu driver is using it right now, and it's going to be
converted to a module soon.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - (none)

 drivers/iommu/iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 6ca377f4fbf9..006a65411a28 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1675,6 +1675,7 @@ struct iommu_domain *iommu_group_default_domain(struct iommu_group *group)
 {
 	return group->default_domain;
 }
+EXPORT_SYMBOL_GPL(iommu_group_default_domain);
 
 static int probe_iommu_group(struct device *dev, void *data)
 {
-- 
2.35.1


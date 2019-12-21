Return-Path: <SRS0=POLG=2L=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0447AC2D0C0
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 21 Dec 2019 15:05:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CB34821927
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 21 Dec 2019 15:05:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=tcd-ie.20150623.gappssmtp.com header.i=@tcd-ie.20150623.gappssmtp.com header.b="Ukw6PoNA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbfLUPFN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 21 Dec 2019 10:05:13 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44266 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727504AbfLUPFN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 21 Dec 2019 10:05:13 -0500
Received: by mail-ed1-f68.google.com with SMTP id bx28so11366386edb.11
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 Dec 2019 07:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tcd-ie.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0N+893Qfq6YLP1OvUkum1ZO1qWJ01GUT6Ih8V2c80Vk=;
        b=Ukw6PoNAZjf5krJJRS06xPvTLavrof9Akn4Pak+RjVdM62j1/NqPdGsYUU6ngGpNzI
         ZHRA+faVKygYXpBoHQBzzSrMhFuDjDM3rPT8thlw7ti3Ya7E/2Ia2hgJGmjOkpCbhcKi
         fWFJ41yTlMvsKGf/oqAM1MkQf60LS0RKrqZ8loUGznkUimWWsqYUsRHeSebLKMi4vBlg
         XuhtpVGYw4uTiieNAiV6TEl+/HFnxAfvR6qkWvowyMkkJ9p39r4oe6DrrFdOAOaTjRHK
         ZuOahTLph0HLpnOdVRH8cOKfXQ7P8kaiwem0m0P3CTEBJSk0wQflsk31c0yoR6ujnQx5
         TqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0N+893Qfq6YLP1OvUkum1ZO1qWJ01GUT6Ih8V2c80Vk=;
        b=HWNMSUI511CMI1T86B1BPHq9nZxmktcC3CZsRy8E4wPUmW54b5FuR/Nojj7VnNk6my
         3orG3pdLh11saGIV54qQ6x1iKmJTru6rVEv85yPY30NLZuBFa5Q8vLg4iaAR04q7CN7F
         avYymuk686vb8+ZqLA3dbBiDUfiwBfsPVKLs73BTi3Q9MZwwYRLuwBcae0MRb+Sn2yO3
         M3qYxBWBuEqIWNKYAVOVXwadCwghO2Rg9RawD9ZpQfVJnFHk1JefII9rSSpyhlOot8tT
         0UJXGHxyCIGpAdCldetLmtwkcphR7OGhoaGMeR9Ztfn1rhXzLUfVonGvyfP2SSD5tGzD
         IY6w==
X-Gm-Message-State: APjAAAVo+fZRDclcVdtxcbvDQLPgR4YcgwHobOEe2zMCLRk0hdSM1pt9
        I9+Ko8iqoq0KmuQVlhMDMrgOdQ==
X-Google-Smtp-Source: APXvYqzYBtLgHyu41wW+pu/pR134HwMgfABxCFG7SFTaKHnLsnkRqp9tkFJSv1iaSEoyl+LQ52YyaQ==
X-Received: by 2002:a17:906:2649:: with SMTP id i9mr22633139ejc.120.1576940711107;
        Sat, 21 Dec 2019 07:05:11 -0800 (PST)
Received: from localhost.localdomain ([80.233.37.20])
        by smtp.googlemail.com with ESMTPSA id u13sm1517639ejz.69.2019.12.21.07.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2019 07:05:10 -0800 (PST)
From:   Tom Murphy <murphyt7@tcd.ie>
To:     iommu@lists.linux-foundation.org
Cc:     Tom Murphy <murphyt7@tcd.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Marc Zyngier <maz@kernel.org>,
        Eric Auger <eric.auger@redhat.com>,
        Julien Grall <julien.grall@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org, kvm@vger.kernel.org
Subject: [PATCH 8/8] DO NOT MERGE: iommu: disable list appending in dma-iommu
Date:   Sat, 21 Dec 2019 15:04:00 +0000
Message-Id: <20191221150402.13868-9-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191221150402.13868-1-murphyt7@tcd.ie>
References: <20191221150402.13868-1-murphyt7@tcd.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

ops __finalise_sg

Disable combining sg segments in the dma-iommu api.
Combining the sg segments exposes a bug in the intel i915 driver which
causes visual artifacts and the screen to freeze. This is most likely
because of how the i915 handles the returned list. It probably doesn't
respect the returned value specifying the number of elements in the list
and instead depends on the previous behaviour of the intel iommu driver
which would return the same number of elements in the output list as in
the input list.

Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
---
 drivers/iommu/dma-iommu.c | 38 +++++++-------------------------------
 1 file changed, 7 insertions(+), 31 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index cf778db7d84d..d7547b912c87 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -853,8 +853,7 @@ static int __finalise_sg(struct device *dev, struct scatterlist *sg, int nents,
 {
 	struct scatterlist *s, *cur = sg;
 	unsigned long seg_mask = dma_get_seg_boundary(dev);
-	unsigned int cur_len = 0, max_len = dma_get_max_seg_size(dev);
-	int i, count = 0;
+	int i;
 
 	for_each_sg(sg, s, nents, i) {
 		/* Restore this segment's original unaligned fields first */
@@ -862,39 +861,16 @@ static int __finalise_sg(struct device *dev, struct scatterlist *sg, int nents,
 		unsigned int s_length = sg_dma_len(s);
 		unsigned int s_iova_len = s->length;
 
+		if (i > 0)
+			cur = sg_next(cur);
+
 		s->offset += s_iova_off;
 		s->length = s_length;
-		sg_dma_address(s) = DMA_MAPPING_ERROR;
-		sg_dma_len(s) = 0;
-
-		/*
-		 * Now fill in the real DMA data. If...
-		 * - there is a valid output segment to append to
-		 * - and this segment starts on an IOVA page boundary
-		 * - but doesn't fall at a segment boundary
-		 * - and wouldn't make the resulting output segment too long
-		 */
-		if (cur_len && !s_iova_off && (dma_addr & seg_mask) &&
-		    (max_len - cur_len >= s_length)) {
-			/* ...then concatenate it with the previous one */
-			cur_len += s_length;
-		} else {
-			/* Otherwise start the next output segment */
-			if (i > 0)
-				cur = sg_next(cur);
-			cur_len = s_length;
-			count++;
-
-			sg_dma_address(cur) = dma_addr + s_iova_off;
-		}
-
-		sg_dma_len(cur) = cur_len;
+		sg_dma_address(cur) = dma_addr + s_iova_off;
+		sg_dma_len(cur) = s_length;
 		dma_addr += s_iova_len;
-
-		if (s_length + s_iova_off < s_iova_len)
-			cur_len = 0;
 	}
-	return count;
+	return nents;
 }
 
 /*
-- 
2.20.1


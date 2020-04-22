Return-Path: <SRS0=PHE5=6G=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A62C55185
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 22 Apr 2020 11:41:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3895F2082E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 22 Apr 2020 11:41:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="eJBDy+WA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbgDVLlO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 22 Apr 2020 07:41:14 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35024 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbgDVLlN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Apr 2020 07:41:13 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200422114111euoutp01318c1ab249b50b32bcab4deae8934951~IIXjGoBju1321313213euoutp01l
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Apr 2020 11:41:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200422114111euoutp01318c1ab249b50b32bcab4deae8934951~IIXjGoBju1321313213euoutp01l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1587555671;
        bh=jySS9kmEQ6ZJogXBh5srjxo4f8GGmavoMRc37EuQxhE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eJBDy+WAGeUuhHxNHSpnu0z+PWhuy3JFN0lI62hQJC8mdd/AZWyVTmFwQhVgK9h6Y
         DxkGKsnm/x9GZZNFh21OTy1L/5vQAG+DZINoL5ain8gmrnIDF9ndv3OjHFr/8UIx1C
         yUgDsRhH+HmRQv/UPAfwGu+5loUSxk+LBsXvYPKw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200422114110eucas1p2e0fd93fb3efef7553644ac5646bb74c1~IIXivXvGR0670106701eucas1p2r;
        Wed, 22 Apr 2020 11:41:10 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 30.A0.60698.65D20AE5; Wed, 22
        Apr 2020 12:41:10 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200422114110eucas1p2ef6b94864d6ad44af66855a9cb003a96~IIXiY5T9Q1480914809eucas1p2L;
        Wed, 22 Apr 2020 11:41:10 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200422114110eusmtrp29f0e076f47320fb56d076bb7585f124a~IIXiYOID33169431694eusmtrp26;
        Wed, 22 Apr 2020 11:41:10 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-16-5ea02d568b51
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 14.6C.08375.65D20AE5; Wed, 22
        Apr 2020 12:41:10 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200422114110eusmtip293bb2ff4707d1546c39d676132259cf1~IIXh8eWIH2390223902eusmtip2j;
        Wed, 22 Apr 2020 11:41:09 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 2/3] drm/exynos: gem: rework scatter-list contiguity
 check on prime import
Date:   Wed, 22 Apr 2020 13:40:59 +0200
Message-Id: <20200422114059.29477-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <4cfed490-e45c-e559-bfa3-c616e3c00029@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEIsWRmVeSWpSXmKPExsWy7djPc7phugviDG49NLS4te4cq8XGGetZ
        La58fc9mMen+BBaLGef3MVmsPXKX3WLG5JdsDuwe97uPM3n0bVnF6PF5k1wAcxSXTUpqTmZZ
        apG+XQJXxstVW5kK/gtV/P37gq2BcQJ/FyMnh4SAicScG0uZuxi5OIQEVjBKTHz5kxHC+cIo
        8W3XdhYI5zOjxIVV51hhWj4cfMAEkVjOKNG64i8bXMudz9vBqtgEDCW63naxgdgiAm4STYdn
        soIUMQtcB5r7YxF7FyMHh7BAvMSiNe4gNSwCqhKL5q9kAwnzCthKHHiQA7FMXmL1hgPMIDan
        gL3EwbbjYOdJCDxmkzjQdpsNoshF4uqss1C2sMSr41vYIWwZif875zNBNDQzSjw8t5Ydwulh
        lLjcNIMRospa4s65X2CbmQU0Jdbv0ocIO0qc2fCFCSQsIcAnceOtIEiYGcictG06M0SYV6Kj
        TQiiWk1i1vF1cGsPXrjEDGF7SBy90AMNxUmMEtNeTGCcwCg/C2HZAkbGVYziqaXFuempxcZ5
        qeV6xYm5xaV56XrJ+bmbGIEp4fS/4193MO77k3SIUYCDUYmHN0JxQZwQa2JZcWXuIUYJDmYl
        Ed4ND+fFCfGmJFZWpRblxxeV5qQWH2KU5mBREuc1XvQyVkggPbEkNTs1tSC1CCbLxMEp1cDI
        YiJ943RlotXZW8KLW9u+On7coGmbFy0ifvG2W1qGNPvsgOedxytDm66/FpW6mzf/Kqe4468f
        U2tXtqc8eTDVvfAt16k9LJt9deZdO3HkdNoE4x/e7Lobj3p/61b7v/5QYZjQ1erLSnKys+XM
        uP7XOZh6xN60m8WiVs+Vfc34kJjjt+6b8XVKLMUZiYZazEXFiQB6MOYpBQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrELMWRmVeSWpSXmKPExsVy+t/xe7phugviDK41SVncWneO1WLjjPWs
        Fle+vmezmHR/AovFjPP7mCzWHrnLbjFj8ks2B3aP+93HmTz6tqxi9Pi8SS6AOUrPpii/tCRV
        ISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv4+WqrUwF/4Uq/v59
        wdbAOIG/i5GTQ0LAROLDwQdMXYxcHEICSxklnl5aygiRkJE4Oa2BFcIWlvhzrYsNougTo8TS
        CW/YQBJsAoYSXW+7wGwRAQ+J5m/H2UGKmAVuAxV9mMcCkhAWiJU41ncZbBKLgKrEovkrgRo4
        OHgFbCUOPMiBWCAvsXrDAWYQm1PAXuJg23FGkBIhATuJg63uExj5FjAyrGIUSS0tzk3PLTbU
        K07MLS7NS9dLzs/dxAgMz23Hfm7ewXhpY/AhRgEORiUe3gjFBXFCrIllxZW5hxglOJiVRHg3
        PJwXJ8SbklhZlVqUH19UmpNafIjRFOikicxSosn5wNjJK4k3NDU0t7A0NDc2NzazUBLn7RA4
        GCMkkJ5YkpqdmlqQWgTTx8TBKdXAGCF6k2GyB/PtegOnKYfqekLnrtfv/PQnMmyvrtDZNTna
        7TdEHqTM+tncISy3x4VjRZD7b7N3BgmpfycJdn0JWJW++dX+ioYLqgxn/Sy8f62dlyP6NKXu
        98N7XCV5yw5oTTwvd+OKXf4STvk7P8s9nT6eeJ0wbd7WI/WcIdx1Iuf220jmid+6q8RSnJFo
        qMVcVJwIANyT+/tlAgAA
X-CMS-MailID: 20200422114110eucas1p2ef6b94864d6ad44af66855a9cb003a96
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200422114110eucas1p2ef6b94864d6ad44af66855a9cb003a96
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200422114110eucas1p2ef6b94864d6ad44af66855a9cb003a96
References: <4cfed490-e45c-e559-bfa3-c616e3c00029@samsung.com>
        <CGME20200422114110eucas1p2ef6b94864d6ad44af66855a9cb003a96@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Explicitly check if the imported buffer has been mapped as contiguous in
the DMA address space, what is required by all Exynos DRM CRTC drivers.
While touching this, set buffer flags depending on the availability of
the IOMMU.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v2:
- reworked a check for sgt->nents
- added a comment about a scatter-list contiguity check
- removed additional 'return ERR_PTR(-EINVAL)' accidentaly left after debugging
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 42 ++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 40514d3..f136efb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -458,6 +458,29 @@ struct drm_gem_object *
 	int npages;
 	int ret;
 
+	if (sgt->nents < 1)
+		return ERR_PTR(-EINVAL);
+
+	/*
+	 * Check if the provided buffer has been mapped as contiguous
+	 * into DMA address space.
+	 */
+	if (sgt->nents > 1) {
+		dma_addr_t next_addr = sg_dma_address(sgt->sgl);
+		struct scatterlist *s;
+		unsigned int i;
+
+		for_each_sg(sgt->sgl, s, sgt->nents, i) {
+			if (!sg_dma_len(s))
+				break;
+			if (sg_dma_address(s) != next_addr) {
+				DRM_ERROR("buffer chunks must be mapped contiguously");
+				return ERR_PTR(-EINVAL);
+			}
+			next_addr = sg_dma_address(s) + sg_dma_len(s);
+		}
+	}
+
 	exynos_gem = exynos_drm_gem_init(dev, attach->dmabuf->size);
 	if (IS_ERR(exynos_gem)) {
 		ret = PTR_ERR(exynos_gem);
@@ -480,18 +503,15 @@ struct drm_gem_object *
 
 	exynos_gem->sgt = sgt;
 
-	if (sgt->nents == 1) {
-		/* always physically continuous memory if sgt->nents is 1. */
-		exynos_gem->flags |= EXYNOS_BO_CONTIG;
-	} else {
-		/*
-		 * this case could be CONTIG or NONCONTIG type but for now
-		 * sets NONCONTIG.
-		 * TODO. we have to find a way that exporter can notify
-		 * the type of its own buffer to importer.
-		 */
+	/*
+	 * Buffer has been mapped as contiguous into DMA address space,
+	 * but if there is IOMMU, it can be either CONTIG or NONCONTIG.
+	 * We assume a simplified logic below:
+	 */
+	if (is_drm_iommu_supported(dev))
 		exynos_gem->flags |= EXYNOS_BO_NONCONTIG;
-	}
+	else
+		exynos_gem->flags |= EXYNOS_BO_CONTIG;
 
 	return &exynos_gem->base;
 
-- 
1.9.1


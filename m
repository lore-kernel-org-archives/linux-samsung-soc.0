Return-Path: <SRS0=NNbO=5X=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2745FC2BB55
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Apr 2020 13:43:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F1A382078A
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Apr 2020 13:43:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="DVGYFnyE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728555AbgDGNnQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Apr 2020 09:43:16 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35132 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728573AbgDGNnQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Apr 2020 09:43:16 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200407134314euoutp0198bc7d6ab25cf4b66ec03a211331c22d~DjW1uBBzZ2410024100euoutp01f
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Apr 2020 13:43:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200407134314euoutp0198bc7d6ab25cf4b66ec03a211331c22d~DjW1uBBzZ2410024100euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1586266994;
        bh=uUJPJklxt2/uUOtgdn6uJV4flK8igVvMSY2AWPBTxJc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DVGYFnyEUJv7Kn1JIww48VaDk5Wyt3uMp3fmOre88l8cE6ihedR/cVrhAcvJMlWcE
         dPALVymfjGLU0blUNmTo5lVkxV5V5zv/TnACy/vVKfLGbzQvkDQxu1tjEb9g4Tyf81
         T1wnbF+sJH5z164bY1+K9mNHgDchpA2o9U6fgsa0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200407134314eucas1p272ee27a69f80f2cdf2ac7a47f70206db~DjW1fuAnf1027710277eucas1p23;
        Tue,  7 Apr 2020 13:43:14 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 6A.29.60679.2738C8E5; Tue,  7
        Apr 2020 14:43:14 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200407134314eucas1p1bfe654163e093db30c4a31bd9e1ccada~DjW1GtrHh2294322943eucas1p1M;
        Tue,  7 Apr 2020 13:43:14 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200407134314eusmtrp1d24b5b06ed49b2401fc61d6e9d9b3b94~DjW1GKALX2889128891eusmtrp1g;
        Tue,  7 Apr 2020 13:43:14 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-19-5e8c837269d7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id DF.1F.08375.2738C8E5; Tue,  7
        Apr 2020 14:43:14 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200407134313eusmtip1fcd91bb01cba8ba97798ce970718f163~DjW0q9YlM0251902519eusmtip1o;
        Tue,  7 Apr 2020 13:43:13 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/3] drm/exynos: gem: Rework scatter-list contiguity check
 on Prime import
Date:   Tue,  7 Apr 2020 15:42:55 +0200
Message-Id: <20200407134256.9129-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200407134256.9129-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEIsWRmVeSWpSXmKPExsWy7djP87pFzT1xBo+XqVvcWneO1WLjjPWs
        Fle+vmezmHR/AovFjPP7mCzWHrnLbjFj8ks2B3aP+93HmTz6tqxi9Pi8SS6AOYrLJiU1J7Ms
        tUjfLoErY/HcxewFkwUrdh74w9LA+IK3i5GTQ0LAROL49E3MXYxcHEICKxgl/j7uZIVwvjBK
        vNzzlQ3C+cwo0fz3MiNMS8vqfUwQieWMEstugiSgWn5f38cKUsUmYCjR9baLDcQWEXCTaDo8
        E2wus8B1RolvPxaxgySEBWIkpq2dwQJiswioSnxuOARUxMHBK2AjsWCVCcQ2eYnVGw4wg9ic
        ArYSF3bsApsjIfCYTeJm1wcmiCIXiecrX7FC2MISr45vYYewZSROT+5hgWhoZpR4eG4tO4TT
        wyhxuWkG1EPWEnfO/WID2cwsoCmxfpc+iCkh4CjRt18MwuSTuPFWEKSYGcictG06M0SYV6Kj
        TQhihprErOPr4LYevHCJGcL2kDg4tY8FEj4TGCU+LfrDNIFRfhbCrgWMjKsYxVNLi3PTU4uN
        8lLL9YoTc4tL89L1kvNzNzECU8Lpf8e/7GDc9SfpEKMAB6MSD++DxJ44IdbEsuLK3EOMEhzM
        SiK8Ur2dcUK8KYmVValF+fFFpTmpxYcYpTlYlMR5jRe9jBUSSE8sSc1OTS1ILYLJMnFwSjUw
        bt3/iy1SNu9oMP+Vp6mab1snXJ5hd4F3DtvhmbO44qteRBv9jt/wTVKA8Y+s2WmbX9vmLk1k
        WfhoztGulm1/5xowf9ssZ1xQ7Rt70P3BiWk/3Pyyq3rvRpVkT5v8XvmZ8zezuglftB/c+GP1
        /HyGzToBrm1zXUpnfbCe5Z8U8udN0qZydZa/8UosxRmJhlrMRcWJAJlxk/UFAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrELMWRmVeSWpSXmKPExsVy+t/xu7pFzT1xBm0f2C1urTvHarFxxnpW
        iytf37NZTLo/gcVixvl9TBZrj9xlt5gx+SWbA7vH/e7jTB59W1YxenzeJBfAHKVnU5RfWpKq
        kJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXsXjuYvaCyYIVOw/8
        YWlgfMHbxcjJISFgItGyeh9TFyMXh5DAUkaJRe9Ws0AkZCROTmtghbCFJf5c62KDKPrEKPHy
        zyt2kASbgKFE11uQBCeHiICHRPO34+wgRcwCtxklln6YBzSJg0NYIErie0cwSA2LgKrE54ZD
        rCBhXgEbiQWrTCDmy0us3nCAGcTmFLCVuLBjF9heIaCSzx+fs05g5FvAyLCKUSS1tDg3PbfY
        UK84Mbe4NC9dLzk/dxMjMDy3Hfu5eQfjpY3BhxgFOBiVeHgfJPbECbEmlhVX5h5ilOBgVhLh
        lertjBPiTUmsrEotyo8vKs1JLT7EaAp000RmKdHkfGDs5JXEG5oamltYGpobmxubWSiJ83YI
        HIwREkhPLEnNTk0tSC2C6WPi4JRqYPRorg6s9Itp/yb5MU+TjV12VZVMY4IJn492A+Pj653F
        5y+6vgj+VLT5n+mhKYGrPlifW+6er/Dhp/WSjJTbViqr05Mexle5/qy8+eygfILarsXGsunX
        43/Zv/n6/2RbYkvv001TupXjrB+XV0dEOIUqOy+LONe46FeAUm2TX7b4+Rvhgc/1lFiKMxIN
        tZiLihMBOB3UgWUCAAA=
X-CMS-MailID: 20200407134314eucas1p1bfe654163e093db30c4a31bd9e1ccada
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200407134314eucas1p1bfe654163e093db30c4a31bd9e1ccada
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200407134314eucas1p1bfe654163e093db30c4a31bd9e1ccada
References: <20200407134256.9129-1-m.szyprowski@samsung.com>
        <CGME20200407134314eucas1p1bfe654163e093db30c4a31bd9e1ccada@eucas1p1.samsung.com>
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
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 36 +++++++++++++++++--------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 40514d3dcf60..9d4e4d321bda 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -458,6 +458,23 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
 	int npages;
 	int ret;
 
+	if (sgt->nents != 1) {
+		dma_addr_t next_addr = sg_dma_address(sgt->sgl);
+		struct scatterlist *s;
+		unsigned int i;
+
+		for_each_sg(sgt->sgl, s, sgt->nents, i) {
+			if (!sg_dma_len(s))
+				continue;
+			if (sg_dma_address(s) != next_addr) {
+				DRM_ERROR("buffer chunks must be mapped contiguously");
+				return ERR_PTR(-EINVAL);
+			}
+			next_addr = sg_dma_address(s) + sg_dma_len(s);
+		}
+		return ERR_PTR(-EINVAL);
+	}
+
 	exynos_gem = exynos_drm_gem_init(dev, attach->dmabuf->size);
 	if (IS_ERR(exynos_gem)) {
 		ret = PTR_ERR(exynos_gem);
@@ -480,18 +497,15 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
 
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
2.17.1


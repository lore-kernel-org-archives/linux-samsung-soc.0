Return-Path: <SRS0=NNbO=5X=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D26C2BB1D
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Apr 2020 13:43:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6FECF20747
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Apr 2020 13:43:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="YUjJ2ic0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728643AbgDGNnQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Apr 2020 09:43:16 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35130 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728482AbgDGNnP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Apr 2020 09:43:15 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200407134314euoutp018add312ab305be8dec254b21efe76bef~DjW1X1Ifh2332523325euoutp015
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Apr 2020 13:43:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200407134314euoutp018add312ab305be8dec254b21efe76bef~DjW1X1Ifh2332523325euoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1586266994;
        bh=bcEbGrmufxbXH+41WsayCMBUWxXhEu+MfRalXv8WG9s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YUjJ2ic0bZU1MqCL2a0PGU7PL986fg3QUL0lRh+05aU1cAbGAWlosHCycidSosNXz
         YBJ94RnBhUf+3yi/NHBRY1LndFblDbkHAQZb3pstITVrxIzMmIk0gQb+DOtWvj6pef
         7Y/pSrmN/3I7HojKIMdQ/sb0gtYl3LOFbay/5F80=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200407134314eucas1p2097b0503072026f981cc4edef732b529~DjW1AnC5T1024810248eucas1p2C;
        Tue,  7 Apr 2020 13:43:14 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 1B.7D.61286.2738C8E5; Tue,  7
        Apr 2020 14:43:14 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200407134313eucas1p1a86ed9bd35c8f1eb88a09c32fb949335~DjW0sw4oB1682116821eucas1p1M;
        Tue,  7 Apr 2020 13:43:13 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200407134313eusmtrp216bead281ec23c828a449a1f5d9fc2ec~DjW0sJiI83117631176eusmtrp2u;
        Tue,  7 Apr 2020 13:43:13 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-3b-5e8c8372ce52
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 71.9D.07950.1738C8E5; Tue,  7
        Apr 2020 14:43:13 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200407134313eusmtip1701220988246e3badca2340d232866ed~DjW0VPHiN0417004170eusmtip1x;
        Tue,  7 Apr 2020 13:43:13 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/3] drm/exynos: gem: Remove dead-code
Date:   Tue,  7 Apr 2020 15:42:54 +0200
Message-Id: <20200407134256.9129-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200407134256.9129-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPIsWRmVeSWpSXmKPExsWy7djPc7pFzT1xBve+sVncWneO1WLjjPWs
        Fle+vmezmHR/AovFjPP7mCzWHrnLbjFj8ks2B3aP+93HmTz6tqxi9Pi8SS6AOYrLJiU1J7Ms
        tUjfLoErY8bkioLpohUX7nA0MPYJdTFycEgImEg8OG3RxcjFISSwglHi8ZWHzBDOF0aJJ/0n
        2SCcz4wSXb9mMsF0zJpSDRFfzijRvGozK1zHph9dQO2cHGwChhJdb7vYQGwRATeJpsMzwYqY
        Ba4zSnz7sYgdJCEsYCbRdvM2mM0ioCrx5fg/sAZeARuJjy9fgNkSAvISqzccABvKKWArcWHH
        LrBBEgKP2STWTlrBCHGSi8Svy7wQ9cISr45vYYewZST+75zPBFHfzCjx8Nxadginh1HictMM
        Rogqa4k7536xgQxiFtCUWL9LHyLsKPH561Wol/kkbrwVBAkzA5mTtk1nhgjzSnS0CUFUq0nM
        Or4Obu3BC5eYIWwPiV3dbeyQAJrAKDH9wGPmCYzysxCWLWBkXMUonlpanJueWmyYl1quV5yY
        W1yal66XnJ+7iRGYDE7/O/5pB+PXS0mHGAU4GJV4eB8k9sQJsSaWFVfmHmKU4GBWEuGV6u2M
        E+JNSaysSi3Kjy8qzUktPsQozcGiJM5rvOhlrJBAemJJanZqakFqEUyWiYNTqoHRt8M5p1D0
        cEG3xvY8lSynwJpNppNvm5rvsnxddXW++2S1jS80OkoCt3gvY/q+9I65wemePl6tWykRwUEn
        lm05vYlbxNW3ylXIvde9o87FcPZHPqcTXVH9W2ubvHo5mD4Ws+WUnjz41rQsxtCPsXq935vf
        EUmcq/kqTnys/Dln/YroOQKhmUosxRmJhlrMRcWJAJ1brnUCAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrILMWRmVeSWpSXmKPExsVy+t/xu7qFzT1xBrMn6VncWneO1WLjjPWs
        Fle+vmezmHR/AovFjPP7mCzWHrnLbjFj8ks2B3aP+93HmTz6tqxi9Pi8SS6AOUrPpii/tCRV
        ISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvY8bkioLpohUX7nA0
        MPYJdTFycEgImEjMmlLdxcjFISSwlFFiTdtL9i5GTqC4jMTJaQ2sELawxJ9rXWwQRZ8YJe6/
        vQeWYBMwlOh6C5Lg5BAR8JBo/nacHaSIWeA2o8TSD/NYQBLCAmYSbTdvg01lEVCV+HL8H1gD
        r4CNxMeXL9ggNshLrN5wgBnE5hSwlbiwYxfYAiGgms8fn7NOYORbwMiwilEktbQ4Nz232Eiv
        ODG3uDQvXS85P3cTIzA4tx37uWUHY9e74EOMAhyMSjy8DxJ74oRYE8uKK3MPMUpwMCuJ8Er1
        dsYJ8aYkVlalFuXHF5XmpBYfYjQFOmois5Rocj4wcvJK4g1NDc0tLA3Njc2NzSyUxHk7BA7G
        CAmkJ5akZqemFqQWwfQxcXBKNTCmHn9gcG6bQv6mBUeNJTtWpL8Ouu3FYaJ++8WkSV8MHzCX
        fRNhT/E+fXLlqWfCz3x9TjHeCzZdrnrv7/Mj/68feRNz5V9vl+3MGPZ3J9Ter3qTeUDFxOW+
        jZOshOCEhwranxfpay843XTuDesxgSBdS9m0Fc3nv11/dHZZzf+IzZdmuB4ScNd7qMRSnJFo
        qMVcVJwIAOtiOtlkAgAA
X-CMS-MailID: 20200407134313eucas1p1a86ed9bd35c8f1eb88a09c32fb949335
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200407134313eucas1p1a86ed9bd35c8f1eb88a09c32fb949335
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200407134313eucas1p1a86ed9bd35c8f1eb88a09c32fb949335
References: <20200407134256.9129-1-m.szyprowski@samsung.com>
        <CGME20200407134313eucas1p1a86ed9bd35c8f1eb88a09c32fb949335@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The ExynosDRM page fault handler is never used, drm_gem_mmap()
always calls exynos_drm_gem_mmap() function, which perform
complete mapping for the given virtual address-space area.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c |  1 -
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 20 --------------------
 drivers/gpu/drm/exynos/exynos_drm_gem.h |  3 ---
 3 files changed, 24 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 57defeb44522..dbd80f1e4c78 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -76,7 +76,6 @@ static void exynos_drm_postclose(struct drm_device *dev, struct drm_file *file)
 }
 
 static const struct vm_operations_struct exynos_drm_gem_vm_ops = {
-	.fault = exynos_drm_gem_fault,
 	.open = drm_gem_vm_open,
 	.close = drm_gem_vm_close,
 };
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index d734d9d51762..40514d3dcf60 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -381,26 +381,6 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
 	return 0;
 }
 
-vm_fault_t exynos_drm_gem_fault(struct vm_fault *vmf)
-{
-	struct vm_area_struct *vma = vmf->vma;
-	struct drm_gem_object *obj = vma->vm_private_data;
-	struct exynos_drm_gem *exynos_gem = to_exynos_gem(obj);
-	unsigned long pfn;
-	pgoff_t page_offset;
-
-	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
-
-	if (page_offset >= (exynos_gem->size >> PAGE_SHIFT)) {
-		DRM_ERROR("invalid page offset\n");
-		return VM_FAULT_SIGBUS;
-	}
-
-	pfn = page_to_pfn(exynos_gem->pages[page_offset]);
-	return vmf_insert_mixed(vma, vmf->address,
-			__pfn_to_pfn_t(pfn, PFN_DEV));
-}
-
 static int exynos_drm_gem_mmap_obj(struct drm_gem_object *obj,
 				   struct vm_area_struct *vma)
 {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
index 42ec67bc262d..f00044c0b688 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
@@ -101,9 +101,6 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
 			       struct drm_device *dev,
 			       struct drm_mode_create_dumb *args);
 
-/* page fault handler and mmap fault address(virtual) to physical memory. */
-vm_fault_t exynos_drm_gem_fault(struct vm_fault *vmf);
-
 /* set vm_flags and we can change the vm attribute to other one at here. */
 int exynos_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
 
-- 
2.17.1


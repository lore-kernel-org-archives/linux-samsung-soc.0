Return-Path: <SRS0=6p2y=DJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76004C4363C
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  2 Oct 2020 17:53:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B80EE2085B
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  2 Oct 2020 17:53:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="GdOd/VH/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388034AbgJBRxn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 2 Oct 2020 13:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387957AbgJBRxn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Oct 2020 13:53:43 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E74A0C0613E2
        for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Oct 2020 10:53:42 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id s13so2472758wmh.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Oct 2020 10:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Ic9kLI7iEmx4fzg6K/MGmVs8Kbr/xz3cK5mQ8gVn9M=;
        b=GdOd/VH/FT5eF5Gfj5Q1p9o3Vy+IUnorHd0BlnwOL9uxqZXuqaW6hM5SPvXVoCliFo
         bYTAnUT5U/MmyPZiyzSRP+mItblvHt3dnKeVQamNmGl1Wkstvlwhpe9QI+eMQwsUSnFG
         vCIrvzCfJM5d8ZpALwF1YBf+lWT2Rg+eoosfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Ic9kLI7iEmx4fzg6K/MGmVs8Kbr/xz3cK5mQ8gVn9M=;
        b=gbEoC4s9/+wLp+gIO7I13MBhrb94MUNhxAWIDY8PeqdTEKdp7uvPtgQOV7xkNZA2a1
         fFAxtdRMEyM7xEgCRq8OAq2WWgUdOR6KRr2uQ6heVEYZs55IfXn6Zc8MTiADiQHw+RV7
         c0vMeyjGOWyVO9Dh6ehH6EcAqPLlUEBfGGv6ACBNkzmOqXGEIrKBdxeqRjpKZsm1+vsn
         aBiqL3qT+Oqd2jm6N92gYI2CpN+WoDJMr6AP0/0qfp4/Q2Oo7+0JZ2FOu0LH1WzWB9+9
         FTo5PlJORbL6MMhx34SOhHqt7OUz8qFZZ6fIQRg1Ev/DBLTCHQsbJYH4JRQ4KmeJc0w1
         utBQ==
X-Gm-Message-State: AOAM530hM88v7gEMIjxEbN4/i99d8bGRRerxH0BJemCf3b3e9+tsS/SL
        o0IB8wGXRswaR6XnZeeajsGxhg==
X-Google-Smtp-Source: ABdhPJx4N0mByTSrMhoszno9AheTX2LZ7oZ+iqT+Q3TvlZQuWl0+xgzy8x8+JKsZ5hS5NTaTlr3Xeg==
X-Received: by 2002:a7b:cf1a:: with SMTP id l26mr4030327wmg.164.1601661221643;
        Fri, 02 Oct 2020 10:53:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id m10sm2585429wmc.9.2020.10.02.10.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 10:53:40 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Oded Gabbay <oded.gabbay@gmail.com>,
        Omer Shpigelman <oshpigelman@habana.ai>,
        Tomer Tayar <ttayar@habana.ai>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pawel Piskorski <ppiskorski@habana.ai>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mm@kvack.org
Subject: [PATCH 1/2] mm/frame-vec: Drop gup_flags from get_vaddr_frames()
Date:   Fri,  2 Oct 2020 19:53:02 +0200
Message-Id: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

FOLL_WRITE | FOLL_FORCE is really the only reasonable thing to do for
simple dma device that can't guarantee write protection. Which is also
what all the callers are using.

So just simplify this.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pawel Osciak <pawel@osciak.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Tomasz Figa <tfiga@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Oded Gabbay <oded.gabbay@gmail.com>
Cc: Omer Shpigelman <oshpigelman@habana.ai>
Cc: Tomer Tayar <ttayar@habana.ai>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pawel Piskorski <ppiskorski@habana.ai>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linux-mm@kvack.org
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c           | 3 +--
 drivers/media/common/videobuf2/videobuf2-memops.c | 3 +--
 drivers/misc/habanalabs/common/memory.c           | 3 +--
 include/linux/mm.h                                | 2 +-
 mm/frame_vector.c                                 | 4 ++--
 5 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 967a5cdc120e..ac452842bab3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -480,8 +480,7 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct g2d_data *g2d,
 		goto err_free;
 	}
 
-	ret = get_vaddr_frames(start, npages, FOLL_FORCE | FOLL_WRITE,
-		g2d_userptr->vec);
+	ret = get_vaddr_frames(start, npages, g2d_userptr->vec);
 	if (ret != npages) {
 		DRM_DEV_ERROR(g2d->dev,
 			      "failed to get user pages from userptr.\n");
diff --git a/drivers/media/common/videobuf2/videobuf2-memops.c b/drivers/media/common/videobuf2/videobuf2-memops.c
index 6e9e05153f4e..9dd6c27162f4 100644
--- a/drivers/media/common/videobuf2/videobuf2-memops.c
+++ b/drivers/media/common/videobuf2/videobuf2-memops.c
@@ -40,7 +40,6 @@ struct frame_vector *vb2_create_framevec(unsigned long start,
 	unsigned long first, last;
 	unsigned long nr;
 	struct frame_vector *vec;
-	unsigned int flags = FOLL_FORCE | FOLL_WRITE;
 
 	first = start >> PAGE_SHIFT;
 	last = (start + length - 1) >> PAGE_SHIFT;
@@ -48,7 +47,7 @@ struct frame_vector *vb2_create_framevec(unsigned long start,
 	vec = frame_vector_create(nr);
 	if (!vec)
 		return ERR_PTR(-ENOMEM);
-	ret = get_vaddr_frames(start & PAGE_MASK, nr, flags, vec);
+	ret = get_vaddr_frames(start & PAGE_MASK, nr, vec);
 	if (ret < 0)
 		goto out_destroy;
 	/* We accept only complete set of PFNs */
diff --git a/drivers/misc/habanalabs/common/memory.c b/drivers/misc/habanalabs/common/memory.c
index 5ff4688683fd..43b10aee8150 100644
--- a/drivers/misc/habanalabs/common/memory.c
+++ b/drivers/misc/habanalabs/common/memory.c
@@ -1287,8 +1287,7 @@ static int get_user_memory(struct hl_device *hdev, u64 addr, u64 size,
 		return -ENOMEM;
 	}
 
-	rc = get_vaddr_frames(start, npages, FOLL_FORCE | FOLL_WRITE,
-				userptr->vec);
+	rc = get_vaddr_frames(start, npages, userptr->vec);
 
 	if (rc != npages) {
 		dev_err(hdev->dev,
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 16b799a0522c..7d14aa2780d2 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1757,7 +1757,7 @@ struct frame_vector {
 struct frame_vector *frame_vector_create(unsigned int nr_frames);
 void frame_vector_destroy(struct frame_vector *vec);
 int get_vaddr_frames(unsigned long start, unsigned int nr_pfns,
-		     unsigned int gup_flags, struct frame_vector *vec);
+		     struct frame_vector *vec);
 void put_vaddr_frames(struct frame_vector *vec);
 int frame_vector_to_pages(struct frame_vector *vec);
 void frame_vector_to_pfns(struct frame_vector *vec);
diff --git a/mm/frame_vector.c b/mm/frame_vector.c
index 10f82d5643b6..5d34c9047e9c 100644
--- a/mm/frame_vector.c
+++ b/mm/frame_vector.c
@@ -12,7 +12,6 @@
  * get_vaddr_frames() - map virtual addresses to pfns
  * @start:	starting user address
  * @nr_frames:	number of pages / pfns from start to map
- * @gup_flags:	flags modifying lookup behaviour
  * @vec:	structure which receives pages / pfns of the addresses mapped.
  *		It should have space for at least nr_frames entries.
  *
@@ -32,10 +31,11 @@
  * This function takes care of grabbing mmap_lock as necessary.
  */
 int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
-		     unsigned int gup_flags, struct frame_vector *vec)
+		     struct frame_vector *vec)
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
+	unsigned int gup_flags = FOLL_WRITE | FOLL_FORCE;
 	int ret = 0;
 	int err;
 	int locked;
-- 
2.28.0


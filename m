Return-Path: <SRS0=uz1o=D6=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E6FC83010
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 23 Oct 2020 12:23:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B87E824655
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 23 Oct 2020 12:23:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="AEIa/7Rt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463668AbgJWMXF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 23 Oct 2020 08:23:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S463661AbgJWMXE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 08:23:04 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14176C0613D2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Oct 2020 05:23:03 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id s9so1566690wro.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Oct 2020 05:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cXs1UvblKDwz1YQCIe37x2wwQ5T1EiKP8bli0y6YQUo=;
        b=AEIa/7RtMPcTkOS17xaoZ+tZ2WHJwDB/uLw+Jxwkknjzz0o8Pvb3jK8xNmI5+rkacH
         RvXPWyHDVHuGWcl22HeQn+NbqKDCOAf9Q9GDKtS71H17YcqVr/FxJsbfr3QL5ROHJrug
         tpVEoVnRUaDsKK3bbvDbpWdN2Mh/1JfyJptkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cXs1UvblKDwz1YQCIe37x2wwQ5T1EiKP8bli0y6YQUo=;
        b=rsCoY7mIvYy/8ZhNwLOGkmB4/SHHwd0qodKyZfNXrrMzR8C72RhiNVsc7l93eBU3kQ
         MUpi97tbVZyacM2fjJ9NzW3XpEP6CL13GwsbvP6aGVqgYVP59r1OS9YQgpcHcTqKVdWe
         fElA6Fx42ol6d/SCC2ov7uieZdgvPg0zmb2zxi8/sKfYXniXfq+xe6itwzOO0AsQeOOr
         Xay8K9k19smfhzb81wFGdZej4zK1g6zGsqxS0PYwhW4SQEuUecoUwdE+cdtHoR6NQzqT
         +bJumoNlntSLhBVos6MZ60w9Jzn7rucfKAPECttuG2tDXbCnv1rLfqxN4Me8FX7R84EC
         eboA==
X-Gm-Message-State: AOAM531cDEPQVQQGVIoyM3rnqvOO6gjkyM9zyuOAxzlRdsAZzz8APri5
        FTaSMD2WuXCyg+L5qVI5wWKSIw==
X-Google-Smtp-Source: ABdhPJwugsOja41agH4JeM0mB6q18uXcawtusiYBwFAiX2c/bgyl3tIOiZ8ZGxA9kMQgDSsksw1WPw==
X-Received: by 2002:adf:fd8a:: with SMTP id d10mr2236246wrr.85.1603455781768;
        Fri, 23 Oct 2020 05:23:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 05:23:01 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 34/65] mm/frame-vector: Use FOLL_LONGTERM
Date:   Fri, 23 Oct 2020 14:21:45 +0200
Message-Id: <20201023122216.2373294-34-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This is used by media/videbuf2 for persistent dma mappings, not just
for a single dma operation and then freed again, so needs
FOLL_LONGTERM.

Unfortunately current pup_locked doesn't support FOLL_LONGTERM due to
locking issues. Rework the code to pull the pup path out from the
mmap_sem critical section as suggested by Jason.

By relying entirely on the vma checks in pin_user_pages and follow_pfn
(for vm_flags and vma_is_fsdax) we can also streamline the code a lot.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Pawel Osciak <pawel@osciak.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Tomasz Figa <tfiga@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
--
v2: Streamline the code and further simplify the loop checks (Jason)
---
 mm/frame_vector.c | 50 ++++++++++++++---------------------------------
 1 file changed, 15 insertions(+), 35 deletions(-)

diff --git a/mm/frame_vector.c b/mm/frame_vector.c
index 10f82d5643b6..d44779e56313 100644
--- a/mm/frame_vector.c
+++ b/mm/frame_vector.c
@@ -38,7 +38,6 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
 	struct vm_area_struct *vma;
 	int ret = 0;
 	int err;
-	int locked;
 
 	if (nr_frames == 0)
 		return 0;
@@ -48,40 +47,25 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
 
 	start = untagged_addr(start);
 
-	mmap_read_lock(mm);
-	locked = 1;
-	vma = find_vma_intersection(mm, start, start + 1);
-	if (!vma) {
-		ret = -EFAULT;
-		goto out;
-	}
-
-	/*
-	 * While get_vaddr_frames() could be used for transient (kernel
-	 * controlled lifetime) pinning of memory pages all current
-	 * users establish long term (userspace controlled lifetime)
-	 * page pinning. Treat get_vaddr_frames() like
-	 * get_user_pages_longterm() and disallow it for filesystem-dax
-	 * mappings.
-	 */
-	if (vma_is_fsdax(vma)) {
-		ret = -EOPNOTSUPP;
-		goto out;
-	}
-
-	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP))) {
+	ret = pin_user_pages_fast(start, nr_frames,
+				  FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
+				  (struct page **)(vec->ptrs));
+	if (ret > 0) {
 		vec->got_ref = true;
 		vec->is_pfns = false;
-		ret = pin_user_pages_locked(start, nr_frames,
-			gup_flags, (struct page **)(vec->ptrs), &locked);
-		goto out;
+		goto out_unlocked;
 	}
 
+	mmap_read_lock(mm);
 	vec->got_ref = false;
 	vec->is_pfns = true;
 	do {
 		unsigned long *nums = frame_vector_pfns(vec);
 
+		vma = find_vma_intersection(mm, start, start + 1);
+		if (!vma)
+			break;
+
 		while (ret < nr_frames && start + PAGE_SIZE <= vma->vm_end) {
 			err = follow_pfn(vma, start, &nums[ret]);
 			if (err) {
@@ -92,17 +76,13 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
 			start += PAGE_SIZE;
 			ret++;
 		}
-		/*
-		 * We stop if we have enough pages or if VMA doesn't completely
-		 * cover the tail page.
-		 */
-		if (ret >= nr_frames || start < vma->vm_end)
+		/* Bail out if VMA doesn't completely cover the tail page. */
+		if (start < vma->vm_end)
 			break;
-		vma = find_vma_intersection(mm, start, start + 1);
-	} while (vma && vma->vm_flags & (VM_IO | VM_PFNMAP));
+	} while (ret < nr_frames);
 out:
-	if (locked)
-		mmap_read_unlock(mm);
+	mmap_read_unlock(mm);
+out_unlocked:
 	if (!ret)
 		ret = -EFAULT;
 	if (ret > 0)
-- 
2.28.0


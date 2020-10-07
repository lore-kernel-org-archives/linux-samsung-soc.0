Return-Path: <SRS0=c76P=DO=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D479CC47423
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 16:45:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 807A4215A4
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 16:45:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="ZCR6epNG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728850AbgJGQp6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Oct 2020 12:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728003AbgJGQol (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Oct 2020 12:44:41 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A14EC0613D2
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Oct 2020 09:44:41 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id f21so3041529wml.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Oct 2020 09:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tumapzZxvtArZNF04352kaumd5zWdbY4K/o9+R8ZPiU=;
        b=ZCR6epNGq4y9pMu5KQprul9p0e5pbHRNVWh8gfzFX5t78d6KExLodPu0cge87TbHQ7
         IFCUDLlXaw9OhMaO8M6ZionCebVY74YdmCbAxhY4ZzIXmKSQNldnw8FEWkuV3IgYHDwi
         4BgN7dseD1BVSXWfbIbpwPFDfQHHYpunWAI44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tumapzZxvtArZNF04352kaumd5zWdbY4K/o9+R8ZPiU=;
        b=E17Vzmjn/3fgpjSKPTZia1BUPTq03Y141nIzmWKJx/scFsTgVfIiiKYLA+soM0hBPB
         QjFAl5j2FVzyDNoj3BlkPD7YJPJLgUQXDfr+yXfL/sQoUBCwlAhTLCKS2dyZs9/ZVdjN
         kMsW6Qv/Uh7gwuyqCMRUeCurhL5KOjVVyKofDOJjNTecIatOjVuzW8tGAaC1FhXooYpw
         BgXqEHQfvY3uv3nl9vwzHzDjAuQupEUrowNnEE2OQ5lfydaKc+R8FPBDaGpAvtZBUnDX
         0kyga/KtG5q5CrfYwjBGFCDyiZ4npjJmiOiv81duw1Ov0amJaXO5ehn+MkAEufK8oSUZ
         cWBA==
X-Gm-Message-State: AOAM532m6WQQwWUbau/Oalo6ASo/TzyNhMkS8DT2GaMk6HGx6UaIHj4a
        861BiX/zZ0T2ofJrvbOW16h9pg==
X-Google-Smtp-Source: ABdhPJzV4N2gLoUB2iCJL2idqYl1jr0gD0FniH6eb95jw+Xbq6j8k/dKxJZkk3IRomSCwD32oRnJ8Q==
X-Received: by 2002:a1c:a7cc:: with SMTP id q195mr4218149wme.8.1602089080062;
        Wed, 07 Oct 2020 09:44:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z191sm3332280wme.40.2020.10.07.09.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 09:44:39 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
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
        Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH 05/13] mm/frame-vector: Use FOLL_LONGTERM
Date:   Wed,  7 Oct 2020 18:44:18 +0200
Message-Id: <20201007164426.1812530-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
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
---
 mm/frame_vector.c | 36 +++++++++++-------------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/mm/frame_vector.c b/mm/frame_vector.c
index 10f82d5643b6..39db520a51dc 100644
--- a/mm/frame_vector.c
+++ b/mm/frame_vector.c
@@ -38,7 +38,6 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
 	struct vm_area_struct *vma;
 	int ret = 0;
 	int err;
-	int locked;
 
 	if (nr_frames == 0)
 		return 0;
@@ -48,35 +47,22 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
 
 	start = untagged_addr(start);
 
+	ret = pin_user_pages_fast(start, nr_frames,
+				  FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
+				  (struct page **)(vec->ptrs));
+	if (ret > 0) {
+		vec->got_ref = true;
+		vec->is_pfns = false;
+		goto out_unlocked;
+	}
+
 	mmap_read_lock(mm);
-	locked = 1;
 	vma = find_vma_intersection(mm, start, start + 1);
 	if (!vma) {
 		ret = -EFAULT;
 		goto out;
 	}
 
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
-		vec->got_ref = true;
-		vec->is_pfns = false;
-		ret = pin_user_pages_locked(start, nr_frames,
-			gup_flags, (struct page **)(vec->ptrs), &locked);
-		goto out;
-	}
-
 	vec->got_ref = false;
 	vec->is_pfns = true;
 	do {
@@ -101,8 +87,8 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
 		vma = find_vma_intersection(mm, start, start + 1);
 	} while (vma && vma->vm_flags & (VM_IO | VM_PFNMAP));
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


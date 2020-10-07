Return-Path: <SRS0=c76P=DO=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B939C47420
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 16:45:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C63D42087D
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Oct 2020 16:45:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="PbdDP59N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbgJGQpM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Oct 2020 12:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728737AbgJGQpL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Oct 2020 12:45:11 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 563DEC0613AC
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Oct 2020 09:44:52 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id p15so3042410wmi.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Oct 2020 09:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dvMOl5qn3xQqngcKVpyNX+ax+2goWhkEVg7LeNCEKtI=;
        b=PbdDP59NrSDZxmLOWczSE2cRJJsMLzvw4mEtmBjBj9fgeRsN0fZSKVabWIN7hFcZtv
         xzAe3LJduGn0vaaDjiW4G/C3Uf4XUZO2JllwyTJ9Wsq0tezSYJkYYoiFOthcqAJ5SpO/
         3t8nzxUBbNP7hSXTX+L3BgEGTBUq+RyoYYKLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dvMOl5qn3xQqngcKVpyNX+ax+2goWhkEVg7LeNCEKtI=;
        b=IlcqWCz99TQDCz+sV9jPMdty/RRft0Vy7hQphheDMIQIGD9p+rNfuUJsVRzSFj9P4T
         ES6LFP37GER/tF6kqUzkKKtuuvCLzu0MLf5ttRnKPRSxyc2jELDzES0nCUBNeyc2wdOB
         nM9O1WEPfqYww+vgH88R0w+vwFYL+BYXrcTVtZokEQ/Hhm11tKw2Mm1sg3G06swVkBVp
         xeJv4vU+1uRptckarJt9omRsFkvK7YX5YnsmnWYp3ezERsb+5+nZ6/ATiSM3OkI9MhqS
         bX//Qs4MtQ1aFpYLGGPwhcOKG5pZB/0c/r3HYR1CaLT4J2BNUyfOEj6xVyijpRDsvj5E
         UH5A==
X-Gm-Message-State: AOAM533DG7S4NLUiULGLYlMoRs8dGY+95SzLTfutsk+fVvnaWCKakbhL
        igKZgFwqOd0qwJp050DZlrCrOQ==
X-Google-Smtp-Source: ABdhPJzw6PlCUbNqoLiPN5u1sFMl1viobOv7pIsUUzeqLWeTM2j6wE9ncJp2ranbphS6F7r51TbDeQ==
X-Received: by 2002:a1c:1905:: with SMTP id 5mr4404786wmz.32.1602089090410;
        Wed, 07 Oct 2020 09:44:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z191sm3332280wme.40.2020.10.07.09.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 09:44:49 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Daniel Jordan <daniel.m.jordan@oracle.com>,
        Michel Lespinasse <walken@google.com>
Subject: [PATCH 12/13] media/videbuf1|2: Mark follow_pfn usage as unsafe
Date:   Wed,  7 Oct 2020 18:44:25 +0200
Message-Id: <20201007164426.1812530-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The media model assumes that buffers are all preallocated, so that
when a media pipeline is running we never miss a deadline because the
buffers aren't allocated or available.

This means we cannot fix the v4l follow_pfn usage through
mmu_notifier, without breaking how this all works. The only real fix
is to deprecate userptr support for VM_IO | VM_PFNMAP mappings and
tell everyone to cut over to dma-buf memory sharing for zerocopy.

userptr for normal memory will keep working as-is.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kees Cook <keescook@chromium.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: Pawel Osciak <pawel@osciak.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Tomasz Figa <tfiga@chromium.org>
Cc: Laurent Dufour <ldufour@linux.ibm.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Daniel Jordan <daniel.m.jordan@oracle.com>
Cc: Michel Lespinasse <walken@google.com>
---
 drivers/media/common/videobuf2/frame_vector.c | 2 +-
 drivers/media/v4l2-core/videobuf-dma-contig.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
index b95f4f371681..d56eb6258f09 100644
--- a/drivers/media/common/videobuf2/frame_vector.c
+++ b/drivers/media/common/videobuf2/frame_vector.c
@@ -71,7 +71,7 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
 		unsigned long *nums = frame_vector_pfns(vec);
 
 		while (ret < nr_frames && start + PAGE_SIZE <= vma->vm_end) {
-			err = follow_pfn(vma, start, &nums[ret]);
+			err = unsafe_follow_pfn(vma, start, &nums[ret]);
 			if (err) {
 				if (ret == 0)
 					ret = err;
diff --git a/drivers/media/v4l2-core/videobuf-dma-contig.c b/drivers/media/v4l2-core/videobuf-dma-contig.c
index 52312ce2ba05..821c4a76ab96 100644
--- a/drivers/media/v4l2-core/videobuf-dma-contig.c
+++ b/drivers/media/v4l2-core/videobuf-dma-contig.c
@@ -183,7 +183,7 @@ static int videobuf_dma_contig_user_get(struct videobuf_dma_contig_memory *mem,
 	user_address = untagged_baddr;
 
 	while (pages_done < (mem->size >> PAGE_SHIFT)) {
-		ret = follow_pfn(vma, user_address, &this_pfn);
+		ret = unsafe_follow_pfn(vma, user_address, &this_pfn);
 		if (ret)
 			break;
 
-- 
2.28.0


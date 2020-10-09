Return-Path: <SRS0=q3lv=DQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D07C35265
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Oct 2020 08:00:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6DFEA222C2
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Oct 2020 08:00:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="X+lVFEzk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732479AbgJIIAO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Oct 2020 04:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732736AbgJIIAN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Oct 2020 04:00:13 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07254C0610D1
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2020 01:00:08 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id t9so9226792wrq.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Oct 2020 01:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N5MezEhvq/wwBRTty0X109hZVMwHizCfP5Lc200+OeU=;
        b=X+lVFEzkJG7G1y1hQOMHpq9aH/9wMcZRASu3pf5WwWkSy+lBQfhcJFHkD+mB+HB+8B
         6q3Z/oFWS+IjpKniri9mdKD+xWh4Pb1kxxRnhtmA75fRmXM2leSVVQ9O6mzJ2s2pjdNF
         FwYvxU8GuH0ylVTYs9gfzX5C6vRDllxk8cWjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N5MezEhvq/wwBRTty0X109hZVMwHizCfP5Lc200+OeU=;
        b=Irg27hENpSP5TrSqMfXSO6ClDOI+aL3vvKvgPYW08uJ90r8t60Cv/gicR+qlRJcT9D
         IIDIIiQIEat930TgHi+Ne7cLaX7kCX4hVdgninWta3hIXzbvPQC7EeeeTo2zUIQi0RzO
         tefYGPmZE7mUUKgxNmJTVeWwUVS90116p206R6PX1+O5IT4f6NYP/y278KN0qPCEOqWz
         8wazYPwL8a/4oUPRxe8K7Dz5gJuoKSNkQy+e3Dp9cCebY9I5IYmbVhaTPNtfUNrEalRO
         rct7+MwxcO7d4SoPQs+Isptv2w53jCz+z3/yj81b+9/x0asLICMkqMZlPcETYMKuDALr
         zYPw==
X-Gm-Message-State: AOAM533INAuCjxemRf43YQHTeaJFMhFWkI7li798mhgDwOG0/y30POKk
        nixSRu3MTCYbLhtvYy9NsmNrdQ==
X-Google-Smtp-Source: ABdhPJzMUouKiCH6SJK6dyAVSQS46IBJV9EJgv/XkHUvyqgT9BYelO/ICRgl0rBnswqZFheeRzPOMA==
X-Received: by 2002:adf:9dd1:: with SMTP id q17mr6771139wre.317.1602230406671;
        Fri, 09 Oct 2020 01:00:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u17sm11634118wri.45.2020.10.09.01.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 01:00:05 -0700 (PDT)
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
Subject: [PATCH v2 10/17] media/videbuf1|2: Mark follow_pfn usage as unsafe
Date:   Fri,  9 Oct 2020 09:59:27 +0200
Message-Id: <20201009075934.3509076-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
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
index 2b0b97761d15..a1b85fe9e7c1 100644
--- a/drivers/media/common/videobuf2/frame_vector.c
+++ b/drivers/media/common/videobuf2/frame_vector.c
@@ -69,7 +69,7 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
 			break;
 
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


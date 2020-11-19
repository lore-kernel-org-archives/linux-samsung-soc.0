Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E188C64E7C
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Nov 2020 14:44:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3DF222261
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Nov 2020 14:44:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="fB+D8fFK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728258AbgKSOnu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 19 Nov 2020 09:43:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728254AbgKSOmF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Nov 2020 09:42:05 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94CBDC061A4F
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2020 06:42:02 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id 23so6668893wrc.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2020 06:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uJ66h4r+uGLcY1nTVoNYHPkSqbRa1dgKivSR4OFu4LY=;
        b=fB+D8fFK/n1cYI0XfO7cCNc5oqG0hw2vRzAYLkEDawtmiSOt4j7ub0OZ64eKZ4mays
         FyoIFs22WIXfMJrOYvZp7mva1fL/CQ+7LLKtclHkZNG+oe+BQMM3ovtoRxA985OThIs4
         f+M1uXioUE0trLlKcHCq62lNSfl+inAYmYAxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uJ66h4r+uGLcY1nTVoNYHPkSqbRa1dgKivSR4OFu4LY=;
        b=HZk+CBAfsnSgpzt/xXFsgyyMF0o+KzhKaHQRkd9hK4VBBPHFBPEaizt0KuUJegznZ0
         PjG/q3CfVaGWjG3QgWaHNTrFpmU1pm7zzITXsyJTZZxFvZmoj3P8R6x4lLWqJbDB12IW
         uipCN7ZrRi8hAXUrAkAwa5D7p+WAhTVsKB7Q55CueAB5INbpa3IhzFEQehIcIkfJyus9
         PqY49lGhtXfkn2cZQbxTDGVpFMaspzUNehMzKUXIHlK3p5JqaNyw9qqMdTWju/42vcrj
         msjyTmJz/K9OrrLir9jWDqasiOcuxuTTUXiY6+YzvGLnWXl4NCKrUdG/7mbDaoZHfBNI
         R8xg==
X-Gm-Message-State: AOAM533Vy5vDwBGk0LoxF2DKn9Dk0heXubzezEVGDd88W4AtaXlc8b65
        1CGdV36bMQnhEF6owL/JXwZIEw==
X-Google-Smtp-Source: ABdhPJzACCQdVm0RkvVnBMIhZUcZyXzZbizm9jfYVKw/H/OWLfFBClBwfDOZTKTCLRW1U0QO7fDpbg==
X-Received: by 2002:a5d:4a50:: with SMTP id v16mr10699614wrs.106.1605796921317;
        Thu, 19 Nov 2020 06:42:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id x63sm51292wmb.48.2020.11.19.06.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 06:42:00 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        John Hubbard <jhubbard@nvidia.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v6 06/17] media: videobuf2: Move frame_vector into media subsystem
Date:   Thu, 19 Nov 2020 15:41:35 +0100
Message-Id: <20201119144146.1045202-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

It's the only user. This also garbage collects the CONFIG_FRAME_VECTOR
symbol from all over the tree (well just one place, somehow omap media
driver still had this in its Kconfig, despite not using it).

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Tomasz Figa <tfiga@chromium.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
--
v3:
- Create a new frame_vector.h header for this (Mauro)
v5:
- Rebase over changes in frame-vector.c from Tomasz review.
---
 drivers/media/common/videobuf2/Kconfig        |  1 -
 drivers/media/common/videobuf2/Makefile       |  1 +
 .../media/common/videobuf2}/frame_vector.c    |  2 +
 drivers/media/platform/omap/Kconfig           |  1 -
 include/linux/mm.h                            | 42 -----------------
 include/media/frame_vector.h                  | 47 +++++++++++++++++++
 include/media/videobuf2-core.h                |  1 +
 mm/Kconfig                                    |  3 --
 mm/Makefile                                   |  1 -
 9 files changed, 51 insertions(+), 48 deletions(-)
 rename {mm => drivers/media/common/videobuf2}/frame_vector.c (99%)
 create mode 100644 include/media/frame_vector.h

diff --git a/drivers/media/common/videobuf2/Kconfig b/drivers/media/common/videobuf2/Kconfig
index edbc99ebba87..d2223a12c95f 100644
--- a/drivers/media/common/videobuf2/Kconfig
+++ b/drivers/media/common/videobuf2/Kconfig
@@ -9,7 +9,6 @@ config VIDEOBUF2_V4L2
 
 config VIDEOBUF2_MEMOPS
 	tristate
-	select FRAME_VECTOR
 
 config VIDEOBUF2_DMA_CONTIG
 	tristate
diff --git a/drivers/media/common/videobuf2/Makefile b/drivers/media/common/videobuf2/Makefile
index 77bebe8b202f..54306f8d096c 100644
--- a/drivers/media/common/videobuf2/Makefile
+++ b/drivers/media/common/videobuf2/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 videobuf2-common-objs := videobuf2-core.o
+videobuf2-common-objs += frame_vector.o
 
 ifeq ($(CONFIG_TRACEPOINTS),y)
   videobuf2-common-objs += vb2-trace.o
diff --git a/mm/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
similarity index 99%
rename from mm/frame_vector.c
rename to drivers/media/common/videobuf2/frame_vector.c
index f8c34b895c76..a0e65481a201 100644
--- a/mm/frame_vector.c
+++ b/drivers/media/common/videobuf2/frame_vector.c
@@ -8,6 +8,8 @@
 #include <linux/pagemap.h>
 #include <linux/sched.h>
 
+#include <media/frame_vector.h>
+
 /**
  * get_vaddr_frames() - map virtual addresses to pfns
  * @start:	starting user address
diff --git a/drivers/media/platform/omap/Kconfig b/drivers/media/platform/omap/Kconfig
index f73b5893220d..de16de46c0f4 100644
--- a/drivers/media/platform/omap/Kconfig
+++ b/drivers/media/platform/omap/Kconfig
@@ -12,6 +12,5 @@ config VIDEO_OMAP2_VOUT
 	depends on VIDEO_V4L2
 	select VIDEOBUF2_DMA_CONTIG
 	select OMAP2_VRFB if ARCH_OMAP2 || ARCH_OMAP3
-	select FRAME_VECTOR
 	help
 	  V4L2 Display driver support for OMAP2/3 based boards.
diff --git a/include/linux/mm.h b/include/linux/mm.h
index efb8c39bc933..b1a4a140863d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1751,48 +1751,6 @@ int account_locked_vm(struct mm_struct *mm, unsigned long pages, bool inc);
 int __account_locked_vm(struct mm_struct *mm, unsigned long pages, bool inc,
 			struct task_struct *task, bool bypass_rlim);
 
-/* Container for pinned pfns / pages */
-struct frame_vector {
-	unsigned int nr_allocated;	/* Number of frames we have space for */
-	unsigned int nr_frames;	/* Number of frames stored in ptrs array */
-	bool got_ref;		/* Did we pin pages by getting page ref? */
-	bool is_pfns;		/* Does array contain pages or pfns? */
-	void *ptrs[];		/* Array of pinned pfns / pages. Use
-				 * pfns_vector_pages() or pfns_vector_pfns()
-				 * for access */
-};
-
-struct frame_vector *frame_vector_create(unsigned int nr_frames);
-void frame_vector_destroy(struct frame_vector *vec);
-int get_vaddr_frames(unsigned long start, unsigned int nr_pfns,
-		     struct frame_vector *vec);
-void put_vaddr_frames(struct frame_vector *vec);
-int frame_vector_to_pages(struct frame_vector *vec);
-void frame_vector_to_pfns(struct frame_vector *vec);
-
-static inline unsigned int frame_vector_count(struct frame_vector *vec)
-{
-	return vec->nr_frames;
-}
-
-static inline struct page **frame_vector_pages(struct frame_vector *vec)
-{
-	if (vec->is_pfns) {
-		int err = frame_vector_to_pages(vec);
-
-		if (err)
-			return ERR_PTR(err);
-	}
-	return (struct page **)(vec->ptrs);
-}
-
-static inline unsigned long *frame_vector_pfns(struct frame_vector *vec)
-{
-	if (!vec->is_pfns)
-		frame_vector_to_pfns(vec);
-	return (unsigned long *)(vec->ptrs);
-}
-
 struct kvec;
 int get_kernel_pages(const struct kvec *iov, int nr_pages, int write,
 			struct page **pages);
diff --git a/include/media/frame_vector.h b/include/media/frame_vector.h
new file mode 100644
index 000000000000..bfed1710dc24
--- /dev/null
+++ b/include/media/frame_vector.h
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+#ifndef _MEDIA_FRAME_VECTOR_H
+#define _MEDIA_FRAME_VECTOR_H
+
+/* Container for pinned pfns / pages in frame_vector.c */
+struct frame_vector {
+	unsigned int nr_allocated;	/* Number of frames we have space for */
+	unsigned int nr_frames;	/* Number of frames stored in ptrs array */
+	bool got_ref;		/* Did we pin pages by getting page ref? */
+	bool is_pfns;		/* Does array contain pages or pfns? */
+	void *ptrs[];		/* Array of pinned pfns / pages. Use
+				 * pfns_vector_pages() or pfns_vector_pfns()
+				 * for access */
+};
+
+struct frame_vector *frame_vector_create(unsigned int nr_frames);
+void frame_vector_destroy(struct frame_vector *vec);
+int get_vaddr_frames(unsigned long start, unsigned int nr_pfns,
+		     struct frame_vector *vec);
+void put_vaddr_frames(struct frame_vector *vec);
+int frame_vector_to_pages(struct frame_vector *vec);
+void frame_vector_to_pfns(struct frame_vector *vec);
+
+static inline unsigned int frame_vector_count(struct frame_vector *vec)
+{
+	return vec->nr_frames;
+}
+
+static inline struct page **frame_vector_pages(struct frame_vector *vec)
+{
+	if (vec->is_pfns) {
+		int err = frame_vector_to_pages(vec);
+
+		if (err)
+			return ERR_PTR(err);
+	}
+	return (struct page **)(vec->ptrs);
+}
+
+static inline unsigned long *frame_vector_pfns(struct frame_vector *vec)
+{
+	if (!vec->is_pfns)
+		frame_vector_to_pfns(vec);
+	return (unsigned long *)(vec->ptrs);
+}
+
+#endif /* _MEDIA_FRAME_VECTOR_H */
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index bbb3f26fbde9..d045e3a5a1d8 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -18,6 +18,7 @@
 #include <linux/dma-buf.h>
 #include <linux/bitops.h>
 #include <media/media-request.h>
+#include <media/frame_vector.h>
 
 #define VB2_MAX_FRAME	(32)
 #define VB2_MAX_PLANES	(8)
diff --git a/mm/Kconfig b/mm/Kconfig
index d42423f884a7..0dcff24cba53 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -819,9 +819,6 @@ config DEVICE_PRIVATE
 config VMAP_PFN
 	bool
 
-config FRAME_VECTOR
-	bool
-
 config ARCH_USES_HIGH_VMA_FLAGS
 	bool
 config ARCH_HAS_PKEYS
diff --git a/mm/Makefile b/mm/Makefile
index d73aed0fc99c..db41fff05038 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -110,7 +110,6 @@ obj-$(CONFIG_PAGE_EXTENSION) += page_ext.o
 obj-$(CONFIG_CMA_DEBUGFS) += cma_debug.o
 obj-$(CONFIG_USERFAULTFD) += userfaultfd.o
 obj-$(CONFIG_IDLE_PAGE_TRACKING) += page_idle.o
-obj-$(CONFIG_FRAME_VECTOR) += frame_vector.o
 obj-$(CONFIG_DEBUG_PAGE_REF) += debug_page_ref.o
 obj-$(CONFIG_HARDENED_USERCOPY) += usercopy.o
 obj-$(CONFIG_PERCPU_STATS) += percpu-stats.o
-- 
2.29.2


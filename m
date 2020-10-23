Return-Path: <SRS0=uz1o=D6=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A67F7C5DF9D
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 23 Oct 2020 12:23:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 656932463C
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 23 Oct 2020 12:23:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="kxcHr9Xa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463673AbgJWMXG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 23 Oct 2020 08:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S463669AbgJWMXG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 08:23:06 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D997AC0613CE
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Oct 2020 05:23:05 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id t9so1556097wrq.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Oct 2020 05:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hPo/Bw6tNC6m8oopvfckb4iPuUPePa6aSZ/PC8jTJPc=;
        b=kxcHr9XaGgdgUN/6f9tRbwBS2R7y8JekVykqE3uxv65hBKf0VpkNLgGxd8FIvRj750
         nO7ickZUiLfE5Y0mI+ot8RAg1bvzM+pU+EnQr+/RtXjGmgjqqxLTca/kFkBVNTJKhQjr
         XwcE78fbKjpMmELfqkY2vXpXpf6p2WAexMqJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hPo/Bw6tNC6m8oopvfckb4iPuUPePa6aSZ/PC8jTJPc=;
        b=APBcKIzI/GeqTt6pppG2Y7hh+GWTyErwGi2X4dIpbo6QQKeZdA0obnM3tq0/yezqNI
         HevP0bVEhoDzxb2UM7Wz+2QtQZlk4/yBiLGq1f0dJWzYq6GvtqeU6pKjGd5r+FRVh+1E
         dCvpstXKILdtL1joHwsvY1HwVJh1ezkTWVHRGZxwyaHJE+tn6FjjoNr3Jvi7PEyjGfuR
         YeaDg49nE4qCJFmHAJBZKg5LN0omB65LOVSvpK3sa7SswikepJZgOvhVHQcqCubUScNL
         1+48BFKX62NSh8uOIrMrbXT2g95IN8xYrmdwo3DJdm3XOVy90POmlRinSzzjKcukA+YG
         rLTg==
X-Gm-Message-State: AOAM5316OezRSo4P3HxqcMVB/0AlkNVJijPUUhNmp/V/KS6d+kn0etqL
        JxNrIJrtc6MCJ6stTn4kKo+IQg==
X-Google-Smtp-Source: ABdhPJwnPss/3+FXK73SGyn1ajFye9TH2uvE+XJgRwBdhY+CfV9NESKavPXc5txtoFVhV9XkRhrz0Q==
X-Received: by 2002:adf:e8d0:: with SMTP id k16mr2306084wrn.362.1603455784579;
        Fri, 23 Oct 2020 05:23:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 05:23:03 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Benjamin Herrensmidt <benh@kernel.crashing.org>,
        Dave Airlie <airlied@linux.ie>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Chris Wilson <chris@chris-wilson.co.uk>
Subject: [PATCH 36/65] mm: Close race in generic_access_phys
Date:   Fri, 23 Oct 2020 14:21:47 +0200
Message-Id: <20201023122216.2373294-36-daniel.vetter@ffwll.ch>
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

Way back it was a reasonable assumptions that iomem mappings never
change the pfn range they point at. But this has changed:

- gpu drivers dynamically manage their memory nowadays, invalidating
  ptes with unmap_mapping_range when buffers get moved

- contiguous dma allocations have moved from dedicated carvetouts to
  cma regions. This means if we miss the unmap the pfn might contain
  pagecache or anon memory (well anything allocated with GFP_MOVEABLE)

- even /dev/mem now invalidates mappings when the kernel requests that
  iomem region when CONFIG_IO_STRICT_DEVMEM is set, see 3234ac664a87
  ("/dev/mem: Revoke mappings when a driver claims the region")

Accessing pfns obtained from ptes without holding all the locks is
therefore no longer a good idea. Fix this.

Since ioremap might need to manipulate pagetables too we need to drop
the pt lock and have a retry loop if we raced.

While at it, also add kerneldoc and improve the comment for the
vma_ops->access function. It's for accessing, not for moving the
memory from iomem to system memory, as the old comment seemed to
suggest.

References: 28b2ee20c7cb ("access_process_vm device memory infrastructure")
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Benjamin Herrensmidt <benh@kernel.crashing.org>
Cc: Dave Airlie <airlied@linux.ie>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
--
v2: Fix inversion in the retry check (John).

v4: While at it, use offset_in_page (Chris Wilson)
---
 include/linux/mm.h |  3 ++-
 mm/memory.c        | 46 +++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index acd60fbf1a5a..2a16631c1fda 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -566,7 +566,8 @@ struct vm_operations_struct {
 	vm_fault_t (*pfn_mkwrite)(struct vm_fault *vmf);
 
 	/* called by access_process_vm when get_user_pages() fails, typically
-	 * for use by special VMAs that can switch between memory and hardware
+	 * for use by special VMAs. See also generic_access_phys() for a generic
+	 * implementation useful for any iomem mapping.
 	 */
 	int (*access)(struct vm_area_struct *vma, unsigned long addr,
 		      void *buf, int len, int write);
diff --git a/mm/memory.c b/mm/memory.c
index eeae590e526a..1b46eae3b703 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4840,28 +4840,68 @@ int follow_phys(struct vm_area_struct *vma,
 	return ret;
 }
 
+/**
+ * generic_access_phys - generic implementation for iomem mmap access
+ * @vma: the vma to access
+ * @addr: userspace addres, not relative offset within @vma
+ * @buf: buffer to read/write
+ * @len: length of transfer
+ * @write: set to FOLL_WRITE when writing, otherwise reading
+ *
+ * This is a generic implementation for &vm_operations_struct.access for an
+ * iomem mapping. This callback is used by access_process_vm() when the @vma is
+ * not page based.
+ */
 int generic_access_phys(struct vm_area_struct *vma, unsigned long addr,
 			void *buf, int len, int write)
 {
 	resource_size_t phys_addr;
 	unsigned long prot = 0;
 	void __iomem *maddr;
-	int offset = addr & (PAGE_SIZE-1);
+	pte_t *ptep, pte;
+	spinlock_t *ptl;
+	int offset = offset_in_page(addr);
+	int ret = -EINVAL;
+
+	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP)))
+		return -EINVAL;
+
+retry:
+	if (follow_pte(vma->vm_mm, addr, &ptep, &ptl))
+		return -EINVAL;
+	pte = *ptep;
+	pte_unmap_unlock(ptep, ptl);
 
-	if (follow_phys(vma, addr, write, &prot, &phys_addr))
+	prot = pgprot_val(pte_pgprot(pte));
+	phys_addr = (resource_size_t)pte_pfn(pte) << PAGE_SHIFT;
+
+	if ((write & FOLL_WRITE) && !pte_write(pte))
 		return -EINVAL;
 
 	maddr = ioremap_prot(phys_addr, PAGE_ALIGN(len + offset), prot);
 	if (!maddr)
 		return -ENOMEM;
 
+	if (follow_pte(vma->vm_mm, addr, &ptep, &ptl))
+		goto out_unmap;
+
+	if (!pte_same(pte, *ptep)) {
+		pte_unmap_unlock(ptep, ptl);
+		iounmap(maddr);
+
+		goto retry;
+	}
+
 	if (write)
 		memcpy_toio(maddr + offset, buf, len);
 	else
 		memcpy_fromio(buf, maddr + offset, len);
+	ret = len;
+	pte_unmap_unlock(ptep, ptl);
+out_unmap:
 	iounmap(maddr);
 
-	return len;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(generic_access_phys);
 #endif
-- 
2.28.0


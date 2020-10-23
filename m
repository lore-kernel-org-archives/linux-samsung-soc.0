Return-Path: <SRS0=uz1o=D6=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A79DC4363A
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 23 Oct 2020 12:23:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34FCE24655
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 23 Oct 2020 12:23:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="K0cS0ybR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463675AbgJWMXH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 23 Oct 2020 08:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S463671AbgJWMXH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 08:23:07 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28138C0613CE
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Oct 2020 05:23:07 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id g12so1563394wrp.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Oct 2020 05:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jw8O4zHShCAt4bi/mdSwE8pqaQ/Ci7nnAmM3jj6tKas=;
        b=K0cS0ybRn+oowL57X6Nq5A66q23biV6d8Mh7nGNYpraDsikoql8NXlqFHPQVPGQZEq
         ZhmiEFHW8LcIIsLLB04p9O5em1Gy5Y5hrhfhfjs2YroaC/WrwZiQyslSzwbv6NtWleY1
         RjNBNdVMAomvkHW50DBDpEmjI0t0ipkA/M7JE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jw8O4zHShCAt4bi/mdSwE8pqaQ/Ci7nnAmM3jj6tKas=;
        b=kPJnN1JevOtcsams/D+6rripjEmJG08g0npkVKvFJ8jw9ZH8Fc7MlebxE9zZobK6qC
         ouYre90dLVQo9BhGtWGl6j6bd6p1NyZ7AHT14R98q0O28Nm50kUDd1L4Yn4d8NBjc4jk
         JR0ZFJEzL8Wp+MXloUsrSWf7dRJ80xCIcGvhaDIarcVT8cj5LxDDj+uF1obaGjoJwxzP
         /CVZQH1Z0T08G3Bf7DgXJINnD2/iw7dhkykt0rP0u33hQ5A6xr6nBsDysKfnCd3Lxjq+
         ka08PZJNbn7IF6fT2lYu00qPQFiUgYE3TSWXPgQ6sbDrZEH+0Uc1RhN6jOaTgLPZZVoa
         twDw==
X-Gm-Message-State: AOAM532iV8gahBBIdRpkgfwc+HoVXqZwldaYvsZ6BLU10sKYsvN7j2tZ
        MfPhx/XAutLIfcfhN1TGeuIv+A==
X-Google-Smtp-Source: ABdhPJyHNrzVnBA/1XZbDotdv4KJ/xMo2zJVR986ilnB2l49QrGJnJFipT6hqx9IUcARiSC9qfVVjQ==
X-Received: by 2002:a5d:6551:: with SMTP id z17mr2352471wrv.266.1603455785885;
        Fri, 23 Oct 2020 05:23:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 05:23:05 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        kvm@vger.kernel.org
Subject: [PATCH 37/65] mm: Add unsafe_follow_pfn
Date:   Fri, 23 Oct 2020 14:21:48 +0200
Message-Id: <20201023122216.2373294-37-daniel.vetter@ffwll.ch>
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
therefore no longer a good idea.

Unfortunately there's some users where this is not fixable (like v4l
userptr of iomem mappings) or involves a pile of work (vfio type1
iommu). For now annotate these as unsafe and splat appropriately.

This patch adds an unsafe_follow_pfn, which later patches will then
roll out to all appropriate places.

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
Cc: kvm@vger.kernel.org
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 include/linux/mm.h |  2 ++
 mm/memory.c        | 32 +++++++++++++++++++++++++++++++-
 mm/nommu.c         | 17 +++++++++++++++++
 security/Kconfig   | 13 +++++++++++++
 4 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 2a16631c1fda..ec8c90928fc9 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1653,6 +1653,8 @@ int follow_pte_pmd(struct mm_struct *mm, unsigned long address,
 		   pte_t **ptepp, pmd_t **pmdpp, spinlock_t **ptlp);
 int follow_pfn(struct vm_area_struct *vma, unsigned long address,
 	unsigned long *pfn);
+int unsafe_follow_pfn(struct vm_area_struct *vma, unsigned long address,
+		      unsigned long *pfn);
 int follow_phys(struct vm_area_struct *vma, unsigned long address,
 		unsigned int flags, unsigned long *prot, resource_size_t *phys);
 int generic_access_phys(struct vm_area_struct *vma, unsigned long addr,
diff --git a/mm/memory.c b/mm/memory.c
index 1b46eae3b703..9a2ec07ff20b 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4788,7 +4788,12 @@ EXPORT_SYMBOL(follow_pte_pmd);
  * @address: user virtual address
  * @pfn: location to store found PFN
  *
- * Only IO mappings and raw PFN mappings are allowed.
+ * Only IO mappings and raw PFN mappings are allowed. Note that callers must
+ * ensure coherency with pte updates by using a &mmu_notifier to follow updates.
+ * If this is not feasible, or the access to the @pfn is only very short term,
+ * use follow_pte_pmd() instead and hold the pagetable lock for the duration of
+ * the access instead. Any caller not following these requirements must use
+ * unsafe_follow_pfn() instead.
  *
  * Return: zero and the pfn at @pfn on success, -ve otherwise.
  */
@@ -4811,6 +4816,31 @@ int follow_pfn(struct vm_area_struct *vma, unsigned long address,
 }
 EXPORT_SYMBOL(follow_pfn);
 
+/**
+ * unsafe_follow_pfn - look up PFN at a user virtual address
+ * @vma: memory mapping
+ * @address: user virtual address
+ * @pfn: location to store found PFN
+ *
+ * Only IO mappings and raw PFN mappings are allowed.
+ *
+ * Returns zero and the pfn at @pfn on success, -ve otherwise.
+ */
+int unsafe_follow_pfn(struct vm_area_struct *vma, unsigned long address,
+	unsigned long *pfn)
+{
+#ifdef CONFIG_STRICT_FOLLOW_PFN
+	pr_info("unsafe follow_pfn usage rejected, see CONFIG_STRICT_FOLLOW_PFN\n");
+	return -EINVAL;
+#else
+	WARN_ONCE(1, "unsafe follow_pfn usage\n");
+	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+
+	return follow_pfn(vma, address, pfn);
+#endif
+}
+EXPORT_SYMBOL(unsafe_follow_pfn);
+
 #ifdef CONFIG_HAVE_IOREMAP_PROT
 int follow_phys(struct vm_area_struct *vma,
 		unsigned long address, unsigned int flags,
diff --git a/mm/nommu.c b/mm/nommu.c
index 75a327149af1..3db2910f0d64 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -132,6 +132,23 @@ int follow_pfn(struct vm_area_struct *vma, unsigned long address,
 }
 EXPORT_SYMBOL(follow_pfn);
 
+/**
+ * unsafe_follow_pfn - look up PFN at a user virtual address
+ * @vma: memory mapping
+ * @address: user virtual address
+ * @pfn: location to store found PFN
+ *
+ * Only IO mappings and raw PFN mappings are allowed.
+ *
+ * Returns zero and the pfn at @pfn on success, -ve otherwise.
+ */
+int unsafe_follow_pfn(struct vm_area_struct *vma, unsigned long address,
+	unsigned long *pfn)
+{
+	return follow_pfn(vma, address, pfn);
+}
+EXPORT_SYMBOL(unsafe_follow_pfn);
+
 LIST_HEAD(vmap_area_list);
 
 void vfree(const void *addr)
diff --git a/security/Kconfig b/security/Kconfig
index 7561f6f99f1d..48945402e103 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -230,6 +230,19 @@ config STATIC_USERMODEHELPER_PATH
 	  If you wish for all usermode helper programs to be disabled,
 	  specify an empty string here (i.e. "").
 
+config STRICT_FOLLOW_PFN
+	bool "Disable unsafe use of follow_pfn"
+	depends on MMU
+	help
+	  Some functionality in the kernel follows userspace mappings to iomem
+	  ranges in an unsafe matter. Examples include v4l userptr for zero-copy
+	  buffers sharing.
+
+	  If this option is switched on, such access is rejected. Only enable
+	  this option when you must run userspace which requires this.
+
+	  If in doubt, say Y.
+
 source "security/selinux/Kconfig"
 source "security/smack/Kconfig"
 source "security/tomoyo/Kconfig"
-- 
2.28.0


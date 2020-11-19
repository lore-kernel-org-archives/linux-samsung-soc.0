Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFF3C64E7C
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Nov 2020 14:43:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E906721D7F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Nov 2020 14:43:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="kks7RcxX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbgKSOmZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 19 Nov 2020 09:42:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728336AbgKSOmT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Nov 2020 09:42:19 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 213C6C061A49
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2020 06:42:18 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id c17so6645819wrc.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2020 06:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xvuI20kUWQXCqNKlS04Giv3Gqte6cuBJUBar3LeScLM=;
        b=kks7RcxXZVU2iXi660qUHlWY1Zld50yTUixBJz2F5NHOLR+z9C6DZL+xmYuFnYvpOi
         yhFft9IPPjJwanMd6Ta77xuyCLwHTTIciU4IjN96NYab2LsscJvc34+rTa57DGLMgL6n
         us4XcAqBE3egN85iQwtnDM0VONo+p434chF6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xvuI20kUWQXCqNKlS04Giv3Gqte6cuBJUBar3LeScLM=;
        b=mOC9DBe23yqZuwkQ/J1t/Z7rElzCQQwM/OTQRpxIdJD/N0Jh0MVoknXhlfC75/cIff
         3RnUpKCOTcxbMybvObQfA8XgWyQbhuD1Cpg2FybXnzLvbTfK80P+xYPycSXKEbrT85wy
         MudSceYgOE23BwFXPR+sQ1X3S3R2QHv1yGUQRUw5exvHRjkKIecluGTCpxT2WRtHOmyF
         tENCrmVtjb27Wm5Vs+LyoSlM1+XMf5oK92N1IehX86F3xVk+zdaQ932xzlmMyfegED+V
         kv3ktpN+SeoTrBAxV8fkcypaYqYOpGbUn23ltb8bwXEx5wZ2cFR0OVt7OC3nLIDQ6dTC
         PHDA==
X-Gm-Message-State: AOAM530lhyz+l3yya4tBBoy+8VZpRRJYlLICN27TjIjSnT2F7ipKJ0cn
        7/E2SjxMKkM5im3H+bYXFxtz0A==
X-Google-Smtp-Source: ABdhPJz+1WJ1GUtyki+3WZWIKnt42UcuR+CAEdjMThsSN8sAHF7ShVQXLqw14DG7ffmPM+1GROVD5w==
X-Received: by 2002:adf:eb47:: with SMTP id u7mr10391494wrn.163.1605796936898;
        Thu, 19 Nov 2020 06:42:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id x63sm51292wmb.48.2020.11.19.06.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 06:42:16 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>
Subject: [PATCH v6 17/17] RFC: mm: add mmu_notifier argument to follow_pfn
Date:   Thu, 19 Nov 2020 15:41:46 +0100
Message-Id: <20201119144146.1045202-18-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The only safe way for non core/arch code to use follow_pfn() is
together with an mmu_notifier subscription. follow_pfn() is already
marked as _GPL and the kerneldoc explains this restriction.

This patch here enforces all this by adding a mmu_notifier argument
and verifying that it is registered for the correct mm_struct.

Motivated by discussions with Christoph Hellwig and Jason Gunthorpe.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Christoph Hellwig <hch@infradead.org>
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
 include/linux/mm.h  |  3 ++-
 mm/memory.c         | 39 ++++++++++++++++++++++++++-------------
 mm/nommu.c          | 23 ++++++++++++++++++-----
 virt/kvm/kvm_main.c |  4 ++--
 4 files changed, 48 insertions(+), 21 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index aa0087feab24..14453f366efd 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1651,6 +1651,7 @@ void unmap_vmas(struct mmu_gather *tlb, struct vm_area_struct *start_vma,
 		unsigned long start, unsigned long end);
 
 struct mmu_notifier_range;
+struct mmu_notifier;
 
 void free_pgd_range(struct mmu_gather *tlb, unsigned long addr,
 		unsigned long end, unsigned long floor, unsigned long ceiling);
@@ -1660,7 +1661,7 @@ int follow_pte_pmd(struct mm_struct *mm, unsigned long address,
 		   struct mmu_notifier_range *range,
 		   pte_t **ptepp, pmd_t **pmdpp, spinlock_t **ptlp);
 int follow_pfn(struct vm_area_struct *vma, unsigned long address,
-	unsigned long *pfn);
+	unsigned long *pfn, struct mmu_notifier *subscription);
 int unsafe_follow_pfn(struct vm_area_struct *vma, unsigned long address,
 		      unsigned long *pfn);
 int follow_phys(struct vm_area_struct *vma, unsigned long address,
diff --git a/mm/memory.c b/mm/memory.c
index 0db0c5e233fd..51fc0507663a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4789,11 +4789,30 @@ int follow_pte_pmd(struct mm_struct *mm, unsigned long address,
 }
 EXPORT_SYMBOL(follow_pte_pmd);
 
+static int __follow_pfn(struct vm_area_struct *vma, unsigned long address,
+			unsigned long *pfn)
+{
+	int ret = -EINVAL;
+	spinlock_t *ptl;
+	pte_t *ptep;
+
+	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP)))
+		return ret;
+
+	ret = follow_pte(vma->vm_mm, address, &ptep, &ptl);
+	if (ret)
+		return ret;
+	*pfn = pte_pfn(*ptep);
+	pte_unmap_unlock(ptep, ptl);
+	return 0;
+}
+
 /**
  * follow_pfn - look up PFN at a user virtual address
  * @vma: memory mapping
  * @address: user virtual address
  * @pfn: location to store found PFN
+ * @subscription: mmu_notifier subscription for the mm @vma is part of
  *
  * Only IO mappings and raw PFN mappings are allowed. Note that callers must
  * ensure coherency with pte updates by using a &mmu_notifier to follow updates.
@@ -4805,21 +4824,15 @@ EXPORT_SYMBOL(follow_pte_pmd);
  * Return: zero and the pfn at @pfn on success, -ve otherwise.
  */
 int follow_pfn(struct vm_area_struct *vma, unsigned long address,
-	unsigned long *pfn)
+	unsigned long *pfn, struct mmu_notifier *subscription)
 {
-	int ret = -EINVAL;
-	spinlock_t *ptl;
-	pte_t *ptep;
+	if (WARN_ON(!subscription->mm))
+		return -EINVAL;
 
-	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP)))
-		return ret;
+	if (WARN_ON(subscription->mm != vma->vm_mm))
+		return -EINVAL;
 
-	ret = follow_pte(vma->vm_mm, address, &ptep, &ptl);
-	if (ret)
-		return ret;
-	*pfn = pte_pfn(*ptep);
-	pte_unmap_unlock(ptep, ptl);
-	return 0;
+	return __follow_pfn(vma, address, pfn);
 }
 EXPORT_SYMBOL_GPL(follow_pfn);
 
@@ -4844,7 +4857,7 @@ int unsafe_follow_pfn(struct vm_area_struct *vma, unsigned long address,
 	WARN_ONCE(1, "unsafe follow_pfn usage\n");
 	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
 
-	return follow_pfn(vma, address, pfn);
+	return __follow_pfn(vma, address, pfn);
 }
 EXPORT_SYMBOL(unsafe_follow_pfn);
 
diff --git a/mm/nommu.c b/mm/nommu.c
index 79fc98a6c94a..2a6b46fe1906 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -111,24 +111,37 @@ unsigned int kobjsize(const void *objp)
 	return page_size(page);
 }
 
+static int __follow_pfn(struct vm_area_struct *vma, unsigned long address,
+			unsigned long *pfn)
+{
+	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP)))
+		return -EINVAL;
+
+	*pfn = address >> PAGE_SHIFT;
+	return 0;
+}
+
 /**
  * follow_pfn - look up PFN at a user virtual address
  * @vma: memory mapping
  * @address: user virtual address
  * @pfn: location to store found PFN
+ * @subscription: mmu_notifier subscription for the mm @vma is part of
  *
  * Only IO mappings and raw PFN mappings are allowed.
  *
  * Returns zero and the pfn at @pfn on success, -ve otherwise.
  */
 int follow_pfn(struct vm_area_struct *vma, unsigned long address,
-	unsigned long *pfn)
+	unsigned long *pfn, struct mmu_notifier *subscription)
 {
-	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP)))
+	if (WARN_ON(!subscription->mm))
 		return -EINVAL;
 
-	*pfn = address >> PAGE_SHIFT;
-	return 0;
+	if (WARN_ON(subscription->mm != vma->vm_mm))
+		return -EINVAL;
+
+	return __follow_pfn(vma, address, pfn);
 }
 EXPORT_SYMBOL_GPL(follow_pfn);
 
@@ -153,7 +166,7 @@ int unsafe_follow_pfn(struct vm_area_struct *vma, unsigned long address,
 	WARN_ONCE(1, "unsafe follow_pfn usage\n");
 	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
 
-	return follow_pfn(vma, address, pfn);
+	return __follow_pfn(vma, address, pfn);
 }
 EXPORT_SYMBOL(unsafe_follow_pfn);
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 417f3d470c3e..6f6786524eff 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1891,7 +1891,7 @@ static int hva_to_pfn_remapped(struct kvm *kvm, struct vm_area_struct *vma,
 	unsigned long pfn;
 	int r;
 
-	r = follow_pfn(vma, addr, &pfn);
+	r = follow_pfn(vma, addr, &pfn, &kvm->mmu_notifier);
 	if (r) {
 		/*
 		 * get_user_pages fails for VM_IO and VM_PFNMAP vmas and does
@@ -1906,7 +1906,7 @@ static int hva_to_pfn_remapped(struct kvm *kvm, struct vm_area_struct *vma,
 		if (r)
 			return r;
 
-		r = follow_pfn(vma, addr, &pfn);
+		r = follow_pfn(vma, addr, &pfn, &kvm->mmu_notifier);
 		if (r)
 			return r;
 
-- 
2.29.2


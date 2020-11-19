Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CECC6379F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Nov 2020 14:43:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C933520888
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Nov 2020 14:43:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="OEFoRj4M"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbgKSOmS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 19 Nov 2020 09:42:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728331AbgKSOmR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Nov 2020 09:42:17 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B07BFC0613D4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2020 06:42:16 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id s8so6652150wrw.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2020 06:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zkeb216dnttsANxMb1gEr5R+0ZdYRKKovGCL9yT1FAY=;
        b=OEFoRj4M9E42bfq/iRIOsKl46YrbtiCBbjvTv/oig1APTLJQ4UtbX4FB0wq8nQR7DV
         +1Z9xekE8CgurHze3jx2RuwGvnmCbykl11MfGozRAiKsp7Mbksai6QESttZp++mq8w27
         9aqJwg0/tCaPIwA6nplaOLISr9nxhq33gSpzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zkeb216dnttsANxMb1gEr5R+0ZdYRKKovGCL9yT1FAY=;
        b=iW4srxcmOAagxjc3SrHa8lNznfbxEmpNGdnwxMYEnaZPVsvPnCmVHXqWf2DZzw3FLN
         /qERmYigq/7cAAQButa3qod3pkpfjRHcjIbThGcArVAEnwzKlLl4ZVLLqwBQPWc4OoNP
         N7VOCWM8TelL40bntBTtUvvd1JbVuNi/fjcqMi7OVOITshdJzad/lDeOZI92yEZQSx3W
         D79mKEzJi4DkLI9q58z6n3iC/k5RUqD5NxYrKTfV8uDVuZA5yx2JQW61beaOmzcQBwsG
         hVKSLpiV/aPct8CoCq+GBJhJlj7Q8tvYjOqlwoYpOAkB+vThu3o//F6pwS0nkWFLDsLF
         DJMA==
X-Gm-Message-State: AOAM532YsYbMocwhl51aHt/4gEfa8H1p7+waMXANvY8SoG7DZbTbSgpu
        ueeC1MXzfNFi1cO7IdX31wjg5A==
X-Google-Smtp-Source: ABdhPJxvIRAgRrFES7wO+NepTS6cCQpwhrGHMzEzGdt8Kdan81c2b72TYQlZw04CiRWhUOLHuW1+1w==
X-Received: by 2002:adf:8366:: with SMTP id 93mr10481140wrd.321.1605796935466;
        Thu, 19 Nov 2020 06:42:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id x63sm51292wmb.48.2020.11.19.06.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 06:42:14 -0800 (PST)
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
Subject: [PATCH v6 16/17] RFC: kvm: pass kvm argument to follow_pfn callsites
Date:   Thu, 19 Nov 2020 15:41:45 +0100
Message-Id: <20201119144146.1045202-17-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Both Christoph Hellwig and Jason Gunthorpe suggested that usage of
follow_pfn by modules should be locked down more. To do so callers
need to be able to pass the mmu_notifier subscription corresponding
to the mm_struct to follow_pfn().

This patch does the rote work of doing that in the kvm subsystem. In
most places this is solved by passing struct kvm * down the call
stacks as an additional parameter, since that contains the
mmu_notifier.

Compile tested on all affected arch.

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
 arch/powerpc/kvm/book3s_64_mmu_hv.c    |  2 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c |  2 +-
 arch/powerpc/kvm/e500_mmu_host.c       |  2 +-
 arch/x86/kvm/mmu/mmu.c                 |  8 ++--
 include/linux/kvm_host.h               |  9 +++--
 virt/kvm/kvm_main.c                    | 52 +++++++++++++++-----------
 6 files changed, 45 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 38ea396a23d6..86781ff76fcb 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -589,7 +589,7 @@ int kvmppc_book3s_hv_page_fault(struct kvm_vcpu *vcpu,
 		write_ok = true;
 	} else {
 		/* Call KVM generic code to do the slow-path check */
-		pfn = __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
+		pfn = __gfn_to_pfn_memslot(kvm, memslot, gfn, false, NULL,
 					   writing, &write_ok);
 		if (is_error_noslot_pfn(pfn))
 			return -EFAULT;
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index bb35490400e9..319a1a99153f 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -821,7 +821,7 @@ int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
 		unsigned long pfn;
 
 		/* Call KVM generic code to do the slow-path check */
-		pfn = __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
+		pfn = __gfn_to_pfn_memslot(kvm, memslot, gfn, false, NULL,
 					   writing, upgrade_p);
 		if (is_error_noslot_pfn(pfn))
 			return -EFAULT;
diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index ed0c9c43d0cf..fd2b2d363559 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -446,7 +446,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 
 	if (likely(!pfnmap)) {
 		tsize_pages = 1UL << (tsize + 10 - PAGE_SHIFT);
-		pfn = gfn_to_pfn_memslot(slot, gfn);
+		pfn = gfn_to_pfn_memslot(kvm, slot, gfn);
 		if (is_error_noslot_pfn(pfn)) {
 			if (printk_ratelimit())
 				pr_err("%s: real page not found for gfn %lx\n",
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 1f96adff8dc4..a46e4ae4f8b0 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2677,7 +2677,7 @@ static kvm_pfn_t pte_prefetch_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn,
 	if (!slot)
 		return KVM_PFN_ERR_FAULT;
 
-	return gfn_to_pfn_memslot_atomic(slot, gfn);
+	return gfn_to_pfn_memslot_atomic(vcpu->kvm, slot, gfn);
 }
 
 static int direct_pte_prefetch_many(struct kvm_vcpu *vcpu,
@@ -3655,7 +3655,8 @@ static bool try_async_pf(struct kvm_vcpu *vcpu, bool prefault, gfn_t gfn,
 	}
 
 	async = false;
-	*pfn = __gfn_to_pfn_memslot(slot, gfn, false, &async, write, writable);
+	*pfn = __gfn_to_pfn_memslot(vcpu->kvm, slot, gfn,
+				    false, &async, write, writable);
 	if (!async)
 		return false; /* *pfn has correct page already */
 
@@ -3669,7 +3670,8 @@ static bool try_async_pf(struct kvm_vcpu *vcpu, bool prefault, gfn_t gfn,
 			return true;
 	}
 
-	*pfn = __gfn_to_pfn_memslot(slot, gfn, false, NULL, write, writable);
+	*pfn = __gfn_to_pfn_memslot(vcpu->kvm, slot, gfn,
+				    false, NULL, write, writable);
 	return false;
 }
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 7f2e2a09ebbd..864424ce6b6b 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -717,9 +717,12 @@ void kvm_set_page_accessed(struct page *page);
 kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn);
 kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
 		      bool *writable);
-kvm_pfn_t gfn_to_pfn_memslot(struct kvm_memory_slot *slot, gfn_t gfn);
-kvm_pfn_t gfn_to_pfn_memslot_atomic(struct kvm_memory_slot *slot, gfn_t gfn);
-kvm_pfn_t __gfn_to_pfn_memslot(struct kvm_memory_slot *slot, gfn_t gfn,
+kvm_pfn_t gfn_to_pfn_memslot(struct kvm *kvm,
+			     struct kvm_memory_slot *slot, gfn_t gfn);
+kvm_pfn_t gfn_to_pfn_memslot_atomic(struct kvm *kvm,
+				    struct kvm_memory_slot *slot, gfn_t gfn);
+kvm_pfn_t __gfn_to_pfn_memslot(struct kvm *kvm,
+			       struct kvm_memory_slot *slot, gfn_t gfn,
 			       bool atomic, bool *async, bool write_fault,
 			       bool *writable);
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 2541a17ff1c4..417f3d470c3e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1883,7 +1883,7 @@ static bool vma_is_valid(struct vm_area_struct *vma, bool write_fault)
 	return true;
 }
 
-static int hva_to_pfn_remapped(struct vm_area_struct *vma,
+static int hva_to_pfn_remapped(struct kvm *kvm, struct vm_area_struct *vma,
 			       unsigned long addr, bool *async,
 			       bool write_fault, bool *writable,
 			       kvm_pfn_t *p_pfn)
@@ -1946,8 +1946,9 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
  * 2): @write_fault = false && @writable, @writable will tell the caller
  *     whether the mapping is writable.
  */
-static kvm_pfn_t hva_to_pfn(unsigned long addr, bool atomic, bool *async,
-			bool write_fault, bool *writable)
+static kvm_pfn_t hva_to_pfn(struct kvm *kvm, unsigned long addr,
+			    bool atomic, bool *async,
+			    bool write_fault, bool *writable)
 {
 	struct vm_area_struct *vma;
 	kvm_pfn_t pfn = 0;
@@ -1979,7 +1980,8 @@ static kvm_pfn_t hva_to_pfn(unsigned long addr, bool atomic, bool *async,
 	if (vma == NULL)
 		pfn = KVM_PFN_ERR_FAULT;
 	else if (vma->vm_flags & (VM_IO | VM_PFNMAP)) {
-		r = hva_to_pfn_remapped(vma, addr, async, write_fault, writable, &pfn);
+		r = hva_to_pfn_remapped(kvm, vma, addr,
+					async, write_fault, writable, &pfn);
 		if (r == -EAGAIN)
 			goto retry;
 		if (r < 0)
@@ -1994,7 +1996,8 @@ static kvm_pfn_t hva_to_pfn(unsigned long addr, bool atomic, bool *async,
 	return pfn;
 }
 
-kvm_pfn_t __gfn_to_pfn_memslot(struct kvm_memory_slot *slot, gfn_t gfn,
+kvm_pfn_t __gfn_to_pfn_memslot(struct kvm *kvm,
+			       struct kvm_memory_slot *slot, gfn_t gfn,
 			       bool atomic, bool *async, bool write_fault,
 			       bool *writable)
 {
@@ -2018,7 +2021,7 @@ kvm_pfn_t __gfn_to_pfn_memslot(struct kvm_memory_slot *slot, gfn_t gfn,
 		writable = NULL;
 	}
 
-	return hva_to_pfn(addr, atomic, async, write_fault,
+	return hva_to_pfn(kvm, addr, atomic, async, write_fault,
 			  writable);
 }
 EXPORT_SYMBOL_GPL(__gfn_to_pfn_memslot);
@@ -2026,38 +2029,43 @@ EXPORT_SYMBOL_GPL(__gfn_to_pfn_memslot);
 kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
 		      bool *writable)
 {
-	return __gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn, false, NULL,
+	return __gfn_to_pfn_memslot(kvm, gfn_to_memslot(kvm, gfn), gfn,
+				    false, NULL,
 				    write_fault, writable);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_prot);
 
-kvm_pfn_t gfn_to_pfn_memslot(struct kvm_memory_slot *slot, gfn_t gfn)
+kvm_pfn_t gfn_to_pfn_memslot(struct kvm *kvm,
+			     struct kvm_memory_slot *slot, gfn_t gfn)
 {
-	return __gfn_to_pfn_memslot(slot, gfn, false, NULL, true, NULL);
+	return __gfn_to_pfn_memslot(kvm, slot, gfn, false, NULL, true, NULL);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_memslot);
 
-kvm_pfn_t gfn_to_pfn_memslot_atomic(struct kvm_memory_slot *slot, gfn_t gfn)
+kvm_pfn_t gfn_to_pfn_memslot_atomic(struct kvm *kvm,
+				    struct kvm_memory_slot *slot, gfn_t gfn)
 {
-	return __gfn_to_pfn_memslot(slot, gfn, true, NULL, true, NULL);
+	return __gfn_to_pfn_memslot(kvm, slot, gfn, true, NULL, true, NULL);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_memslot_atomic);
 
 kvm_pfn_t kvm_vcpu_gfn_to_pfn_atomic(struct kvm_vcpu *vcpu, gfn_t gfn)
 {
-	return gfn_to_pfn_memslot_atomic(kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn);
+	return gfn_to_pfn_memslot_atomic(vcpu->kvm,
+					 kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn);
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_gfn_to_pfn_atomic);
 
 kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn)
 {
-	return gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn);
+	return gfn_to_pfn_memslot(kvm, gfn_to_memslot(kvm, gfn), gfn);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn);
 
 kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn)
 {
-	return gfn_to_pfn_memslot(kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn);
+	return gfn_to_pfn_memslot(vcpu->kvm,
+				  kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn);
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_gfn_to_pfn);
 
@@ -2115,18 +2123,20 @@ void kvm_release_pfn(kvm_pfn_t pfn, bool dirty, struct gfn_to_pfn_cache *cache)
 		kvm_release_pfn_clean(pfn);
 }
 
-static void kvm_cache_gfn_to_pfn(struct kvm_memory_slot *slot, gfn_t gfn,
+static void kvm_cache_gfn_to_pfn(struct kvm *kvm,
+				 struct kvm_memory_slot *slot, gfn_t gfn,
 				 struct gfn_to_pfn_cache *cache, u64 gen)
 {
 	kvm_release_pfn(cache->pfn, cache->dirty, cache);
 
-	cache->pfn = gfn_to_pfn_memslot(slot, gfn);
+	cache->pfn = gfn_to_pfn_memslot(kvm, slot, gfn);
 	cache->gfn = gfn;
 	cache->dirty = false;
 	cache->generation = gen;
 }
 
-static int __kvm_map_gfn(struct kvm_memslots *slots, gfn_t gfn,
+static int __kvm_map_gfn(struct kvm *kvm,
+			 struct kvm_memslots *slots, gfn_t gfn,
 			 struct kvm_host_map *map,
 			 struct gfn_to_pfn_cache *cache,
 			 bool atomic)
@@ -2145,13 +2155,13 @@ static int __kvm_map_gfn(struct kvm_memslots *slots, gfn_t gfn,
 			cache->generation != gen) {
 			if (atomic)
 				return -EAGAIN;
-			kvm_cache_gfn_to_pfn(slot, gfn, cache, gen);
+			kvm_cache_gfn_to_pfn(kvm, slot, gfn, cache, gen);
 		}
 		pfn = cache->pfn;
 	} else {
 		if (atomic)
 			return -EAGAIN;
-		pfn = gfn_to_pfn_memslot(slot, gfn);
+		pfn = gfn_to_pfn_memslot(kvm, slot, gfn);
 	}
 	if (is_error_noslot_pfn(pfn))
 		return -EINVAL;
@@ -2184,14 +2194,14 @@ static int __kvm_map_gfn(struct kvm_memslots *slots, gfn_t gfn,
 int kvm_map_gfn(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map,
 		struct gfn_to_pfn_cache *cache, bool atomic)
 {
-	return __kvm_map_gfn(kvm_memslots(vcpu->kvm), gfn, map,
+	return __kvm_map_gfn(vcpu->kvm, kvm_memslots(vcpu->kvm), gfn, map,
 			cache, atomic);
 }
 EXPORT_SYMBOL_GPL(kvm_map_gfn);
 
 int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map)
 {
-	return __kvm_map_gfn(kvm_vcpu_memslots(vcpu), gfn, map,
+	return __kvm_map_gfn(vcpu->kvm, kvm_vcpu_memslots(vcpu), gfn, map,
 		NULL, false);
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_map);
-- 
2.29.2


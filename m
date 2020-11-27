Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4740C83023
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Nov 2020 16:43:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76E622225F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Nov 2020 16:43:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="QYSE9aht"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731990AbgK0Qm3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 27 Nov 2020 11:42:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731905AbgK0QmU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Nov 2020 11:42:20 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07646C061A49
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Nov 2020 08:42:19 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id t4so6171592wrr.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Nov 2020 08:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r9CpIi9VXsG+zuZeNFc6wtzpnBA/KWk/gpfUTZT1Zjk=;
        b=QYSE9ahtLKl5EGqlS1wxqny1lcMayoTshiQPV4fpDlmhPBNcviZXZr4Hw/D0VvV1nZ
         SlhSkjL1LPH6m8vp1Ns0BA38yTfYlhhdthl3ANf0Zfah59++5CuB09/jCSZWOACnz6YY
         w3HN6kMl99DtY/VTvVNMApS0itb5pUGMEw+wM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r9CpIi9VXsG+zuZeNFc6wtzpnBA/KWk/gpfUTZT1Zjk=;
        b=YA1oSaNCM40Za33e64sMyXQag6m77HXS8SbeGst9W4LeTCvWxhTuEMQy9qKk07f1V/
         7CCFZ7D+mO6G5Usxo3/kIt+O7hQJJu0B0QvpgGyn2cg/F/dn8jp06tMm/5At6HQulaUC
         OOK4keb0II7vo5nv9k9Hw65vN1ylkYEQh4mu/eFchub2oDMP6WuM/CpyRk3pI4tdgpl9
         tlrO9YHPsGLPShGcEFwc1xp5QSxrFBm38QLJVfLFODxOSVI/kR3Mk7xz5Rbn/PP3UmoQ
         iOqMJpOO1M+MLBhDsw8jnYpX0LjFpehV9Wfjz7OfwDvfa+KzYEEBJJb8FX0oje+0R88+
         rowg==
X-Gm-Message-State: AOAM530fQ6BuRlNnalCOhFFkS0m//sns7/F93cmUgakCDKT58AkuNVWg
        LilgMJA1/wquYJh5YGT5PUa8Cc+XikbDEQ==
X-Google-Smtp-Source: ABdhPJwcuwkwTEGjFtq/EaV85N+PVRZBWU4U/IYqc96jNDCQ+Wh7QXU+d6PyrzBG7/osel2wfk3tIQ==
X-Received: by 2002:a5d:5651:: with SMTP id j17mr11831109wrw.221.1606495337823;
        Fri, 27 Nov 2020 08:42:17 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q12sm14859078wrx.86.2020.11.27.08.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 08:42:17 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Alex Williamson <alex.williamson@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v7 15/17] vfio/type1: Mark follow_pfn as unsafe
Date:   Fri, 27 Nov 2020 17:41:29 +0100
Message-Id: <20201127164131.2244124-16-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
References: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The code seems to stuff these pfns into iommu pts (or something like
that, I didn't follow), but there's no mmu_notifier to ensure that
access is synchronized with pte updates.

Hence mark these as unsafe. This means that with
CONFIG_STRICT_FOLLOW_PFN, these will be rejected.

Real fix is to wire up an mmu_notifier ... somehow. Probably means any
invalidate is a fatal fault for this vfio device, but then this
shouldn't ever happen if userspace is reasonable.

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
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: kvm@vger.kernel.org
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/vfio/vfio_iommu_type1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 67e827638995..10170723bb58 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -421,7 +421,7 @@ static int follow_fault_pfn(struct vm_area_struct *vma, struct mm_struct *mm,
 {
 	int ret;
 
-	ret = follow_pfn(vma, vaddr, pfn);
+	ret = unsafe_follow_pfn(vma, vaddr, pfn);
 	if (ret) {
 		bool unlocked = false;
 
@@ -435,7 +435,7 @@ static int follow_fault_pfn(struct vm_area_struct *vma, struct mm_struct *mm,
 		if (ret)
 			return ret;
 
-		ret = follow_pfn(vma, vaddr, pfn);
+		ret = unsafe_follow_pfn(vma, vaddr, pfn);
 	}
 
 	return ret;
-- 
2.29.2


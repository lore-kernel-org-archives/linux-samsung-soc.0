Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A57C6379D
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Nov 2020 14:45:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EC4E22261
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Nov 2020 14:45:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Ddjje0qG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728342AbgKSOop (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 19 Nov 2020 09:44:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728203AbgKSOl5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Nov 2020 09:41:57 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D521AC061A48
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2020 06:41:56 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id s13so6964641wmh.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2020 06:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MT1z3cj215AzOOgO3dPH+bq94VZWhyvFICSSDrawSRQ=;
        b=Ddjje0qG1bJIghWsjtWQYRvphBbynvkaf3By8U2V67dCxiXTHtMXszwEn2f44EbLEE
         L+Lu+1lfosDCM1mlRb7cehz5sWxnIO4nIHkwb8kvmwSa9+BOXzqxUxU/vymEGXGeDUbQ
         SZhNUscGjB4SmbIZaWCA9rUNolsk8QvOm824s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MT1z3cj215AzOOgO3dPH+bq94VZWhyvFICSSDrawSRQ=;
        b=aERGnSZ1WktA/MSgSPzcfDAtb01EgAR7GNsTwVW+dFYlbMfpifa+iRFRDSPO3Vx+cd
         6q4Cq9lJ3ibPgw4hy7YaEZKD011fKEKaJsx3Q5YHTnsn4EoZIWEmPVte2jLDIsYUzQ4U
         yGUQKq96evUjj3/4EQI6VkH+/IiIipmor5bzrmVnWSTKVINJyqcWCnBFKoGsiTlB9ONE
         OC16hCrF36W6moAB+Vu6yaLbG2qEWfqjTe4rdDFJ4WqZIHxf7PgT9t1puDQsjsyMKeMc
         oS3OPtVfg+PoT/WGMmgP/biBdv/vqCvDSr5JGXtvs9tOddKVF769vhqzOYeDmzRatfeq
         0FWQ==
X-Gm-Message-State: AOAM531qgfsYEJijljtjLnpPQfUhGUFH7jrLQz24PyORLK1PnPfGpVkS
        FBZhYKmAWopdRHLjXVj370XIWg==
X-Google-Smtp-Source: ABdhPJywXqDn6sTPCQlKXylI3ANVc0SmwvT4EHUsI+7CudlPK0FFXVfs/7uxaU9QTG4LdtS85a7Rcw==
X-Received: by 2002:a7b:c77a:: with SMTP id x26mr4895510wmk.63.1605796915603;
        Thu, 19 Nov 2020 06:41:55 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id x63sm51292wmb.48.2020.11.19.06.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 06:41:54 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v6 02/17] drm/exynos: Use FOLL_LONGTERM for g2d cmdlists
Date:   Thu, 19 Nov 2020 15:41:31 +0100
Message-Id: <20201119144146.1045202-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The exynos g2d interface is very unusual, but it looks like the
userptr objects are persistent. Hence they need FOLL_LONGTERM.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
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
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index ecede41af9b9..1e0c5a7f206e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -475,7 +475,8 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct g2d_data *g2d,
 		goto err_free;
 	}
 
-	ret = pin_user_pages_fast(start, npages, FOLL_FORCE | FOLL_WRITE,
+	ret = pin_user_pages_fast(start, npages,
+				  FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
 				  g2d_userptr->pages);
 	if (ret != npages) {
 		DRM_DEV_ERROR(g2d->dev,
-- 
2.29.2


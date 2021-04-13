Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96EEAC43461
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 13 Apr 2021 09:49:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76581613B8
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 13 Apr 2021 09:49:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240875AbhDMJte (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 13 Apr 2021 05:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239994AbhDMJte (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 13 Apr 2021 05:49:34 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884C4C061756
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Apr 2021 02:49:13 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id j4-20020a05600c4104b029010c62bc1e20so8381712wmi.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Apr 2021 02:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sKnMGdydD5VEI/3ScWh7YccdRp5+79GpsyoCcHVvPso=;
        b=Eyfyf4WshcsgJkQdPXBY9ti7ylJWX7Sk6dR7sdNRN5pkI8INb22SYQZrIgOMYf5JCm
         jNLHnN+7X8x6jEzvvDwSCmjDxnpYgVws43xT6fX8qQa58NgzjQ5s3rUtfYaGLve9OCCe
         whEAQdW2j8M+s7h43+LSaWFRFh/jAMMBBAE+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sKnMGdydD5VEI/3ScWh7YccdRp5+79GpsyoCcHVvPso=;
        b=ndmqTLgDa9Hb/2ghuwn2VnmlH8rAa6ctVKx7X7buXQkYRJ21JGR4WEqf7q3/4AEEeN
         H7Xbj1kd2ED5HeH/kQ+xdi/8X2bv8cdZ1GJABEvlX7D7hqHNYi5eGzCyXV8YQcER3ZZN
         qyo6fRcboYfJhKbZ2Vn9RuTyT1lBHu/q9Qb/Oi0MMqgIk3r+0558GNXnp/0KMBrMbxi6
         Gk3XLp39WSIy0AL6SWpCBwkS3sXvI/qK/PLn6OjAcqIM6jKkWwT0k9o0JbAuHgF9v2nv
         sqi8OETCX7zBRiC9PWwil8wxA4LDEnDSukrErEfy4Vp9tFSPY9xvyCFdgheK0YWWr9DJ
         WnLQ==
X-Gm-Message-State: AOAM532J1y+ncmZDs7B2FXp6cM3hs/Gp7jLSOG1z74fVOqlIp6N70qYt
        gr3TIeeIlSmfkF2g6YQ6aanc/OUlY1DI6w==
X-Google-Smtp-Source: ABdhPJyozmtYCr5fQuYQk3xh8oRysWRoKgt+zOj2WPFRCcwMWqB8klX4kzPMoSUp1bby3DGm803+ZA==
X-Received: by 2002:a05:600c:3546:: with SMTP id i6mr3218307wmq.104.1618307352372;
        Tue, 13 Apr 2021 02:49:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 64sm1956458wmz.7.2021.04.13.02.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 02:49:11 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 03/12] drm/exynos: Don't set allow_fb_modifiers explicitly
Date:   Tue, 13 Apr 2021 11:48:54 +0200
Message-Id: <20210413094904.3736372-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Since

commit 890880ddfdbe256083170866e49c87618b706ac7
Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Fri Jan 4 09:56:10 2019 +0100

    drm: Auto-set allow_fb_modifiers when given modifiers at plane init

this is done automatically as part of plane init, if drivers set the
modifier list correctly. Which is the case here.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
---
 drivers/gpu/drm/exynos/exynos_drm_fb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index 64370b634cca..79fa3649185c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -177,7 +177,5 @@ void exynos_drm_mode_config_init(struct drm_device *dev)
 	dev->mode_config.funcs = &exynos_drm_mode_config_funcs;
 	dev->mode_config.helper_private = &exynos_drm_mode_config_helpers;
 
-	dev->mode_config.allow_fb_modifiers = true;
-
 	dev->mode_config.normalize_zpos = true;
 }
-- 
2.31.0


Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D5FC43460
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Apr 2021 14:38:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3500C6121E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Apr 2021 14:38:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244828AbhDPOi6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 16 Apr 2021 10:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244722AbhDPOik (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Apr 2021 10:38:40 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7E8C06134D
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Apr 2021 07:38:09 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id e14so42447522ejz.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Apr 2021 07:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JrproNEUMCgSjmh/8B0I/rNyBQoaOU4LantvG8VttuY=;
        b=AbhwF2o8lWGjI+FDsAThxXdYjTFw6ntHJ+FjLaceNvJgOS2Y7pl+JkE3/1i576V58B
         YvDUmpqhZuyg4ON7XYVatcqM580H8JN3lJS9HLyvlLYjuXBs5xAjEta/3co9QOEIr43v
         XLrqP7juFl6LHY7r+NdZVb0uIbH4dibSpJu6wGgmMky1EuVOjhAXtvsFFHpR0y46mchQ
         rNSYZwaCr8ePffvLwn7sdYpMKrD+vBBEloIRYGDJwzMvm6Upd6Mr0PlQYUiNkmTcHqFp
         eVdmSNrJHUvjzz7h9vB9PlsqKdu6rTezQq6HeQ7z78UZtM0LGOPupSB1p9WxIUVHznWW
         Y/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JrproNEUMCgSjmh/8B0I/rNyBQoaOU4LantvG8VttuY=;
        b=n/ZfGvtVlPdp/cS07tACpPTmrMW3eXPhH/l+/e77QAx3iduGGBBFzS5dfmQmMFRy07
         rz6uizwTlPxPLNBDEAycMr8RKbUZqWszQXWy5alh1w48sJzRhjRC5ZW6l4Ryhc9mkGuR
         oBgucJDAEq04DnttM08QuysCU4AwC31iFOshmU32jVVtqzXWyN1jjf3e04n73GZ1Q3fU
         qbnvGC1xQmmWi9C8UmEMSgawS/eXARAIeJii4YwTbW/dGCed/KMSL4ksDMjcZ8IPDAzH
         qQK1W9mDOax1N06D4u6qSXN3Qqhwa4llylMMvX6TU9/yPs3kTMzKX3LLPKDvK4AFby4/
         eneg==
X-Gm-Message-State: AOAM531+ylLPPffUnycUJVuYuVScDH/+dnSDXM0fe9p1Sa4EHd8kjP3W
        hB6ulCSi7+zDfkjB6Xg7LxGFIQ==
X-Google-Smtp-Source: ABdhPJxRohIyR/YCoUD5YI/XkzLdyuPidmXlmk0d8AmwuQ7/5UcOVVluw10vUFCBA6T3eZAmMx7dlA==
X-Received: by 2002:a17:906:dbcd:: with SMTP id yc13mr8165471ejb.99.1618583888233;
        Fri, 16 Apr 2021 07:38:08 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 07:38:07 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Akshu Agarwal <akshua@gmail.com>,
        Ajay Kumar <ajaykumar.rs@samsung.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 36/40] drm/exynos/exynos7_drm_decon: Realign function name with its header
Date:   Fri, 16 Apr 2021 15:37:21 +0100
Message-Id: <20210416143725.2769053-37-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/exynos/exynos7_drm_decon.c:355: warning: expecting prototype for shadow_protect_win(). Prototype was for decon_shadow_protect_win() instead

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Akshu Agarwal <akshua@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 431c5d32f9a47..9b5e6f94e5585 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -344,7 +344,7 @@ static void decon_win_set_colkey(struct decon_context *ctx, unsigned int win)
 }
 
 /**
- * shadow_protect_win() - disable updating values from shadow registers at vsync
+ * decon_shadow_protect_win() - disable updating values from shadow registers at vsync
  *
  * @ctx: display and enhancement controller context
  * @win: window to protect registers for
-- 
2.27.0


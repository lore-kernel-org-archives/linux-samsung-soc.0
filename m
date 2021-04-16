Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072C4C43470
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Apr 2021 14:38:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBBDC611AC
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Apr 2021 14:38:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243572AbhDPOix (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 16 Apr 2021 10:38:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244654AbhDPOid (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Apr 2021 10:38:33 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E5BEC061346
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Apr 2021 07:38:07 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id r12so42511865ejr.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Apr 2021 07:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bA3VNq3Feo1uFNYW34E08QP/aWuR+Zi5iKb1slTOBlo=;
        b=EpresJv3oxdkRa73N4qO5mqNyusavfyinoagpMqdTNBLEwyapmyju32mOy69LbGwAb
         PKyMu7Q6ZIuPsum4Z9ilcND5EMdTidVJkcHBRFh5EStxPKiNPrNgms1x4bJMUn1BYMv8
         ZmAXu5rOl/UQD5k4yVrBQIeMi0E1OHimvrK+vISAIceGPBXfZJIOpE6SJJgAwhkN0+Su
         4CZOMW/fcpzjEcOxORICsMq8mwDgmiwKheDEqsLD3dh+S/siNXSVN2HKNRIolsC3KESd
         2qotwCmMo/3sqD6GSrsdC3utmoPtZ3TxOYVyu+20DOH1nSaQ/5C+8WkRYXL1g33KzFYW
         7h0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bA3VNq3Feo1uFNYW34E08QP/aWuR+Zi5iKb1slTOBlo=;
        b=ARJSVSRV4nQ44WXb4Nj9KBeAJR+U3Gjl1vmDKUPnyRcZQLQHWeh5hKqKoA78Xs+BJq
         JTzWOnmhJp2aofZnQhY60ZLf0B85lU5G5hx/uTEVoz72wJ9nahmv6doGDTr84yLf294L
         XNcdfNe5pW0KUUV94N90Mh0ywdQ4hVaNrACfds4Myn36MLi33R9mUzUDEF3vdLpVbf55
         JWAAQDrHpogeSWDAnwYbNDo3SmSjPakkcP7XPjcI5d8lg7uIZ26ONW/TD8lUncVXufBl
         CpJSur7sjIrQSmmdZRlb8aPVpO6N+twdfx+hYa9Pb8Ud1z/FPorCiqpojNMTvnYOIOcf
         N6Dw==
X-Gm-Message-State: AOAM531dinMVaKoDFf7ltxwex7Hoi/4EmNGmLqqcbS7VD6jb3b0wbbek
        /tjZJzWUGEXq/HRs16kp7gkZwg==
X-Google-Smtp-Source: ABdhPJz0Av/4GzzPBzpk9DQMPQLOCLl90p6pmdgdorPTNCUkay+c6WXVyuJZ9MLadBwsyp4rd9LWEA==
X-Received: by 2002:a17:906:8921:: with SMTP id fr33mr8554450ejc.151.1618583885920;
        Fri, 16 Apr 2021 07:38:05 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 07:38:05 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 34/40] drm/exynos/exynos_drm_fimd: Realign function name with its header
Date:   Fri, 16 Apr 2021 15:37:19 +0100
Message-Id: <20210416143725.2769053-35-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/exynos/exynos_drm_fimd.c:734: warning: expecting prototype for shadow_protect_win(). Prototype was for fimd_shadow_protect_win() instead

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 49a2e0c539187..ae576122873e0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -723,7 +723,7 @@ static void fimd_win_set_colkey(struct fimd_context *ctx, unsigned int win)
 }
 
 /**
- * shadow_protect_win() - disable updating values from shadow registers at vsync
+ * fimd_shadow_protect_win() - disable updating values from shadow registers at vsync
  *
  * @ctx: local driver data
  * @win: window to protect registers for
-- 
2.27.0


Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A58C47093
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Jun 2021 14:34:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 014BA613BA
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Jun 2021 14:34:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbhFBOfu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Jun 2021 10:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbhFBOfg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Jun 2021 10:35:36 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D7D1C06138A
        for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Jun 2021 07:33:36 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 3-20020a05600c0243b029019f2f9b2b8aso1821503wmj.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Jun 2021 07:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nxy5VbUuJktWYoN5f56DsShh05RPtQyulwCzQanfG8c=;
        b=x+eowQOPBexKc0gjdhN++Ps5HQm+5bGTLWuF+UQ6C3gZgripNSo2eBrgQ4v/c7P3B/
         +E+x9qPTRf1nF0Ab63hAIQpqRfG45A67ClrHAnxEyX++oCDb5wVHYSAMDWqmCuaLdRWO
         DCEMoQS1tVfwxxlCAGr6k3nOzuwIwMxs4A/rucgb9RFiQkVR9VibqzKVMKuXuIuj5HgF
         rij0SkVqrI3igYoqn331Lrve+WQ/wsDp1xY5XiCL2+NuGoTui+tN/YSZu3gsU5AlAJcI
         GTWDQ+WlcukducWQBP3VHgu0bmDqVX/nmeDicehdPudN1uXapqOWz+qTWnXKjnRz2Es8
         mfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nxy5VbUuJktWYoN5f56DsShh05RPtQyulwCzQanfG8c=;
        b=uhM7iHYFTAfmkCm/ahtnn70Bf9qEC/1RqM4EEfGy7oM1AMHxzfCTK+ru6KSx7x/MLW
         23QXIPH9NKZfvelU7ayU20oKv/3Jd0yaslnLp49uaWvqhUUuMZ2WgaH6fNRkDNt3vOzt
         wy1Nf3idLRsH6reIpfP5NpgtmelNIF8O1N0hjQXr0MptY5S1XdGuFE1DlShMCiAarIO+
         lYtU4KfblS6HThyFPGjxrGJOV2ovLvyJsiJ6MTChutEpkIX1n/avOg6uASwMgSvtcFcT
         +tlVnubuSoOUSF0YmS7WxHFAZj7Yim5jnJ3sdC+BZF3JW8JIxMLuJ6y4sXjpkImp1qq8
         uUGw==
X-Gm-Message-State: AOAM532RMz6Krqf0DKIt/yCWKFiMvB17m9c7jwcOnvChGfN2juGwqOQk
        MNV/P+SsI16pAA5i3bN9jJI6Hw==
X-Google-Smtp-Source: ABdhPJx+xBu1BihQ5vQP4ImfnxY1U8nE9Hks2Zw/N4egBmVyT9aUFGosvKogM2eahWcVW20UK7GNQw==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr5534912wmh.69.1622644414673;
        Wed, 02 Jun 2021 07:33:34 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
        by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:33:34 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [RESEND 24/26] drm/exynos/exynos_drm_ipp: Fix documentation for 'exynos_drm_ipp_get_{caps,res}_ioctl()'
Date:   Wed,  2 Jun 2021 15:32:58 +0100
Message-Id: <20210602143300.2330146-25-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/exynos/exynos_drm_ipp.c:105: warning: expecting prototype for exynos_drm_ipp_ioctl_get_res_ioctl(). Prototype was for exynos_drm_ipp_get_res_ioctl() instead
 drivers/gpu/drm/exynos/exynos_drm_ipp.c:153: warning: expecting prototype for exynos_drm_ipp_ioctl_get_caps(). Prototype was for exynos_drm_ipp_get_caps_ioctl() instead

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 4f2b7551b2515..9ae8689353579 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -88,7 +88,7 @@ void exynos_drm_ipp_unregister(struct device *dev,
 }
 
 /**
- * exynos_drm_ipp_ioctl_get_res_ioctl - enumerate all ipp modules
+ * exynos_drm_ipp_get_res_ioctl - enumerate all ipp modules
  * @dev: DRM device
  * @data: ioctl data
  * @file_priv: DRM file info
@@ -136,7 +136,7 @@ static inline struct exynos_drm_ipp *__ipp_get(uint32_t id)
 }
 
 /**
- * exynos_drm_ipp_ioctl_get_caps - get ipp module capabilities and formats
+ * exynos_drm_ipp_get_caps_ioctl - get ipp module capabilities and formats
  * @dev: DRM device
  * @data: ioctl data
  * @file_priv: DRM file info
-- 
2.31.1


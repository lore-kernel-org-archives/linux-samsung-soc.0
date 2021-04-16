Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA10EC43470
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Apr 2021 14:38:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9712860FE5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Apr 2021 14:38:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244547AbhDPOjB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 16 Apr 2021 10:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244306AbhDPOio (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Apr 2021 10:38:44 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A64FBC061357
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Apr 2021 07:38:11 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id sd23so33835417ejb.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Apr 2021 07:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=41LgwOuoq22rGgsCktNaBese4amMVfNYLTWP6zyN98Q=;
        b=SdxKlv+fNXg5L8kGoNDlYldYsqKcpPLAo7SNh4UKeExvT+lzMSwwhYTQgAkyNW9XV1
         63a1JDzirzFBEbKuUKIuNOxi9MSJjlGxn4M3fV3HctPcinrNVovY6FlDNzSTVZ92KF+o
         XIk3NOOnT5B91RxZoU8MtBX+p3GuXccPlgOW5xfBBnG3UrYm0xApChnqyq6w3iu3Oe9j
         lE1286wLw82FuzX9IBZjoe3AXA+PeNjmQTiulNd5wH2OOPghylJzXQcb1Xu6CSnNgEHC
         dsZisdfzr5StyHwyG5CNaHmFfL+M9iwvAx32Z/rwAWgZDEmk+ytaEasqOsL58RLMkWX3
         zsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=41LgwOuoq22rGgsCktNaBese4amMVfNYLTWP6zyN98Q=;
        b=FBvw8nYLTjPZ34kCL1ND3aYq2Yq6bXPWzeUbLdFZybbB+/SGYyGrwIbjbM4D3PXnQ5
         M8WQZT37m9GMPqh47wAIqz8uFnIGurE7w9wXLmLQ15/ZZPEhPdLtikWsxEFAB5mXiK/p
         K8fbmYpSP/U6jlUwnQTb+i+maaMN7PcSa35i8VrA1ahEgMQ4qtvdaRFhR1hDKF1eD/2j
         G46uadT6wzRHohsYnVly8ejcvLGkAJE5qfPi9OJdO0+lJajhQcLdR27gzcPOi/biq18k
         Oa/aYaB1/D1TkSJKoD3w3WLsMqjdNRVXsNtJ1AATDFNrzq0CWMZnWHpAaE38wOMAR/qV
         I29Q==
X-Gm-Message-State: AOAM530lzZJNMkhy3JOtIR8mbfPgjTysolGdFE35U0ohj3m+HiDl1sXr
        czpbnpafwj4ncKMOcpmQqs6x6w==
X-Google-Smtp-Source: ABdhPJxvfI/125JkkMmqblbXT2TRLpBJYLh7O+FA3oUYUCfjmPOCcTm/RwOmqUq72nMdaj0sKo9gcg==
X-Received: by 2002:a17:906:b52:: with SMTP id v18mr8565368ejg.485.1618583890433;
        Fri, 16 Apr 2021 07:38:10 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 07:38:09 -0700 (PDT)
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
Subject: [PATCH 38/40] drm/exynos/exynos_drm_ipp: Fix some function name disparity issues
Date:   Fri, 16 Apr 2021 15:37:23 +0100
Message-Id: <20210416143725.2769053-39-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
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
2.27.0


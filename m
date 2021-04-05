Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D76CC433ED
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Apr 2021 18:15:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63D90613B1
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Apr 2021 18:15:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233202AbhDESPf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 5 Apr 2021 14:15:35 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33071 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233373AbhDESPe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Apr 2021 14:15:34 -0400
Received: from mail-wr1-f72.google.com ([209.85.221.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lTTl1-0004pU-7H
        for linux-samsung-soc@vger.kernel.org; Mon, 05 Apr 2021 18:15:27 +0000
Received: by mail-wr1-f72.google.com with SMTP id h30so8673582wrh.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Apr 2021 11:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MLkw/W1VWG6EFfaPc0X5WGBh7Sa2+Rr55CF9ZvrmlGo=;
        b=iED9rmw5AT/eAdIE6DlXA/+BTwutzLrSICFK6jc/2C3SLbnzVyPKsTHQTniPVUFWYF
         XVIxLoix/OMZEnnMtlJ3S1tRdMx9yxddOSVvRDMLvt/hRQX7Ct9RpluFaYggTyWsv2QF
         tMn+OT2sTqbC4e5AV1pCExRD/1z4IyYhnQZs/U6NfYH9D5bJpxa0WHgYZ0fpaAjh5R2C
         OdemYBx92tRAW+++OJtv4fF8tg4H+QwEWGTW06rHK9y5zQXAH0jTf9wkdhJfsHD5LvDg
         xFryiMqpJHZRsGNkOYAtl9W/f6h+3v7Xmq+aEMtJq4inRD9Glko2zBbLU5dB9D31fjtv
         /kWg==
X-Gm-Message-State: AOAM5337ogfKvpG4zfjto+nSFDCN7uRW+dfYhFrBQ+t+LOcOyEM0FgZl
        puG8nl9e8ghUIhjkY4Mybdr7wIHeGlwUCdXwFuGSkHpvWz3YqDXdwxGUrE76PWaPeCL+kEva2xc
        4lwtytURmsKPAe9JUucTrr/B2L+ReILS79FdoHkEb7FOlEBjk
X-Received: by 2002:a05:600c:3594:: with SMTP id p20mr301449wmq.173.1617646526995;
        Mon, 05 Apr 2021 11:15:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7mZ+bLz94q3v3cBPpPKjuOK3slg8uVtnf/BhAOY8wOnY5kSV0Phjy7PdABD6JqdP+P4BFGQ==
X-Received: by 2002:a05:600c:3594:: with SMTP id p20mr301443wmq.173.1617646526872;
        Mon, 05 Apr 2021 11:15:26 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id 61sm18298925wrn.25.2021.04.05.11.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 11:15:26 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/exynos: correct exynos_drm_fimd kerneldoc
Date:   Mon,  5 Apr 2021 20:15:24 +0200
Message-Id: <20210405181524.52426-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Correct the kerneldoc of fimd_shadow_protect_win() to fix W=1 warnings:

  drivers/gpu/drm/exynos/exynos_drm_fimd.c:734: warning:
    expecting prototype for shadow_protect_win(). Prototype was for fimd_shadow_protect_win() instead

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 49a2e0c53918..ae576122873e 100644
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
2.25.1


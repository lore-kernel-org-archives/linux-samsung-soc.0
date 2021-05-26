Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC0AC4708A
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 08:48:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E82861184
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 08:48:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233529AbhEZIuT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 26 May 2021 04:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233252AbhEZItp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 May 2021 04:49:45 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95CFEC06134F
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 May 2021 01:48:04 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id n2so267605wrm.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 May 2021 01:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ggE8ksbwsKIQV0Iz58/vSuT7hydgMXkIFUzJg2iRL3g=;
        b=Hy0ql+D+VGg49Du6KbG40hVhYesQ2E2Ndg/ynB7+UJ1StONSbrjQ+6zw5j4EdKAPUf
         vLlTOh+lM5Cu3sf8fG0L4nqYGeqYUzs+vzxd4njx9dw3xN55MJdLlaAIntnWJdpG5fPB
         0McOglFQLjFGo8AJQm5QwUUQFq6fTt/oIBi7vgQGTT0tuQrR1lE485jgjq4PgdrpIS+1
         tyEhgPAyz3MWZh5/Pc/eTI1mYKBfcJagZ9U23p6pw6bzT3bNTg9o8xm+xnrOmEPNyou+
         jTy335350RYr4C1jh94IcPIqpvp+iNNJ77mpL7sjHLVH0mytrzYUvSwFPN4OQWtHYTR7
         1SXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ggE8ksbwsKIQV0Iz58/vSuT7hydgMXkIFUzJg2iRL3g=;
        b=HYX/F900E4UF2N3r4rJUa4RWRgrYUGyo9o3iqbAaLd98ay9eGY8ZfkfWt8bqFDxugV
         Xh/OpcWiOOHPnrL1faHK1ACLDNXhbcjA4wtBZEPaALkTfuEqysPA8WR0WdsPiQdBYRBA
         xjps5mWjBdGMnVkxNTg+ZVrDLs6d6E+fb63UnNgbVlXBt0pASgWiqTsvXmAspLNVe7Mf
         oTziZO0a5uPv/oto1sferDsoK6PNQtagHoL6t9TQM914wYnE4j38wY532l+izxSMrA5r
         X64CvxGsdGF7LUaq6IwMdpYQNGTVqUfa64Qgpb90cIlNwGaJ5ozI+hbpiaknf0S2+TzF
         /CGQ==
X-Gm-Message-State: AOAM5322evw44ONOfCZylkLdhCn8z+dd685+DOVRw9Tu3gTBJrFt7qvO
        JmvuzQ/3FHLYWT19NO5tyIkEQg==
X-Google-Smtp-Source: ABdhPJxA//TvN5osdqDahzA5dNjExjAswHrw/HX8QfAVXfcltB7c15dB9vYdU164lPB3mSqnuMI0DA==
X-Received: by 2002:a5d:45c6:: with SMTP id b6mr31628412wrs.333.1622018883237;
        Wed, 26 May 2021 01:48:03 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 01:48:02 -0700 (PDT)
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
Subject: [PATCH 31/34] drm/exynos/exynos7_drm_decon: Fix incorrect naming of 'decon_shadow_protect_win()'
Date:   Wed, 26 May 2021 09:47:23 +0100
Message-Id: <20210526084726.552052-32-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
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
2.31.1


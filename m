Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D538CC55ABD
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Nov 2020 19:03:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EC932223F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Nov 2020 19:03:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cX9+YeCq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgKLTDP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 12 Nov 2020 14:03:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbgKLTBH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Nov 2020 14:01:07 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56828C0613D4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Nov 2020 11:01:07 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id c17so7119689wrc.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Nov 2020 11:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9VZRZT8daPeGmypqlkiDD/bg2WPWGzH9nAJzamvIbC4=;
        b=cX9+YeCqT9sC5aPbLf/Z1l7f1X6pFMGszA2M2We1Q1ujxzgtnQJ/o8rksf/vFe4jqZ
         hQTGnYQ8u9RsD0LmmkWZr9PIymGaGFTOrqfpso6SG6bNRwOUrGx+7f4D7Z52mxOfCdmo
         OXQ67Xozr/0PHcjr0mR8c/6p3XNT+wsoVaMxbRmFFgqyEmjNdS78DB6WM64yWp5A6MXO
         FRi5mjieC+KYIHYTAdl+Ljc0Qvn1hyKCOt88nQbIXtJTeZ8HZmAdAzB5wsIgijCuFIFk
         1hf8gpXqOUolQ0BigNhDvmML9OKIVfKx7wa7wjx3tWCh4Oi//xUVdvBoxco0NohraCtE
         WJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9VZRZT8daPeGmypqlkiDD/bg2WPWGzH9nAJzamvIbC4=;
        b=A0Isr8nos1N+s0FupP/Cg5hQDBWOnKLzLjgNIBCb8bAY+THB41L66Cc72OpK/ryL0P
         UFq6pmDuhrTFSuQC4W3Z/KGlGwL1sO07WU/65XlP4dldlg53gmdSYiORWbMO+qHsOKYi
         bsV5ayXxnBxfh7TY7pIRwg3iORGunnv86hIZxRqd/yBo+ZESYWRM2hi4yudOWwvhmED1
         QtL1khl1roDdxKBVhIc8CfSD8+Vr8fwictjxyMGVoJLc+1x4uBvPp8gKgfNgT7OOWTl6
         av5GJVF/uP6GZzUtszrmcnj75+xeUUgPhSJrJ++rXIeFLiZVAvpSc53MpnUpCCN0+dbq
         /94Q==
X-Gm-Message-State: AOAM532URww8+jf0mWrzZ2VzUVzhF2Mjwbs49qsaHhkEUxf5FBNcM+RI
        eufrfxA2/506CBcr6oA7N5Q48g==
X-Google-Smtp-Source: ABdhPJyR+wd6FhkS0NkkOKAYgU4dmP5CIQs3cXDU8ZMCkttt1IuxpT3+zhy8UwFysxWYC+JRR17X2A==
X-Received: by 2002:adf:f546:: with SMTP id j6mr1145810wrp.219.1605207664630;
        Thu, 12 Nov 2020 11:01:04 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 11:01:04 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 09/30] drm/exynos/exynos_drm_fimd: Add missing description for param 'ctx'
Date:   Thu, 12 Nov 2020 19:00:18 +0000
Message-Id: <20201112190039.2785914-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/exynos/exynos_drm_fimd.c:733: warning: Function parameter or member 'ctx' not described in 'fimd_shadow_protect_win'

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index bb67cad8371f0..49a2e0c539187 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -725,6 +725,7 @@ static void fimd_win_set_colkey(struct fimd_context *ctx, unsigned int win)
 /**
  * shadow_protect_win() - disable updating values from shadow registers at vsync
  *
+ * @ctx: local driver data
  * @win: window to protect registers for
  * @protect: 1 to protect (disable updates)
  */
-- 
2.25.1


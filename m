Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A02B9C63777
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Nov 2020 17:43:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CCD62227F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Nov 2020 17:43:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lOXQP9/j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387564AbgKPRmd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 16 Nov 2020 12:42:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733303AbgKPRl2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 12:41:28 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A6EC0613D2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Nov 2020 09:41:28 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id c17so19625989wrc.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Nov 2020 09:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rT+IXEU28/HBDiXMRe74AzE+dn3RqXWDXkbUpL6OkoA=;
        b=lOXQP9/jWpUTVRFTXLhX/qUxrASE13UGlSufAsJNt/RZrsyQXt1Kgj/ODkG8POYrxb
         ttRKdLmv8vaQaTO570FUt6rkbqNvcuWrvkF5Snw1qKoDQhjK8AOAs9su2BJI1JuB/EZb
         Q1TX1WiamLQ6FiNETqn9/QrrR+eXntaFK0XhkR3+zIFNcM2TEjVAWAyVecWFihQAUxBd
         lOV9jjWhGmbs9Uz2AlzvdClkVdW46nM9LqPlEhUJp9iCuTgIjbIkvc58Ud57PxGCAv29
         TUlPk5GBxi8iIKWORUS5d2nTPDhGzD7fu4rq0ki04xBP3yK3SUSSa9qwcM5TquuxW9Be
         ZJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rT+IXEU28/HBDiXMRe74AzE+dn3RqXWDXkbUpL6OkoA=;
        b=qZAAKeZyi/1PczxgjK4H1c2X+Z4lDJIfmrBvoRRCEXWQtwTfhRaQt57lDzR3+lbIkC
         FyyYRs96atGl9hislEai2wcJnMYwRoo6exYFnVx62r+LKywrEjbH9uSU3eZfdfdh2x88
         1bJDJrRZSCWYx3nXwcldlFjgIexV0eOy41o14Rgfi02aloxeLBoHv4snM4Fp3H4SSszi
         H5zi6WwOTHJ8zwZF3w2C4Rg5aDRuHSBMHI6zSbqFCDvO+yHfo0O3bMXRIj4cANrD4qMJ
         QbyJMV/X9l1AQOsu548lX+bCCArAOUuAT3Pu2g0v8ZMTjUMJhWcu8cHlm3bt4h4BTE2W
         pK7w==
X-Gm-Message-State: AOAM532zsP36NOoETXzHPv8Ls30vsCY1U2SEvPHgCvfrsGXKZAAje2qv
        aV/PQ+Z7HYQId9v3a4FIsZsRkg==
X-Google-Smtp-Source: ABdhPJzk2sZtxzq55jR9/b3VYM19OME3kQ9c0B1dB6F5OZ/+fz7NgXKq2LMwoXVd4pXK97ON956dqQ==
X-Received: by 2002:a5d:42c9:: with SMTP id t9mr19786159wrr.13.1605548487217;
        Mon, 16 Nov 2020 09:41:27 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:41:26 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Eunchul Kim <chulspro.kim@samsung.com>,
        Jinyoung Jeon <jy0.jeon@samsung.com>,
        Sangmin Lee <lsmin.lee@samsung.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 06/42] drm/exynos/exynos_drm_gsc: Supply missing description for 'num_limits'
Date:   Mon, 16 Nov 2020 17:40:36 +0000
Message-Id: <20201116174112.1833368-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/exynos/exynos_drm_gsc.c:129: warning: Function parameter or member 'num_limits' not described in 'gsc_driverdata'

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Eunchul Kim <chulspro.kim@samsung.com>
Cc: Jinyoung Jeon <jy0.jeon@samsung.com>
Cc: Sangmin Lee <lsmin.lee@samsung.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_drm_gsc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 45e9aee8366a8..b01f36e76eafd 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -118,6 +118,7 @@ struct gsc_context {
  * struct gsc_driverdata - per device type driver data for init time.
  *
  * @limits: picture size limits array
+ * @num_limits: number of items in the aforementioned array
  * @clk_names: names of clocks needed by this variant
  * @num_clocks: the number of clocks needed by this variant
  */
-- 
2.25.1


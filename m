Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD200C55ABD
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Nov 2020 19:02:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32C882222F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Nov 2020 19:02:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tdjaaSua"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbgKLTCX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 12 Nov 2020 14:02:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbgKLTBr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Nov 2020 14:01:47 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 030B2C0613D4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Nov 2020 11:01:47 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id s8so7135670wrw.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Nov 2020 11:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rT+IXEU28/HBDiXMRe74AzE+dn3RqXWDXkbUpL6OkoA=;
        b=tdjaaSuaL8f73OZa6UUsPKJjUCx6w+csHrLMQpSHxNDvRT0Ejajm9RK/ikXe4ea8dn
         C/+cimXhEn18f0wcUKVz8wQLISeZJJvF09qkXWh1wGcO8CSlYt/wGaz9hbq5+eO3yC0J
         ISrgyxBrrLlvG0Zi1IUN8NhiomV3/E5bpY2B0kW8VGSpWc21ajrnZkOPKImDEn7Z1PFf
         PI0VWcHs8iLytYqKhKiNltaxRYoOBUWpHyzt1T2g/OxuD90NDEEZFeJZHDfx7m15cOlj
         iHUZUr6CEBoTHqDwb7rZvu87Sq+YXAvgT+6ABAgCe+U2ipZP8NEODF8O2we3wWsI9S37
         ufag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rT+IXEU28/HBDiXMRe74AzE+dn3RqXWDXkbUpL6OkoA=;
        b=SL/DTcHDn7OO6lRgDYm1tpB6UFEzKlNCWjFQ5T1mwFQnlHI7mCulhgNAMtrk2MuPoq
         skFGei5AjqPy1C4o83pdEEEtnmdXjjz9DLfAGDubGUzhGGVicjunIUK61SW2WcFXSkAr
         g6tnF9Sz3MxBdMSgvBeJBnFW1d9Kvd3euw3hNWD7wnQQvOWbtp9RNYSwSdA5XMhWJge6
         gvzlrtyAUlJT1QDvaN7Qqy+xPpN7LjrjQIRqrv609Ua/SipqTv7v/2LT+xXEUOdNbYFZ
         VAJvC/xNskK8VCDFtZSyClORJU9JMo853OCrztM9oBgT+3GmJ34DdS0bjUBlYb7JBkA7
         g89w==
X-Gm-Message-State: AOAM530x7GZRXuQA9hgHAkbn2ECq9psseun5k6OOlrfG0lZ+xCekUxT2
        /836nd/LZ+eKAzJgPAbiW/A+LA==
X-Google-Smtp-Source: ABdhPJwu2RHhtXr1BaoQ9pZlbxk1MKDa1ftmZPrnmdplp0CwIonYDb//qkatFZvv5Ghbum++hiSt8g==
X-Received: by 2002:adf:f20c:: with SMTP id p12mr1162094wro.27.1605207704885;
        Thu, 12 Nov 2020 11:01:44 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 11:01:44 -0800 (PST)
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
Subject: [PATCH 26/30] drm/exynos/exynos_drm_gsc: Supply missing description for 'num_limits'
Date:   Thu, 12 Nov 2020 19:00:35 +0000
Message-Id: <20201112190039.2785914-27-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
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


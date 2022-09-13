Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C489ECAAD8
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 13 Sep 2022 20:55:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbiIMUzV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 13 Sep 2022 16:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiIMUzS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 13 Sep 2022 16:55:18 -0400
Received: from mail-ua1-x94a.google.com (mail-ua1-x94a.google.com [IPv6:2607:f8b0:4864:20::94a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D3351E3C5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Sep 2022 13:55:16 -0700 (PDT)
Received: by mail-ua1-x94a.google.com with SMTP id z8-20020ab05648000000b003b48415d88cso3862978uaa.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Sep 2022 13:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=nJJJEPzYfSkXVdsCpO+dC++9rjlYO0nwzxMLu7tGL28=;
        b=kBuaNyAa7BFLRUEAj+HWAu4RAwHGJ9M57W9cIKk5MyobRXZOJfVdASqgAzWehpzyUn
         Y2IjOvlKDeODQuKbuNU3iikjsk79MNdjB7129WV6VfDSJNyYNNWrbljfwjvUPNHaboNr
         uiD84mx7PdI1dLViLrk1nug6KFyvMaOYA5/g2iznrnDGS9JbMdD4SWf2Db7rcUZGQLcG
         PMriKa3MzKAq1ZqqRh77D4TnN4zbttl85a6WpoJim5+T9nS0Gpmnk8hOc6Hgjloq/vak
         YyqkjUk+2SaZYQyLFnw2OgHqRIPyCfeeMNJtGxqxurWYcYuRL5J4RQfQpyzJPmHPv9zm
         QTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=nJJJEPzYfSkXVdsCpO+dC++9rjlYO0nwzxMLu7tGL28=;
        b=STZ/H0+/Q9h422j0UBlOc2zFSl/XtmaNxMNXsoqj2WdJMyv+LmxB5Vn07DToHMcpzg
         fLdbsy44gJ9EbQsHWVmmyG2YdhOlUlKBO0Q+fKr5jaleM90T6KNph2vbr6R84BtWh83X
         vIK6O2cEtvJGYvstPCiUEVv7hggTNkJLI2Jg9RAJ6QPP3Mpj2swVl1cI+0amgYWwOoLa
         MMlZxJwM+nYhwW9Gs6kDnLuBHllGamKYEg1BpE1T2D0AFPWnhfDXpQkSvoJ9SNwYOgjP
         OFZfWpHVR1bOD5se7crOkrj+q4NHJVsLiX2DqGcKaYEPT2RmFacAlU2Ky1+fNh/cErdf
         JcDw==
X-Gm-Message-State: ACgBeo3fVFzGnK73NROVDdXBbnHm+iCzNOkGRqZn9Nc+mzWno9cbIn/v
        vKRVdwZh3UWSSEGZcZBvLfK/I8CZLw==
X-Google-Smtp-Source: AA6agR4lN1+7GX3YCJf/g+HqBAOkYjtAZV+sr5K0G3Nx6PLg9iKXtY/f1H3UDT4F3TWgC7ydjoSAksoqag==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a05:6122:106e:b0:39e:e580:440 with SMTP id
 k14-20020a056122106e00b0039ee5800440mr10035328vko.37.1663102515183; Tue, 13
 Sep 2022 13:55:15 -0700 (PDT)
Date:   Tue, 13 Sep 2022 13:54:49 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220913205449.154966-1-nhuck@google.com>
Subject: [PATCH] drm/exynos: Fix return type for mixer_mode_valid and hdmi_mode_valid
From:   Nathan Huckleberry <nhuck@google.com>
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The field mode_valid in exynos_drm_crtc_ops is expected to be of type
enum drm_mode_status (*mode_valid)(struct exynos_drm_crtc *crtc,
                                   const struct drm_display_mode *mode);

Likewise for mode_valid in drm_connector_helper_funcs.

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of mixer_mode_valid and hdmi_mode_valid should be
changed from int to enum drm_mode_status.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c  | 4 ++--
 drivers/gpu/drm/exynos/exynos_mixer.c | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 10b0036f8a2e..8453359c92e8 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -922,8 +922,8 @@ static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_clock)
 	return -EINVAL;
 }
 
-static int hdmi_mode_valid(struct drm_connector *connector,
-			struct drm_display_mode *mode)
+static enum drm_mode_status hdmi_mode_valid(struct drm_connector *connector,
+					    struct drm_display_mode *mode)
 {
 	struct hdmi_context *hdata = connector_to_hdmi(connector);
 	int ret;
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 65260a658684..82f676e6d21b 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1045,8 +1045,9 @@ static void mixer_atomic_disable(struct exynos_drm_crtc *crtc)
 	clear_bit(MXR_BIT_POWERED, &ctx->flags);
 }
 
-static int mixer_mode_valid(struct exynos_drm_crtc *crtc,
-		const struct drm_display_mode *mode)
+static enum drm_mode_status
+mixer_mode_valid(struct exynos_drm_crtc *crtc,
+		 const struct drm_display_mode *mode)
 {
 	struct mixer_context *ctx = crtc->ctx;
 	u32 w = mode->hdisplay, h = mode->vdisplay;
-- 
2.37.2.789.g6183377224-goog


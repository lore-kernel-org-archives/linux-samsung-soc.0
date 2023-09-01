Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9A4CA0FF8
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  1 Sep 2023 23:44:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351321AbjIAXoL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 1 Sep 2023 19:44:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351302AbjIAXoD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 1 Sep 2023 19:44:03 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660B91711
        for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Sep 2023 16:43:27 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5735282d713so1489515eaf.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Sep 2023 16:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693611769; x=1694216569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uOG7orqF4actDsz25kkoaGcb+oSREvVrWkgMBMJJLo=;
        b=SRrtO74To+xOSsfEnrnrc/0pZK86OkB8mybSOAdCR3tzNO9KrEFhAfMaT522/JHv5K
         l8mwVKK6C73d7B6DSQMO9Xm5HFNEf69yWff7Dns3A2RzkzpDgEfS082QYwg5QRSMFvgZ
         SwUkKSeTZmsBFlluUIGhC7xbxEQH55xj5o764=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693611769; x=1694216569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uOG7orqF4actDsz25kkoaGcb+oSREvVrWkgMBMJJLo=;
        b=V7k/9LM+WcHsBI9N6KjRvbIM1ewhVsWqtaMWbS3/K0+JSFr5JmowtpqzggfSjQuM/Y
         FoK6YZ4ecO/wnDm5F5JV1klQeS8NI3LzCtaJxtZua2vl52nn1VJR9F1IBYcvQtZ0fKOq
         F8LpXLFDZf94onQcBo0uGPtu/ikSWElOeGcT3R70appF4zGO+FhG4tg5GvYf/fxuYeRP
         lomF9jwVWSomZtbu0ms3WrRPGniXVNsDJnJeq+6kk3gN/bWd+kR8boxM5ZKPhgVIJYBA
         oWoyrLjxHzO8F87p2kLalKkhFFN18jJ51Ac7xVDMdm/Uw2XP97BojtJFFJZFgyweJOpK
         TerQ==
X-Gm-Message-State: AOJu0YwG+ylBbW1TkvbOnLHeJwpbsxVgoTy5vBmS7I1p/zNyZD1/7Ufi
        F4XKxcZ7r0UPzUr4jzTUNmLnXA==
X-Google-Smtp-Source: AGHT+IEtno2sAZxUeLfldTVuC/n8wvbt8r9p0WUGoKpJ49IMbd/DsuhRqnZWTnQHfwEPIadZyumfcA==
X-Received: by 2002:a05:6358:7e03:b0:127:f2fb:d103 with SMTP id o3-20020a0563587e0300b00127f2fbd103mr3928386rwm.16.1693611769417;
        Fri, 01 Sep 2023 16:42:49 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
        by smtp.gmail.com with ESMTPSA id o9-20020a639a09000000b0056c3a4a3ca5sm3326390pge.36.2023.09.01.16.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 16:42:48 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>, airlied@gmail.com,
        alim.akhtar@samsung.com, daniel@ffwll.ch, inki.dae@samsung.com,
        krzysztof.kozlowski@linaro.org, kyungmin.park@samsung.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com
Subject: [RFT PATCH 11/15] drm/exynos: Call drm_atomic_helper_shutdown() at shutdown/unbind time
Date:   Fri,  1 Sep 2023 16:41:22 -0700
Message-ID: <20230901164111.RFT.11.Iea33274908b6b258955f45a8aaf6f5bba24ad6cd@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230901234202.566951-1-dianders@chromium.org>
References: <20230901234202.566951-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Based on grepping through the source code this driver appears to be
missing a call to drm_atomic_helper_shutdown() at system shutdown time
and at driver unbind time. Among other things, this means that if a
panel is in use that it won't be cleanly powered off at system
shutdown time.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS shutdown/restart and at driver remove (or unbind) time comes
straight out of the kernel doc "driver instance overview" in
drm_drv.c.

A few notes about this fix:
- When adding drm_atomic_helper_shutdown() to the unbind path, I added
  it after drm_kms_helper_poll_fini() since that's when other drivers
  seemed to have it.
- Technically with a previous patch, ("drm/atomic-helper:
  drm_atomic_helper_shutdown(NULL) should be a noop"), we don't
  actually need to check to see if our "drm" pointer is NULL before
  calling drm_atomic_helper_shutdown(). We'll leave the "if" test in,
  though, so that this patch can land without any dependencies. It
  could potentially be removed later.
- This patch also makes sure to set the drvdata to NULL in the case of
  bind errors to make sure that shutdown can't access freed data.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

 drivers/gpu/drm/exynos/exynos_drm_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 8399256cb5c9..5380fb6c55ae 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -300,6 +300,7 @@ static int exynos_drm_bind(struct device *dev)
 	drm_mode_config_cleanup(drm);
 	exynos_drm_cleanup_dma(drm);
 	kfree(private);
+	dev_set_drvdata(dev, NULL);
 err_free_drm:
 	drm_dev_put(drm);
 
@@ -313,6 +314,7 @@ static void exynos_drm_unbind(struct device *dev)
 	drm_dev_unregister(drm);
 
 	drm_kms_helper_poll_fini(drm);
+	drm_atomic_helper_shutdown(drm);
 
 	component_unbind_all(drm->dev, drm);
 	drm_mode_config_cleanup(drm);
@@ -350,9 +352,18 @@ static int exynos_drm_platform_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void exynos_drm_platform_shutdown(struct platform_device *pdev)
+{
+	struct drm_device *drm = platform_get_drvdata(pdev);
+
+	if (drm)
+		drm_atomic_helper_shutdown(drm);
+}
+
 static struct platform_driver exynos_drm_platform_driver = {
 	.probe	= exynos_drm_platform_probe,
 	.remove	= exynos_drm_platform_remove,
+	.shutdown = exynos_drm_platform_shutdown,
 	.driver	= {
 		.name	= "exynos-drm",
 		.pm	= &exynos_drm_pm_ops,
-- 
2.42.0.283.g2d96d420d3-goog


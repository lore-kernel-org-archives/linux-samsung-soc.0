Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D6BE7D0A6
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Sep 2023 19:49:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbjIUTtI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Sep 2023 15:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230424AbjIUTsn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Sep 2023 15:48:43 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90B259F8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Sep 2023 12:28:41 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c1e3a4a06fso11210835ad.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Sep 2023 12:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695324521; x=1695929321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iA2li7ELqa/hnFznycO86SuLFz051HXi1UIFyEU+SsY=;
        b=BGmAnpIi3iuDy812Osm+g+26341LogmDzQhgtW6SO6RxhNh2/Xxh9zdGfTP1dghyfu
         mwBgbXni0d0hUX2T+0307DGHcjWJjqjCHyQ6333ddP7sLjutHJ8eOWH0AU8ZqzyA5uwe
         0tQCgIWsVbv8HjmWYojERkl+ck9leykdb9Cyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695324521; x=1695929321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iA2li7ELqa/hnFznycO86SuLFz051HXi1UIFyEU+SsY=;
        b=YihBDoDG1hJvpNdSNeyhApsbRC2oKS9TQAreuWHRaJbF6N/qNszASyDWnHr90hlB2U
         GmIRUmmusDK3ErLKJlgHL7n1O/woU3t6s12uPsjx7RFcfveZMghUeKcPG9tNuKUUEhb6
         4tOQnIt/6rZo9Coe3Qz3K3XflL7/SpFU93hxdt1zhf8hweua8Y9BNZ6NszdNB4S3v2yr
         Aeie5ZM9pDUhUjjgRQXTz5aNWHvXVVYbwysSuvJu7gys4XX1P/A0RAaJPfxQtl/dTgVe
         emn3e65nHaPtBJK7yxHChs07Ok6wu29E3/4DGzJCzhdh1jI7ldgI/3FEcgdEdnthSe61
         K4uw==
X-Gm-Message-State: AOJu0YxDlIjFSbRIs8wE50Sryrbh4Kp1BTnDswobes/qY1b9wkcTOh/9
        Q0EDoB4j6RFs1pr3lxte2jR42Q==
X-Google-Smtp-Source: AGHT+IGqiH8+93CjsgTzwhYDRPl823KLkGG4+0EgU7Nds+tbBUgFbUmFj98SJgfl8Opc5kzECLW4aw==
X-Received: by 2002:a17:903:1205:b0:1c4:638:fff4 with SMTP id l5-20020a170903120500b001c40638fff4mr6441686plh.17.1695324521206;
        Thu, 21 Sep 2023 12:28:41 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:e6ed:6d49:f262:8041])
        by smtp.gmail.com with ESMTPSA id w8-20020a1709029a8800b001b9f032bb3dsm1892875plp.3.2023.09.21.12.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 12:28:40 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>, airlied@gmail.com,
        alim.akhtar@samsung.com, daniel@ffwll.ch, inki.dae@samsung.com,
        krzysztof.kozlowski@linaro.org, kyungmin.park@samsung.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com
Subject: [RFT PATCH v2 09/12] drm/exynos: Call drm_atomic_helper_shutdown() at shutdown/unbind time
Date:   Thu, 21 Sep 2023 12:26:52 -0700
Message-ID: <20230921122641.RFT.v2.9.Iea33274908b6b258955f45a8aaf6f5bba24ad6cd@changeid>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
In-Reply-To: <20230921192749.1542462-1-dianders@chromium.org>
References: <20230921192749.1542462-1-dianders@chromium.org>
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
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

(no changes since v1)

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
2.42.0.515.g380fc7ccd1-goog


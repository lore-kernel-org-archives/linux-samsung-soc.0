Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8BAC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  1 Nov 2023 09:37:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbjKAJhE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 1 Nov 2023 05:37:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbjKAJhC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 1 Nov 2023 05:37:02 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41066103
        for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Nov 2023 02:36:57 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5b9a7357553so2203153a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Nov 2023 02:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698831417; x=1699436217; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LyXL+8kMJ/1G6Wc6ZGN/nIRPqs6F9spUVK3ynSWmCqU=;
        b=XeUhafg7f2Td1gBnS5LiSvjkBD+98U4ktqs+QyFgh7BbZ6gLfiPdF0bnWFOYrK03iz
         HnuDRnY2F+e7lhas2XKI9Dtb+h7hyF8D7i3bq3gqT6mjDY2pR/UlTAT+gBaAO0LINaWV
         9P6A4MwCWjo5M8z0v34JgHBt0NW2V5AMnrHBE4p0qjwwY1VFfKcZvkheqWgZ0AOFU3To
         8sj30SYqlbFkb7tBl/pbwRp3kiyePELQZrLGx8wGoN4gNOy71DVDQVgGjJ0CkrqEyUmh
         ZObUj8tYGLWX62u3ZvgfqRDPB7o2GO6hx6YcfDuNLD/tK9XWlpOVsYWFkRtDj41JSios
         0tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698831417; x=1699436217;
        h=message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LyXL+8kMJ/1G6Wc6ZGN/nIRPqs6F9spUVK3ynSWmCqU=;
        b=sLm0gP/AQAgJIOebEpAfmAtE5ZXPIHUU8iZ/RNM4LPrqRMmLxV8cgd/EnfRMHmLiXQ
         T9vMGpy0CIiOUHDc5VhayQ/SsDPLn9xr/d9MvqQLhH8F5lK9YfxyA3de4jRUb6orXSFz
         VDx1NzgFHJozKbYiYBbTf6wchzFoEB4mNLnwy6XtMD56HdflcveEDGGR+zHGiwwl2XF8
         xEmS/JLT7HnPqagwETGMPy/HcWx94Kxr/9ipxjqMyQJniSQYfdR0ldOGYM23PT2rAjJ0
         MTBCcibJ1GxVwnA5+gwRWu50k6oZL3FdCw0LuKuVAwltZ2wbVKjqXyzocsYKJdWgETt1
         K0bw==
X-Gm-Message-State: AOJu0YzwRTWZq+1bBpJC4LiKjHEuV9Jr1Daz/x3QnDcyhI+Q155IP4hY
        qDxTfc+KXiuP7Vf9FcokK9X6f/jqVY4ksg==
X-Google-Smtp-Source: AGHT+IGVAKVpfpaa+6wP/Jcv5qLFNWpIv2d9/MOxDigrVyBuAn8rspFyVvLWgGqGX985E9GijFUIUg==
X-Received: by 2002:a05:6300:8083:b0:16b:9541:85e6 with SMTP id ap3-20020a056300808300b0016b954185e6mr18133836pzc.60.1698831416626;
        Wed, 01 Nov 2023 02:36:56 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id ne19-20020a17090b375300b002776288537fsm527321pjb.53.2023.11.01.02.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 02:36:56 -0700 (PDT)
Sender: Inki Dae <daeinki@gmail.com>
From:   Inki Dae <inki.dae@samsung.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm/exynos: fix a wrong error checking
Date:   Wed,  1 Nov 2023 18:36:51 +0900
Message-Id: <20231101093651.28343-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fix a wrong error checking in exynos_drm_dma.c module.

In the exynos_drm_register_dma function, both arm_iommu_create_mapping()
and iommu_get_domain_for_dev() functions are expected to return NULL as
an error.

However, the error checking is performed using the statement if(IS_ERR(mapping)),
which doesn't provide a suitable error value. So check if 'mapping' is NULL,
and if it is, return ERR_PTR(-ENODEV).

This issue[1] was reported by Dan.

[1] https://www.spinics.net/lists/dri-devel/msg418271.html

Reported-by : Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dma.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
index a971590b81323..6d73d4dca583e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
@@ -107,18 +107,16 @@ int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
 		return 0;
 
 	if (!priv->mapping) {
-		void *mapping;
+		void *mapping = NULL;
 
 		if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU))
 			mapping = arm_iommu_create_mapping(&platform_bus_type,
 				EXYNOS_DEV_ADDR_START, EXYNOS_DEV_ADDR_SIZE);
 		else if (IS_ENABLED(CONFIG_IOMMU_DMA))
 			mapping = iommu_get_domain_for_dev(priv->dma_dev);
-		else
-			mapping = ERR_PTR(-ENODEV);
 
-		if (IS_ERR(mapping))
-			return PTR_ERR(mapping);
+		if (!mapping)
+			return PTR_ERR(-ENODEV);
 		priv->mapping = mapping;
 	}
 
-- 
2.17.1


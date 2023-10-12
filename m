Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A148CDB482
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Oct 2023 09:44:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbjJLJox (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 12 Oct 2023 05:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235480AbjJLJow (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Oct 2023 05:44:52 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FF389D
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Oct 2023 02:44:51 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-317c3ac7339so715464f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Oct 2023 02:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697103889; x=1697708689; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k+QKwp7nbl5f01p02Qg76ygu3plfUspesE0c3bZjqAw=;
        b=ysniDGXROvSZpFs+6obmOEl28B90oClamTM7uit7vfxIxZ2yBfpujMeVJJrqZSmuR4
         dqOUYUxflNwEzNDpeEyUWttJqryx7i1KhetHexF+ltsNzggA9fe4T0ZD1YIMVi4Vz+N/
         8rMyi52elUcgTlSwJ5jR6QVS2GTsnZb17Ptqrh0xCbgTUmz/rGwTKcAQ5spJ3dDG2SyU
         idxheDIPymExuG16vK0jWLXpaVYilVtaIWQVBPf/ZYm7a3D2kuAqEFJi5yAJ2SZI1K2t
         M/xNDIZoSgmw+Sh6ktMt0yHCVr0/yAwWzZ25jSNK7qGo+FVt8BPLOtQx7O05vsPijGbn
         djkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697103889; x=1697708689;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k+QKwp7nbl5f01p02Qg76ygu3plfUspesE0c3bZjqAw=;
        b=qJqxnMyMwbn8no+vZOe/0cTDIZ3xVAL7ZMQEZMEBjoLaIkYpyyReO7wWzVJL7CzEK/
         nhf9GjmcGPiohlmWrI46LnvlOb148c64UHDCXv6n5ZFTAUARkU6TsvgJdwGjeJdp7ApQ
         EPOVwQmj7QTfPRSIGzXhESJ1+nmQx7in1YSLTMI2U8VV+dxg0OARg91rZMUysWKFZ2+0
         WZO8BqLqlulkLQjcA8OlhJ8XVgErDsi2RpW1k1UcJWXV0XMPojQRgwTPjiXXxzjcNpRI
         Lo5XmkhL54IPa9rxIIyzImOmzc5T6EOkYCmR3WabtZWm0rLSKWGl61LvaqeD7QWM6HbR
         Bpgw==
X-Gm-Message-State: AOJu0YyiZQDifHwliGV8MFR3qDkEEFNX5gKjKkTNgekOIZ8PpTKZrDMK
        XCYvxTMFeAkPmARFUnEr/S+WUA==
X-Google-Smtp-Source: AGHT+IG7sLNYr0zpChWt8fMpTJKOcqZ3lRnegx7zppgFF1S6sXIq/A7SPemRfc4R3uX5KM5QEnagzw==
X-Received: by 2002:a5d:474c:0:b0:32d:93aa:3d63 with SMTP id o12-20020a5d474c000000b0032d93aa3d63mr634911wrs.69.1697103889452;
        Thu, 12 Oct 2023 02:44:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e11-20020adfe7cb000000b003176c6e87b1sm17890924wrn.81.2023.10.12.02.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 02:44:49 -0700 (PDT)
Date:   Thu, 12 Oct 2023 12:44:46 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     andrzej.hajda@intel.com
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [bug report] drm/exynos/iommu: merge IOMMU and DMA code
Message-ID: <33e52277-1349-472b-a55b-ab5c3462bfcf@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hello Andrzej Hajda,

The patch 67fbf3a3ef84: "drm/exynos/iommu: merge IOMMU and DMA code"
from Oct 12, 2018 (linux-next), leads to the following Smatch static
checker warning:

	drivers/gpu/drm/exynos/exynos_drm_dma.c:120 exynos_drm_register_dma()
	warn: 'mapping' isn't an ERR_PTR

drivers/gpu/drm/exynos/exynos_drm_dma.c
    95 int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
    96                             void **dma_priv)
    97 {
    98         struct exynos_drm_private *priv = drm->dev_private;
    99 
    100         if (!priv->dma_dev) {
    101                 priv->dma_dev = dev;
    102                 DRM_INFO("Exynos DRM: using %s device for DMA mapping operations\n",
    103                          dev_name(dev));
    104         }
    105 
    106         if (!IS_ENABLED(CONFIG_EXYNOS_IOMMU))
    107                 return 0;
    108 
    109         if (!priv->mapping) {
    110                 void *mapping;
    111 
    112                 if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU))
    113                         mapping = arm_iommu_create_mapping(&platform_bus_type,
    114                                 EXYNOS_DEV_ADDR_START, EXYNOS_DEV_ADDR_SIZE);
    115                 else if (IS_ENABLED(CONFIG_IOMMU_DMA))
    116                         mapping = iommu_get_domain_for_dev(priv->dma_dev);

arm_iommu_create_mapping() and iommu_get_domain_for_dev() seem to return
NULL on error.

    117                 else
    118                         mapping = ERR_PTR(-ENODEV);
    119 
--> 120                 if (IS_ERR(mapping))
    121                         return PTR_ERR(mapping);

Smatch uses the pre-compiled code so it says that mapping is always NULL
on this config...

    122                 priv->mapping = mapping;
    123         }
    124 
    125         return drm_iommu_attach_device(drm, dev, dma_priv);
    126 }

regards,
dan carpenter

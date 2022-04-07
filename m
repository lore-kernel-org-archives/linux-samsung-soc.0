Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A97EC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Apr 2022 09:19:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235287AbiDGJVH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Apr 2022 05:21:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241232AbiDGJVG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 05:21:06 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D331CA38C
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Apr 2022 02:19:06 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id l7so4108781ejn.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Apr 2022 02:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LnBaoxjesRLMXYfiTlUnMPHbRX/jaeNrS7ud9yunYL8=;
        b=JCkCix2OZhzzzmIsUDtE4MsZEZ7sHVMFlEEY0eQ2IiiIZX43KOoAdUzdfUJL8x5ruc
         Sm3xnbbj+0CzltfkFFixHoqCq1v7LB6Y6ndItKvw5DA1x1eVcQNCJwj3HnNyAVeanXFx
         aHtgvRwOukySZEyYXkTEvxZzAVzIZ65r3D57Qpi/NI4Qzl8BmB6zVkHuIjGO8KoOyjs6
         aTT2qRYKQBKNs+JedW3VoPZa5GtmJGeHUmBhui7++0Xd0PEg2qb4FYOWZ7b/C/YLgoDf
         /vtvkLebSwu7JQcNOUeM9gPdWPWKUB3f3ZX7VJ1PMF5G1/IomarSADR6aPtoE6rX9oYo
         EI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LnBaoxjesRLMXYfiTlUnMPHbRX/jaeNrS7ud9yunYL8=;
        b=Np5RBpPi+qhgYs7UsnesbfwOixthhNTN2Z7cdSuY36RD8RlG1DbBkFzzjATYI9604j
         Rp+IpuNuspxhoEm+eaaNLJKRI3AUmy+J1QKPigTcBayd1gSJV2uraJFdHY4VP5eYSwDz
         REoBZqsS9WFgN92sZgIyKxqg3pT0AXg3qIV6NXI5FOE63u75bRc+S7EgQWX2meIZZOEL
         9NzJy2OXJJc1epldqTN2jM2eo31/pWlpIMNfhq84fwWmMzpKGJwu/a1aZNfbp9tWOSVg
         JOL02KdEKYkdqr1xh7uoEZdYjptyWRwY8T7TyCbyj8WKGGJPfVKMcMDhhPg4RxV67eDI
         RIig==
X-Gm-Message-State: AOAM532we2aqywb6cVibk2G6PEcG8S0K+Az/xXnd7bhyFnjQDgAvxbwl
        l/5DJP+J3Ivci0w8yuQdNH/AZQ==
X-Google-Smtp-Source: ABdhPJwaDEOV/LwjRxHVpjg7xoZn+nxfMxkDpEWEHjQLfxMEE0rGyggRQCA1ZMmBB77kyk/4Dj9zIQ==
X-Received: by 2002:a17:907:3d87:b0:6e6:f1f3:ba7c with SMTP id he7-20020a1709073d8700b006e6f1f3ba7cmr12511730ejc.128.1649323145398;
        Thu, 07 Apr 2022 02:19:05 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id m1-20020a170906848100b006e8053c7cdcsm2927752ejx.39.2022.04.07.02.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 02:19:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Girish K S <ks.giri@samsung.com>,
        Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>,
        Vasanth Ananthan <vasanth.a@samsung.com>,
        linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Miaoqian Lin <linmq006@gmail.com>
Subject: [RESEND PATCH 1/2] phy: samsung: Fix missing of_node_put() in exynos_sata_phy_probe
Date:   Thu,  7 Apr 2022 11:18:56 +0200
Message-Id: <20220407091857.230386-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Miaoqian Lin <linmq006@gmail.com>

The device_node pointer is returned by of_parse_phandle() with refcount
incremented. We should use of_node_put() on it when done.

Fixes: bcff4cba41bc ("PHY: Exynos: Add Exynos5250 SATA PHY driver")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/samsung/phy-exynos5250-sata.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/samsung/phy-exynos5250-sata.c b/drivers/phy/samsung/phy-exynos5250-sata.c
index 9ec234243f7c..6c305a3fe187 100644
--- a/drivers/phy/samsung/phy-exynos5250-sata.c
+++ b/drivers/phy/samsung/phy-exynos5250-sata.c
@@ -187,6 +187,7 @@ static int exynos_sata_phy_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	sata_phy->client = of_find_i2c_device_by_node(node);
+	of_node_put(node);
 	if (!sata_phy->client)
 		return -EPROBE_DEFER;
 
-- 
2.32.0


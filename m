Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB5DC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Apr 2022 09:19:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243737AbiDGJVH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Apr 2022 05:21:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243731AbiDGJVH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 05:21:07 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC021CABCB
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Apr 2022 02:19:07 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id p23so5635127edi.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Apr 2022 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VNbnKRlfaQArckBwqtyPd//4SBBVpRdJ3XTbCofIYRs=;
        b=iKMF7HKH1ujVrO+HWsVSZBima3JdMAbH4p58+DPB86kQEpFAapqdqaaGmPgM+CCT5c
         4ijl8uuyUSC5K0ptya67Bi4z1z1WrZKDC/36CqWVCJOVDF2l6HbaACSlJwQET6tyc9ON
         E83TgMGDZMbug8Upqcm5z8MPN3P+7sKYJy/vK1t1/UC7ImP5BSBT7lrXg1fA31fWjMV9
         6FPdUiH3UDQCyKi+cGH9xeeljybBQU9++yW9sMK/wsMVTUWqs6A+5gqWBSKUxZRPHSwW
         zvwYy1SOGxeKXBfcPn5FoSdzkg/cveW3tZVciql/oQhQnmMYs0P0sIhdaLg96L8yZEfm
         oGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VNbnKRlfaQArckBwqtyPd//4SBBVpRdJ3XTbCofIYRs=;
        b=PhrRboQVzj+wdR+Pudx+l1KwZnSHls7crY2l63jCrw0MJU8uWeLYqeETGic31dD8xJ
         VqlixzuPiD4Gusiz0XFlNRjNWOmHREeZPHKMeKv9811jiKlVsFw3LY1+C1hTvv3BbsHN
         kuiNO/dxlIkmOp56urlSiStQH9xKVgt+ga0KM7jydR7PQcaEwBMmKRWzAfNHRRIg0kaC
         XOi1keZLkwixT+SgbxXkuZ+PqV2O/HOBfTzAHCMu/F3xt9Nbg4gO01Bj8EouGdsWwneC
         3G+6FhEk4STd+L/Hsai+9iG3Q05RhZGYLaX8wtYPPBmBhtPHG3bD+bFEiUoIQy3kgQUo
         Hb4w==
X-Gm-Message-State: AOAM530xHzUHwGuCAtl0Aw8UfqJA2l91mi/5Vaqq2h74DoiSLS8sMG3D
        m5AVUU9GVJnAM1x/UdRDkm7W1Q==
X-Google-Smtp-Source: ABdhPJzFsBM5gI6o2DREc7Xi8f5GVAMfoqKmYdFDqhcq0iN5kCkieW3N33D+6qQ3NnRe9X9N43TCtQ==
X-Received: by 2002:a05:6402:5107:b0:419:935d:bb6e with SMTP id m7-20020a056402510700b00419935dbb6emr13218359edd.242.1649323146442;
        Thu, 07 Apr 2022 02:19:06 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id m1-20020a170906848100b006e8053c7cdcsm2927752ejx.39.2022.04.07.02.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 02:19:06 -0700 (PDT)
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
Subject: [RESEND PATCH 2/2] phy: samsung: exynos5250-sata: fix missing device put in probe error paths
Date:   Thu,  7 Apr 2022 11:18:57 +0200
Message-Id: <20220407091857.230386-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220407091857.230386-1-krzysztof.kozlowski@linaro.org>
References: <20220407091857.230386-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The actions of of_find_i2c_device_by_node() in probe function should be
reversed in error paths by putting the reference to obtained device.

Fixes: bcff4cba41bc ("PHY: Exynos: Add Exynos5250 SATA PHY driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/samsung/phy-exynos5250-sata.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5250-sata.c b/drivers/phy/samsung/phy-exynos5250-sata.c
index 6c305a3fe187..595adba5fb8f 100644
--- a/drivers/phy/samsung/phy-exynos5250-sata.c
+++ b/drivers/phy/samsung/phy-exynos5250-sata.c
@@ -196,20 +196,21 @@ static int exynos_sata_phy_probe(struct platform_device *pdev)
 	sata_phy->phyclk = devm_clk_get(dev, "sata_phyctrl");
 	if (IS_ERR(sata_phy->phyclk)) {
 		dev_err(dev, "failed to get clk for PHY\n");
-		return PTR_ERR(sata_phy->phyclk);
+		ret = PTR_ERR(sata_phy->phyclk);
+		goto put_dev;
 	}
 
 	ret = clk_prepare_enable(sata_phy->phyclk);
 	if (ret < 0) {
 		dev_err(dev, "failed to enable source clk\n");
-		return ret;
+		goto put_dev;
 	}
 
 	sata_phy->phy = devm_phy_create(dev, NULL, &exynos_sata_phy_ops);
 	if (IS_ERR(sata_phy->phy)) {
-		clk_disable_unprepare(sata_phy->phyclk);
 		dev_err(dev, "failed to create PHY\n");
-		return PTR_ERR(sata_phy->phy);
+		ret = PTR_ERR(sata_phy->phy);
+		goto clk_disable;
 	}
 
 	phy_set_drvdata(sata_phy->phy, sata_phy);
@@ -217,11 +218,18 @@ static int exynos_sata_phy_probe(struct platform_device *pdev)
 	phy_provider = devm_of_phy_provider_register(dev,
 					of_phy_simple_xlate);
 	if (IS_ERR(phy_provider)) {
-		clk_disable_unprepare(sata_phy->phyclk);
-		return PTR_ERR(phy_provider);
+		ret = PTR_ERR(phy_provider);
+		goto clk_disable;
 	}
 
 	return 0;
+
+clk_disable:
+	clk_disable_unprepare(sata_phy->phyclk);
+put_dev:
+	put_device(&sata_phy->client->dev);
+
+	return ret;
 }
 
 static const struct of_device_id exynos_sata_phy_of_match[] = {
-- 
2.32.0


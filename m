Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC3FC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  9 Mar 2022 17:09:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235851AbiCIRKC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 9 Mar 2022 12:10:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237599AbiCIRJv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 9 Mar 2022 12:09:51 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B6C6172E70
        for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Mar 2022 09:00:33 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 412803F499
        for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Mar 2022 17:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646845232;
        bh=1C2abaYPYBkDuzkzZwjwXPHr1LgPUoTyCzwwpANsRGs=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=jYFYE8HjbQ361Lz6QyM6p8qfSJMRJKH6Cbq7Q8/dKabL9SFmSZNjD/oKCs3jHn3Es
         QS4UtCRXLuAImY8I9xOaHwzGps/ngaDCWTykYBh6BJNPPC8LvEj8X906GOJG6Z6zCj
         YFdhFuN4R3IIb0alGG28AqgesAo7flwbNiGDOdG/WHO/kpAjjWULpqE99v6E+ztI9Y
         WWaOTQ2CPqzQp5NBgp/R6gECA54TYf2wiJ1AMUC35XOWVCXGaubUbTkRc/G+yyjP3v
         sn29csMxfRn+ujubdj1AI7wN/qjzQ1iT6KClViGN0cX8Z0UEmaIpcEaQ/33jhIfXFt
         +yDI6hrnAqhkA==
Received: by mail-ej1-f70.google.com with SMTP id m12-20020a1709062acc00b006cfc98179e2so1635293eje.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Mar 2022 09:00:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1C2abaYPYBkDuzkzZwjwXPHr1LgPUoTyCzwwpANsRGs=;
        b=kS/7lpMP56iw4ts41TXCEe1qjbCvcbG7m9GK+GTwS8Aon2TgCE552jZuDt7CAKy7G7
         CmMTZWZScPy3/B4IcrPgIxkRZzvDMRtUbfoGxP1EGpq+RRKkLpVQddwHydkYPGpXHt5K
         nyDa3QBGkVaw6WoOxUc4yz6EVsdiv91AcKSi2AAnraQ7ePPc62yM4WVlyjNybhil5r+5
         ZPKISVwJBOsiL8zXd7TbKHkMckBCZZHDozxdaG3yqGSZMDJdrpWZCKydJ4lG8X5sqgSP
         AMTOm8lGyARXQPSNu+d3bqMqy9B0j7d3xA2IrRKPjRJuHCgu88Z/L5AhhqibABcNclfy
         TR4w==
X-Gm-Message-State: AOAM533y//17PPK2vTNM4RBiPqOi5UwjnTNyc3gwZdBjeQGxjKWwmyz8
        uvK2zQIvdAuSoLuNikeBDY5kdd3QAhN27CYzrvqO+GdvH74yGeoake78LXNoKG7dBNj4IlcrxLU
        I2Vbz4MzbsA0znQTejvdLo8unI+8XEY7u0S+IzEiIaCVfti63
X-Received: by 2002:a17:906:6a26:b0:6da:873c:b9a2 with SMTP id qw38-20020a1709066a2600b006da873cb9a2mr647417ejc.727.1646845231648;
        Wed, 09 Mar 2022 09:00:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrw1wchW3O6ryE+IVn5BJTWoAbUv5bAvi3pD7v2cxZRa7DtGFD01MOWRsewZfconSJ8erZ5A==
X-Received: by 2002:a17:906:6a26:b0:6da:873c:b9a2 with SMTP id qw38-20020a1709066a2600b006da873cb9a2mr647400ejc.727.1646845231437;
        Wed, 09 Mar 2022 09:00:31 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id h22-20020a1709062dd600b006dac66b8076sm944767eji.95.2022.03.09.09.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 09:00:30 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Miaoqian Lin <linmq006@gmail.com>,
        linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] phy: samsung: exynos5250-sata: fix missing device put in probe error paths
Date:   Wed,  9 Mar 2022 18:00:28 +0100
Message-Id: <20220309170028.51913-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The actions of of_find_i2c_device_by_node() in probe function should be
reversed in error paths by putting the reference to obtained device.

Fixes: bcff4cba41bc ("PHY: Exynos: Add Exynos5250 SATA PHY driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Rebased on top of (although it is independent, no conflicts):
https://lore.kernel.org/linux-samsung-soc/20220309124856.32632-1-linmq006@gmail.com/T/#u
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


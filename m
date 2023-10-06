Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14648E92FF9
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Oct 2023 09:00:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbjJFJAl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Oct 2023 05:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231318AbjJFJAk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Oct 2023 05:00:40 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38A7295
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Oct 2023 02:00:37 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso341247666b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Oct 2023 02:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696582835; x=1697187635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XbYEmjwyN/rvXZtiiJmZRXloVKTHD6PfGRwin2k2z3I=;
        b=yd+UZ/jc2nld49TJGpNBDD0bPDQkOwNKdYv5np2HS+vx2EqXwc12lW7esNZ5oGVRVq
         fRtouhlRvOxySihTi11y6rOMN9ADygemnv0uZkMPDK/FORCC3AJ0e9HXsZ1hrJSZnS8o
         XfcqpxA6A1q9wJCl49nxWjEkT7Px1e1LO990QPRg9K6t3TQFrrReBPhc71OtzAwMxLvM
         uw1+0Czyi2klENoqXukcqNaxPHvMagPfTefuGKcL1hGTX0NtwC62L5VNqrxFiyHmrFBS
         gyhdxIU/lOwEGijTwCyDTRwUVqsq5GrAXExoJ4gdRHLiNHhm9X6UQ0rLwHmKHPRnPMxl
         CBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696582835; x=1697187635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XbYEmjwyN/rvXZtiiJmZRXloVKTHD6PfGRwin2k2z3I=;
        b=PTmwVy+SE5jYgRSNfkaHaG6QXH1tLDvkcLTzEr9x4u9UCpZyA6uUFY0A/bbJaESmso
         8psRhV1z/wo1VhYL8YJngDyFwy28x3ppMW5o7oFh914lpXuE+7SBK4gVWCbeiExZn8fr
         +QpkoL5+R1jB9XVEDmbNIc/zI43MCKzsRCgtkLEZ5zLVlgnWsU20y3A2MCj29e+6F3NZ
         SsgDAbszE2mcPOBFkIxEbDmQ09m3hP2HVss8E//nPnLvUJlg2r+by+8dL+sHlFVMmF4N
         9lU34FpHA4RBw+HfGGo+Zx9RMSMgETzaQnQH82/9RcTLbBm0HfoGvjTA5tQmytmddPDs
         j/1w==
X-Gm-Message-State: AOJu0YxxJGrNiu6iX635uwqLI5QNv3TzdsLdwb1QGVLT8kR/DEDhTfey
        VFIPZ8+wV57S2k/YwtwtcfReHg==
X-Google-Smtp-Source: AGHT+IETTgEY5f/+/zJhn8TchC2peIdWtv6NFlBmU8Ykoojr6SlCgiwUJaSJhnmThCVVVgreb23ADQ==
X-Received: by 2002:a17:906:5357:b0:9ae:7681:f62a with SMTP id j23-20020a170906535700b009ae7681f62amr7474264ejo.44.1696582835695;
        Fri, 06 Oct 2023 02:00:35 -0700 (PDT)
Received: from tudordana.roam.corp.google.com ([79.115.63.123])
        by smtp.gmail.com with ESMTPSA id l7-20020a170906a40700b009ae587ce133sm2521163ejz.188.2023.10.06.02.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 02:00:35 -0700 (PDT)
From:   Tudor Ambarus <tudor.ambarus@linaro.org>
To:     krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        semen.protsenko@linaro.org, peter.griffin@linaro.org,
        Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH] soc: samsung: usi: remove superfluous parameter
Date:   Fri,  6 Oct 2023 10:00:14 +0100
Message-ID: <20231006090014.277448-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

exynos_usi_set_sw_conf() has a single caller, exynos_usi_configure,
which called it with exynos_usi_set_sw_conf(usi, usi->mode). Since the
mode is already defined in struct exynos_usi, remove the superfluous
pass of the mode parameter. While in exynos_usi_set_sw_conf(), remove the
reinitialization of usi->mode with its same value.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-usi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
index 114352695ac2..269ed930c5a9 100644
--- a/drivers/soc/samsung/exynos-usi.c
+++ b/drivers/soc/samsung/exynos-usi.c
@@ -95,14 +95,14 @@ MODULE_DEVICE_TABLE(of, exynos_usi_dt_match);
 /**
  * exynos_usi_set_sw_conf - Set USI block configuration mode
  * @usi: USI driver object
- * @mode: Mode index
  *
  * Select underlying serial protocol (UART/SPI/I2C) in USI IP-core.
  *
  * Return: 0 on success, or negative error code on failure.
  */
-static int exynos_usi_set_sw_conf(struct exynos_usi *usi, size_t mode)
+static int exynos_usi_set_sw_conf(struct exynos_usi *usi)
 {
+	size_t mode = usi->mode;
 	unsigned int val;
 	int ret;
 
@@ -115,8 +115,7 @@ static int exynos_usi_set_sw_conf(struct exynos_usi *usi, size_t mode)
 	if (ret)
 		return ret;
 
-	usi->mode = mode;
-	dev_dbg(usi->dev, "protocol: %s\n", exynos_usi_modes[usi->mode].name);
+	dev_dbg(usi->dev, "protocol: %s\n", exynos_usi_modes[mode].name);
 
 	return 0;
 }
@@ -164,7 +163,7 @@ static int exynos_usi_configure(struct exynos_usi *usi)
 {
 	int ret;
 
-	ret = exynos_usi_set_sw_conf(usi, usi->mode);
+	ret = exynos_usi_set_sw_conf(usi);
 	if (ret)
 		return ret;
 
-- 
2.42.0.609.gbb76f46606-goog


Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C717C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 27 Nov 2021 22:40:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356661AbhK0WoM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 27 Nov 2021 17:44:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356559AbhK0WmL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 27 Nov 2021 17:42:11 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7316C0617A1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Nov 2021 14:33:07 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 137so11301711wma.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Nov 2021 14:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hN+6gbYdyGAjVnMlgQrBqQi/CF2WLkIegNLftvsH2gY=;
        b=DlVHEKe1sf9t1x3J3dV5oUzT5laj66uD+D8FcpDAJGtTw7W6R/G6/4i/1FsAegGaC4
         DW4mVPYOPZZa1fR+gJVNcxrDMoGaTpCFO3BS6HqLDhV685L/RFi8oZ3uCTMIVamCk/rH
         Gbm13j/4qRRRpYZNvl7glovJJVa4VSthBqDZ1Emi172S1esenJHvEmYHb1eH0HfsP46I
         EIUfXDANPd+JKuTHyKrw/fL7UZ2YD9yL22xJNnjsCng73w0MP+ZI7cfIWty5543aPlMg
         jYSBaNQJ2WS81kRXrTK+CKnleaWNOIepZa+TUGt8DNK8znwRi+QHw0uezn0wfC/HRYbd
         ewkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hN+6gbYdyGAjVnMlgQrBqQi/CF2WLkIegNLftvsH2gY=;
        b=wJ60wTPXm0KyW8yVHQxMToEb9v/luLH2w+GeMH/J4Rl/MAgLcnRANh6JWl9sogzyS1
         G7U25aHQ59LInYI+8W2k1jazDbi80Q+XIZitIP31FiXPljBYKy6Va2meXXQGExB1ZiX4
         LB41jYzbbGZ5kGhP1feAhTcwQmTjwlFsyOHbjO2hAAD0lAM+YxOgcbDX6Cg2FyfPpBD7
         1U1w2FHsd++EpHJ7sDMT4J/qtnjsqbs1Dqc1R8N3dykNuCkZfIXcIzznxHabKDXxnWEc
         KzkTxtd2mWCqcTrpw3FG5uGuak9HwFATo0eiDGBWuNr51kzFtQgT56vZ24BhKrXHwiMc
         aWHw==
X-Gm-Message-State: AOAM5335mF8PWgunFRYoyy+bzMID0GxpTYXv0pC9p/PepLbaAwQ9FWKZ
        TKbsUgZ6UxX/r0dDLKXR95/knA==
X-Google-Smtp-Source: ABdhPJxR6Q7r+leY9cj8FBiR+YQOouaiZQ2fWT9sTrdBPHYHb+gpo78GRNNQbc1FsqSfzm0h3WuhFg==
X-Received: by 2002:a05:600c:4f87:: with SMTP id n7mr25568893wmq.63.1638052386493;
        Sat, 27 Nov 2021 14:33:06 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id w4sm10078421wrs.88.2021.11.27.14.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 14:33:05 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH 7/8] i2c: Make I2C_EXYNOS5=y impossible when EXYNOS_USI_V2=m
Date:   Sun, 28 Nov 2021 00:32:52 +0200
Message-Id: <20211127223253.19098-8-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211127223253.19098-1-semen.protsenko@linaro.org>
References: <20211127223253.19098-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

When HSI2C is encapsulated in USIv2 block (e.g. in Exynos850), USIv2
driver must be loaded first, as it's preparing USI hardware for
particular protocol use. Make it impossible for i2c-exynos5 driver to be
built-in when USIv2 driver is built as a module, to prevent incorrect
booting order for those drivers.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/i2c/busses/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index df89cb809330..e815a9dffb2c 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -613,6 +613,7 @@ config I2C_EXYNOS5
 	tristate "Exynos high-speed I2C driver"
 	depends on OF
 	depends on ARCH_EXYNOS || COMPILE_TEST
+	depends on EXYNOS_USI_V2 || !EXYNOS_USI_V2
 	default y if ARCH_EXYNOS
 	help
 	  High-speed I2C controller on Samsung Exynos5 and newer Samsung SoCs:
-- 
2.30.2


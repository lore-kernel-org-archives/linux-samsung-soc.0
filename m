Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD33BC6FD19
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 12 Mar 2023 18:36:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbjCLSg6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 12 Mar 2023 14:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbjCLSgj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Mar 2023 14:36:39 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED0F216AC3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 11:35:42 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id k10so40148381edk.13
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 11:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678646094;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rC/o1AQDcGAyPZ0tU6+VZIwVNayEqqDcPKH36IGj0wI=;
        b=PHq6N8u2EkRN78+3bkgP0AelEUQIQhEWSMLgb5jfdb/luXpfE3TrxHNr/JVg76W1Wu
         GpRyoSN2Rap/kIJrgGqxfTELNqF5cJBX6XhDD9E2uQRpVAei7/VqjW12yO7e03SlavFF
         BCUd36YYvazwLMH3LIBp//vFuKcr8GIlspoaRTG3mRrOr+QgZDW8CX1Fu9GcmhEt0bHa
         3h5Du41nKcPruYIPHnEagOJPnV+OS7fkPk8nOV1J//omGMXH2vWrK90zPxQ1OCIezU0z
         LhJF67PlwWOCz+F2dFvTglQGk77Kt46iEh6vlsRHocMNyMBF8QQVmXdLezumB76LV/k9
         6/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678646094;
        h=cc:to:subject:date:from:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rC/o1AQDcGAyPZ0tU6+VZIwVNayEqqDcPKH36IGj0wI=;
        b=DXZGyypxC0Qam++uXvC7j6jxIgtCpeCYYCrsyC2PE7VbJgivL/l9bQuhKcHM9l70Ou
         2wgfN3nhlWfjGsee2ACoBg0hIvHAZknwROrDpAnCBnB3q6VLvi0evs4w9le048eqmGbF
         8DggVlfahBz4p2hMgjSC3YBko7zi0YI0tY6LZMQY5lhT+Emgfcd6Ak2shBZtWoZRxfnG
         n2OLkPprsW3uVdLK6euSCSVdwg4rzQbVLD2Z+Onf+M4ANj7OBxe3YfYzj62MyGbciSAn
         knggWhzijAhvE/sqzPsmgGqcEiV4ono6vYnpJO1TdPuv0UYS0YPwH0Cpk/vCgACxTuOw
         PlMQ==
X-Gm-Message-State: AO0yUKU4lwZmdxE3EI7P5ov/pBVXH3Pjj0zSSL6Weg8diUubZqHzEjEL
        e6+wNTG+hXVdblZpBfJaXzOQARFr0BZUjyVG
X-Google-Smtp-Source: AK7set9hiSyHDnHMYWZmz+CVEQzBjHUErx4ai0yoMd3WdVkVTil+UiT/VlFJPM/4c3ky+Jh8VOMnZg==
X-Received: by 2002:ac2:5215:0:b0:4d4:fcdb:6454 with SMTP id a21-20020ac25215000000b004d4fcdb6454mr8563581lfl.17.1678644316495;
        Sun, 12 Mar 2023 11:05:16 -0700 (PDT)
Received: from 0003-arm64-dts-exynos-fix-wrong-mmc-compatible-in-exynos7.patch (46-138-144-249.dynamic.spd-mgts.ru. [46.138.144.249])
        by smtp.gmail.com with ESMTPSA id y14-20020a2e9d4e000000b00295a32db4e1sm716776ljj.91.2023.03.12.11.05.15
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 11:05:16 -0700 (PDT)
Message-ID: <640e145c.2e0a0220.422d2.19f2@mx.google.com>
From:   Sergey Lisov <sleirsgoevy@gmail.com>
Date:   Sun, 12 Mar 2023 20:58:50 +0300
Subject: [PATCH v5 3/3] arm64: dts: exynos: fix wrong mmc compatible in
 exynos7885.dtsi
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This DW-MMC variant is not actually compatible with
"samsung,exynos7-dw-mshc-smu", and requires an additional quirk to handle
very short data transfers, typically used by SDIO cards. Update the
compatible string to "samsung,exynos7885-dw-mshc-smu" to reflect this fact.
---
 arch/arm64/boot/dts/exynos/exynos7885.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885.dtsi b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
index 23c2e0bb0..b0addb0b3 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
@@ -294,7 +294,7 @@ pmu_system_controller: system-controller@11c80000 {
 		};
 
 		mmc_0: mmc@13500000 {
-			compatible = "samsung,exynos7-dw-mshc-smu";
+			compatible = "samsung,exynos7885-dw-mshc-smu";
 			reg = <0x13500000 0x2000>;
 			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
-- 
2.38.3



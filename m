Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A64C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  1 Dec 2021 19:05:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352674AbhLATIo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 1 Dec 2021 14:08:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352645AbhLATIb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 1 Dec 2021 14:08:31 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D851AC061761
        for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Dec 2021 11:05:07 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id bi37so65441956lfb.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Dec 2021 11:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d6fIBufmD5QRMsiw/gE/8E+34ToRCzmP+LytC0+70WA=;
        b=fEwES4k7XV41oxKjE9076qaNcNBSMHNFAhXgS+OoH/wfCgfA7Omf9+QTWzXH+1O22P
         bJjzldE4J2xo8XME/WQRtuDpwzg/NmNVjUy4lYve9X5mM0vKBfgszZ1EedRZtYjS8gxS
         SCwbVv4WXThSbX1fPCzbqzfjGrAF/W3wS9IXCT63GL5QfNE1Dig8v92tAGkB/eP15+V2
         FSEVaqfrRFO3fKoBr6aZQscuTG5tH1c3ICI4w1lZie+wqeFub5gCYdGU5QV43JlY/B3a
         BzlOkHaNCmMXicSPAPKmrq3an0KR1khryejau7fF09f5PyZi3MyLFKD660GpUOew1+HU
         Gefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d6fIBufmD5QRMsiw/gE/8E+34ToRCzmP+LytC0+70WA=;
        b=WbGRrhPXBGO9KT5IjBKpDFIhnL8A4oqqZvMKX4Vnf2j0Np8vXjg1V8HtAycheKbylz
         rs2xml8jP7LLEpYhv3431ibQh68ruVhqV4X/Fc8yopEfPg5IRVJNUts5NiqEitD5D+0M
         Ys9VrXrjcmeDqamFrmELzVNetnmzHNNTY9NjNr3Bbnjqt5+PbhgGU74MWUW+3QbXwgz/
         3IxOnxE4iXRAQNuB0biR0Rlk8i4g0QBZAfBiL1lYdQjrh4Zw2LNG1aeuTb1mB19RbMGx
         lhF94ud2PhOhRpMmRbY5KYCPzWTGI4hwlZHSsLDufggwxwOu5Xeg+jyHSSPuv6ec5Jd6
         t3cA==
X-Gm-Message-State: AOAM531HL/xDzZJIUtwh/hcmSUooF+UBzfxMH1iSyGvEdLDSo0ujei33
        xF1IIughM9cx9QGKMLA8n7ouJw==
X-Google-Smtp-Source: ABdhPJyvjE/0qbt84gWoIGc+pyqYk+/D639fFxWAkgip4SenMEvpmY1/UWceA3HcjGJREntdEe18JQ==
X-Received: by 2002:ac2:5bce:: with SMTP id u14mr7529672lfn.467.1638385506127;
        Wed, 01 Dec 2021 11:05:06 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id q1sm68855lfo.255.2021.12.01.11.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 11:05:05 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 6/6] i2c: exynos5: Mention Exynos850 and ExynosAutoV9 in Kconfig
Date:   Wed,  1 Dec 2021 21:04:55 +0200
Message-Id: <20211201190455.31646-7-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211201190455.31646-1-semen.protsenko@linaro.org>
References: <20211201190455.31646-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

I2C controller chosen by I2C_EXYNOS5 config option is also suitable for
Exynos850 and ExynosAutoV9 SoCs. State that specifically in I2C_EXYNOS5
symbol help section.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index df89cb809330..42da31c1ab70 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -617,7 +617,7 @@ config I2C_EXYNOS5
 	help
 	  High-speed I2C controller on Samsung Exynos5 and newer Samsung SoCs:
 	  Exynos5250, Exynos5260, Exynos5410, Exynos542x, Exynos5800,
-	  Exynos5433 and Exynos7.
+	  Exynos5433, Exynos7, Exynos850 and ExynosAutoV9.
 	  Choose Y here only if you build for such Samsung SoC.
 
 config I2C_GPIO
-- 
2.30.2


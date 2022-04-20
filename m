Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED753C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Apr 2022 10:47:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348654AbiDTKuF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Apr 2022 06:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243895AbiDTKuE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Apr 2022 06:50:04 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B99513F79
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Apr 2022 03:47:18 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id y20so2646394eju.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Apr 2022 03:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bcpYqRaU49XKqh0Z0sSXhDxB3o3VF6wDafoLfTVp4EQ=;
        b=TllbobzAtOeBEXWQjxWZwmHDv/7A+77wdjCWcGGlbLmwQnEk+Zd8uBxoUl8qMoYIvt
         GP6zRKxeVe+L2gaGMMHvIvIrU1SHOX/jNhZ6zrtqzUqhzFoM/yxmyUM0bMSHCDRMiJux
         Gf/26FTMxYbd+jdvyZcC/5pABqDpE6CKw16ps+kIPS8tkE0WcSA3rhBy7wzu3ixbt4Hp
         gXMk7EaNo+5uQkHTqZJEkFrh14utTtQ0fDC0Vqv+9JHXyDgQGfF2OfNK2SJy0gb37pDx
         AVruYFb2E/K95YlR0+UCI1vLc6tb+2usEeGEfigufEujzTpvXdAr8e9dyLKT90vLTSC6
         61tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bcpYqRaU49XKqh0Z0sSXhDxB3o3VF6wDafoLfTVp4EQ=;
        b=G2lpzUpn5Mzl9a1Y68PlluiCU9hESrw4DCP+V2VfPwzS9DMoI8SvdJeAtqaJIrSOah
         UA5QV+pbyl/WHMsSImi4pRDRfeiRl7X/zQCzYTcPJ4Fyw6GMcZKX1ydgGhP1BofNSVXE
         o4rWLa0A9H1R/H9JN/uTcR+bIScaH0XcO/V1NLmgWm2Z4wpBlXKlBbJY/jxXqmftEeUU
         Hh13eD0HAkaB24mLa59X6CMJSz/greEMBFPS3tZcsgGngDu0/deqo+54kz3QdLUEA3eJ
         tcg0QhG2j0FWINIHFlogxV6f+SDFxa1Wgp/grRbF+tBvTfvtKWAUAUXz8NUM7io35SPa
         iAVw==
X-Gm-Message-State: AOAM531M/ZjqFFJnuxUADIEgFnN+4Qe/kry905lTuBNBlXnHCIcuOw1e
        oagzS6ReKXlBMBYMr3ENeXA0Mg==
X-Google-Smtp-Source: ABdhPJy9OVgwcawWRlYVZ5WxCEw/1/2nlUmelZjjBlqNclDd2qstERYLUEf0WaDM3tW8fI/yuSRHvA==
X-Received: by 2002:a17:906:6a1c:b0:6eb:d76c:e835 with SMTP id qw28-20020a1709066a1c00b006ebd76ce835mr18773642ejc.15.1650451637094;
        Wed, 20 Apr 2022 03:47:17 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q14-20020a17090622ce00b006e898c912e5sm6583019eja.217.2022.04.20.03.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 03:47:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] MAINTAINERS: add Bug entry for Samsung and memory controller drivers
Date:   Wed, 20 Apr 2022 12:47:08 +0200
Message-Id: <20220420104708.106738-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add a Bug sections, indicating preferred mailing method for bug
reports, to Samsung SoC related entries and memory controller drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4cfe5a9acf3f..2d746723306a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2645,6 +2645,7 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 C:	irc://irc.libera.chat/linux-exynos
 Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
+B:	mailto:linux-samsung-soc@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git
 F:	Documentation/arm/samsung/
 F:	Documentation/devicetree/bindings/arm/samsung/
@@ -11989,6 +11990,7 @@ M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
 L:	linux-pm@vger.kernel.org
 S:	Supported
+B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/power/supply/maxim,max14577.yaml
 F:	Documentation/devicetree/bindings/power/supply/maxim,max77693.yaml
 F:	drivers/power/supply/max14577_charger.c
@@ -12000,6 +12002,7 @@ M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
+B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/*/maxim,max14577.yaml
 F:	Documentation/devicetree/bindings/*/maxim,max77686.yaml
 F:	Documentation/devicetree/bindings/*/maxim,max77693.yaml
@@ -12693,6 +12696,7 @@ MEMORY CONTROLLER DRIVERS
 M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
+B:	mailto:krzysztof.kozlowski@linaro.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git
 F:	Documentation/devicetree/bindings/memory-controllers/
 F:	drivers/memory/
@@ -15624,6 +15628,7 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 C:	irc://irc.libera.chat/linux-exynos
 Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
+B:	mailto:linux-samsung-soc@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git
 F:	Documentation/devicetree/bindings/pinctrl/samsung,pinctrl*yaml
 F:	drivers/pinctrl/samsung/
@@ -17357,6 +17362,7 @@ M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
+B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/sound/samsung*
 F:	sound/soc/samsung/
 
@@ -17401,6 +17407,7 @@ M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
+B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
 F:	Documentation/devicetree/bindings/mfd/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/mfd/samsung,s5m*.yaml
-- 
2.32.0


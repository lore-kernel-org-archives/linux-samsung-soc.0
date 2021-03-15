Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B63C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Mar 2021 12:44:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83F0D64EE1
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Mar 2021 12:44:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhCOMns (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 15 Mar 2021 08:43:48 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33273 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbhCOMnW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 08:43:22 -0400
Received: from mail-wr1-f70.google.com ([209.85.221.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lLmZ7-0004i4-2w
        for linux-samsung-soc@vger.kernel.org; Mon, 15 Mar 2021 12:43:21 +0000
Received: by mail-wr1-f70.google.com with SMTP id m23so10028823wrh.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Mar 2021 05:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rxaIjR1J//5PkyRZXm0+xJCkI6bQEZtH1ohc21euivs=;
        b=PUHC8jqQzehFj7Pz6npkr1iJp/V8BoPGY4ljFRJT8RoswpCRYtY4Nx3eChe8g2DQw7
         a/DqHwESboXm7y+ueJ3JA+Tzk+++XKv1/GgEhzGHemtgh9GtvzNTBr4uN3tnNjl/RlMV
         6Juo06Bmp5kkVpr2ddNVwP180pFolnmyZ2R69HtS7211B0X5KjZw3zk1+xLUe/c86xG/
         PFcFsoBW8ewEu4xKPtcdFRSXdlP6+LFSPc1T18xsmEObUXPzIccRCTvo8KvVhzfx3BQg
         FRpZtajrog0MFt+Dw5OiNnyvB78JcTH0BY4o6pIv34xoHcVJy7REI0ffPa419ZtmQ5DN
         aNKg==
X-Gm-Message-State: AOAM5328S39dHP7tO3USq2slcZEaDscQv2ybFycyrzA1jqniR36hTGnT
        h2OpvTPbtM/nZ7v30OKp+4a6XlVNoS6fIWnR3ahb8ufoY45D4cb2kLnEIJoHkZ+Y1nWXGV+JE/F
        zZuK2bsydEV+8uHFT52xCYFuYdc5oCme/fdtvGZ8h1IeD7AV5
X-Received: by 2002:a05:6000:1546:: with SMTP id 6mr27051361wry.398.1615812200828;
        Mon, 15 Mar 2021 05:43:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx19SoVoAAQrYf7moALON3Fv15zBfY8pJOsEEAAhFpyMpxvBF4bD3zbUHBRa65h38JIQJV97g==
X-Received: by 2002:a05:6000:1546:: with SMTP id 6mr27051353wry.398.1615812200719;
        Mon, 15 Mar 2021 05:43:20 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id r10sm14410094wmh.45.2021.03.15.05.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 05:43:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 3/3] arm64: dts: exynos: white-space cleanups
Date:   Mon, 15 Mar 2021 13:43:13 +0100
Message-Id: <20210315124313.114842-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315124313.114842-1-krzysztof.kozlowski@canonical.com>
References: <20210315124313.114842-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fixup white-space issue:

  WARNING: please, no spaces at the start of a line

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 413cac63a1cb..773d9abe3a44 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -1002,7 +1002,7 @@ events {
 		ppmu_event0_d1_general: ppmu-event0-d1-general {
 		       event-name = "ppmu-event0-d1-general";
 	       };
-       };
+	};
 };
 
 &pinctrl_alive {
-- 
2.25.1


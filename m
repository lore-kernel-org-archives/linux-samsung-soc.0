Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A549C54E94
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Jan 2023 09:46:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235463AbjAYJqN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Jan 2023 04:46:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235302AbjAYJqH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 04:46:07 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E15904C0C
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:45:43 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id e19-20020a05600c439300b003db1cac0c1fso803129wmn.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sf93u9qLAl/kW4zKoFQL4lEPy9GA4IuPMNBdksDHS4=;
        b=v+fFGjaVu6HopZHsKR1i+WrrGZgLZssRidqBnouaBBYmluIu4HuuQpS0bGmEWNuoOD
         afpoL/k0HjMpjaZJ4qBud9g3vMgpuRsnLQbjUd/osCnoNous9OWI+5VY2KqByddEhcQa
         iaknKRn/FHyGh0Res25N5dveRZRa0qNkpLAJv5e669mYpg0lXwYj0y+8K8P1wp2AoX8s
         a4VA3dvH1rgCxZ1863rj6I2PFH3ua11kPIoFWylPR/+Q2Il8Ugzhg26W1J8gl7uXtb+S
         6B5D8w3fs7d9RMPMBmKzYgF7t5MO9N5DQUd1j6c4Hv/7gTH9jfwrm52glcL+frS2V/fR
         gJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7sf93u9qLAl/kW4zKoFQL4lEPy9GA4IuPMNBdksDHS4=;
        b=4y3kBScIbqpz6n/jSWvLSSEtkZmdUrHMqnmEsBbUpfdQMzbCtGpSwFjhPba+69KrzL
         ehdshk1rq2cOwGoEgKB8K71qkV5A8hbt3Mox550e5Zw5Ssw8kvEha099YM/QSN14R7uI
         V4dY1MD7ibMbq+ts39Lj69qCgUKUfLdyEdF6XWFx8AwyFAQT0qGShNJjcRiK3bAmMpWF
         4ca7VpaPPTP9Yh+vl04yicycBcHACPkPn4aRJONIciNs9A2LhxbMhjS7kh8FUbx0ZJTg
         d8+Jk+Ax4iMb1JeV1am8bFIuzH1l4ueXJ/5UmQ1lQU36WzrMm6wHYMgno2KevxRDuuyI
         uz0w==
X-Gm-Message-State: AFqh2kqkAoAQtBOY5KNPjSXj/3U7wzUFNlqjDtzzFC8fD1YJRqg4ibcD
        JS8dPs6BxOQzY5FR3pKoYQdR5Q==
X-Google-Smtp-Source: AMrXdXvljaUY7zFk1FMrwWw7waw2nNZzQ2VmmZk/Xs+/90HApHOPzGWCAz2+tIKn+1boYL9dwf0hGA==
X-Received: by 2002:a05:600c:4f82:b0:3db:25a0:ca5b with SMTP id n2-20020a05600c4f8200b003db25a0ca5bmr22484430wmq.37.1674639933314;
        Wed, 25 Jan 2023 01:45:33 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id fl22-20020a05600c0b9600b003d1e3b1624dsm1419238wmb.2.2023.01.25.01.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 01:45:33 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 8/9] arm64: dts: exynos: move exynos-bus nodes out of soc in Exynos5433
Date:   Wed, 25 Jan 2023 10:45:12 +0100
Message-Id: <20230125094513.155063-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230125094513.155063-1-krzysztof.kozlowski@linaro.org>
References: <20230125094513.155063-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The soc node is supposed to have only device nodes with MMIO addresses,
as reported by dtc W=1:

  exynos5433-bus.dtsi:10.20-16.4:
    Warning (simple_bus_reg): /soc@0/bus0: missing or empty reg/ranges property

and dtbs_check:

  exynos5433-tm2.dtb: soc@0: bus1:
    {'compatible': ['samsung,exynos-bus'], 'clocks': [[21, 220]], 'clock-names': ['bus'], 'operating-points-v2': [[165]], 'status': ['okay'], 'devfreq': [[166]]} should not be valid under {'type': 'object'}

Move the bus nodes and their OPP tables out of SoC to fix this.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
index 72ccf18eb9d1..540b4d6c9067 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
@@ -6,7 +6,7 @@
  * Chanwoo Choi <cw00.choi@samsung.com>
  */
 
-&soc {
+/ {
 	bus_g2d_400: bus0 {
 		compatible = "samsung,exynos-bus";
 		clocks = <&cmu_top CLK_ACLK_G2D_400>;
-- 
2.34.1


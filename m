Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E538DC47089
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Dec 2022 19:05:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbiLDTFu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 4 Dec 2022 14:05:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbiLDTFt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 4 Dec 2022 14:05:49 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498F91402A
        for <linux-samsung-soc@vger.kernel.org>; Sun,  4 Dec 2022 11:05:48 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id s8so15426390lfc.8
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Dec 2022 11:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tN+9Eb6t2q0VBWQioY+fDSvDW1iJ67j9nKJa3pJNoHE=;
        b=FAtPhEtwKfrpA7H7/CVexgdRiBlyeoL9GOxpY9VjgxGOplHfaH//XnrLS4kgyEi7HP
         yUCiMo3FiivqFgWKdZiTDZmO2It2wBMTj+PXCuC3Wbgd3rgkNYPfDYzErVCGX7tglm6S
         MRHtSW92JMm/8xikcQXyP6GzEHM6KrENe0gv256zfyVU10BLs0mWlcgbjimSRTEO3Lhg
         Nc1GMPSvegrC3/Md0Bv9vS3vnGMnUG6UbspwErRc552yGUpufrR9BVQoZWlgX0hJgCOw
         o4mcW1ce0ULh5J67TTQWBi3Cb0Xp0k2P6Gbzes7k1flAeCrfYAUciVWLBfNhyScXmABY
         H/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tN+9Eb6t2q0VBWQioY+fDSvDW1iJ67j9nKJa3pJNoHE=;
        b=JyJNqMgO0idG9ytSnJJ31fqb9JgN/hnv0a+RJV5miUiE4tXr1B/Am/J9NxextwMjvz
         nAVT5ka+0+wEhZoLFHqY+dbelD7Ccqhb7tuj2sm+JO1gbOqmeyK+oehnOEoxdN9sF5vU
         PSKABcB2pZYZOUFsokoBQ7LMvftmg1wW9BjdKuLgU1rdJeolUGaHC6VVhQoEZ2yn5qbd
         D36/gA6Ttwni+Z9UUQFfaGzWJQnYrVTIIi9QZNoxeJ2Tn9hrLK3wM8m1gkRbppzdY2w4
         ugvP7fMGKLJjGAYsc6hBAFvGmbQKCIFH4xNDcvlY5w5KgQJpCAUXHwD8wxA5mEWDsm82
         9a/Q==
X-Gm-Message-State: ANoB5pmP5wkc83FIebEI/v5nm0wHEQ6F3BOqVKKv9dHvmMLlbpnNNW8G
        9Q4KXGO1PMiVxRhRkK3AYI11zw==
X-Google-Smtp-Source: AA0mqf68JL1m43Z6g7sdxW+3FaligMTVWjde3DBlZw9aHIYbSh615ZEfiokpvAz+OSX/Pdl9Tag7nw==
X-Received: by 2002:a19:2d55:0:b0:4a2:7c6a:5cad with SMTP id t21-20020a192d55000000b004a27c6a5cadmr25939614lft.366.1670180746581;
        Sun, 04 Dec 2022 11:05:46 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bi35-20020a0565120ea300b004ac6a444b26sm1847644lfb.141.2022.12.04.11.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 11:05:46 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ARM: dts: exynos: drop unused pinctrl-names from Galaxy Tab
Date:   Sun,  4 Dec 2022 20:05:43 +0100
Message-Id: <20221204190543.143986-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221204190543.143986-1-krzysztof.kozlowski@linaro.org>
References: <20221204190543.143986-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

pinctrl-names without pinctrl-0 are simply unused:

  exynos5420-klimt-wifi.dtb: gpio-keys: 'pinctrl-0' is a dependency of 'pinctrl-names'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos5420-galaxy-tab-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420-galaxy-tab-common.dtsi b/arch/arm/boot/dts/exynos5420-galaxy-tab-common.dtsi
index d19bc3d266fa..63675fe189cd 100644
--- a/arch/arm/boot/dts/exynos5420-galaxy-tab-common.dtsi
+++ b/arch/arm/boot/dts/exynos5420-galaxy-tab-common.dtsi
@@ -51,7 +51,6 @@ oscclk {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		pinctrl-names = "default";
 
 		key-power {
 			debounce-interval = <10>;
-- 
2.34.1


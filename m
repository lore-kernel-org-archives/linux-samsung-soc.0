Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2FFC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 29 Jan 2022 17:53:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346187AbiA2Rxl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 29 Jan 2022 12:53:41 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:36118
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1352753AbiA2Rxi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 29 Jan 2022 12:53:38 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 418B43F2FF
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Jan 2022 17:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643478817;
        bh=bgWRA4jagXRIZ+87s8E1TzK9o6vneJUF41jOIzkhmn8=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=ONUwmfMYgmOjJVpFEl9qHLSdNgi4Jz1EKCz3is9zKeUxa4HpRH1mBUEhuievkYB8D
         t9NDsaWiRorcFKmgtjuiZOvLDIMgKBFrLoaak4lMKCgQtJn/x9O0wOOIbJ2O8/d2qs
         3/Fl68pdtFfkqeFeXEn8aq+Dx92u8cZyqlJpOhyYOjpHcbvwe9oxSNJP4QAB11lfEe
         ySFMSnd025lycLsduu3T6Pz7HS6mcrzptnyRHcX4zalDopHBsi1aV/ipsVDdlNVaYV
         qscHHTePSfgl+rxqVxJvUep1MM//4MChXKZNKt8OEElu/p4iG/vdyVuxdtUzhG4rQy
         D5+HyVgNFqBoA==
Received: by mail-ed1-f69.google.com with SMTP id l16-20020aa7c3d0000000b004070ea10e7fso4666004edr.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Jan 2022 09:53:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bgWRA4jagXRIZ+87s8E1TzK9o6vneJUF41jOIzkhmn8=;
        b=ugtP/LQ1OWlmX3KLKDAV8Q0vcXKi5lm1/2IKaUlYlD+ucwyjFArf5OPdjWRZYA4+0K
         Vq4+UApkF2eJ/3USBobH3M/3rKJqAYlgu8FhPzMQ/KHkLK432veHXk9GDQwFvRiSOVNz
         mXnl2ech+f9UFQEowhvfJcy25pJQRJNhHioHdjxkMWkXI/9Xk9EWCNaPoqPqbHvM5OSe
         Di9vXuPDvqTYxxGPOKt7ttSzJSeZOMP6jgSO3dV1TJz5k0jm/UN3TR+pPEboxyx/ybFr
         8Lekg2h9rBGnFmplbAKMlihZIeCrhesx5iBBWybenXYiHFPUVCKpekebr2DviJjIax5L
         6zbA==
X-Gm-Message-State: AOAM532RcUSn265B8zcGulmI9d0ZcoBnHa4PvJC/6DYirafFaZuNCRD2
        wRa8/xFQvEy5giQBxF8tkYjzD+QEOdi8ZY5YczujQAvv874dTMlvD6/p3KWQ5Wd4bxDVKdZlCuW
        9/P2EotP0nSiYmHt/RnPq14+dV7sm6Un00VWeVBcYkY153Xb4
X-Received: by 2002:a17:907:9726:: with SMTP id jg38mr3651945ejc.384.1643478816579;
        Sat, 29 Jan 2022 09:53:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaBAqEWxBwVQz5SVpuSS2UhkhrR1UFQZFLootOZ1zlNqZ0WYYIUdusgJTZcK3C6ZgqYdhF9A==
X-Received: by 2002:a17:907:9726:: with SMTP id jg38mr3651939ejc.384.1643478816415;
        Sat, 29 Jan 2022 09:53:36 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id s12sm11236266ejx.184.2022.01.29.09.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 09:53:35 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: exynos: drop unneeded syscon phandle in Exynos5433 LPASS
Date:   Sat, 29 Jan 2022 18:53:29 +0100
Message-Id: <20220129175332.298666-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220129175332.298666-1-krzysztof.kozlowski@canonical.com>
References: <20220129175332.298666-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos5433 LPASS audio node does not use syscon phandle since commit
addebf1588ab ("mfd: exynos-lpass: Remove pad retention control").  It
was also dropped from bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index b4cde77e02d3..661567d2dd7a 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1885,7 +1885,6 @@ audio-subsystem@11400000 {
 			reg = <0x11400000 0x100>, <0x11500000 0x08>;
 			clocks = <&cmu_aud CLK_PCLK_SFR0_CTRL>;
 			clock-names = "sfr0_ctrl";
-			samsung,pmu-syscon = <&pmu_system_controller>;
 			power-domains = <&pd_aud>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.32.0


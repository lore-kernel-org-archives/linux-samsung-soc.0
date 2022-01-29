Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DC3C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 29 Jan 2022 19:37:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353113AbiA2ThL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 29 Jan 2022 14:37:11 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:60202
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353080AbiA2ThE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 29 Jan 2022 14:37:04 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 255D43F1E8
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Jan 2022 19:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643485012;
        bh=XuPLAqAJ9YY2uh5AhVfTrXkOsUrsAC204eUS2kAaJyU=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=pZdjHiHwXmqk/aiwKLflJ16fTfmzE6L4LNFL83ClXQ6zxSsOjViWOH/qKtuFUPug1
         VP2IsIW6C7z7oY/+LdCU5CaKzoGoMDOQk0VoSwt8w8Nc8LaxnFcqNUwvsoCLqa5L0q
         OpPLHoPgQIPxis0ArbMnr8i9hH6eI7azGbMMhdMcjTBCsEC8HfeEPvPERd6u1DPjJe
         A4Pkuj8on1VXUG/ypqAaVTjMb94bYoFENuotNhuge/+iYRabpVICnpibxPG39ZRDAe
         qa/0YGankpZDDlfNW1kSs/A6KLSmG6pwbrzUyfoJxqRdAWUgNbOfna+ysZ7L4T9aAM
         nngaofrm7VrvA==
Received: by mail-ed1-f71.google.com with SMTP id w15-20020a056402268f00b00408234dc1dfso4773349edd.16
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Jan 2022 11:36:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XuPLAqAJ9YY2uh5AhVfTrXkOsUrsAC204eUS2kAaJyU=;
        b=dgwyexdDCPaGSoMhFPdh4l/Jj3p+Yf8Q97e3Eo3x3lEr5fd/Inljk/Pm99k5Et3NCP
         QrYbOaoB5pD/SM3goxf+CSevT7x4cZOfX4eR7w28j5977O+eg+0T1yAvb3xVQXqQtfLH
         Jnx0uGYL+Klk7myVfdAIYtws3p+OtXprfzFuEyHxOS01p18xK5uFYSlSJQ2qWNEVBzNR
         C0Vli9+hXAmIDlyTQ6mSFODL1X3BEUzDBhWkdlYkjchZ2S/u2nrlwczJGWsEvnD6BX1P
         tK+upywxyJ6SX1NNOEzXIArTCBymEY1RQURK/kLU4x2EqivLCM4NOmBrrriguUrdiRit
         VAqg==
X-Gm-Message-State: AOAM53276ZGzWErlOW7TyzoSAezRXw0dSE5oPlngyycNJapOBsh24ogW
        /iHXPJ50ETby6ruvgUZUPb9JRFa+tPdlbyrpp3MmikRF8s+XhGC+inqHglrmh0mXQwsl7+T/IQW
        ZCC4aERD+aIf0ieXFigQJuTBiA5bXSfUnSpvzuSwnnoNBAy3J
X-Received: by 2002:aa7:cdc5:: with SMTP id h5mr13885351edw.293.1643485009963;
        Sat, 29 Jan 2022 11:36:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkRER9zOkkAySGx0C0YpNLKKRr5Djve4lerBLmDsvqlQap4YIrDFg+B4EOx7UpKxurUyVhXg==
X-Received: by 2002:aa7:cdc5:: with SMTP id h5mr13885341edw.293.1643485009830;
        Sat, 29 Jan 2022 11:36:49 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id bf21sm14968026edb.2.2022.01.29.11.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 11:36:49 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/8] arm64: dts: exynos: adjust USB DRD clocks with dtschema in Exynos7
Date:   Sat, 29 Jan 2022 20:36:39 +0100
Message-Id: <20220129193646.372481-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use the same order of USB 3.0 DRD controller clocks as in Exynos5433.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 3364b09c3158..e38bb02a2152 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -684,11 +684,10 @@ usbdrd_phy: phy@15500000 {
 			reg = <0x15500000 0x100>;
 			clocks = <&clock_fsys0 ACLK_USBDRD300>,
 			       <&clock_fsys0 OSCCLK_PHY_CLKOUT_USB30_PHY>,
-			       <&clock_fsys0 PHYCLK_USBDRD300_UDRD30_PIPE_PCLK_USER>,
 			       <&clock_fsys0 PHYCLK_USBDRD300_UDRD30_PHYCLK_USER>,
+			       <&clock_fsys0 PHYCLK_USBDRD300_UDRD30_PIPE_PCLK_USER>,
 			       <&clock_fsys0 SCLK_USBDRD300_REFCLK>;
-			clock-names = "phy", "ref", "phy_pipe",
-				"phy_utmi", "itp";
+			clock-names = "phy", "ref", "phy_utmi", "phy_pipe", "itp";
 			samsung,pmu-syscon = <&pmu_system_controller>;
 			#phy-cells = <1>;
 		};
-- 
2.32.0


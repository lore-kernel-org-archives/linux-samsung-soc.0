Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAF2C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Mar 2022 12:25:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239184AbiCDM0A (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Mar 2022 07:26:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237786AbiCDMZx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Mar 2022 07:25:53 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C8981B01A5
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Mar 2022 04:25:06 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 021643F60B
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Mar 2022 12:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646396705;
        bh=ro6EmjNQtTARcIDRl9rR+ZuulwNuQEnHoOGAjteVwBA=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=FtYDgn46GhZawBnOjYOhhaW9UxhjNAXGRaNy8YrjxiUPvA60WUve40tisLqAo4vUC
         apqSQMTtTvAPh43EO58/YstkK5CIXOp2Icv9imqY4GkKbq88t5apj/I2JmEjOok0Jw
         V/DQQ4uqsh1oKjYMkDE9E3mPSx+8wjb+bi9WTxc6WlX8kJVNCoNPP55gLipywZnJp1
         rjY5+QunqunCkYflzBurV3htHXo6Au128y/EqCRz6e0lfBc0x91HrL16tDCgjrDJBd
         5zNITXDkGvJkz1gYPQc5+ioZspjWz2TSRMRI0Ai0RUyLwJNNgCcVwpw/DG8fFNaHxY
         jLAiUoAXnmQPA==
Received: by mail-ej1-f71.google.com with SMTP id d7-20020a1709061f4700b006bbf73a7becso4313676ejk.17
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Mar 2022 04:25:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ro6EmjNQtTARcIDRl9rR+ZuulwNuQEnHoOGAjteVwBA=;
        b=aTa4L73TdoY+4q4eXHu9x8xOlhZeQYyr6kdZSx0VgAeGjmvTFvGnYVIprHYbB+tuXV
         iuycdkUlVpx5ObMSYhexLt7k3d/io/vcOsPIDlBVLssPwyh50Rydd27jCHn8FaqVf/k2
         8G1tgZ3mp7ypOURJqlrnkjNowj12M6CaEW62jGGFe90WpNfuSBeSscdJJssmVzg3fJ7u
         R4urQko6PsNIN48DxWk3OnBm/XBNBMpHfmWr8AzbTrN75LnHNQjavcL74p3vHtba7bIC
         USTxa/Vzbo57awY2KWTyzqH1W0BKNjV2X3te0ePeHFdIVmszKGlsXMxOijP2Dj/WUXAz
         Ybfg==
X-Gm-Message-State: AOAM531gTV0by3S5L+nY2vdgITf4DBoZSEwIeCymLFsCtJ80GpGO3X6w
        uHopwpeHXqTIaGI7xHGWrrUidH2+YefcaBOl8BHSi4UkVFqW8hrPqbG4m0ILKVArPtfIfYKvyGX
        Zg80VPDS6ID7a34qZln/yDaaSrWGYhRcbFKBGY90W3J0jcXzt
X-Received: by 2002:a17:907:da6:b0:6d6:f8ce:e03 with SMTP id go38-20020a1709070da600b006d6f8ce0e03mr13707469ejc.516.1646396704531;
        Fri, 04 Mar 2022 04:25:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9E5PWp+lrl3OL2lDlQRole/yVnG6bMeI2HXzqoiizpGaQQxWBjhH2J8aOcejstMV3oomogg==
X-Received: by 2002:a17:907:da6:b0:6d6:f8ce:e03 with SMTP id go38-20020a1709070da600b006d6f8ce0e03mr13707446ejc.516.1646396704377;
        Fri, 04 Mar 2022 04:25:04 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id r23-20020aa7da17000000b00415a1431488sm2047368eds.4.2022.03.04.04.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 04:25:03 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: exynos: add a specific compatible to MCT
Date:   Fri,  4 Mar 2022 13:24:23 +0100
Message-Id: <20220304122424.307885-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220304122424.307885-1-krzysztof.kozlowski@canonical.com>
References: <20220304122424.307885-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

One compatible is used for the Multi-Core Timer on most of the Samsung
Exynos SoCs, which is correct but not specific enough.  These MCT blocks
have different number of interrupts, so add a second specific
compatible to Exynos5433 and Exynos850.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 3 ++-
 arch/arm64/boot/dts/exynos/exynos850.dtsi  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 661567d2dd7a..017ccc2f4650 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -806,7 +806,8 @@ tmu_isp: tmu@1007c000 {
 		};
 
 		timer@101c0000 {
-			compatible = "samsung,exynos4210-mct";
+			compatible = "samsung,exynos5433-mct",
+				     "samsung,exynos4210-mct";
 			reg = <0x101c0000 0x800>;
 			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index d1700e96fee2..12f7ddc6fd0a 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -181,7 +181,8 @@ chipid@10000000 {
 		};
 
 		timer@10040000 {
-			compatible = "samsung,exynos4210-mct";
+			compatible = "samsung,exynos850-mct",
+				     "samsung,exynos4210-mct";
 			reg = <0x10040000 0x800>;
 			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.32.0


Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5ECC6FA99
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 12 Mar 2023 13:10:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbjCLNKx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 12 Mar 2023 09:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjCLNKw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Mar 2023 09:10:52 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60D5746168
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 06:10:51 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id t14so9981959ljd.5
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 06:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678626649;
        h=cc:to:subject:date:from:in-reply-to:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tDIef+aPGuB5wQknGJ7abVMxEUnE+NE/6MUxxwCrbfI=;
        b=C1p1ntT0etmor/iVXlOt6hSRsqxR33/cuRZwGSxDulTOKzvgPGYKoB8SxXGsn5rra0
         yKe+QZjO6A3svjvntlTXKmLwFpGOaB6NIMAcuRGJaNdvsXpaYVpGW2uzqds+Uj/U3zl8
         TF9hRsJOWBpVB1EGS3VL+h9CuaVuD+UTUuehy/d3kB/zIPOE5nIFZY8OvICcnAU/js2q
         y5RGUQPXGBRTiC5LA56h8LIsEG42cPox5ozC3s/M6zWRsM5vzJCcUSyMT4SBEzZK8wI2
         O+JaTOYbZbIhhlZpLtll1FNKEwXQfc7iu+Xh6s+BAn+wCHbqBrZVz9LG4g3ObO22tYxQ
         TvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626649;
        h=cc:to:subject:date:from:in-reply-to:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tDIef+aPGuB5wQknGJ7abVMxEUnE+NE/6MUxxwCrbfI=;
        b=u+RPwpjrGoyllSyAm7DdBC73f6x3UMz/3kj4QPfZ6pU5X9yiYalbS8+OQSw5FIYcqV
         dK0HZCFTSeMDUyhc39g68lgisk6NNd2j10qz49PM5vXo1r+FNmmozSJlb5Ij4NluWc78
         6xGBz6TXZYjQ8X1xI09KiKlfSl7CbH1y7owjoKw22Op1BIjBuGRhI+zROuCbuln2tOYH
         PdpfTxjW/RsEUFrSAk7tJGt3t4Opti0iDexjdmGNOrEvgu1JDhVBLeFlpL+Cxj16LbQR
         cjC/PofmU9XQ/brpFVm7+Di4+fGro8wrPdSMLiKa9jC3z3pSzzlUwHboprA9nrrFpmmA
         q/cA==
X-Gm-Message-State: AO0yUKVpBNryWa51RnZITMSivxkDX3P9hYNsflbzoOCEWMOA/JN4XH9D
        gYbcCJ0k4MAQN2XOfIPlNvySCxHw6KLF4ydw
X-Google-Smtp-Source: AK7set/ljCLFurYKW96ihxF300Ih4+EpgwBaQlWPb/gXRKtNQ/yH3JTmsmMxcQQ9YynBhOreZqlTyg==
X-Received: by 2002:a2e:b55c:0:b0:295:b432:2055 with SMTP id a28-20020a2eb55c000000b00295b4322055mr8014003ljn.32.1678626649131;
        Sun, 12 Mar 2023 06:10:49 -0700 (PDT)
Received: from 0001-dt-bindings-exynos-dw-mshc-common-add-exynos78xx-var.patch (46-138-144-249.dynamic.spd-mgts.ru. [46.138.144.249])
        by smtp.gmail.com with ESMTPSA id x25-20020a2e9c99000000b002959d2cc975sm645695lji.37.2023.03.12.06.10.48
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:10:48 -0700 (PDT)
Message-Id: <1678626510.1783316-1-sleirsgoevy@gmail.com>
In-Reply-To: <1678626510.1783316-0-sleirsgoevy@gmail.com>
From:   Sergey Lisov <sleirsgoevy@gmail.com>
Date:   Sun, 12 Mar 2023 16:03:15 +0300
Subject: [PATCH v3 1/2] dt-bindings: exynos-dw-mshc-common: add exynos78xx
 variants
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

Some Samsung Exynos boards using the arm64 architecture have DW MMC
controllers configured for a 32-bit data bus but a 64-bit FIFO. On these
systems the 64-bit FIFO registers must be accessed in two 32-bit halves.

Add two new compatible strings, "samsung,exynos78xx-dw-mshc" and
"samsung,exynos78xx-dw-mshc-smu" respectively, to denote exynos78xx
boards that need this quirk. But it's very possible that all
"samsung,exynos7-dw-mshc" boards are actually affected.
---
 .../devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml         | 2 ++
 arch/arm64/boot/dts/exynos/exynos7885.dtsi                      | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
index fdaa18481..a72a67792 100644
--- a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
@@ -22,6 +22,8 @@ properties:
       - samsung,exynos5420-dw-mshc-smu
       - samsung,exynos7-dw-mshc
       - samsung,exynos7-dw-mshc-smu
+      - samsung,exynos78xx-dw-mshc
+      - samsung,exynos78xx-dw-mshc-smu
       - axis,artpec8-dw-mshc
 
   reg:
diff --git a/arch/arm64/boot/dts/exynos/exynos7885.dtsi b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
index 23c2e0bb0..4b94ac9da 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
@@ -294,7 +294,7 @@ pmu_system_controller: system-controller@11c80000 {
 		};
 
 		mmc_0: mmc@13500000 {
-			compatible = "samsung,exynos7-dw-mshc-smu";
+			compatible = "samsung,exynos78xx-dw-mshc-smu";
 			reg = <0x13500000 0x2000>;
 			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
-- 
2.38.3



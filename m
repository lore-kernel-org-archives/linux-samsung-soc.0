Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B3CC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Nov 2022 11:23:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbiKYLXP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 25 Nov 2022 06:23:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbiKYLWk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Nov 2022 06:22:40 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDF7EBE07
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Nov 2022 03:22:34 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id d3so4847586ljl.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Nov 2022 03:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tz3cZj02s7aotfkNU3pInJmLUet7fGFyUb52blcubmM=;
        b=toUdoUer8O6ICxYt2TX9P+gM3wg8szguyp3yhukHtWihLThomk5WlZCEpL2/n6fOvg
         jzDf0UAD657ZQouqG6igfQPAEi9ffKoeqLDSBsQ4y3y93K774gezh07URAAYgI9K7BFs
         0FGssY8APmAEH0lC4A+Yrs1fRkaFUT5o73xrYjXS68aPgEv3Clgw/Ti6CJRr3+etE7d3
         AH/qt1DAcF+lu4Hgw8KNCZKaTnna4kJ/+J70xFVfnVrrDhoj0vD2pV1QgjWG5fgL49Ea
         PGpRaEN2HetZMjg3Oz9CNAfbZF3Do1revE0NKbjb6bRkMolMwxlKfR+txLNC/BMSIYK0
         YDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tz3cZj02s7aotfkNU3pInJmLUet7fGFyUb52blcubmM=;
        b=wmw+6EcPQ3UaWHycKMwLMdQJcLMYQ8ar9kCNRcJbEGAlb44a8FoA8iya8U2Kd/76+e
         K8pfyzLw5MgUQMn2d5qBh+1e32aB+JUVCFKs+H8v8zyu0ASswcKB9GlVtmBRt04dvHtj
         B4tyeE9EIQrVXlTzevSWZ2n8abzZsaS6r6vSxKw4GE1SEvfxHBvvunwVa1HMMFXBVPNo
         QxGs/TRB7b5Z3epcB5z79XFJGX7fwcSkx5UIIeNbCO27lkRi8cgX46T86F14cHeEHLQx
         3G0dhtycvlDHeGLoEd42XUC5TjbvzxWGlFnUMjN1fI0SduApu6Uzf/8v/2stvQvscs03
         UwZg==
X-Gm-Message-State: ANoB5pk+Z6GzXaOAWiQ276tIAJhxtmr8SfQ0H8QFbhXg7uiY1fIlx4pX
        hneBjqMC4UR2H03z7EruxC8Hlg==
X-Google-Smtp-Source: AA0mqf7uHQRLxH002yhu3C+WeyylgDabaXzzY3G4vkTFf9b0YzmceNM7D5j1yDv35P4uyLdy+xF3GQ==
X-Received: by 2002:a05:651c:221e:b0:277:6231:5a7 with SMTP id y30-20020a05651c221e00b00277623105a7mr5755113ljq.300.1669375352556;
        Fri, 25 Nov 2022 03:22:32 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c1-20020a056512074100b004a478c2f4desm483904lfs.163.2022.11.25.03.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 03:22:32 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sriranjani P <sriranjani.p@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>
Subject: [PATCH 1/4] arm64: dts: exynos: add dedicated SYSREG compatibles to Exynos5433
Date:   Fri, 25 Nov 2022 12:21:58 +0100
Message-Id: <20221125112201.240178-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos5433 has several different SYSREGs, so use dedicated compatibles
for them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Sriranjani P <sriranjani.p@samsung.com>
Cc: Chanho Park <chanho61.park@samsung.com>
Cc: Sam Protsenko <semen.protsenko@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index bd6a354b9cb5..6976e45aa769 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1118,22 +1118,26 @@ hdmiphy: hdmiphy@13af0000 {
 		};
 
 		syscon_disp: syscon@13b80000 {
-			compatible = "samsung,exynos5433-sysreg", "syscon";
+			compatible = "samsung,exynos5433-disp-sysreg",
+				     "samsung,exynos5433-sysreg", "syscon";
 			reg = <0x13b80000 0x1010>;
 		};
 
 		syscon_cam0: syscon@120f0000 {
-			compatible = "samsung,exynos5433-sysreg", "syscon";
+			compatible = "samsung,exynos5433-cam0-sysreg",
+				     "samsung,exynos5433-sysreg", "syscon";
 			reg = <0x120f0000 0x1020>;
 		};
 
 		syscon_cam1: syscon@145f0000 {
-			compatible = "samsung,exynos5433-sysreg", "syscon";
+			compatible = "samsung,exynos5433-cam1-sysreg",
+				     "samsung,exynos5433-sysreg", "syscon";
 			reg = <0x145f0000 0x1038>;
 		};
 
 		syscon_fsys: syscon@156f0000 {
-			compatible = "samsung,exynos5433-sysreg", "syscon";
+			compatible = "samsung,exynos5433-fsys-sysreg",
+				     "samsung,exynos5433-sysreg", "syscon";
 			reg = <0x156f0000 0x1044>;
 		};
 
-- 
2.34.1


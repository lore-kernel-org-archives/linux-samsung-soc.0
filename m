Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B398EB64DD
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  2 Jul 2023 18:50:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbjGBSuT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 2 Jul 2023 14:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbjGBSuS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 2 Jul 2023 14:50:18 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE2FC5
        for <linux-samsung-soc@vger.kernel.org>; Sun,  2 Jul 2023 11:50:17 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-51d9865b8a2so4103758a12.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 02 Jul 2023 11:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688323816; x=1690915816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qH+P16GMJa4hg234EvRKnPWScihX6AijR7r6oKHaQCc=;
        b=zGdVsGmVOlI3E5pewBay7isTt0GFG60vdXTFXOWddj3Rzq0CtWchkFQ308Zjr3EJce
         RfMSVocXX+VVheLElteSsLpB607vuBJYInKcobiIKnC5EDCDPzk8gjLjFQ2J9SDmF00b
         g9/72TmJWGwNqBiSsdBo23GWpgiF8oaHzhRKc/OeYLzeDJs6wIaGKyYPefNiPDR5QK5D
         wIXQzeYmcSdwQKGntGXmpT/V0wvCkBL1dbiCdHLUuLfxIoDnzaMmKMo++9mxI2JtfXO4
         tbzjFHluIcu5MSvloqhwlTidlZcAWt5qsgb0eHCJvzHQynXj8blqNCk4SkLqxsgeyDIc
         ERQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688323816; x=1690915816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qH+P16GMJa4hg234EvRKnPWScihX6AijR7r6oKHaQCc=;
        b=JEwfQfmzftOaQc40XKXLjv5KoCZ+/1YoKy76E3/c3wFR3O5N565fcirBKB/gIFAPzr
         s6eOzoabXRFHkvHyxBLLRUw7gfEQU7S6IjzcvoMZHEDv6Dh9uQqNuvnMlW/RQCapVUbV
         uh1410V2VUcgJ3P6XT3OSqAKL2kijCEKJfxnc+vWRjdbSyhQbyK6IJNEVvN+IAebRF6n
         /YSV+WFF+D+oJMGrB9K7qDHg3UN9BD2JxpSsh0nf/wqA5em8YDeknHnid5B6uYMfnijb
         DY/09SQc5/r1JORzafRsh7ENnhmRMu2N/pPrcBQzNivJ0vntOJziQ7x/CcAf1TSP6NiW
         Rs5g==
X-Gm-Message-State: ABy/qLbuZC/ReYXUeB1r37RUAdulJOa0/Fc3fLbmnXocl90xTF+qKlgF
        Tw1bI7k8a58Xjj5ONRafHE93NKL7fjyE7CA3UwCxjg==
X-Google-Smtp-Source: APBJJlE8+ONhvnN7VGJb6jOcm8M40yva8rsSBl+DxwHXyrAXb/D0YHrte27DiPV2x7gSlma9WG+GKQ==
X-Received: by 2002:a17:906:cf87:b0:992:b9f4:85db with SMTP id um7-20020a170906cf8700b00992b9f485dbmr5690357ejb.39.1688323815717;
        Sun, 02 Jul 2023 11:50:15 -0700 (PDT)
Received: from krzk-bin.. ([217.169.179.6])
        by smtp.gmail.com with ESMTPSA id k25-20020a17090666d900b00982842ea98bsm10861789ejp.195.2023.07.02.11.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 11:50:15 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] arm64: dts: exynos: minor whitespace cleanup around '='
Date:   Sun,  2 Jul 2023 20:50:09 +0200
Message-Id: <20230702185012.43699-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The DTS code coding style expects exactly one space before and after '='
sign.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 5ea8bda2bfa6..54ed5167d0f6 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -138,10 +138,10 @@ gic: interrupt-controller@11001000 {
 			#interrupt-cells = <3>;
 			#address-cells = <0>;
 			interrupt-controller;
-			reg =	<0x11001000 0x1000>,
-				<0x11002000 0x2000>,
-				<0x11004000 0x2000>,
-				<0x11006000 0x2000>;
+			reg = <0x11001000 0x1000>,
+			      <0x11002000 0x2000>,
+			      <0x11004000 0x2000>,
+			      <0x11006000 0x2000>;
 		};
 
 		pdma0: dma-controller@10e10000 {
-- 
2.34.1


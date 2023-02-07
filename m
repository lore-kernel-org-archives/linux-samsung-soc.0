Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C41C636CC
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Feb 2023 19:33:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbjBGTdD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Feb 2023 14:33:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjBGTdC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Feb 2023 14:33:02 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 257C83B655
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Feb 2023 11:33:00 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so12326145wms.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Feb 2023 11:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aDwz8ebyu9Jo7GZkf4h4ogBfSjVLdYt8W82W2oxUCBw=;
        b=o1nMqJ1JV7BH6nSbGoYhVezSQWYdsIwIHO2oFzyFGogxcJLHmPwe9icRyVU0CPVRdH
         LdQqsnc/XihYDgSfu5KXBhnFDFmQir7OHeNwLDLeIU+MXVG43QgTJJz79R7ouJVp2EGY
         xNhhFAW/mVyxPwXlrUopmdxEV+2L1ze0sqg2pLkgT+CEuRRzfTZ34oo7qz4WQF69LkpY
         AOT/DavIzxwqnyX5RijMWO+3tmStjS/teYbwI4aow06M7dAROfuyl6Dwv5oIuFYM84XV
         LNhbk2fdCDUAemNW3cKZi8CB5yMAIlLViRFK6RSlCC2WpOE103o9kAMVpKoArOP94U8h
         gndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDwz8ebyu9Jo7GZkf4h4ogBfSjVLdYt8W82W2oxUCBw=;
        b=yizZzuYf4UuGjLkfatD0cCWZadAonWvpHDhzcpkDaAifU2xAZrjrtM2l6nE/etRYWh
         iY76xSJz6iyMSS5YW6U1TWDum8h72PgKTPmlWV38GcweVwQcnKqUecRoxP1xo9m39R16
         knAU269URc367oNFPZFNTlTZLAkSUpCZVxGXtENWTCBwbqMWivH0iYK/6IC08LiCeCgs
         DYVHjlPh3QVdY5dcxcgCNw0TgfyrmMt3YkqweB0t+xYujrURyqkcE+N22AvLJ26JGvvj
         ZpCA74gjd72Ys7PoQc2+/T0YWrA4H5YkOdp/KXnMuu6sB20m/9gh6/D49B+XIDK8CfjT
         gGeQ==
X-Gm-Message-State: AO0yUKW7nd3Txo3e3QSdLSNukkLorEE462FQaEwrbE9lUvxR57ywIPTi
        BtCrzeKpy9v1vAFWQzLrp/SswA==
X-Google-Smtp-Source: AK7set92ZR+qa3SVZ8aNN05BcIhoOfWWX1JrmGGCPTSPHm3q4M3R/VGXCw3bbDGaZvrte7sR/+oijw==
X-Received: by 2002:a05:600c:713:b0:3df:e4b4:de69 with SMTP id i19-20020a05600c071300b003dfe4b4de69mr4118923wmn.27.1675798378737;
        Tue, 07 Feb 2023 11:32:58 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d17-20020adff851000000b002c3dd82a0e9sm9199448wrq.91.2023.02.07.11.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 11:32:58 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ARM: dts: exynos: drop simple-bus from FIMC in Exynos4
Date:   Tue,  7 Feb 2023 20:32:53 +0100
Message-Id: <20230207193254.550236-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The FIMC camera node wrapper is not a bus, so using simple-bus fallback
compatible just to instantiate its children nodes was never correct.
Dropping simple-bus node fixes warnings:

  exynos4210-smdkv310.dtb: camera: $nodename:0: 'camera' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'

The change is not backwards compatible and expects the FIMC driver to
populate its children.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on:
https://lore.kernel.org/linux-samsung-soc/20230207192914.549309-1-krzysztof.kozlowski@linaro.org/T/#t
---
 arch/arm/boot/dts/exynos4.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 8dd6976ab0a7..434025331041 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -201,8 +201,8 @@ dsi_0: dsi@11c80000 {
 			#size-cells = <0>;
 		};
 
-		camera: camera {
-			compatible = "samsung,fimc", "simple-bus";
+		camera: camera@11800000 {
+			compatible = "samsung,fimc";
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.34.1


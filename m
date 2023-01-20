Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B8CC25B50
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 07:12:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbjATHMM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 02:12:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbjATHML (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 02:12:11 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C865CE68
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jan 2023 23:11:58 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so406404wmq.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jan 2023 23:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i3+Bkk+XIU7Y4ICBofg74wb2Khfebi4kOszzdZMn3mg=;
        b=ZafJBSbiARhqyQ+ssIrBJPwCDCTw8hwzqRdhRLUocHV8pBmbdzLVZ8/wzLiVgDdk5r
         5wtITDv5Fwus1LjK7H0CGSINKU15KVD6KqKeA0GJlalHg2KJkB+Im6Fl905QWItN1QEC
         v6E695HBTdZRsL5PBBu4HXvbMHMDDNBhdiNljf6hcMRLE0/DeHi+UOVYeK7Zt62iTa3o
         zp4GmEyDAKCsj4G7M+6BBR0NAmrsXph/uTr5hR+gU1QoXrpxTbQW1GaPGdIMXKuOTucu
         4M7ONLVBauSkuyAzE0k33L5VaMucqHDtuorCuPU5gf9Vds2Gbud/rrPK8dvCDEo2/ycb
         omvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3+Bkk+XIU7Y4ICBofg74wb2Khfebi4kOszzdZMn3mg=;
        b=1+WGjSE2sUDixXG1afiN/zlhBfM1y0U9cFIOGT26TN3/SGOGZAJ8aFiWPdqy8bG54O
         MwUZAhJau+PeUR8ODzLHiDmp6KzEa8r7HcsNgrYbhWfIlYjfwsOkniRM3FhdQ8+h+9WF
         CC11787kzLg2okikTWHGPEpypHKjWxwqIndK6ReQ8VoOO1irutpepyc0Ov2iqsfGIjL6
         LccAIe75HMrLGgvUEW94Kza/gk51xj6yjP60J14Z18/dJNayaaLY4EGSWUXFKyekNiGV
         Fdd8CsOsT/M/vvfslpnX8wQH2vq/9vpC2g9ot2xWoAzXEp9WovpNnHFODdVgAsNVCV4m
         OlSA==
X-Gm-Message-State: AFqh2kr2aXWk62SxxpNFvmPS9wnBBTG/TugibsA5vbhv/I32D9SiD4hb
        gf13Uin1L/0+g+4df6ydcME+fA==
X-Google-Smtp-Source: AMrXdXt7+nh8ca7/1yrIp9E/1nrNSGJ4aQFzrZgnmtyQHesPuo7ROe81rlXJlua239KYSzV7UlASFA==
X-Received: by 2002:a05:600c:4e93:b0:3db:d3f:a91f with SMTP id f19-20020a05600c4e9300b003db0d3fa91fmr10681001wmq.23.1674198716414;
        Thu, 19 Jan 2023 23:11:56 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l30-20020a05600c1d1e00b003c6b70a4d69sm1386377wms.42.2023.01.19.23.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 23:11:55 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: exynos: drop incorrect power-supplies in P4 Note
Date:   Fri, 20 Jan 2023 08:11:51 +0100
Message-Id: <20230120071151.116272-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

simple-battery does not have supplies, but it is referenced by charger
instead:

  exynos4412-p4note-n8010.dtb: battery-cell: 'power-supplies' does not match any of the regexes: '^ocv-capacity-table-[0-9]+$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-p4note.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-p4note.dtsi b/arch/arm/boot/dts/exynos4412-p4note.dtsi
index 7a515b87bc7c..e41cf3ed362d 100644
--- a/arch/arm/boot/dts/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/exynos4412-p4note.dtsi
@@ -132,8 +132,6 @@ battery_cell: battery-cell {
 		precharge-current-microamp = <250000>;
 		charge-term-current-microamp = <250000>;
 		constant-charge-voltage-max-microvolt = <4200000>;
-
-		power-supplies = <&power_supply>;
 	};
 
 	i2c-gpio-1 {
-- 
2.34.1


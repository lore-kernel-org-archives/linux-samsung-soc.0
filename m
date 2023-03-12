Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F71BC6FD19
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 12 Mar 2023 18:25:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbjCLSZH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 12 Mar 2023 14:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232318AbjCLSYv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Mar 2023 14:24:51 -0400
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA846905D
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 11:17:53 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id f16so10385813ljq.10
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 11:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678644704;
        h=cc:to:subject:date:from:in-reply-to:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rC/o1AQDcGAyPZ0tU6+VZIwVNayEqqDcPKH36IGj0wI=;
        b=Bjoj1S0EQ3nkblsbxvnueg540So/ragV5zW7BBKaESp8iU1LuECMUeIGeImVFPhvct
         gUK8mN0tDEn05utCq045NVz9/iLAhQkjdeEXdhWKXl+DJLqQgM/gLijG5uNXVg49CTpb
         1b1Pt7BUzrC+X7Na0MPTtKtLUl16rEA4Wrx2pALRoOHbAHLAJHMJEqCU9dXDq/18TjgP
         20F+cnip1jaHTzA6zCEAB5XhaHH0cXwVzI5ey9He1ac/9jOh37uuXA3KvHhXguB6Dnvb
         k+TI0oc8G90WnQjhn1HyxRdI/HZ6ThFxADmdUWOXCSkQEGIeyuitwRNeAGwKAyJXBen6
         R5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678644704;
        h=cc:to:subject:date:from:in-reply-to:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rC/o1AQDcGAyPZ0tU6+VZIwVNayEqqDcPKH36IGj0wI=;
        b=mpw1YsB6xuuts7WRQjvpz9LPBX7IsriLADnrXwLsTDKGIF/LOlmkJ1SNnpt1D3ft3K
         8EUxS7wggjpLXkSkfqBQY6l8jp34Ggv9Gz6POq7no7TOK4z36faRbqzD+a17W5s/Zq9h
         OysnWZwBUH/nMYgJZIV6d8zNLmsup+r2pdadIeU6FcTcH4bIWbbfDTPZOiAEXgCYHzVL
         IfpsBeZLl8BD+9/JbCFgl9cqEP4hz8A5O/v0j8+k6lLa1lJlm0VZDNmI4Pmjt3ZyG0V0
         g9KinlFuI4IIndqrarNpV6Ey8N4VgYHHYl9F1vFLhHo0XQup3fQX8dHdAsaSXcKPOJDG
         hGWA==
X-Gm-Message-State: AO0yUKXvdo+ZfD17HBsNPdd1bH7fRC+wv/iAIh4oNUyQ/3SADc5V00jL
        fOucsVZ4p8Ih55BhEM6SFykZ1aDu83a2MVS3
X-Google-Smtp-Source: AK7set97YdzV5ot/3klk5YmDmpCdIaKTUmPak62EXa0iPBKROOH+M9WHoxMLhrj3PWZzxOoYFVkkxg==
X-Received: by 2002:a2e:b17a:0:b0:293:32e0:5c8a with SMTP id a26-20020a2eb17a000000b0029332e05c8amr9142247ljm.15.1678644703932;
        Sun, 12 Mar 2023 11:11:43 -0700 (PDT)
Received: from 0003-arm64-dts-exynos-fix-wrong-mmc-compatible-in-exynos7.patch (46-138-144-249.dynamic.spd-mgts.ru. [46.138.144.249])
        by smtp.gmail.com with ESMTPSA id s21-20020a2e9c15000000b00295765966d9sm718324lji.86.2023.03.12.11.11.43
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 11:11:43 -0700 (PDT)
Message-Id: <1678644516.665314-3-sleirsgoevy@gmail.com>
In-Reply-To: <1678644516.665314-0-sleirsgoevy@gmail.com>
From:   Sergey Lisov <sleirsgoevy@gmail.com>
Date:   Sun, 12 Mar 2023 20:58:50 +0300
Subject: [PATCH v5 3/3] arm64: dts: exynos: fix wrong mmc compatible in
 exynos7885.dtsi
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

This DW-MMC variant is not actually compatible with
"samsung,exynos7-dw-mshc-smu", and requires an additional quirk to handle
very short data transfers, typically used by SDIO cards. Update the
compatible string to "samsung,exynos7885-dw-mshc-smu" to reflect this fact.
---
 arch/arm64/boot/dts/exynos/exynos7885.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885.dtsi b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
index 23c2e0bb0..b0addb0b3 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
@@ -294,7 +294,7 @@ pmu_system_controller: system-controller@11c80000 {
 		};
 
 		mmc_0: mmc@13500000 {
-			compatible = "samsung,exynos7-dw-mshc-smu";
+			compatible = "samsung,exynos7885-dw-mshc-smu";
 			reg = <0x13500000 0x2000>;
 			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
-- 
2.38.3



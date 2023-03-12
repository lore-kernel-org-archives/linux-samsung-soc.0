Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2831C6FD1C
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 12 Mar 2023 17:03:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbjCLRDR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 12 Mar 2023 13:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231232AbjCLRDK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Mar 2023 13:03:10 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3786C1024E
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 10:03:08 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id m6so12869408lfq.5
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 10:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678640586;
        h=cc:to:subject:date:from:in-reply-to:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yNccjh9ehO5GzEa2MK08HfZDjH6EdpZB9/Uqslpa9j8=;
        b=GBebKeXkPCIvN9CvF9Uv06Be+Od1C8V2cwgfOHMDFEunwxnsijCUcOZIA5UFEX0RIA
         19LKlsxMcVe6zazuKH4HxO6A3cYlrl0Ti84OXr2in9b7m15wBBHmia/TLHpgbnDBglad
         KYMVZq+6HLmCD93vqhqttIw5UhNd4b95Uo6tQo0LgfRG03Yp42ot0jXJyqCwrEBOH561
         WKnflqDeQhWXVuplaypwj7q7+2ItHfkNZ86vDLo15nME0jdndWgEoIyGlotOcEJ5zol0
         ya37y+UkY7IcSzvCH+xR4LFWHgsjpz/oX9b+NBXFRL4i4WDIeEJ9A1bun3/4ce1Axrlk
         05lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678640586;
        h=cc:to:subject:date:from:in-reply-to:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yNccjh9ehO5GzEa2MK08HfZDjH6EdpZB9/Uqslpa9j8=;
        b=uw/EAxfN3mXkyiXH+Di1XzN2VIxwoIsUaSRcSFnABjm2i0LeOcn1OqM1uRt5S5tipl
         sReIxYAfUPHK1lKJQQ46U8eUeEB2POSCwXEdZ7Fxt/oL1f9V6v5t6cN7dSvs02vDIJF+
         6+9j6tKeq6/AYsgP2lC1boMebcf5QXE7NfXq1C0R36/7v13OMEPY1RlDipodjnek+wSt
         YVRsxTFheFu3wS5MDI07JhhmZrYxnALwAzcPxkDMWuVrycPbmzYiNGYOc8I4KB2FuMgT
         CyhNkghP5ILRTTK+/DrYER4VQkGxKRejAEZsrtonl7Nz34rrNzacG9LH69smoDVJBslm
         HGkA==
X-Gm-Message-State: AO0yUKWI0Jt8AyzYshnQo5X7w0wosb8h6t6uoEM+a7zGtftBmJyE75h6
        EEbkW0hmj/Qv7hyRejPtPE5ELXLwVFm9Lu4d
X-Google-Smtp-Source: AK7set+d427OnZV5tUz+Hop1WyeOExN3uza9xAgETWDMBsT6dUAEwPT8nVDYk2koaXKIzt//Rc+DZQ==
X-Received: by 2002:ac2:5103:0:b0:4db:3848:86af with SMTP id q3-20020ac25103000000b004db384886afmr8505415lfb.12.1678640586292;
        Sun, 12 Mar 2023 10:03:06 -0700 (PDT)
Received: from 0002-arm64-dts-exynos-fix-wrong-mmc-compatible-in-exynos7.patch (46-138-144-249.dynamic.spd-mgts.ru. [46.138.144.249])
        by smtp.gmail.com with ESMTPSA id l23-20020ac24317000000b004d8584970b8sm698249lfh.226.2023.03.12.10.03.05
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 10:03:06 -0700 (PDT)
Message-Id: <1678640497.9030156-2-sleirsgoevy@gmail.com>
In-Reply-To: <1678640497.9030156-0-sleirsgoevy@gmail.com>
From:   Sergey Lisov <sleirsgoevy@gmail.com>
Date:   Sun, 12 Mar 2023 19:59:29 +0300
Subject: [PATCH v4 2/3] arm64: dts: exynos: fix wrong mmc compatible in
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
very short data transfers. Update the compatible string to
"samsung,exynos78xx-dw-mshc-smu" to reflect this fact.
---
 arch/arm64/boot/dts/exynos/exynos7885.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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



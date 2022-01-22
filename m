Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00044C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 22 Jan 2022 13:26:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233066AbiAVN0D (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 22 Jan 2022 08:26:03 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:44426
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232976AbiAVN0C (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 22 Jan 2022 08:26:02 -0500
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3F5C13F1C1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Jan 2022 13:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642857960;
        bh=8fMesucJS/Q/CHcDtWavokH1YLXI1OKktuJiUdUDTLs=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=GFwiiVlvJDuXIgHLpov9RN5ZZHXnXsLy1H6UGg5Ogne+c36chhV/YYe/d2g6GIsl0
         Nx3XtK+ZV8g2wRr4VrqnE4kZoock8wwVJVhzTC4PGyDnjPIjams7o0lou4klDDBab2
         JnsS56iURSxCttm9O5EO7S7uYN+NvFN7pGJd8ApP55XmTrlFLmqFWa5NVYr3omCQkA
         +1P8ORGzgqYj7sz+fGSDlZy9gelX5n30J4i7TzKCcn2osguKFsXSzBuux3kWKesJBD
         3sf7wF//KbGvGF3aFysWIFTXjSg0TSvrXTzik4h8PP/9cKy3W3Au4TvdKgmTpUDOba
         7l/xWjnIjseFA==
Received: by mail-ej1-f72.google.com with SMTP id p8-20020a1709060e8800b006b39ade8c12so952069ejf.10
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Jan 2022 05:26:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8fMesucJS/Q/CHcDtWavokH1YLXI1OKktuJiUdUDTLs=;
        b=EeOpQ948aCFRVIkSfzFdsAHOp0OwDLf5zEZjZsxpMImtRm0d4tT6cwY1oRaIvX640i
         9UtzKr2Y9sFT2GXrXfDSxs8z5A0dRUV7YmGcbkgI8sZw+G/9tcbtlv/PkG51/rnoMSLR
         4mS4B7Wf7pLmnzZc364yLvJVViSxtxYmB0KA9zGzP04PB3fYlkVpIXRDQR9Hm5Vd0UIi
         fY9SAlUC7u3klqNU7qNor+xfvcyjELpJYt0fr/tNQu7Fs8fkU0hhUvoXHopiavFHILuZ
         o78IqB/PBgRMX9mN98ad26S923VWiN0B16pnF/1ajD567t5m82V5VYs8LhvaaCYvwBDp
         zG4A==
X-Gm-Message-State: AOAM530VI3cNi7FbEQt/0O+tJWeOqdUKs9bjQXVk6U6IS4PLZUSp82VB
        KWKARL1mapf4rpNSbmog9cyWfMNRUeOq9EyPQEoQ2IvIfeqIIy6zuYHdLBLLdwVZJMYzI1Lfgmd
        l78tQMpAnAyky4i+CT6NOyGwVyVD3+cAENpDhhHqa8Oi+dRue
X-Received: by 2002:a17:907:2da3:: with SMTP id gt35mr6700213ejc.493.1642857958473;
        Sat, 22 Jan 2022 05:25:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNLq+wl/T1aIhyqPK0PgngG1nTaJ+rpaL0m5ALl8KOG7N8L+TA5ORWK4t1DsKSjwTs3nbw4w==
X-Received: by 2002:a17:907:2da3:: with SMTP id gt35mr6700198ejc.493.1642857958277;
        Sat, 22 Jan 2022 05:25:58 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id v2sm2373060ejb.114.2022.01.22.05.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 05:25:57 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ARM: dts: exynos: drop old thermal properties from Exynos4210
Date:   Sat, 22 Jan 2022 14:25:52 +0100
Message-Id: <20220122132554.65192-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The samsung,tmu_gain and samsung,tmu_reference_voltage properties of
Exynos Thermal Management Unit driver are not used since April 2018.
They were removed with commit fccfe0993b5d ("thermal: exynos: remove
parsing of samsung,tmu_gain property") and commit 61020d189dbc
("thermal: exynos: remove parsing of samsung, tmu_reference_voltage
property"), so drop them also from Exynos4210 DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

I'll take this patch via Samsung SoC. Adding here for reference, so
Rob's robot will not spot DTS issues when checking against dtschema.
---
 arch/arm/boot/dts/exynos4210.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 7e7d65ce6585..2c25cc37934e 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -527,8 +527,6 @@ &tmu {
 	compatible = "samsung,exynos4210-tmu";
 	clocks = <&clock CLK_TMU_APBIF>;
 	clock-names = "tmu_apbif";
-	samsung,tmu_gain = <15>;
-	samsung,tmu_reference_voltage = <7>;
 };
 
 #include "exynos4210-pinctrl.dtsi"
-- 
2.32.0


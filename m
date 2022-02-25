Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A35C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Feb 2022 15:37:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242195AbiBYPiJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 25 Feb 2022 10:38:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242187AbiBYPiG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Feb 2022 10:38:06 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFECE70072
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Feb 2022 07:37:33 -0800 (PST)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 60A153FCAD
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Feb 2022 15:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645803452;
        bh=UZI/W2JahxU89dnjOf2ONuJlruSbsJiXCZ4vcoyOmqk=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=dN5CT18DP/v9X/4ROhLeOSq3o9D0hm+Y0n+MCoQJKjnmkpoTv5PqZh1atKlm3l0SR
         z+I06B7PUiXW4OT/inib0ywgCFPILQqoDXIJBhx9HSnUbd86CHdaz/ny1WBPX2MbVI
         nC9MLyWiNqjiizA74Wtbt6izNBk8Cko9kpRSlaV24CL6RioG6sTIEhcrerFO0EcSoJ
         yajLpkhBezGeuY1BzZQ/poxVn9KwmvlPDpc1jSi1bGFzJLN02r/ESJySAGufy1kSxn
         LP9fyOsRavKX73k8q5PJAuPGUfTgibrm5WstSU78AojGxUYmAxMJzl5nqirbRkwH0P
         qMiUWDerUy0Hg==
Received: by mail-wr1-f71.google.com with SMTP id w2-20020adfbac2000000b001ea99ca4c50so1026063wrg.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Feb 2022 07:37:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UZI/W2JahxU89dnjOf2ONuJlruSbsJiXCZ4vcoyOmqk=;
        b=tqOHH1eEjzEdw4doo0Zh0kyO3FrX3xD0rM8vAq4D/5gRMYS//VtZFhgbaA7SChC6w/
         rjsygJP0ESm1F2iJrW2X2AjVmsIBuRSEOSB5IVAxEbzxscpmTcXylmr0eLwbAq3uFk9S
         LanOhXuaM7eQhfx/2uyp01qt3VmHobiM+Rri/OBu+/3cIAJMkSE+9MZYUjnUj2fcE0VH
         Kpma71lgpxavnRZsF1B8etwM+VEuKfddt0S32i1WdSMGbpmka4XzFKVwW3CUtAiFJhwV
         u6iySJv9AHfaVl6MYj1Yfl1Pyj5K7NDKE8z/ueWX26e9cgu2bzNKbGuursFLo/TIuVCl
         uUHA==
X-Gm-Message-State: AOAM530G2isFZU5UAMBsKsZOV6LiXNMdfR18EU9CwuwGxJ0bnWLnZ8+i
        D0skJTbdP65Rdbji63Q0U49ToUr+oW6laMU2/5Td1gJtO3yAJS+mNt2cWnOKesIBVOqyfuT7aZz
        /QpE2+5gj7q3r5e8DiDpy0XtROMlXgmuqCPZ6bETlwtXun+Mx
X-Received: by 2002:a05:600c:4fd0:b0:37b:ddf7:aeb9 with SMTP id o16-20020a05600c4fd000b0037bddf7aeb9mr3296666wmq.190.1645803451237;
        Fri, 25 Feb 2022 07:37:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIFKEf+6La7szHsSP99MDMXNfHBPihThkLUvVYK9XyumQ4jUFIYy/zF/Tl0PvKABo2wryFaA==
X-Received: by 2002:a05:600c:4fd0:b0:37b:ddf7:aeb9 with SMTP id o16-20020a05600c4fd000b0037bddf7aeb9mr3296649wmq.190.1645803451088;
        Fri, 25 Feb 2022 07:37:31 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id p15-20020adfce0f000000b001edc0bcf875sm2647168wrn.102.2022.02.25.07.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 07:37:30 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: exynos: add a specific compatible to MCT
Date:   Fri, 25 Feb 2022 16:36:50 +0100
Message-Id: <20220225153650.289923-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220225153650.289923-1-krzysztof.kozlowski@canonical.com>
References: <20220225153650.289923-1-krzysztof.kozlowski@canonical.com>
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


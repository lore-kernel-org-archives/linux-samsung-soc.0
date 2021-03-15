Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1B2C4332D
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Mar 2021 12:44:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D459F64EE1
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Mar 2021 12:44:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbhCOMnr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 15 Mar 2021 08:43:47 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33255 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhCOMnU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 08:43:20 -0400
Received: from mail-wm1-f71.google.com ([209.85.128.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lLmZ5-0004h3-Ar
        for linux-samsung-soc@vger.kernel.org; Mon, 15 Mar 2021 12:43:19 +0000
Received: by mail-wm1-f71.google.com with SMTP id s192so8142186wme.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Mar 2021 05:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ap5ykNmpsbJrdR3iXM5yH1laQEs7sajDaAHvKopsfYY=;
        b=gn8pw2K0M1LkxMq7pE0VFbIfF392ulIjFVVejTgaA+mKFQL6nkikl/slrTsuby3AWF
         t+6yWyLCKgRpOu9iRCmtRtS5md0GzUq0Ans3xK8aq0goLfbnqDT7ADTFWTz4rex6sONd
         ugAdYdnvMmfgs4yVdOIDiuF7e72izU7xkHvpxa8jM6d3EhgJePvYQs/dwIa2cMvugdoK
         7CE2DMMCPdPArC5ZWzd1+EwmnEv5jyPq0f1pntTokv3YL2S/Fvdha4RTs26tIYwGe/A7
         12oeyDDo4XnUUZf6KBib8RZigSv70WRityhHvgQzZjCXX2oMRjG53x2DRYDK+6tOv16B
         wK4Q==
X-Gm-Message-State: AOAM532yq+PgoPAqahqHeV26ELSOqYgU3Dm6VipELd2++xQcdKDhu750
        Lbe9O5l1tREAyPypUYXGD5mbN28h4Pe25O70ouUDRs5fqYNZ6mT0q8QVRUIVKC4jGq+lAqQqwy1
        1ybvoteyVQKTSwlPKL8dh6Plmz6H465aDOj1M2POkhYZrfNWj
X-Received: by 2002:a1c:dd89:: with SMTP id u131mr25312313wmg.54.1615812199079;
        Mon, 15 Mar 2021 05:43:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmU1m3dmd00t2dinw2OgM+pPhoIqpEjxFpRuHHFrZ/nlHv0DtmWmNj9mLulLOyG1tXv3t5pg==
X-Received: by 2002:a1c:dd89:: with SMTP id u131mr25312303wmg.54.1615812198908;
        Mon, 15 Mar 2021 05:43:18 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id r10sm14410094wmh.45.2021.03.15.05.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 05:43:18 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 1/3] ARM: dts: exynos: replace deprecated NTC/Murata compatibles
Date:   Mon, 15 Mar 2021 13:43:11 +0100
Message-Id: <20210315124313.114842-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The compatibles with "ntc" vendor prefix become deprecated and "murata"
should be used.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos3250-monk.dts   | 4 ++--
 arch/arm/boot/dts/exynos3250-rinato.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250-monk.dts b/arch/arm/boot/dts/exynos3250-monk.dts
index fae046e08a5d..8b41a9d5e2db 100644
--- a/arch/arm/boot/dts/exynos3250-monk.dts
+++ b/arch/arm/boot/dts/exynos3250-monk.dts
@@ -142,7 +142,7 @@ &adc {
 	assigned-clock-rates = <6000000>;
 
 	thermistor-ap {
-		compatible = "ntc,ncp15wb473";
+		compatible = "murata,ncp15wb473";
 		pullup-uv = <1800000>;
 		pullup-ohm = <100000>;
 		pulldown-ohm = <100000>;
@@ -150,7 +150,7 @@ thermistor-ap {
 	};
 
 	thermistor-battery {
-		compatible = "ntc,ncp15wb473";
+		compatible = "murata,ncp15wb473";
 		pullup-uv = <1800000>;
 		pullup-ohm = <100000>;
 		pulldown-ohm = <100000>;
diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index d64ccf4b7d32..c52b9cf4f74c 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -142,7 +142,7 @@ &adc {
 	assigned-clock-rates = <6000000>;
 
 	thermistor-ap {
-		compatible = "ntc,ncp15wb473";
+		compatible = "murata,ncp15wb473";
 		pullup-uv = <1800000>;
 		pullup-ohm = <100000>;
 		pulldown-ohm = <100000>;
@@ -150,7 +150,7 @@ thermistor-ap {
 	};
 
 	thermistor-battery {
-		compatible = "ntc,ncp15wb473";
+		compatible = "murata,ncp15wb473";
 		pullup-uv = <1800000>;
 		pullup-ohm = <100000>;
 		pulldown-ohm = <100000>;
-- 
2.25.1


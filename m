Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 026A7C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 17 Oct 2021 10:12:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D82A5611C1
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 17 Oct 2021 10:12:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241790AbhJQKOo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 17 Oct 2021 06:14:44 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:58842
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234709AbhJQKOn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 17 Oct 2021 06:14:43 -0400
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7CB3040006
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Oct 2021 10:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634465553;
        bh=uecOb7N7tV/LWWMrNnMwWfkrdzrnfLrEO1+TCM57vo8=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=QhiIvqunw+PX//UY2Tzz2AkuPaPCQgQJz9m7gjFWNS5v2jtUghSI9UW6Y4Mj4lNj5
         fqODsz/H8InTGYmS0qzuCgdYOqo5ddKGEpK8KyI6UgycGLaa2CXj655KegzcU1eq+C
         oTlxqDcMqx8OEBpdscBU/0sYZF5uFHpirve76j77CcCoy230oh4EMF7RUAKwVXPoj0
         +hgRPn6NJTt0b36ZrkuLqGjYa8jyTTBDWYmCqYatSuV/1KEe9DSoaLQK7Jjb5RPx9w
         NeAkNRzf0CSeMYuhNZekiCGsS6k8snCQisAXTsu5OmJgK0LRwE8A8eefTrg6LY2gE5
         v1bckv5kL/adg==
Received: by mail-lj1-f200.google.com with SMTP id j12-20020a2e800c000000b00210c475e1aaso260411ljg.15
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Oct 2021 03:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uecOb7N7tV/LWWMrNnMwWfkrdzrnfLrEO1+TCM57vo8=;
        b=vzBr+0LU7WQPNDfYiUM5S0/yZQXa1gM6jBt0YQ7cn5G1S106VbZ3xKX2a0+rmHx3VZ
         CaJEVNyTH8acgWp6bAMFs72vk/4LxURNFOBPh0bYVThGEZmKBz1tPujeXTOqF+Et/yH6
         m23d2t5CQMkvH/sP19DHWomlglvTCJQqhow67j08bCnQWDTLbeFOCUD22YrytarAT1ZG
         0vMybly38TtlS+3xWGPq0cdTbOs3Hq7yA8UW+73Bdrmh4dhppZJ/tbkQ0g3Fu29ELtYG
         Zc3KtzF5IddEk9/oTL+vIM5v8TATRGi8Ew906jUiLwMOFKDpUy5tSW8gWNOG36u7TiHI
         XGhQ==
X-Gm-Message-State: AOAM533SjFcYu/PjgAtAKNnZEhYveMPKfaCDd9QKJnpzpfA+PO9weYxp
        O2EuFVzjbn3rDNIaIJR7CSXAP6pvDNEMYagCXuRTKO6U/cAdqwSE56Rjemz/hqqP5k4nwL2xkZv
        kt58w77XQGMRe29YuqntVZrGCRz4Ahpgd+thO/f4Fes639YRs
X-Received: by 2002:a2e:a4a9:: with SMTP id g9mr24341740ljm.245.1634465552825;
        Sun, 17 Oct 2021 03:12:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEEyrgMvNW4cONRNXv+WaNYi8KqpqiX2ZTRhTHA+/5IFmhPfe0LoAvEqgcrOnG/zghLkNJwA==
X-Received: by 2002:a2e:a4a9:: with SMTP id g9mr24341708ljm.245.1634465552522;
        Sun, 17 Oct 2021 03:12:32 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id o26sm1263077ljg.92.2021.10.17.03.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 03:12:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 2/3] ARM: dts: exynos: add 'chassis-type' property
Date:   Sun, 17 Oct 2021 12:12:27 +0200
Message-Id: <20211017101228.19478-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211017101228.19478-1-krzysztof.kozlowski@canonical.com>
References: <20211017101228.19478-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

A new 'chassis-type' root node property has recently been approved for
the device-tree specification.

Add this property for end-user devices (such as laptops,
smartphones and tablets) based on Samsung Exynos ARM SoCs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos3250-rinato.dts         | 1 +
 arch/arm/boot/dts/exynos4210-i9100.dts          | 1 +
 arch/arm/boot/dts/exynos4210-trats.dts          | 1 +
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 1 +
 arch/arm/boot/dts/exynos4412-i9300.dts          | 1 +
 arch/arm/boot/dts/exynos4412-i9305.dts          | 1 +
 arch/arm/boot/dts/exynos4412-n710x.dts          | 1 +
 arch/arm/boot/dts/exynos4412-p4note-n8010.dts   | 1 +
 arch/arm/boot/dts/exynos4412-trats2.dts         | 1 +
 arch/arm/boot/dts/exynos5250-snow-rev5.dts      | 1 +
 arch/arm/boot/dts/exynos5250-snow.dts           | 1 +
 arch/arm/boot/dts/exynos5250-spring.dts         | 1 +
 arch/arm/boot/dts/exynos5420-peach-pit.dts      | 1 +
 arch/arm/boot/dts/exynos5800-peach-pi.dts       | 1 +
 14 files changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index f6ba5e426040..5f7f8fedfb92 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -19,6 +19,7 @@
 / {
 	model = "Samsung Rinato board";
 	compatible = "samsung,rinato", "samsung,exynos3250", "samsung,exynos3";
+	chassis-type = "watch";
 
 	aliases {
 		i2c7 = &i2c_max77836;
diff --git a/arch/arm/boot/dts/exynos4210-i9100.dts b/arch/arm/boot/dts/exynos4210-i9100.dts
index 55922176807e..19bb7dc98b33 100644
--- a/arch/arm/boot/dts/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/exynos4210-i9100.dts
@@ -18,6 +18,7 @@
 / {
 	model = "Samsung Galaxy S2 (GT-I9100)";
 	compatible = "samsung,i9100", "samsung,exynos4210", "samsung,exynos4";
+	chassis-type = "handset";
 
 	memory@40000000 {
 		device_type = "memory";
diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 3eb8df319246..9c4ff7521348 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -16,6 +16,7 @@
 / {
 	model = "Samsung Trats based on Exynos4210";
 	compatible = "samsung,trats", "samsung,exynos4210", "samsung,exynos4";
+	chassis-type = "handset";
 
 	memory@40000000 {
 		device_type = "memory";
diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index f052853244a4..9f93e7464aed 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -16,6 +16,7 @@
 / {
 	model = "Samsung Universal C210 based on Exynos4210 rev0";
 	compatible = "samsung,universal_c210", "samsung,exynos4210", "samsung,exynos4";
+	chassis-type = "handset";
 
 	memory@40000000 {
 		device_type = "memory";
diff --git a/arch/arm/boot/dts/exynos4412-i9300.dts b/arch/arm/boot/dts/exynos4412-i9300.dts
index 07fbcf845c49..61aca5798f38 100644
--- a/arch/arm/boot/dts/exynos4412-i9300.dts
+++ b/arch/arm/boot/dts/exynos4412-i9300.dts
@@ -12,6 +12,7 @@
 / {
 	model = "Samsung Galaxy S3 (GT-I9300) based on Exynos4412";
 	compatible = "samsung,i9300", "samsung,midas", "samsung,exynos4412", "samsung,exynos4";
+	chassis-type = "handset";
 
 	/* bootargs are passed in by bootloader */
 
diff --git a/arch/arm/boot/dts/exynos4412-i9305.dts b/arch/arm/boot/dts/exynos4412-i9305.dts
index 6bc3d897f432..77083f1a8273 100644
--- a/arch/arm/boot/dts/exynos4412-i9305.dts
+++ b/arch/arm/boot/dts/exynos4412-i9305.dts
@@ -5,6 +5,7 @@
 / {
 	model = "Samsung Galaxy S3 (GT-I9305) based on Exynos4412";
 	compatible = "samsung,i9305", "samsung,midas", "samsung,exynos4412", "samsung,exynos4";
+	chassis-type = "handset";
 
 	/* bootargs are passed in by bootloader */
 
diff --git a/arch/arm/boot/dts/exynos4412-n710x.dts b/arch/arm/boot/dts/exynos4412-n710x.dts
index 2c792142605c..9ae05b0d684c 100644
--- a/arch/arm/boot/dts/exynos4412-n710x.dts
+++ b/arch/arm/boot/dts/exynos4412-n710x.dts
@@ -5,6 +5,7 @@
 / {
 	compatible = "samsung,n710x", "samsung,midas", "samsung,exynos4412", "samsung,exynos4";
 	model = "Samsung Galaxy Note 2 (GT-N7100, GT-N7105) based on Exynos4412";
+	chassis-type = "handset";
 
 	memory@40000000 {
 		device_type = "memory";
diff --git a/arch/arm/boot/dts/exynos4412-p4note-n8010.dts b/arch/arm/boot/dts/exynos4412-p4note-n8010.dts
index 9f559425bd2c..0932ec5866cc 100644
--- a/arch/arm/boot/dts/exynos4412-p4note-n8010.dts
+++ b/arch/arm/boot/dts/exynos4412-p4note-n8010.dts
@@ -12,6 +12,7 @@
 / {
 	model = "Samsung Galaxy Note 10.1 (GT-N8010/N8013) based on Exynos4412";
 	compatible = "samsung,n8010", "samsung,p4note", "samsung,exynos4412", "samsung,exynos4";
+	chassis-type = "tablet";
 
 	/* this is the base variant without any kind of modem */
 };
diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 7b447b63007e..3c2d2a7836da 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -15,6 +15,7 @@
 / {
 	model = "Samsung Trats 2 based on Exynos4412";
 	compatible = "samsung,trats2", "samsung,midas", "samsung,exynos4412", "samsung,exynos4";
+	chassis-type = "handset";
 
 	memory@40000000 {
 		device_type = "memory";
diff --git a/arch/arm/boot/dts/exynos5250-snow-rev5.dts b/arch/arm/boot/dts/exynos5250-snow-rev5.dts
index 0822b778c035..f8ca61df6981 100644
--- a/arch/arm/boot/dts/exynos5250-snow-rev5.dts
+++ b/arch/arm/boot/dts/exynos5250-snow-rev5.dts
@@ -14,6 +14,7 @@ / {
 	model = "Google Snow Rev 5+";
 	compatible = "google,snow-rev5", "samsung,exynos5250",
 		"samsung,exynos5";
+	chassis-type = "laptop";
 
 	sound {
 		compatible = "google,snow-audio-max98090";
diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 9946dce54d74..a630bc654a49 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -12,6 +12,7 @@ / {
 	model = "Google Snow";
 	compatible = "google,snow-rev4", "google,snow", "samsung,exynos5250",
 		"samsung,exynos5";
+	chassis-type = "laptop";
 
 	sound {
 		compatible = "google,snow-audio-max98095";
diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/dts/exynos5250-spring.dts
index fba1462b19df..e0feedcf54bb 100644
--- a/arch/arm/boot/dts/exynos5250-spring.dts
+++ b/arch/arm/boot/dts/exynos5250-spring.dts
@@ -16,6 +16,7 @@
 / {
 	model = "Google Spring";
 	compatible = "google,spring", "samsung,exynos5250", "samsung,exynos5";
+	chassis-type = "laptop";
 
 	memory@40000000 {
 		device_type = "memory";
diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 315b3dc9c017..e76fb104db19 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -26,6 +26,7 @@ / {
 		"google,pit-rev7", "google,pit-rev6",
 		"google,pit", "google,peach","samsung,exynos5420",
 		"samsung,exynos5";
+	chassis-type = "laptop";
 
 	aliases {
 		/* Assign 20 so we don't get confused w/ builtin ones */
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 0ce3443d39a8..77013ee586f8 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -24,6 +24,7 @@ / {
 		"google,pi-rev11", "google,pi-rev10",
 		"google,pi", "google,peach", "samsung,exynos5800",
 		"samsung,exynos5";
+	chassis-type = "laptop";
 
 	aliases {
 		/* Assign 20 so we don't get confused w/ builtin ones */
-- 
2.30.2


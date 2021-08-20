Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B2A0C4320A
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Aug 2021 08:20:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22B32610D2
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Aug 2021 08:20:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbhHTIVT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Aug 2021 04:21:19 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:52420
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232243AbhHTIVT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Aug 2021 04:21:19 -0400
X-Greylist: delayed 337 seconds by postgrey-1.27 at vger.kernel.org; Fri, 20 Aug 2021 04:21:19 EDT
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AC888406E1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Aug 2021 08:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629447303;
        bh=+kHKFGwTKXn41PWg7UfAuln8Q8OXBJ2CxByz+s3vd2w=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=f0bJGBTkK41EdRUtkva9SvKq4HfNqCbcKh9qM36/vLR2oXlk8kLnM65QUfGQIwS+h
         UK58rf7LNyQ6zn2WH4dislBeJKFlD6RR/RbNL+A3JfRzg5ypnmzzze+B5trRvkmJ9S
         kTFdlZY5DbS2cmKQBFojBLv7c9NMLOD8w8yybN+MW760kzFOytdUmHw0nShSIeAcsE
         FbzwKu0d6PgS49hABSro3Q6tPGEUYp8EQypgqP2AY9A+vJ7ckA8geRn0rJTKHluHvq
         sFaSpbLS8c6mZvExT/FfYoKV1DAUDfCV/h90IMAuSm/EX2t40ll5NfirFNilupV0in
         /Yqm/ond7dJLg==
Received: by mail-ed1-f71.google.com with SMTP id l18-20020a0564021252b02903be7bdd65ccso4192123edw.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Aug 2021 01:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+kHKFGwTKXn41PWg7UfAuln8Q8OXBJ2CxByz+s3vd2w=;
        b=YVXsYevvYgWDKM0vCGZuD2z+5Wze0BeNjTfSLIv66/tx/Z9Ii16oW4X7tyWFLc5S0k
         0zNyfrG2i3Vz3vQhe9cMCZyLouSPeXSutc9AxL73HiFri4O02yUKKSnZ5I/2Gxapnqt3
         69YLL5l+E21x4zadJ51xGYOaWTQo7jRSiqmBjTvVNCgpv+Q/B5GF/CGLBEosv41wna7B
         nyEbZm89LkTe0JTDuaoNS98Q5xQCgzgnXknKPvhEx3WV2nuE/q6aHtqJY2K/raeBPZLx
         IYFpVijDVj+23x8V6CMmaEsK7V9Iuv5Jciaff5n8YjqYR9STCgnV5gyV5UntYY3Kz1vt
         2xHg==
X-Gm-Message-State: AOAM531PMzRmN9adJITZh+aMeOpCrzA1BH2XeJYdnFdCpKQhhJ0ehTMH
        6PRxiz3qEGIf9ROG4fRyUWM42m5FOXOBQipuTGN///QFj80w8FXVFmyUA6/oHXVL/MIMnTcCybF
        n1vI49YJgfP1OaGJ0ZRXhGCCQswH//GLk1DP5Xk9DLWYo5tUp
X-Received: by 2002:a05:6402:50c9:: with SMTP id h9mr21654141edb.357.1629447302553;
        Fri, 20 Aug 2021 01:15:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMEqHxaJILqth3tDzX13eqFAO3EJLWJDrrCnn+vkSZOV4tjYEACJCJ7+O/QLcOpMQv2o3JsQ==
X-Received: by 2002:a05:6402:50c9:: with SMTP id h9mr21654120edb.357.1629447302372;
        Fri, 20 Aug 2021 01:15:02 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id a2sm3284071edm.72.2021.08.20.01.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 01:15:01 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: exynos: align operating-points table name with dtschema in Exynos5433
Date:   Fri, 20 Aug 2021 10:14:57 +0200
Message-Id: <20210820081458.83406-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Align the name of operating-points node to dtschema to fix warnings like:

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi | 10 +++++-----
 arch/arm64/boot/dts/exynos/exynos5433.dtsi     |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
index 8997f8f2b96c..72ccf18eb9d1 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
@@ -87,7 +87,7 @@ bus_noc2: bus9 {
 		status = "disabled";
 	};
 
-	bus_g2d_400_opp_table: opp-table2 {
+	bus_g2d_400_opp_table: opp-table-2 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
@@ -117,7 +117,7 @@ opp-100000000 {
 		};
 	};
 
-	bus_g2d_266_opp_table: opp-table3 {
+	bus_g2d_266_opp_table: opp-table-3 {
 		compatible = "operating-points-v2";
 
 		opp-267000000 {
@@ -137,7 +137,7 @@ opp-100000000 {
 		};
 	};
 
-	bus_gscl_opp_table: opp-table4 {
+	bus_gscl_opp_table: opp-table-4 {
 		compatible = "operating-points-v2";
 
 		opp-333000000 {
@@ -151,7 +151,7 @@ opp-166500000 {
 		};
 	};
 
-	bus_hevc_opp_table: opp-table5 {
+	bus_hevc_opp_table: opp-table-5 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
@@ -175,7 +175,7 @@ opp-100000000 {
 		};
 	};
 
-	bus_noc2_opp_table: opp-table6 {
+	bus_noc2_opp_table: opp-table-6 {
 		compatible = "operating-points-v2";
 
 		opp-400000000 {
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 6a6f7dd1d65c..ebd5091d68b4 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -239,7 +239,7 @@ cluster_a53_l2: l2-cache1 {
 		};
 	};
 
-	cluster_a53_opp_table: opp-table0 {
+	cluster_a53_opp_table: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
@@ -285,7 +285,7 @@ opp-1300000000 {
 		};
 	};
 
-	cluster_a57_opp_table: opp-table1 {
+	cluster_a57_opp_table: opp-table-1 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
-- 
2.30.2


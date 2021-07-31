Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145E9C43216
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 31 Jul 2021 09:24:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03CED61058
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 31 Jul 2021 09:24:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233169AbhGaJYx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 31 Jul 2021 05:24:53 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:60034
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233018AbhGaJYu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 31 Jul 2021 05:24:50 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id ADFE63F110
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Jul 2021 09:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627723483;
        bh=chFkYRASRXmnCTx3ox4fvgdh5vYDNQ+s+kCxqXeprbY=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=YXsVsGaZWOHequaxAuPZ3u4dHs0MJOTkgf7mTsLZoA8H8ekzazepCfbrfvRFSZZJ7
         Og+jWwcSArTtK63ZuRw2+h4CNzvLzwcPiGfXFE4zT3MA+NB1suMeZxyDGZgUWM2NY5
         uT+a+vuXLw3wcQcQBqktccsSQwyMuaLKa2xYVi4Fp+gqRDHdzKzdfXD3h+3kQCCfw9
         6NcVzzASnTClkIn1ySN/zM1n8/Uo/LiRh40ifLXs7inE20j45vQxz1MpgOEpkUVHJm
         kQeZT6EPyn+UczyEcb+lHB/Vxs4+o+Yobit+RoUHJKwUxcyVBQSdAXGD7pyhQGYp0Z
         X1+UpgqpwANjQ==
Received: by mail-ed1-f71.google.com with SMTP id l10-20020aa7caca0000b02903b874f26036so5848179edt.20
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Jul 2021 02:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=chFkYRASRXmnCTx3ox4fvgdh5vYDNQ+s+kCxqXeprbY=;
        b=ahcQpx0E2a/CcQx6C1D2HakC4ITrfAbfez1piqpFkUJU9sFC/Hfk8mdiTs3IGvnmr2
         iPRlxhly0X3c7ARSAmw3XjqFCrbX6ZiXM+kfFmw3Aorp6PH8ACpUY2/pXyZNoex2mtZg
         L7WPdCmEgP7h/kZvsIzenK1vubawkEi45NKtSZ686HyOi0d4fZN6uBrjuw3JCwtiHaHV
         KmIPkU45VVQffwOQ71GsOBKP0+kkQETWX3q/RJFjwHgwTjc7lCoNRDX0paxL5JVBiJJv
         +M0rXeeti0hb65u0j9AJCrbHbVBTDUozVaAjQRK9K86OA9hc+QpSEqyWj20Ix/DMVbW9
         1ewA==
X-Gm-Message-State: AOAM530Vwlz2qIqlKrBro8zgasEHRE6TbRB8LfjxqfE+k5MVYiuKTmSk
        UdHTYexlNESOCqa+JoSAgna2MUk6R8/Wom6aGpHSTQdlhb9Mm5jh+G/1H8jvZQ6PQxGgedKZ0DT
        oO7+5pyHJtfvCgqRPh9w5rcA5uRaLndCCFDmWdyyk7p3tGxTo
X-Received: by 2002:a05:6402:795:: with SMTP id d21mr8286569edy.351.1627723483219;
        Sat, 31 Jul 2021 02:24:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwB5LpBFJZe4d1UOd9BvYXXzvUaXaSYxvLp4RsSizpd+kp+Ein0sIsc5F4o+6q+hd41PzPxLg==
X-Received: by 2002:a05:6402:795:: with SMTP id d21mr8286563edy.351.1627723483120;
        Sat, 31 Jul 2021 02:24:43 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id r16sm1947693edt.15.2021.07.31.02.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 02:24:42 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 8/8] arm64: dts: exynos: add CPU topology to Exynos5433
Date:   Sat, 31 Jul 2021 11:24:09 +0200
Message-Id: <20210731092409.31496-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210731092409.31496-1-krzysztof.kozlowski@canonical.com>
References: <20210731092409.31496-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Describe Exynos5433 CPU topology.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 73aa0fa9b778..6a6f7dd1d65c 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -52,6 +52,38 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu1>;
+				};
+				core2 {
+					cpu = <&cpu2>;
+				};
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu4>;
+				};
+				core1 {
+					cpu = <&cpu5>;
+				};
+				core2 {
+					cpu = <&cpu6>;
+				};
+				core3 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
 		cpu0: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
-- 
2.27.0


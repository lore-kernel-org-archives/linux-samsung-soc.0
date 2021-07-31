Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511FAC4320E
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 31 Jul 2021 09:24:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39B0A61042
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 31 Jul 2021 09:24:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233076AbhGaJYv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 31 Jul 2021 05:24:51 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:59978
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232473AbhGaJYr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 31 Jul 2021 05:24:47 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 1F6B23F233
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Jul 2021 09:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627723481;
        bh=oZaMws7fwrXQ+39v59StjW2jRchmqWMSe99swu1ZncA=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=nXg/FIqSDxEjmBHEH0h9pnjLLCOQJDVVzCZ/umh/7rFsyRWezPguqgjA0HW2TJTZE
         +h6JdFvLqhFLZ4jtVdtXc08Qe2yT0H1grLb72dwEmhd+WuE38yov3ldUknvN4K2UoZ
         MftRET4rUAvA9kAKppuyGLN1TYMKaeMWmqel+MRgLmhUwdgYj/PHmjl9U5rNN8BH2u
         O8qHuW+bKlLXDwxu5Lqx7wJwzlQYGn5AN6MYtLKuB+iDlKGa68+aMr9IqSUh9Mm9o1
         S2dBjrQhtmzrH3AD2CRYSn1FJson4RI4y6+FquLNIMhaqEd2GEzPFjZGiMWCl4sDSl
         GNJumKlHwx5+Q==
Received: by mail-ed1-f71.google.com with SMTP id c1-20020aa7df010000b02903bb5c6f746eso5845113edy.10
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Jul 2021 02:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oZaMws7fwrXQ+39v59StjW2jRchmqWMSe99swu1ZncA=;
        b=XhRfNjTXugxlN6hu7EtzgeAeXNEQKXVdvJ4uQmkoHjES2ft4IZWTm3f+v4VyBYUdVS
         3MtTvbEGwFIE4MN9CMjOZun9asr9pZbks56tw56LxxbbgJP3BBfZBlgFqgIjhHc2gzl6
         0FC7Slf+xgFqrFuDFze6kcQxV7rNkPd9P/sK/GanU3nmjrAP7ST2rpyKst0U4BZMucXe
         Cl5xmTJ2yPRaaTyRdfxX01EFpT5yG5fX7JRJsoied0z5evOZO/c8C8fLkJ1BOBVoMgzB
         8RDOZCPmhw6tGt33m/mMSVGxUE8zUn8VrTxX3uU6ihjaj90yjIe7+y04Sh+Jb1h9rVeq
         ZPQA==
X-Gm-Message-State: AOAM531c/8OK5GXrXbTbUZUpCVQvcHXIN6prYkmoshZOu0lmw7kxQhKz
        ORXUa/d0fT3WcEJ2pdRSnkuYi7BzXULBfiZ8H8SBlta5Ro9va3Vsb5UyBp1yqX++zCTHBz2dfLy
        G6C2G/vgzfqTR+TVPnQ9Uk7ggWprUJmzPFOnKVCfqtw4PAI0Z
X-Received: by 2002:aa7:c792:: with SMTP id n18mr8329664eds.269.1627723480791;
        Sat, 31 Jul 2021 02:24:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/sf10Y8srbg8K+efQ4NmEX6nec9k/+iYcFltTGdhcbdRPp/dreDc16TZIWHAzqpOtGFDNEg==
X-Received: by 2002:aa7:c792:: with SMTP id n18mr8329653eds.269.1627723480696;
        Sat, 31 Jul 2021 02:24:40 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id r16sm1947693edt.15.2021.07.31.02.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 02:24:40 -0700 (PDT)
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
Subject: [PATCH 6/8] ARM: dts: exynos: add CPU topology to Exynos5420
Date:   Sat, 31 Jul 2021 11:24:07 +0200
Message-Id: <20210731092409.31496-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210731092409.31496-1-krzysztof.kozlowski@canonical.com>
References: <20210731092409.31496-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Describe Exynos5420 CPU topology.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5420-cpus.dtsi | 32 ++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-cpus.dtsi b/arch/arm/boot/dts/exynos5420-cpus.dtsi
index 58d1c54cf925..e9f4eb75b50f 100644
--- a/arch/arm/boot/dts/exynos5420-cpus.dtsi
+++ b/arch/arm/boot/dts/exynos5420-cpus.dtsi
@@ -22,6 +22,38 @@ cpus {
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
 		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
-- 
2.27.0


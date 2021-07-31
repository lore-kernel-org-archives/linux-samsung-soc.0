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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8C5C43214
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 31 Jul 2021 09:24:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1142A6103B
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 31 Jul 2021 09:24:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232881AbhGaJYr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 31 Jul 2021 05:24:47 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:47662
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232542AbhGaJYp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 31 Jul 2021 05:24:45 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 9FE893F243
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Jul 2021 09:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627723478;
        bh=HDsVJHbLYdehvdLjNS9gFGVYyn3GWDKvQhj/fRkHz3k=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=r3J2xVRSTITLOfnAUBHizqpat79WL6Bug9H9YJMAtDC2Xj8WPxJ7gYo2w3V4Lm1RE
         dYJ8LYDt1S5WrWABXV02U1Gee9dQRaJT/zYbLozJmhrEj7152kIUcvFBsu5bd861mb
         naoXVfgchFNNmJg4+n4rvq3JLXattV9RHP+cwchz2asHragkdWg7KF6txbrlZY/NfU
         O1ULzkI4jDGfkFbOoH+C45kM55p3cOL3m5uvbXuuUkbCojWcE7q9ISbKaFov5qaEcY
         G4s7FSVKBpdtVqSXNR3lxaMYl6iyHJRlC7TTnc4VGubJft/dl7axlL0kYLMp8MiG5+
         heim5UCqcgIog==
Received: by mail-ed1-f71.google.com with SMTP id ay20-20020a0564022034b02903bc515b673dso5889447edb.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Jul 2021 02:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HDsVJHbLYdehvdLjNS9gFGVYyn3GWDKvQhj/fRkHz3k=;
        b=VfmKsHjSMJ9jbdcvAHtj3nFzGhgsQPnUSqZJ0P3BGzva9SxWddGz9KU7ec9SG18dIG
         l5BJsLEN36/69fgTFP7A121dW2pSyvZ0h5R6nzUWAryP95TSCyasCNx1qry8jYXfw8J5
         Q2G2c8YYnrwmiTMp3ZQYlhJgco8UhuNSA3l+BsC9g3vzIjF29cRu/QMbCIeRf1jYP/Hu
         KmjLCr3YctgJJOdTZZMdAJ5MenuLxDwBmsfboorPU4irDZh7cQE8lP+jUJveguhoF4ub
         Tw5zWJE0PEjvTzh5wLJ5JRTjml2N7Pa/SqjHeawUWs/N6PXSTMyueaNgFGujBW8vhm0L
         ruSA==
X-Gm-Message-State: AOAM530Uhy+lWAnuNNONSV7kqZcVKXI8DIsrVyVgdKhlEq2uki2kdaqN
        MSBmUPoMlICyCwh/5UT8TW2QaOQ+50Vuy2lrhLhVZ1rJq6bigQ/31Qa4NkvXsHT9QDTy8k1NXJB
        p9H2iiJdKUeS6D/SrIGk7WbP53KlXDeJrNfNrlCdqzTSB0fT9
X-Received: by 2002:aa7:cace:: with SMTP id l14mr8188589edt.14.1627723478393;
        Sat, 31 Jul 2021 02:24:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuIJmHBiFSjnUtPJTyExYA/Xbvt6uMsTVXP7lA49p4XG3mtpPWK0r+g1e+pbMZwXbjTXj+Xw==
X-Received: by 2002:aa7:cace:: with SMTP id l14mr8188584edt.14.1627723478243;
        Sat, 31 Jul 2021 02:24:38 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id r16sm1947693edt.15.2021.07.31.02.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 02:24:37 -0700 (PDT)
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
Subject: [PATCH 4/8] ARM: dts: exynos: add CPU topology to Exynos5250
Date:   Sat, 31 Jul 2021 11:24:05 +0200
Message-Id: <20210731092409.31496-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210731092409.31496-1-krzysztof.kozlowski@canonical.com>
References: <20210731092409.31496-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Describe Exynos5250 CPU topology.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 2ea2caaca4e2..4ffa9253b566 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -50,6 +50,17 @@ cpus {
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
+			};
+		};
+
 		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
-- 
2.27.0


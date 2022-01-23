Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BC1C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 23 Jan 2022 11:17:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236162AbiAWLRI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 23 Jan 2022 06:17:08 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:56072
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236267AbiAWLRA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 23 Jan 2022 06:17:00 -0500
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 37A3F3F1C1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 11:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642936618;
        bh=oFyg+gwb7XtvC7QbtaeH/MyDAvhazxDlD6i95VQK5XA=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=vJN5ZXeWlHeGIfbb6QuAq6Ql0HkFtyZurbuLagsTNwiVr1hEyX5H+g5P2k02ByR0O
         kJCf1zU6CH/eTWqULKEYCg0YN1xgUUZQ6Zdb7gOm6v2Fi0i8u/iM1fd16mdJNuKktp
         tvDXPCE4RzUTta1m1HrdU25i7FHFvJ5rme4OqtrYhE54WjtXjYO3YKC8RIcmm6wHPh
         AXlboLZlWAkGSdjNozOyMJWu/xaYwv5uIYfQ6+imqp2eU+UKfRwNaXG/g2gfLt8W+U
         Aw3WiFsbrwB5wk9hZt2GfoJqr2UA+gTRl+w/w7PUOYKerXNjZxAfdMEA/18qIatOD0
         +z8HOqx1xx0QA==
Received: by mail-wm1-f70.google.com with SMTP id a189-20020a1c98c6000000b0034e32e18a21so6660128wme.9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 03:16:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oFyg+gwb7XtvC7QbtaeH/MyDAvhazxDlD6i95VQK5XA=;
        b=fh2PY30WH3AJJOWjJwncJSsSBZp1cWzoNJxmN1pwIMTpRJLaucNmzgXh80cB5zPwjI
         Cs6jVc6sE8Kkv4OzVhVIW3T5X+Q1gO5/k2I9JsILlF9JjZctGHnxp/00Xbsq3h0J2Ktb
         QXl3/pXDaXiIvX/BresslPI50AuWGuYAK704P4r0ODyTk9rrTaJ3hMlCeExnkhYkH4r6
         O7UrqvZCwVlBuwDN2RQvGN7tIb9GUWPm7gKVZGTVjgUlHrtxHhWUbjP2oEzVNKL1pVT0
         22bdkQhwIOEhXA2NHT+LBU3O/HlJLuj4hudq7imX1Y6y7+ApPeeVUNZcY37WX5xfJpiW
         qC5A==
X-Gm-Message-State: AOAM530hbvgrvEyHXFb0T6B7t5eZtLUDEKiHFGuagADh4p1o/q+ekiet
        9DfL6LwrXaMKyM53D7z0z3XYyLu0iU2EDnqrEwXNefRmgFYTh36sjGLAa0Mq1BsrT7M4W+o58oB
        4eRIZ3ksfIS/fULgJj3DbrTQ1PjjdRV9f3t9k5okazU1tYbWm
X-Received: by 2002:a7b:cb05:: with SMTP id u5mr7582893wmj.59.1642936616521;
        Sun, 23 Jan 2022 03:16:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzl/THDIXXxYVsa2sg8+CimTWrhi2Zjb2hJxs9yZ1xXuWrxrnlJt2icnBT+iFNOebYeJ8eo7g==
X-Received: by 2002:a7b:cb05:: with SMTP id u5mr7582884wmj.59.1642936616338;
        Sun, 23 Jan 2022 03:16:56 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id m5sm10143729wms.4.2022.01.23.03.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 03:16:55 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 07/12] ARM: dts: exynos: add USB DWC3 supplies to Chromebook Peach Pit
Date:   Sun, 23 Jan 2022 12:16:39 +0100
Message-Id: <20220123111644.25540-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
References: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add required voltage regulators for USB DWC3 block on Exynos5420
Chromebook Peach Pit board.  Due to lack of board schematics, use same
regulators as on Odroid XU board (using same MAX77802 PMIC).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index e76fb104db19..6252089e4350 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -1090,6 +1090,16 @@ &tmu_gpu {
 	vtmu-supply = <&ldo10_reg>;
 };
 
+&usbdrd3_0 {
+	vdd10-supply = <&ldo15_reg>;
+	vdd33-supply = <&ldo12_reg>;
+};
+
+&usbdrd3_1 {
+	vdd10-supply = <&ldo15_reg>;
+	vdd33-supply = <&ldo12_reg>;
+};
+
 &usbdrd_dwc3_0 {
 	dr_mode = "host";
 };
-- 
2.32.0


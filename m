Return-Path: <SRS0=QYj3=C6=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37551C4347E
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Sep 2020 17:48:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E80E821D91
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Sep 2020 17:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600710518;
	bh=5HbWkTPMjTEjcRZk0/muHA9531uVnOzMMAxeJwJifjo=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=ytvC26VlXK3C3Vcmh0jdjaYfla9Yy9vpmRIuSNyyn+oSgA4PdJOAnFbuUHhOKInnV
	 lk3mp0nl7HhIYBt16YI5iJSKUG91jjnUfAedOPLEAzjUYdkadvXwxbv/NF6k2FazzG
	 bF+NVsjL5/eEl/8EEMWIYvF6PGDuMHI6CpRZAZdI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728262AbgIURsc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 21 Sep 2020 13:48:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:38548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726537AbgIURsa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Sep 2020 13:48:30 -0400
Received: from localhost.localdomain (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7828B216C4;
        Mon, 21 Sep 2020 17:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600710510;
        bh=5HbWkTPMjTEjcRZk0/muHA9531uVnOzMMAxeJwJifjo=;
        h=From:To:Cc:Subject:Date:From;
        b=DNcxGJEyXWr5Mm8SeWt4U95UvNq1O3+tIgBWdAbYwXdKu3rXJLeFlGnhuo1PtgyH9
         oGpP3vUT82cjnzA7Lxm4AR6cvFngN1lqsjxQ7Y6HUcld3PSM+4QCMikAEylTLB8HPA
         rquwcWXzyNCNlIO1YRxpdgbCLP6BNLdfYwtIraV8=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: dts: exynos: revert "add input clock to CMU in Exynos4412 Odroid"
Date:   Mon, 21 Sep 2020 19:48:18 +0200
Message-Id: <20200921174818.15525-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This reverts commit eaf2d2f6895d676dda6c95a652b58594f2887720.

The commit eaf2d2f6895d ("ARM: dts: exynos: add input clock to CMU in
Exynos4412 Odroid") breaks probing of usb3503 USB hub on Odroid U3.

It changes the order of clock drivers probe: the clkout (Exynos PMU)
driver is probed before the main clk-exynos4 driver.  The clkout driver
on Exynos4412 depends on clk-exynos4 but it does not support deferred
probe, therefore this dependency and changed probe order causes probe
failure.

The usb3503 USB hub on Odroid U3 on the other hand requires clkout
clock.  This can be seen in logs:

    [    5.007442] usb3503 0-0008: unable to request refclk (-517)

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index ab291cec650a..2983e91bc7dd 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -122,7 +122,6 @@
 };
 
 &clock {
-	clocks = <&clock CLK_XUSBXTI>;
 	assigned-clocks = <&clock CLK_FOUT_EPLL>;
 	assigned-clock-rates = <45158401>;
 };
-- 
2.17.1


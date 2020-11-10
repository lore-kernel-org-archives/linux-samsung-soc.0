Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342D7C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Nov 2020 19:37:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD2A020781
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Nov 2020 19:37:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0uvq151S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgKJTh6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Nov 2020 14:37:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:35080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbgKJTh6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 14:37:58 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0BF3020678;
        Tue, 10 Nov 2020 19:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605037077;
        bh=Fl2UQG2htLleEj9UfjSzEEtMBBatbOujS6Yy09+5Cu8=;
        h=From:To:Subject:Date:From;
        b=0uvq151SoGRa1d/cy+GtV4G6jYI9QRlTHeor71pmVztSpQ5jqRyqW/hYocpbHZXWw
         ZwK/6LXakv1tF7ppRKPL8nzq6aO2N+IhsURtBw0lVAo3wksDWupqyCu4gYNhXmrs9Z
         AX3GXx9iM/iS/s3eJJ0Fr/vK8oiXAuPGBTmEin3A=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: samsung: allow building the clkout driver as module
Date:   Tue, 10 Nov 2020 20:37:49 +0100
Message-Id: <20201110193749.261367-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Exynos clock output driver can be built as module (it does not have
to be part of core init process) for better customization.  Adding a
KConfig entry allows also compile testing for build coverage.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/samsung/Kconfig             | 10 ++++++++++
 drivers/clk/samsung/Makefile            |  2 +-
 drivers/clk/samsung/clk-exynos-clkout.c |  1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
index 57d4b3f20417..b6b2cb209543 100644
--- a/drivers/clk/samsung/Kconfig
+++ b/drivers/clk/samsung/Kconfig
@@ -19,6 +19,16 @@ config EXYNOS_AUDSS_CLK_CON
 	  on some Exynos SoC variants. Choose M or Y here if you want to
 	  use audio devices such as I2S, PCM, etc.
 
+config EXYNOS_CLK_OUT
+	tristate "Samsung Exynos clock output driver"
+	depends on COMMON_CLK_SAMSUNG
+	default y if ARCH_EXYNOS
+	help
+	  Support for the clock output (XCLKOUT) driver present on some of
+	  Exynos SoC variants. Usually the XCLKOUT is used to monitor the
+	  status of the certains clocks from SoC, but it could also be tied to
+	  other devices as an input clock.
+
 # For S3C24XX platforms, select following symbols:
 config S3C2410_COMMON_CLK
 	bool "Samsung S3C2410 clock controller support" if COMPILE_TEST
diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index 1a4e6b787978..4adbf972e9f6 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -15,7 +15,7 @@ obj-$(CONFIG_SOC_EXYNOS5420)	+= clk-exynos5420.o
 obj-$(CONFIG_SOC_EXYNOS5420)	+= clk-exynos5-subcmu.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos5433.o
 obj-$(CONFIG_EXYNOS_AUDSS_CLK_CON) += clk-exynos-audss.o
-obj-$(CONFIG_ARCH_EXYNOS)	+= clk-exynos-clkout.o
+obj-$(CONFIG_EXYNOS_CLK_OUT)	+= clk-exynos-clkout.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7.o
 obj-$(CONFIG_S3C2410_COMMON_CLK)+= clk-s3c2410.o
 obj-$(CONFIG_S3C2410_COMMON_DCLK)+= clk-s3c2410-dclk.o
diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index f5f8a956b316..9ec2f40cc400 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -72,6 +72,7 @@ static const struct of_device_id exynos_clkout_ids[] = {
 		.data = &exynos_clkout_exynos5,
 	}, { }
 };
+MODULE_DEVICE_TABLE(of, exynos_clkout_ids);
 
 /*
  * Device will be instantiated as child of PMU device without its own
-- 
2.25.1


Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377BEC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 19 Sep 2021 09:31:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 190FE60FE6
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 19 Sep 2021 09:31:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237587AbhISJcv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 19 Sep 2021 05:32:51 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:40582
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237648AbhISJcu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 19 Sep 2021 05:32:50 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6C582402CD
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Sep 2021 09:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632043884;
        bh=ZK+VXD8gxhx/mjWHqKBF1YSNqbZHXzRbC1073HoZOfw=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=pfgD4SJI02C4K19ur8dP+YMThlFbTxyTjZNLVI+KKU9In3ko4s+umNZpxd2bOiqq1
         BHiBcUXfblFb62FyfuNEjxGoE1i3qajlhDjNvD+Z9JPGtBOxozscrq5njHoJlqmpcW
         jKvUlSvitVxYJHyYaB4SlRWmWyLQ8zTCqe+wy97L/IHklsaC65C+R5xuCc4LFhcGDS
         9Vni+UK1ded8lTaBq+wb5M8G+28rC8AwAYLV4AZq0GdP6sltjRxd/Ml4A50gUmcnGt
         ASMLr4i7Ml1NoRofjWqOoRmQEjnqjrtNh3mQfFkmGD6cgmJl54M/6Yaqg2QqATniLr
         tYDUguVdgF2Dw==
Received: by mail-ed1-f71.google.com with SMTP id h15-20020aa7de0f000000b003d02f9592d6so13059195edv.17
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Sep 2021 02:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZK+VXD8gxhx/mjWHqKBF1YSNqbZHXzRbC1073HoZOfw=;
        b=obkjnISvOnJPO3dhbJuACaPGhX4w1slTMKWMvai7fKbTUAM83mh8LdNwuZELd5aHoX
         Q/zub3saezaA5/DSQ9EIBLzl+HOIITjUrYa2MeozRfl700HMXed7WL0vN+HXhYL2dqHJ
         MSd9X0VfKzPTp/r44gUHECZ8X10gFUS7ojp4UZz7J3V4rBtqHZeuU8fxKN55ylbKIq0R
         MdjaXspO3HOFlmTC5Qbu9+zPX2N0eYoYk6wWpvNVWaSnXMccCfgu7OJ9U3RvQf89dQaG
         4RipqRcPWzQaKXeFC75rw5NO6WtnnW0ZsPt+wODKV3rYP5wSY+Cw3HCRswvBKWquEom7
         hflQ==
X-Gm-Message-State: AOAM533f3LGB/4hsLhRd6U+ZpIrc802F+tGlUqRz4FzSaV09smN8zxZi
        ktIMBtm9KPwHo/Pofa0WNlyPiYRwJqjEwzF47yYehyAOurxynAry7bpJcBMcWzVWpc66orNTKzT
        MxiCXBlAgsNMKcPsYcd9+WmJ6kh9tXMplPmzz2fKaUhs44mzB
X-Received: by 2002:a17:906:52c5:: with SMTP id w5mr22093749ejn.567.1632043883946;
        Sun, 19 Sep 2021 02:31:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiIdx1f8hVgqGPm9ahXSP2VgGM2d2n4WF4eeiUA+ez9LIqX3F6ubdGXPQ6Oqkcr1zug1//Eg==
X-Received: by 2002:a17:906:52c5:: with SMTP id w5mr22093732ejn.567.1632043883779;
        Sun, 19 Sep 2021 02:31:23 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id p24sm514111edq.27.2021.09.19.02.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 02:31:23 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 2/3] soc: samsung: exynos-chipid: convert to a module
Date:   Sun, 19 Sep 2021 11:31:13 +0200
Message-Id: <20210919093114.35987-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210919093114.35987-1-krzysztof.kozlowski@canonical.com>
References: <20210919093114.35987-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos ChipID and ASV (Adaptive Supply Voltage) driver is not essential
to system boot and it can successfully be built and loaded as module.

This makes core kernel image smaller and reduces the memory footprint
when multi-platform kernel is booted on non-Exynos board.  Usually it is
also distro-friendly.

Add multiple authors of the driver since its conversion from
mach-exynos, ordered alphabetically by first name.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/soc/samsung/Kconfig          |  3 ++-
 drivers/soc/samsung/Makefile         |  3 ++-
 drivers/soc/samsung/exynos-chipid.c  | 11 ++++++++++-
 drivers/soc/samsung/exynos5422-asv.c |  1 +
 4 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
index 1f643c0f5c93..fe139f26d093 100644
--- a/drivers/soc/samsung/Kconfig
+++ b/drivers/soc/samsung/Kconfig
@@ -13,13 +13,14 @@ config EXYNOS_ASV_ARM
 	depends on EXYNOS_CHIPID
 
 config EXYNOS_CHIPID
-	bool "Exynos ChipID controller and ASV driver" if COMPILE_TEST
+	tristate "Exynos ChipID controller and ASV driver" if COMPILE_TEST
 	depends on ARCH_EXYNOS || COMPILE_TEST
 	select EXYNOS_ASV_ARM if ARM && ARCH_EXYNOS
 	select MFD_SYSCON
 	select SOC_BUS
 	help
 	  Support for Samsung Exynos SoC ChipID and Adaptive Supply Voltage.
+	  This driver can also be built as module (exynos_chipid).
 
 config EXYNOS_PMU
 	bool "Exynos PMU controller driver" if COMPILE_TEST
diff --git a/drivers/soc/samsung/Makefile b/drivers/soc/samsung/Makefile
index 0c523a8de4eb..2ae4bea804cf 100644
--- a/drivers/soc/samsung/Makefile
+++ b/drivers/soc/samsung/Makefile
@@ -1,8 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_EXYNOS_ASV_ARM)	+= exynos5422-asv.o
+obj-$(CONFIG_EXYNOS_CHIPID)	+= exynos_chipid.o
+exynos_chipid-y			+= exynos-chipid.o exynos-asv.o
 
-obj-$(CONFIG_EXYNOS_CHIPID)	+= exynos-chipid.o exynos-asv.o
 obj-$(CONFIG_EXYNOS_PMU)	+= exynos-pmu.o
 
 obj-$(CONFIG_EXYNOS_PMU_ARM_DRIVERS)	+= exynos3250-pmu.o exynos4-pmu.o \
diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index dcd9a08ce706..b2627a3a127a 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -15,6 +15,7 @@
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -128,6 +129,7 @@ static const struct of_device_id exynos_chipid_of_device_ids[] = {
 	{ .compatible = "samsung,exynos4210-chipid" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, exynos_chipid_of_device_ids);
 
 static struct platform_driver exynos_chipid_driver = {
 	.driver = {
@@ -137,4 +139,11 @@ static struct platform_driver exynos_chipid_driver = {
 	.probe	= exynos_chipid_probe,
 	.remove	= exynos_chipid_remove,
 };
-builtin_platform_driver(exynos_chipid_driver);
+module_platform_driver(exynos_chipid_driver);
+
+MODULE_DESCRIPTION("Samsung Exynos ChipID controller and ASV driver");
+MODULE_AUTHOR("Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>");
+MODULE_AUTHOR("Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>");
+MODULE_AUTHOR("Pankaj Dubey <pankaj.dubey@samsung.com>");
+MODULE_AUTHOR("Sylwester Nawrocki <s.nawrocki@samsung.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/samsung/exynos5422-asv.c b/drivers/soc/samsung/exynos5422-asv.c
index ca409a976e34..475ae5276529 100644
--- a/drivers/soc/samsung/exynos5422-asv.c
+++ b/drivers/soc/samsung/exynos5422-asv.c
@@ -503,3 +503,4 @@ int exynos5422_asv_init(struct exynos_asv *asv)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(exynos5422_asv_init);
-- 
2.30.2


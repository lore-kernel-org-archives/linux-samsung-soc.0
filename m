Return-Path: <SRS0=KIUv=BQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20EAFC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:38:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62F5422CE3
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596739122;
	bh=/PTDXeYOWV9QWjTZIHRZoZzyNEJs3+9dKsJcQfHLRYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=trDWCbxrnYUM4Q5KawPBbcjVxxCr1D7y7bGjR4tVnW37ouPoEkKwls12ej1QFVPW2
	 chdeqsV6lB3hN0WUKTznH4mQxG2rtseUtL2C5atXwWqqr6V7dnqH1IP2xRt7nGK53R
	 gorXDG0AiG34uaHGhOXcTCGMsd7hIsA5UH2IXvJk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729389AbgHFSil (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 Aug 2020 14:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729193AbgHFSeP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 14:34:15 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3863EC0617A2
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2020 11:34:15 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id 184so10629428wmb.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2020 11:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=fL/L+7A5Rk27LFu8zoyS3l+7ohTQNz5YSakGRT9+74k=;
        b=pv9b0U9xxqo1IEZ4KYMRoYVmM5M6ZTwjfQNDfDvo+TjFo8/NsGtnotyGRZHOO3itCb
         Gxjr9kNSqudkPiajIswwyZ4uPRMwduU2mF1yugD9aJ0BHmBpXcrIj4+2vtr+ObjKxVLm
         WQtRoyjO7t0QeJqf78J+stSMjp02NxLNFkQumVajijqTjtMLA72/8WSQMFncBxVh9VtF
         JCDGN7XveiP7o/kQTW2znJlWu2L6qyPj3h5kcdr4u9PosFOeVkEL64h7OTn8IfFPmRWh
         6JKZvzFiN0e2C/1Bu7IArXxRGzcaexUfAEn2gOfX2n1nhZeubFMKFVtGxu2VKOuvyDDJ
         3f5Q==
X-Gm-Message-State: AOAM5321pZhddTq2HxsgsiDGXh2gehEzB/fNsMbtHKdwfNBIT2GeuVHp
        F2nmmHpo1CIXlNQjDL6klJYC2AbOVlE=
X-Google-Smtp-Source: ABdhPJxuAuo0Tf1/M6lVP89sMEHpJHyE+VD5whNocksfnZM3WZjBXSGDMfcZ8jugyUj5MMbeqH9RnQ==
X-Received: by 2002:a05:600c:22cb:: with SMTP id 11mr9480414wmg.66.1596738853401;
        Thu, 06 Aug 2020 11:34:13 -0700 (PDT)
Received: from kozik-lap ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id x204sm17224553wmg.2.2020.08.06.11.34.12
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 11:34:13 -0700 (PDT)
Received: by 2002:ab3:1105:0:0:0:0:0 with SMTP id j5csp1542265lta;
        Thu, 6 Aug 2020 11:24:24 -0700 (PDT)
X-Received: by 2002:a17:902:bd01:: with SMTP id p1mr9363895pls.25.1596738264500;
        Thu, 06 Aug 2020 11:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596738264; cv=none;
        d=google.com; s=arc-20160816;
        b=n2XnawlybNYipLBTDVUbOeB7wXj45Zv7iWSF/6IxnwbVsnJQKCxppcuIEaGGt5qaCu
         JbaTBA/Yu9ulmR4hYIP09cSjoXjkrRP10FuOebNgaYgdZDXfifImHtz+JdUC0u+3B3Iu
         F9XYxLkwcCAKab624L8RMswY9veoaZXS3pOrtaTEpvIUwrRYmciKizGqqnxepXwutLZR
         sFFxwtq1m38E/2kC9Mirm3iWuaXNAsNtLfS54Ea04RUEgcCFkyqIvAncpkN1QSOytJDw
         V54U6/SvSpKLNUo42dKz7CewWTB1/bFFAH//k0hqTwz8dxML9fRlGvoE/huZVecokKbZ
         i5Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:delivered-to;
        bh=fL/L+7A5Rk27LFu8zoyS3l+7ohTQNz5YSakGRT9+74k=;
        b=r54e95zZHzMGd3V8MbC72/R+n0rB2+gWS+SWgywOhUpdTDGEbUI3yuirMEIdbrTClF
         /yP20QrCSK8+8L/fzUIxXfYvtu7WTq5u7mqyWAjxrf8zSnMlk40FSqjXpQLAPECnSA66
         UTMYvRUTfjKp7Gx5sit4CU1kqaIofQI9nP9bDBPEQAKWS4JsRDRuykbmYuBggthMb3am
         9bAHLpXUo2KXGUavi/thyK6lcndnQkY/6o9vIHss8SBa60tF23XFG6H5WpGSaFXCNR74
         FVnoZwcvZJGkSMh9ghAC9GWzcqMARjJ/lyjZMx8+6frAjbAmPsAIg9UsQk9g5p/8OENB
         oCXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b="G//rUJW4";
       spf=pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=krzk@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id f21si3993924pgv.567.2020.08.06.11.24.24
        for <k.kozlowski.k+kernel@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 11:24:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix)
        id 9DF0D22EBE; Thu,  6 Aug 2020 18:24:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3DA6F22E02;
        Thu,  6 Aug 2020 18:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596738264;
        bh=/PTDXeYOWV9QWjTZIHRZoZzyNEJs3+9dKsJcQfHLRYQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G//rUJW4asuC/9ZXGjP4OyorW/E6c//1xsUBzMJAkrkvJUPVPp99t5znuqluXNtZY
         0jTUxnH0G3JnmPYD1Aq7Ha9ukgvnjQ0sjmZ2elsYLZdR94IKkTORFgIWzkxUQV1Axp
         /n00cmqUI3M6Ac9m0ocb9w4PzW2Wf8eiqT2qcDIY=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH v2 35/41] ARM: s3c: remove cpufreq header dependencies
Date:   Thu,  6 Aug 2020 20:20:52 +0200
Message-Id: <20200806182059.2431-35-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
X-TUID: iUbRvZe+9WgF
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The cpufreq drivers are split between the machine directory
and the drivers/cpufreq directory. In order to share header
files after we convert s3c to multiplatform, those headers
have to live in a different global location.

Move them to linux/soc/samsung/ in lack of a better place.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-s3c24xx/common.c                         |  1 -
 arch/arm/mach-s3c24xx/cpufreq-utils.c                  |  2 +-
 arch/arm/mach-s3c24xx/iotiming-s3c2410.c               |  2 +-
 arch/arm/mach-s3c24xx/iotiming-s3c2412.c               |  2 +-
 arch/arm/mach-s3c24xx/mach-bast.c                      |  2 +-
 arch/arm/mach-s3c24xx/mach-osiris-dvs.c                |  2 +-
 arch/arm/mach-s3c24xx/mach-osiris.c                    |  2 +-
 arch/arm/mach-s3c24xx/pll-s3c2410.c                    |  4 ++--
 arch/arm/mach-s3c24xx/pll-s3c2440-12000000.c           |  4 ++--
 arch/arm/mach-s3c24xx/pll-s3c2440-16934400.c           |  4 ++--
 arch/arm/mach-s3c24xx/s3c2410.c                        |  1 -
 arch/arm/mach-s3c24xx/s3c2412.c                        |  1 -
 arch/arm/mach-s3c24xx/s3c244x.c                        |  2 --
 arch/arm/mach-s3c64xx/s3c6400.c                        |  1 -
 arch/arm/mach-s3c64xx/s3c6410.c                        |  2 +-
 arch/arm/plat-samsung/include/plat/cpu.h               |  9 ---------
 drivers/cpufreq/s3c2410-cpufreq.c                      |  5 ++---
 drivers/cpufreq/s3c2412-cpufreq.c                      |  5 ++---
 drivers/cpufreq/s3c2440-cpufreq.c                      |  5 ++---
 drivers/cpufreq/s3c24xx-cpufreq-debugfs.c              |  2 +-
 drivers/cpufreq/s3c24xx-cpufreq.c                      |  5 ++---
 .../linux/soc/samsung/s3c-cpu-freq.h                   |  4 ++++
 .../linux/soc/samsung/s3c-cpufreq-core.h               |  6 +++++-
 include/linux/soc/samsung/s3c-pm.h                     | 10 ++++++++++
 24 files changed, 41 insertions(+), 42 deletions(-)
 rename arch/arm/plat-samsung/include/plat/cpu-freq.h => include/linux/soc/samsung/s3c-cpu-freq.h (97%)
 rename arch/arm/plat-samsung/include/plat/cpu-freq-core.h => include/linux/soc/samsung/s3c-cpufreq-core.h (98%)

diff --git a/arch/arm/mach-s3c24xx/common.c b/arch/arm/mach-s3c24xx/common.c
index c476a673d07f..f987de1a61c2 100644
--- a/arch/arm/mach-s3c24xx/common.c
+++ b/arch/arm/mach-s3c24xx/common.c
@@ -37,7 +37,6 @@
 
 #include <plat/cpu.h>
 #include <plat/devs.h>
-#include <plat/cpu-freq.h>
 #include <plat/pwm-core.h>
 
 #include "common.h"
diff --git a/arch/arm/mach-s3c24xx/cpufreq-utils.c b/arch/arm/mach-s3c24xx/cpufreq-utils.c
index 1a7f38d085dd..43ab714eaa9e 100644
--- a/arch/arm/mach-s3c24xx/cpufreq-utils.c
+++ b/arch/arm/mach-s3c24xx/cpufreq-utils.c
@@ -15,7 +15,7 @@
 #include <mach/map.h>
 #include <mach/regs-clock.h>
 
-#include <plat/cpu-freq-core.h>
+#include <linux/soc/samsung/s3c-cpufreq-core.h>
 
 #include "regs-mem.h"
 
diff --git a/arch/arm/mach-s3c24xx/iotiming-s3c2410.c b/arch/arm/mach-s3c24xx/iotiming-s3c2410.c
index 39081c41958c..5d85c259f328 100644
--- a/arch/arm/mach-s3c24xx/iotiming-s3c2410.c
+++ b/arch/arm/mach-s3c24xx/iotiming-s3c2410.c
@@ -17,7 +17,7 @@
 #include <mach/map.h>
 #include <mach/regs-clock.h>
 
-#include <plat/cpu-freq-core.h>
+#include <linux/soc/samsung/s3c-cpufreq-core.h>
 
 #include "regs-mem.h"
 
diff --git a/arch/arm/mach-s3c24xx/iotiming-s3c2412.c b/arch/arm/mach-s3c24xx/iotiming-s3c2412.c
index 59356d10fbcf..a22b5611697d 100644
--- a/arch/arm/mach-s3c24xx/iotiming-s3c2412.c
+++ b/arch/arm/mach-s3c24xx/iotiming-s3c2412.c
@@ -24,7 +24,7 @@
 #include <asm/mach/map.h>
 
 #include <plat/cpu.h>
-#include <plat/cpu-freq-core.h>
+#include <linux/soc/samsung/s3c-cpufreq-core.h>
 
 #include <mach/s3c2412.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-bast.c b/arch/arm/mach-s3c24xx/mach-bast.c
index 306891235f73..7e3ce48539c4 100644
--- a/arch/arm/mach-s3c24xx/mach-bast.c
+++ b/arch/arm/mach-s3c24xx/mach-bast.c
@@ -45,7 +45,7 @@
 #include <mach/gpio-samsung.h>
 
 #include <plat/cpu.h>
-#include <plat/cpu-freq.h>
+#include <linux/soc/samsung/s3c-cpu-freq.h>
 #include <plat/devs.h>
 #include <plat/gpio-cfg.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-osiris-dvs.c b/arch/arm/mach-s3c24xx/mach-osiris-dvs.c
index 5d819b6ea428..1250520b3bcc 100644
--- a/arch/arm/mach-s3c24xx/mach-osiris-dvs.c
+++ b/arch/arm/mach-s3c24xx/mach-osiris-dvs.c
@@ -14,7 +14,7 @@
 
 #include <linux/mfd/tps65010.h>
 
-#include <plat/cpu-freq.h>
+#include <linux/soc/samsung/s3c-cpu-freq.h>
 #include <mach/gpio-samsung.h>
 
 #define OSIRIS_GPIO_DVS	S3C2410_GPB(5)
diff --git a/arch/arm/mach-s3c24xx/mach-osiris.c b/arch/arm/mach-s3c24xx/mach-osiris.c
index ed10a32e26b8..258850c1bbb2 100644
--- a/arch/arm/mach-s3c24xx/mach-osiris.c
+++ b/arch/arm/mach-s3c24xx/mach-osiris.c
@@ -37,7 +37,7 @@
 #include <linux/mtd/partitions.h>
 
 #include <plat/cpu.h>
-#include <plat/cpu-freq.h>
+#include <linux/soc/samsung/s3c-cpu-freq.h>
 #include <plat/devs.h>
 #include <plat/gpio-cfg.h>
 
diff --git a/arch/arm/mach-s3c24xx/pll-s3c2410.c b/arch/arm/mach-s3c24xx/pll-s3c2410.c
index 0561f79ddce8..3fbc99eaa4a2 100644
--- a/arch/arm/mach-s3c24xx/pll-s3c2410.c
+++ b/arch/arm/mach-s3c24xx/pll-s3c2410.c
@@ -15,8 +15,8 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 
-#include <plat/cpu.h>
-#include <plat/cpu-freq-core.h>
+#include <linux/soc/samsung/s3c-cpufreq-core.h>
+#include <linux/soc/samsung/s3c-pm.h>
 
 /* This array should be sorted in ascending order of the frequencies */
 static struct cpufreq_frequency_table pll_vals_12MHz[] = {
diff --git a/arch/arm/mach-s3c24xx/pll-s3c2440-12000000.c b/arch/arm/mach-s3c24xx/pll-s3c2440-12000000.c
index 2ec3a2f9a6a5..fdb8e8c2fe3b 100644
--- a/arch/arm/mach-s3c24xx/pll-s3c2440-12000000.c
+++ b/arch/arm/mach-s3c24xx/pll-s3c2440-12000000.c
@@ -13,8 +13,8 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 
-#include <plat/cpu.h>
-#include <plat/cpu-freq-core.h>
+#include <linux/soc/samsung/s3c-cpufreq-core.h>
+#include <linux/soc/samsung/s3c-pm.h>
 
 /* This array should be sorted in ascending order of the frequencies */
 static struct cpufreq_frequency_table s3c2440_plls_12[] = {
diff --git a/arch/arm/mach-s3c24xx/pll-s3c2440-16934400.c b/arch/arm/mach-s3c24xx/pll-s3c2440-16934400.c
index 4b3d9e36c6bb..438b6fc099a4 100644
--- a/arch/arm/mach-s3c24xx/pll-s3c2440-16934400.c
+++ b/arch/arm/mach-s3c24xx/pll-s3c2440-16934400.c
@@ -13,8 +13,8 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 
-#include <plat/cpu.h>
-#include <plat/cpu-freq-core.h>
+#include <linux/soc/samsung/s3c-cpufreq-core.h>
+#include <linux/soc/samsung/s3c-pm.h>
 
 /* This array should be sorted in ascending order of the frequencies */
 static struct cpufreq_frequency_table s3c2440_plls_169344[] = {
diff --git a/arch/arm/mach-s3c24xx/s3c2410.c b/arch/arm/mach-s3c24xx/s3c2410.c
index 21fd5404bc98..8427c150dd22 100644
--- a/arch/arm/mach-s3c24xx/s3c2410.c
+++ b/arch/arm/mach-s3c24xx/s3c2410.c
@@ -30,7 +30,6 @@
 #include <asm/irq.h>
 #include <asm/system_misc.h>
 
-#include <plat/cpu-freq.h>
 
 #include <mach/regs-clock.h>
 
diff --git a/arch/arm/mach-s3c24xx/s3c2412.c b/arch/arm/mach-s3c24xx/s3c2412.c
index c3fb3e6c0dd8..209f952a6c98 100644
--- a/arch/arm/mach-s3c24xx/s3c2412.c
+++ b/arch/arm/mach-s3c24xx/s3c2412.c
@@ -34,7 +34,6 @@
 #include <mach/regs-gpio.h>
 
 #include <plat/cpu.h>
-#include <plat/cpu-freq.h>
 #include <plat/devs.h>
 #include <plat/pm.h>
 
diff --git a/arch/arm/mach-s3c24xx/s3c244x.c b/arch/arm/mach-s3c24xx/s3c244x.c
index a75f588b9d45..f5bd489bac85 100644
--- a/arch/arm/mach-s3c24xx/s3c244x.c
+++ b/arch/arm/mach-s3c24xx/s3c244x.c
@@ -28,8 +28,6 @@
 #include <mach/hardware.h>
 #include <asm/irq.h>
 
-#include <plat/cpu-freq.h>
-
 #include <mach/regs-clock.h>
 #include <mach/regs-gpio.h>
 
diff --git a/arch/arm/mach-s3c64xx/s3c6400.c b/arch/arm/mach-s3c64xx/s3c6400.c
index 81233495d548..d18af724c807 100644
--- a/arch/arm/mach-s3c64xx/s3c6400.c
+++ b/arch/arm/mach-s3c64xx/s3c6400.c
@@ -28,7 +28,6 @@
 
 #include <asm/irq.h>
 
-#include <plat/cpu-freq.h>
 #include <mach/regs-clock.h>
 
 #include <plat/cpu.h>
diff --git a/arch/arm/mach-s3c64xx/s3c6410.c b/arch/arm/mach-s3c64xx/s3c6410.c
index 9465a6e0f068..b1d725e55cd2 100644
--- a/arch/arm/mach-s3c64xx/s3c6410.c
+++ b/arch/arm/mach-s3c64xx/s3c6410.c
@@ -29,7 +29,7 @@
 
 #include <asm/irq.h>
 
-#include <plat/cpu-freq.h>
+#include <linux/soc/samsung/s3c-pm.h>
 #include <mach/regs-clock.h>
 
 #include <plat/cpu.h>
diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat-samsung/include/plat/cpu.h
index 93ecd7127831..20ff98d05c53 100644
--- a/arch/arm/plat-samsung/include/plat/cpu.h
+++ b/arch/arm/plat-samsung/include/plat/cpu.h
@@ -123,15 +123,6 @@ extern struct syscore_ops s3c2412_pm_syscore_ops;
 extern struct syscore_ops s3c2416_pm_syscore_ops;
 extern struct syscore_ops s3c244x_pm_syscore_ops;
 
-/* system device subsystems */
-
-extern struct bus_type s3c2410_subsys;
-extern struct bus_type s3c2410a_subsys;
-extern struct bus_type s3c2412_subsys;
-extern struct bus_type s3c2416_subsys;
-extern struct bus_type s3c2440_subsys;
-extern struct bus_type s3c2442_subsys;
-extern struct bus_type s3c2443_subsys;
 extern struct bus_type s3c6410_subsys;
 
 #endif
diff --git a/drivers/cpufreq/s3c2410-cpufreq.c b/drivers/cpufreq/s3c2410-cpufreq.c
index 5c6cb590b63f..9c2f29cacdd0 100644
--- a/drivers/cpufreq/s3c2410-cpufreq.c
+++ b/drivers/cpufreq/s3c2410-cpufreq.c
@@ -16,13 +16,12 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/soc/samsung/s3c-cpufreq-core.h>
+#include <linux/soc/samsung/s3c-pm.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <plat/cpu.h>
-#include <plat/cpu-freq-core.h>
-
 #include <mach/map.h>
 
 #define S3C2410_CLKREG(x) ((x) + S3C24XX_VA_CLKPWR)
diff --git a/drivers/cpufreq/s3c2412-cpufreq.c b/drivers/cpufreq/s3c2412-cpufreq.c
index d922d0d47c80..38dc9e6db633 100644
--- a/drivers/cpufreq/s3c2412-cpufreq.c
+++ b/drivers/cpufreq/s3c2412-cpufreq.c
@@ -19,15 +19,14 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/soc/samsung/s3c-cpufreq-core.h>
+#include <linux/soc/samsung/s3c-pm.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
 #include <mach/s3c2412.h>
 
-#include <plat/cpu.h>
-#include <plat/cpu-freq-core.h>
-
 #include <mach/map.h>
 
 #define S3C2410_CLKREG(x) ((x) + S3C24XX_VA_CLKPWR)
diff --git a/drivers/cpufreq/s3c2440-cpufreq.c b/drivers/cpufreq/s3c2440-cpufreq.c
index 5fe7a891fa13..442abdccb9c1 100644
--- a/drivers/cpufreq/s3c2440-cpufreq.c
+++ b/drivers/cpufreq/s3c2440-cpufreq.c
@@ -20,13 +20,12 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/soc/samsung/s3c-cpufreq-core.h>
+#include <linux/soc/samsung/s3c-pm.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <plat/cpu.h>
-#include <plat/cpu-freq-core.h>
-
 #include <mach/map.h>
 
 #define S3C2410_CLKREG(x) ((x) + S3C24XX_VA_CLKPWR)
diff --git a/drivers/cpufreq/s3c24xx-cpufreq-debugfs.c b/drivers/cpufreq/s3c24xx-cpufreq-debugfs.c
index 290e3539d03e..93971dfe7c75 100644
--- a/drivers/cpufreq/s3c24xx-cpufreq-debugfs.c
+++ b/drivers/cpufreq/s3c24xx-cpufreq-debugfs.c
@@ -18,7 +18,7 @@
 #include <linux/seq_file.h>
 #include <linux/err.h>
 
-#include <plat/cpu-freq-core.h>
+#include <linux/soc/samsung/s3c-cpufreq-core.h>
 
 static struct dentry *dbgfs_root;
 static struct dentry *dbgfs_file_io;
diff --git a/drivers/cpufreq/s3c24xx-cpufreq.c b/drivers/cpufreq/s3c24xx-cpufreq.c
index cf0571e8fafb..27111fbca2ff 100644
--- a/drivers/cpufreq/s3c24xx-cpufreq.c
+++ b/drivers/cpufreq/s3c24xx-cpufreq.c
@@ -21,13 +21,12 @@
 #include <linux/device.h>
 #include <linux/sysfs.h>
 #include <linux/slab.h>
+#include <linux/soc/samsung/s3c-cpufreq-core.h>
+#include <linux/soc/samsung/s3c-pm.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <plat/cpu.h>
-#include <plat/cpu-freq-core.h>
-
 #include <mach/map.h>
 
 /* note, cpufreq support deals in kHz, no Hz */
diff --git a/arch/arm/plat-samsung/include/plat/cpu-freq.h b/include/linux/soc/samsung/s3c-cpu-freq.h
similarity index 97%
rename from arch/arm/plat-samsung/include/plat/cpu-freq.h
rename to include/linux/soc/samsung/s3c-cpu-freq.h
index 558892bcf9b6..63e88fd5dea2 100644
--- a/arch/arm/plat-samsung/include/plat/cpu-freq.h
+++ b/include/linux/soc/samsung/s3c-cpu-freq.h
@@ -6,6 +6,8 @@
  *
  * S3C CPU frequency scaling support - driver and board
  */
+#ifndef __LINUX_SOC_SAMSUNG_S3C_CPU_FREQ_H
+#define __LINUX_SOC_SAMSUNG_S3C_CPU_FREQ_H
 
 #include <linux/cpufreq.h>
 
@@ -139,3 +141,5 @@ static inline int s3c_cpufreq_setboard(struct s3c_cpufreq_board *board)
 	return 0;
 }
 #endif  /* CONFIG_ARM_S3C_CPUFREQ */
+
+#endif
diff --git a/arch/arm/plat-samsung/include/plat/cpu-freq-core.h b/include/linux/soc/samsung/s3c-cpufreq-core.h
similarity index 98%
rename from arch/arm/plat-samsung/include/plat/cpu-freq-core.h
rename to include/linux/soc/samsung/s3c-cpufreq-core.h
index 2c7cf2665634..c578b07ccd5d 100644
--- a/arch/arm/plat-samsung/include/plat/cpu-freq-core.h
+++ b/include/linux/soc/samsung/s3c-cpufreq-core.h
@@ -6,8 +6,10 @@
  *
  * S3C CPU frequency scaling support - core support
  */
+#ifndef __LINUX_SOC_SAMSUNG_S3C_CPUFREQ_CORE_H
+#define __LINUX_SOC_SAMSUNG_S3C_CPUFREQ_CORE_H
 
-#include <plat/cpu-freq.h>
+#include <linux/soc/samsung/s3c-cpu-freq.h>
 
 struct seq_file;
 
@@ -285,3 +287,5 @@ static inline int s3c_cpufreq_addfreq(struct cpufreq_frequency_table *table,
 
 	return index + 1;
 }
+
+#endif
diff --git a/include/linux/soc/samsung/s3c-pm.h b/include/linux/soc/samsung/s3c-pm.h
index 730bd1d3d09a..f9164559c99f 100644
--- a/include/linux/soc/samsung/s3c-pm.h
+++ b/include/linux/soc/samsung/s3c-pm.h
@@ -81,4 +81,14 @@ extern void s3c_pm_check_store(void);
 #define s3c_pm_check_store()   do { } while (0)
 #endif
 
+/* system device subsystems */
+
+extern struct bus_type s3c2410_subsys;
+extern struct bus_type s3c2410a_subsys;
+extern struct bus_type s3c2412_subsys;
+extern struct bus_type s3c2416_subsys;
+extern struct bus_type s3c2440_subsys;
+extern struct bus_type s3c2442_subsys;
+extern struct bus_type s3c2443_subsys;
+
 #endif
-- 
2.17.1


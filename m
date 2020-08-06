Return-Path: <SRS0=KIUv=BQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9EF1C433DF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:38:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1404722C9F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596739116;
	bh=jrfTfMqqNK4Bu08uryiHCRmAlSmR+sRWLonChf0RUVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=fdsjY7FwFWpJ4q01Qn0+mVC6tbmEng/au+A849TCcQdhcrP14yCDsaFfRJPaWIVSa
	 nDxQKrzvJ1zEoq4GG/LdMlolE7sQnbDo39xE3IGBlDKdL6EEwg7FNzdL9/aEjBfHTX
	 n2B+CcUBrlsyZ9qGzKnVdXJJ27HkRaUjNejuLYLM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728330AbgHFSie (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 Aug 2020 14:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729015AbgHFSeV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 14:34:21 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A53C06138D
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2020 11:34:17 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a5so34969126wrm.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2020 11:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=t89of2ib66EvK/qIxdX9Z8OwhfoxuMvCv4hhykxxPHM=;
        b=gcvxvJjkkxGAdHAYUsTX1hQri9je/4Mm2RziHErCwJI5i8tLXE7XT71M+Pq/ePMcqZ
         tWbhbiZb6GR6pV/IT7p4+V2rklJz2w8igX7GVlOlX++zWnSnuFrqMRKDeW4gonzjC49e
         l1BFwLI5vwDfYQLHEYpzd2OhOpKCY30UmU8IgZwfEpgoTFeSnRf5HRS9ix4E6EzkrXRr
         zakLy5p0z6F+cMeWIRs63kXLrq4gk1tpoygv8I9alJhFBVeDr3x1bwFmYOyXw7HMel3B
         i144DPe4A8+wyNOmuU4zETwQIgRb17MUiKpb1majJpUoe1JOHdtZQq+jgKMdohGJLvN/
         e4Cg==
X-Gm-Message-State: AOAM533JfeIhZ8vu8Ou3ajimeWrWQnfItdB2RfDK3upbbd1Zl9Vtl3Ld
        2KThA6S8V5Jg1DrEPlBrsnKctXTeTZ4=
X-Google-Smtp-Source: ABdhPJywvU7nMHbCgWXgIANrAqbpJurGt0N4MC5u3lPwmbY1nvNzzWRx2lXtPHAEO9/gZdPdgLPbCw==
X-Received: by 2002:adf:b30c:: with SMTP id j12mr8423163wrd.420.1596738855387;
        Thu, 06 Aug 2020 11:34:15 -0700 (PDT)
Received: from kozik-lap ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id l18sm7584985wrm.52.2020.08.06.11.34.15
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 11:34:15 -0700 (PDT)
Received: by 2002:ab3:1105:0:0:0:0:0 with SMTP id j5csp1542204lta;
        Thu, 6 Aug 2020 11:24:19 -0700 (PDT)
X-Received: by 2002:a63:4b0c:: with SMTP id y12mr7740543pga.199.1596738259446;
        Thu, 06 Aug 2020 11:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596738259; cv=none;
        d=google.com; s=arc-20160816;
        b=d9upnIDC6bX+mGIDBKcIHVW6Th9dZD0kVuN+SuEE0x8zRO1vM89iZOCTfxH1oa1O60
         hHeVKvfpqEpit39ujQ/9uwwCCqTRW1I92TznDZaR/T58DfIP3yc2eQhBqX3MXnnMme5U
         kBvM9VDAsQpbfBLQa9aPW6UWWacoG7G0SzX+czHRLYa+zed95sSbtDB400bhFmmaZX7+
         sMzYn4ctI2yhFYaMgU6GFTgkDvROWuyddSF4bTakGPsDh8qxm3WjPq4yOBH3CEZ3PnkC
         49BeHYyRg32PMhQUZOtHU/0TwDN3TAhWT0Yb2Y5ii3jzn9v45CcPQGx6ML0NtQgwul/G
         dc8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:delivered-to;
        bh=t89of2ib66EvK/qIxdX9Z8OwhfoxuMvCv4hhykxxPHM=;
        b=I2lY1upvTBYSFwLLh0WQsaZSHGx4JBST3svBM+tu3T1rvgwFZ2URpIi8SGzya8dkYN
         qplaR71g/vLaCMhlj3Rz6XBXzhiCUGLEBp91DhkBUWhQazwPbU0GgWrwoF6VNVHOvgII
         zSnJxLopY2Zx4Oph4O/MeC423MX3OJE1oXkqBUN3jCkjZ/aLvsUoP3jdEa/i3aysNh+y
         itdvkxZXeHalGCZNfMUpZJtLn10ez0ogh5bBg3xFt20nE3uE2p2HEiYwTVjK/wKN2OuF
         Qv9O9d2bxt7/RJ3SoRWQugM+djl7z1Yc/pe+Qm7wnb3iEnbBbRnaA2mZpEvF75q1jwuk
         L3JA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=s1m6Niw6;
       spf=pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=krzk@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id h8si4082180pjt.14.2020.08.06.11.24.19
        for <k.kozlowski.k+kernel@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 11:24:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix)
        id 86B0023103; Thu,  6 Aug 2020 18:24:19 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A6E9422EBD;
        Thu,  6 Aug 2020 18:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596738259;
        bh=jrfTfMqqNK4Bu08uryiHCRmAlSmR+sRWLonChf0RUVQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=s1m6Niw69C99kV9/wFls7VY3aooYZo58lNSDxmPoeT3N05Ac+qqHtOwpvIBmwewtn
         Cj0y+jDgdQWZHi/wwx3p+oGGdAhCGVXSKu00oIsXJS+eFZM+uuSesef27ST3Tv3tui
         l0XEBnV9iSiieJK6h+8Yr7I8B0YTwNKWidMKHhGk=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Kukjin Kim <kgene@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 34/41] cpufreq: s3c24xx: split out registers
Date:   Thu,  6 Aug 2020 20:20:51 +0200
Message-Id: <20200806182059.2431-34-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
X-TUID: kIdrDZjK9w+6
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Each of the cpufreq drivers uses a fixed set of register
bits, copy those definitions into the drivers to avoid
including mach/regs-clock.h.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
[krzk: Fix build by copying also S3C2410_LOCKTIME]
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Copy also S3C2410_LOCKTIME to the driver.
---
 drivers/cpufreq/s3c2410-cpufreq.c | 11 +++++++++--
 drivers/cpufreq/s3c2412-cpufreq.c | 20 +++++++++++++++++++-
 drivers/cpufreq/s3c2440-cpufreq.c | 24 ++++++++++++++++++++++--
 drivers/cpufreq/s3c24xx-cpufreq.c |  5 ++++-
 4 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/drivers/cpufreq/s3c2410-cpufreq.c b/drivers/cpufreq/s3c2410-cpufreq.c
index 0c4f2ccd7e22..5c6cb590b63f 100644
--- a/drivers/cpufreq/s3c2410-cpufreq.c
+++ b/drivers/cpufreq/s3c2410-cpufreq.c
@@ -20,11 +20,18 @@
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <mach/regs-clock.h>
-
 #include <plat/cpu.h>
 #include <plat/cpu-freq-core.h>
 
+#include <mach/map.h>
+
+#define S3C2410_CLKREG(x) ((x) + S3C24XX_VA_CLKPWR)
+
+#define S3C2410_CLKDIVN	    S3C2410_CLKREG(0x14)
+
+#define S3C2410_CLKDIVN_PDIVN	     (1<<0)
+#define S3C2410_CLKDIVN_HDIVN	     (1<<1)
+
 /* Note, 2410A has an extra mode for 1:4:4 ratio, bit 2 of CLKDIV */
 
 static void s3c2410_cpufreq_setdivs(struct s3c_cpufreq_config *cfg)
diff --git a/drivers/cpufreq/s3c2412-cpufreq.c b/drivers/cpufreq/s3c2412-cpufreq.c
index 53385a9ab957..d922d0d47c80 100644
--- a/drivers/cpufreq/s3c2412-cpufreq.c
+++ b/drivers/cpufreq/s3c2412-cpufreq.c
@@ -23,12 +23,30 @@
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <mach/regs-clock.h>
 #include <mach/s3c2412.h>
 
 #include <plat/cpu.h>
 #include <plat/cpu-freq-core.h>
 
+#include <mach/map.h>
+
+#define S3C2410_CLKREG(x) ((x) + S3C24XX_VA_CLKPWR)
+
+#define S3C2410_CLKDIVN	    S3C2410_CLKREG(0x14)
+
+#define S3C2412_CLKDIVN_PDIVN		(1<<2)
+#define S3C2412_CLKDIVN_HDIVN_MASK	(3<<0)
+#define S3C2412_CLKDIVN_ARMDIVN		(1<<3)
+#define S3C2412_CLKDIVN_DVSEN		(1<<4)
+#define S3C2412_CLKDIVN_HALFHCLK	(1<<5)
+#define S3C2412_CLKDIVN_USB48DIV	(1<<6)
+#define S3C2412_CLKDIVN_UARTDIV_MASK	(15<<8)
+#define S3C2412_CLKDIVN_UARTDIV_SHIFT	(8)
+#define S3C2412_CLKDIVN_I2SDIV_MASK	(15<<12)
+#define S3C2412_CLKDIVN_I2SDIV_SHIFT	(12)
+#define S3C2412_CLKDIVN_CAMDIV_MASK	(15<<16)
+#define S3C2412_CLKDIVN_CAMDIV_SHIFT	(16)
+
 /* our clock resources. */
 static struct clk *xtal;
 static struct clk *fclk;
diff --git a/drivers/cpufreq/s3c2440-cpufreq.c b/drivers/cpufreq/s3c2440-cpufreq.c
index 3f772ba8896e..5fe7a891fa13 100644
--- a/drivers/cpufreq/s3c2440-cpufreq.c
+++ b/drivers/cpufreq/s3c2440-cpufreq.c
@@ -24,11 +24,31 @@
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <mach/regs-clock.h>
-
 #include <plat/cpu.h>
 #include <plat/cpu-freq-core.h>
 
+#include <mach/map.h>
+
+#define S3C2410_CLKREG(x) ((x) + S3C24XX_VA_CLKPWR)
+#define S3C2410_CLKDIVN	    S3C2410_CLKREG(0x14)
+#define S3C2440_CAMDIVN	    S3C2410_CLKREG(0x18)
+
+#define S3C2440_CLKDIVN_PDIVN	     (1<<0)
+#define S3C2440_CLKDIVN_HDIVN_MASK   (3<<1)
+#define S3C2440_CLKDIVN_HDIVN_1      (0<<1)
+#define S3C2440_CLKDIVN_HDIVN_2      (1<<1)
+#define S3C2440_CLKDIVN_HDIVN_4_8    (2<<1)
+#define S3C2440_CLKDIVN_HDIVN_3_6    (3<<1)
+#define S3C2440_CLKDIVN_UCLK         (1<<3)
+
+#define S3C2440_CAMDIVN_CAMCLK_MASK  (0xf<<0)
+#define S3C2440_CAMDIVN_CAMCLK_SEL   (1<<4)
+#define S3C2440_CAMDIVN_HCLK3_HALF   (1<<8)
+#define S3C2440_CAMDIVN_HCLK4_HALF   (1<<9)
+#define S3C2440_CAMDIVN_DVSEN        (1<<12)
+
+#define S3C2442_CAMDIVN_CAMCLK_DIV3  (1<<5)
+
 static struct clk *xtal;
 static struct clk *fclk;
 static struct clk *hclk;
diff --git a/drivers/cpufreq/s3c24xx-cpufreq.c b/drivers/cpufreq/s3c24xx-cpufreq.c
index ed0e713b1b57..cf0571e8fafb 100644
--- a/drivers/cpufreq/s3c24xx-cpufreq.c
+++ b/drivers/cpufreq/s3c24xx-cpufreq.c
@@ -28,9 +28,12 @@
 #include <plat/cpu.h>
 #include <plat/cpu-freq-core.h>
 
-#include <mach/regs-clock.h>
+#include <mach/map.h>
 
 /* note, cpufreq support deals in kHz, no Hz */
+#define S3C2410_CLKREG(x) ((x) + S3C24XX_VA_CLKPWR)
+#define S3C2410_LOCKTIME    S3C2410_CLKREG(0x00)
+#define S3C2410_MPLLCON     S3C2410_CLKREG(0x04)
 
 static struct cpufreq_driver s3c24xx_driver;
 static struct s3c_cpufreq_config cpu_cur;
-- 
2.17.1


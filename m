Return-Path: <SRS0=3dq4=EN=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B38C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  7 Nov 2020 12:15:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B099E20888
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  7 Nov 2020 12:15:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F46HQ1XI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727608AbgKGMPH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 7 Nov 2020 07:15:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727264AbgKGMPG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 7 Nov 2020 07:15:06 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA39C0613CF;
        Sat,  7 Nov 2020 04:15:04 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id s30so5677572lfc.4;
        Sat, 07 Nov 2020 04:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8+Mm44weplld/dSNNRNUy7NBfXXfQxTylZi90l7dWis=;
        b=F46HQ1XI/INYQ7QCgO/1nFtEUip8UcNsw77sK+EOHgPoA37xQiKMI1YEg9yGHvVP1L
         NXSNEFJLV9uiBbUklfUWAD7/K2vgab61sY/NtQk48GcY9lrVdYqxqvR+TQsin3r2ldpn
         QuBit5fdNORZoTL9hOoKfQLZ8/UlqWdkQLkE103KiaMSoiK/c231lcvqz5bMjD+Gh2Uu
         0X5OUJWK/KgZ/fzXki016xj79F4dxkn8rgFy69DUVIWc6RL033U43v5QSOvolZ4UB49Y
         DtiJuMHXrMn8FyWPSAz3rD+quEdxxq1ZzAeo8lOQJuvN9m8kB6L+CETuF75WKg4jvJKz
         6BGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8+Mm44weplld/dSNNRNUy7NBfXXfQxTylZi90l7dWis=;
        b=hBFpGfcmIE6fraZwkOzIULljpIpMaRV/6GDoWB5A00wEKKTKF9Rn0gSrtm3raCFx3c
         p9a14PD5DMxDWtYrVh7DRwdavv2Qbi9TPIqvdgpRiDYF6QmfaNdjz5rR83T/b/nHCZZ8
         jhTCOgrqUMTEJ6kAnoGtwpZZ0i9mp2ijkBf8pkllgtGgBpEWMAk7VqA1L3pnPhhkNu9b
         uTMovFrf2axMMVOSS/ASzVNF+Z1K37WYnPQVFeftM6CAbeGIUEjfIQF/k1Tc7BrIEKM1
         X7Vc8wKS8chMA4FOeV4xCEIlG/oDKxhPjHXpqQSmWj7oUCzjJ2olh9x195mmh1vfowRp
         WJtA==
X-Gm-Message-State: AOAM530QfP3Q8o22qvrIkJzlYyDOSaU70YlBSCJa4PfBeZr1r+00SJ9g
        ytO351WrmL8xa/9AoGqXjUk=
X-Google-Smtp-Source: ABdhPJyXSihKMIVg9TRTUqhHcpHCcsdtTm44JJEMUD1eZcPni5jfyGby+/1mUJWfiSZK+7QD+mGl1g==
X-Received: by 2002:ac2:5e91:: with SMTP id b17mr2392285lfq.442.1604751303425;
        Sat, 07 Nov 2020 04:15:03 -0800 (PST)
Received: from localhost.localdomain ([2a02:a315:5445:5300:d646:fcbb:9c5e:1da1])
        by smtp.googlemail.com with ESMTPSA id y26sm489828lfe.164.2020.11.07.04.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 04:15:02 -0800 (PST)
From:   =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
To:     kgene@kernel.org, krzk@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     s.nawrocki@samsung.com, tomasz.figa@gmail.com,
        cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH v2] clk: exynos7: Keep aclk_fsys1_200 enabled
Date:   Sat,  7 Nov 2020 13:14:56 +0100
Message-Id: <20201107121456.25562-1-pawel.mikolaj.chmiel@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This clock must be always enabled to allow access to any registers in
fsys1 CMU. Until proper solution based on runtime PM is applied
(similar to what was done for Exynos5433), fix this by calling
clk_prepare_enable() directly from clock provider driver.

It was observed on Samsung Galaxy S6 device (based on Exynos7420), where
UFS module is probed before pmic used to power that device.
In this case defer probe was happening and that clock was disabled by
UFS driver, causing whole boot to hang on next CMU access.

Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
Changes from v1:
  - Instead of marking clock as critical, enable it manually in driver.
---
 drivers/clk/samsung/clk-exynos7.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index c1ff715e960c..e05b673e277f 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -6,6 +6,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/of.h>
+#include <linux/clk.h>
 
 #include "clk.h"
 #include <dt-bindings/clock/exynos7-clk.h>
@@ -571,6 +572,10 @@ static const struct samsung_cmu_info top1_cmu_info __initconst = {
 static void __init exynos7_clk_top1_init(struct device_node *np)
 {
 	samsung_cmu_register_one(np, &top1_cmu_info);
+	/*
+	 * Keep top FSYS1 aclk enabled permanently. It's required for CMU register access.
+	 */
+	clk_prepare_enable(__clk_lookup("aclk_fsys1_200"));
 }
 
 CLK_OF_DECLARE(exynos7_clk_top1, "samsung,exynos7-clock-top1",
-- 
2.27.0


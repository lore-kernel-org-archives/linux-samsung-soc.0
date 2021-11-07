Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055F1C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  7 Nov 2021 20:30:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E211F61360
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  7 Nov 2021 20:30:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235541AbhKGUdI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 7 Nov 2021 15:33:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236577AbhKGUcu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 7 Nov 2021 15:32:50 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8EFBC06122C
        for <linux-samsung-soc@vger.kernel.org>; Sun,  7 Nov 2021 12:30:00 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id bu18so31738244lfb.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 07 Nov 2021 12:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9RBK6L5sPHBfA9E4ROAzR6qwhEdcT7uzmZdJODyoaHE=;
        b=p9s4I/1cufJuq7N0Ql9FShfZUL6xclTHtK9U+Dx+lKbOhZsM13PA/ZCCRlvRFmc8Kb
         MtrU1eNsAnbMh/kyjkPwTkTm2YQ6wXE0WASHANre6YZErjSObsip/S7WCKV++b83b+ef
         sylMJ3IKBsyKqk5zJSY/F5BE5zZgC6xPAWTNVFbAYCS0CoRiJk8IGX1f4SetNJTC5oCJ
         5aGghZFhMT4AWXY2bi9M7+d7yKn1N7oFDwPUYqbSsACtd8kPWogkA9KbuiGn5kwQKo4j
         VU1IrSMGA/ZEeCrnFsPU3LdfDbWjbhYNMNZik+ACnXRkaZuJ4SNFKPbohE/b+Na4QZ1W
         S3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9RBK6L5sPHBfA9E4ROAzR6qwhEdcT7uzmZdJODyoaHE=;
        b=gIdZLSXuPAV3ESYaWCEur7WEMofd+eED8Ow5MXFOc0YmHIN358+9nOeNNsjsvP1Fbz
         Ew08m9uW+POu1Gh+P2eFIiTIRvsBNGCJsUUbBSOQFCVZ71SeWlTSPghOLd8Z6gD4QqWL
         mRoSJz5Nn4mYRtctYT3H4Sa4EASMbOggtQ6WjK6EhZp1oc+TLb3ha8yrBCShtzvgdBzY
         IT/ndi+G4y6men6KEQsmx00lirWqqpL7Dey/B2hZH/5VYW8kct8eRo5qxKI0gatoCrR7
         VsRAtToYOU1ajhSzEOSsoR34FRSsbOeL110YHT3aU8Vg50xFUpNe2QzDKVXAdT2M+5tb
         A6dQ==
X-Gm-Message-State: AOAM533w+hI0AZW/Cm7DLHFj8sN/oDpK7WwEuWdMCwX14aqRqCVwRehr
        kzm0CGa9NnDLC5kqwE5NVl2TKg==
X-Google-Smtp-Source: ABdhPJwMH3gpWIlfVe0lnvJlooRW94dMT8JoEqnaNL5EGkVfAh50QJ4xv4o3IlpkhzEjl/I2Et1Ugw==
X-Received: by 2002:a05:6512:3192:: with SMTP id i18mr1355151lfe.569.1636316999205;
        Sun, 07 Nov 2021 12:29:59 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id w15sm22444lfe.245.2021.11.07.12.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 12:29:58 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 08/12] watchdog: s3c2410: Add support for WDT counter enable register
Date:   Sun,  7 Nov 2021 22:29:39 +0200
Message-Id: <20211107202943.8859-9-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211107202943.8859-1-semen.protsenko@linaro.org>
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On new Exynos chips (e.g. Exynos850) new CLUSTERx_NONCPU_OUT register is
introduced, where CNT_EN_WDT bit must be enabled to make watchdog
counter running. Add corresponding quirk and proper infrastructure to
handle that register if the quirk is set.

This commit doesn't bring any functional change to existing devices, but
merely provides an infrastructure for upcoming chips support.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
Changes in v3:
  - Added R-b tag by Krzysztof Kozlowski

Changes in v2:
  - Used quirks instead of callbacks for all added PMU registers
  - Used BIT() macro
  - Extracted cleanup code to separate patch to minimize changes and
    ease the review and porting

 drivers/watchdog/s3c2410_wdt.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 2a61b6ea5602..ec341c876225 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -60,11 +60,13 @@
 #define QUIRK_HAS_RST_STAT			(1 << 1)
 #define QUIRK_HAS_WTCLRINT_REG			(1 << 2)
 #define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
+#define QUIRK_HAS_PMU_CNT_EN			(1 << 4)
 
 /* These quirks require that we have a PMU register map */
 #define QUIRKS_HAVE_PMUREG			(QUIRK_HAS_PMU_CONFIG | \
 						 QUIRK_HAS_RST_STAT | \
-						 QUIRK_HAS_PMU_AUTO_DISABLE)
+						 QUIRK_HAS_PMU_AUTO_DISABLE | \
+						 QUIRK_HAS_PMU_CNT_EN)
 
 static bool nowayout	= WATCHDOG_NOWAYOUT;
 static int tmr_margin;
@@ -98,6 +100,8 @@ MODULE_PARM_DESC(soft_noboot, "Watchdog action, set to 1 to ignore reboots, 0 to
  * @rst_stat_reg: Offset in pmureg for the register that has the reset status.
  * @rst_stat_bit: Bit number in the rst_stat register indicating a watchdog
  * reset.
+ * @cnt_en_reg: Offset in pmureg for the register that enables WDT counter.
+ * @cnt_en_bit: Bit number for "watchdog counter enable" in cnt_en register.
  * @quirks: A bitfield of quirks.
  */
 
@@ -108,6 +112,8 @@ struct s3c2410_wdt_variant {
 	int mask_bit;
 	int rst_stat_reg;
 	int rst_stat_bit;
+	int cnt_en_reg;
+	int cnt_en_bit;
 	u32 quirks;
 };
 
@@ -233,6 +239,20 @@ static int s3c2410wdt_mask_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
 	return ret;
 }
 
+static int s3c2410wdt_enable_counter(struct s3c2410_wdt *wdt, bool en)
+{
+	const u32 mask_val = BIT(wdt->drv_data->cnt_en_bit);
+	const u32 val = en ? mask_val : 0;
+	int ret;
+
+	ret = regmap_update_bits(wdt->pmureg, wdt->drv_data->cnt_en_reg,
+				 mask_val, val);
+	if (ret < 0)
+		dev_err(wdt->dev, "failed to update reg(%d)\n", ret);
+
+	return ret;
+}
+
 static int s3c2410wdt_mask_and_disable_reset(struct s3c2410_wdt *wdt, bool mask)
 {
 	int ret;
@@ -249,6 +269,12 @@ static int s3c2410wdt_mask_and_disable_reset(struct s3c2410_wdt *wdt, bool mask)
 			return ret;
 	}
 
+	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_CNT_EN) {
+		ret = s3c2410wdt_enable_counter(wdt, !mask);
+		if (ret < 0)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.30.2


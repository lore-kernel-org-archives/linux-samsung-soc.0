Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DBF2CCA479
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  1 Jul 2022 08:21:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234697AbiGAIVp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 1 Jul 2022 04:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233332AbiGAIVa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 1 Jul 2022 04:21:30 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028DF7124C
        for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Jul 2022 01:21:12 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id g20-20020a17090a579400b001ed52939d72so1961068pji.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Jul 2022 01:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qsU9wtO366QGqn2stFTSeEtjcXZrw3Fi++5zsewllw4=;
        b=mYbS8wl99X3HCAP868Vx551nyMcsU2v27Yzpw3q4wB28iGCSEzCU3T0L8B0sy6bCqv
         9aJFzKf3Vy6vNlnXsdYt/mCa4W/t+sqSy3Pmq9d4xWm5xNJjSPgyulzm9a9b59WMhV3d
         7XQGmImKOgc+60IYmIPEAY6dCC83cYEJEoNsFbS+XNuKPQD/938dZxx7pqInsIkjx/nO
         +ppaJFCWTUvdJj66YGKGgpj4WgDu3Cey9bLwQsUKp/R50GCosKHyQq2bPAxjY+UP2v7/
         wzjNBbh3hGEdsoHbuc0EIBBu4sPWBFfKorijzTYSyLupD4nRXlDPybYJnS/jvV+8s4a1
         rjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qsU9wtO366QGqn2stFTSeEtjcXZrw3Fi++5zsewllw4=;
        b=rpJJK6ly9ItMAco11d9UpTMLLPy93OI7K1NG6oIld3nO5ZiYZVLtAJUVO/LGCfYWVr
         +bqaZoTRxIeLjp6Lii78HIDFO4CosTT3r0rX2iUD9g/IIjaOP09p7nKiBAWP3XzSgTmx
         7lRVDw3rvVNM56ycU8LQTQK0FGKpBE7PuuxhT829/lOgpt+Lmag/+5XkHA6BZEVqDSNg
         Q9bZyhBwPz2bGhQgtVyNWyr9rJECHohkf8bY8hwU5cZZugL/6kKJBvS2Lvxeog4hP8BZ
         rC7jHCHbsolWJA8qvjR0wPnZwXxCwnxNt5w7ilRNRo1q5mkJikXqjCYWwCz9qx7deTIe
         xI7g==
X-Gm-Message-State: AJIora8yFuAOi0Balx/upwRxtTCAht9/d+6jW6KxSdilCXA6q2rkRnvp
        Ia12S+zf3s/br8aYzutORn+gJg==
X-Google-Smtp-Source: AGRyM1sFl5EDfJmLxUmQIL9clpelCvUmhUe8DIu10IpEDNEAFe1uijgj4nsnsYzo39Vt/eVZslGEtA==
X-Received: by 2002:a17:902:e546:b0:16b:8f8a:3344 with SMTP id n6-20020a170902e54600b0016b8f8a3344mr18796467plf.130.1656663672403;
        Fri, 01 Jul 2022 01:21:12 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id h8-20020a056a00170800b0050dc762819bsm15055700pfc.117.2022.07.01.01.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 01:21:12 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 10/30] devfreq: exynos: Migrate to dev_pm_opp_set_config()
Date:   Fri,  1 Jul 2022 13:50:05 +0530
Message-Id: <14d236f519900b7bb7859b4690aca62979b78ce6.1656660185.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1656660185.git.viresh.kumar@linaro.org>
References: <cover.1656660185.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The OPP core now provides a unified API for setting all configuration
types, i.e. dev_pm_opp_set_config().

Lets start using it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/devfreq/exynos-bus.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
index e689101abc93..b5615e667e31 100644
--- a/drivers/devfreq/exynos-bus.c
+++ b/drivers/devfreq/exynos-bus.c
@@ -33,7 +33,7 @@ struct exynos_bus {
 
 	unsigned long curr_freq;
 
-	struct opp_table *opp_table;
+	int opp_token;
 	struct clk *clk;
 	unsigned int ratio;
 };
@@ -161,8 +161,7 @@ static void exynos_bus_exit(struct device *dev)
 
 	dev_pm_opp_of_remove_table(dev);
 	clk_disable_unprepare(bus->clk);
-	dev_pm_opp_put_regulators(bus->opp_table);
-	bus->opp_table = NULL;
+	dev_pm_opp_clear_config(bus->opp_token);
 }
 
 static void exynos_bus_passive_exit(struct device *dev)
@@ -179,18 +178,20 @@ static int exynos_bus_parent_parse_of(struct device_node *np,
 					struct exynos_bus *bus)
 {
 	struct device *dev = bus->dev;
-	struct opp_table *opp_table;
 	const char *vdd = "vdd";
 	int i, ret, count, size;
+	struct dev_pm_opp_config config = {
+		.regulator_names = &vdd,
+		.regulator_count = 1,
+	};
 
-	opp_table = dev_pm_opp_set_regulators(dev, &vdd, 1);
-	if (IS_ERR(opp_table)) {
-		ret = PTR_ERR(opp_table);
-		dev_err(dev, "failed to set regulators %d\n", ret);
+	ret = dev_pm_opp_set_config(dev, &config);
+	if (ret < 0) {
+		dev_err(dev, "failed to set OPP config %d\n", ret);
 		return ret;
 	}
 
-	bus->opp_table = opp_table;
+	bus->opp_token = ret;
 
 	/*
 	 * Get the devfreq-event devices to get the current utilization of
@@ -236,8 +237,7 @@ static int exynos_bus_parent_parse_of(struct device_node *np,
 	return 0;
 
 err_regulator:
-	dev_pm_opp_put_regulators(bus->opp_table);
-	bus->opp_table = NULL;
+	dev_pm_opp_clear_config(bus->opp_token);
 
 	return ret;
 }
@@ -459,8 +459,7 @@ static int exynos_bus_probe(struct platform_device *pdev)
 	dev_pm_opp_of_remove_table(dev);
 	clk_disable_unprepare(bus->clk);
 err_reg:
-	dev_pm_opp_put_regulators(bus->opp_table);
-	bus->opp_table = NULL;
+	dev_pm_opp_clear_config(bus->opp_token);
 
 	return ret;
 }
-- 
2.31.1.272.g89b43f80a514


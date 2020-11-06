Return-Path: <SRS0=C3hI=EM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA32DC4741F
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Nov 2020 07:05:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F48B20825
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Nov 2020 07:05:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u0KpNSdR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgKFHFd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Nov 2020 02:05:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbgKFHFc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Nov 2020 02:05:32 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B5B5C0613D3
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2020 23:05:31 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id q10so487050pfn.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Nov 2020 23:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bPLnUhtQ+dxcmE2HZpN7gVFh2Ut9iquGsDOuyt2kO74=;
        b=u0KpNSdRcvSh+32Vu+x4+8GMjysg6sJiq7B/sGt8ogBO1oSA3jDOLGPpCS1Gd/cAFD
         0OoWP2xdGgLxyacl2f604zjp6ou/DJEvb7GsBBpwq9GNFyEr3i+ft0RYetIgg368pllK
         qyubNricG/aQ37BkTkdxMVIeklBhhk4gfbKt/nnOVGD2VLBE5cY+RfniKlVMt6O4Kl0r
         p9IiJ+DagxIgUTl/1hWMRHfS/mjHy0xK3Md8d+d/W0zZG7OHXDgiICyfm20dMruPyqVX
         5WJgMqWlFH64yHnPunk3djYTru3nfLWKkINRmr900FWq7VLdrUbBXAU5cT2iJp2VraFm
         pyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bPLnUhtQ+dxcmE2HZpN7gVFh2Ut9iquGsDOuyt2kO74=;
        b=nfU/DY8LPSAKh/qpgzudLBZiS7gmKJaUvFqtaYwJsmVT3kUDvkyaYzmffxL+ZwfeTl
         zjO8kp/YBcmS41CNAzYPuRo8LLoxw8r7wReybyDk7lIxt3/M537TI4WGKBpYFYHC4t8X
         B6k6aaydd+QWlH+NJ5diTRyKIN2LBa/Ce2/KAdpo4kMchdEAzz/FOdCHRecr6qpiePjQ
         5Vxk3AWorF+IzBGZQ8xD2dMJYDnTLkhRNHdOniEJuzV6028s8Bh3t4KWCtrCwomLZi9h
         5pC4jxtfQL6s00z/q6eD5jCRQPPy2uzQEQPStNxvqmrP1I8nHh2ZSrs8owDopuWbsesC
         KWoA==
X-Gm-Message-State: AOAM530Zgu0ZTUzAR3jmaS9ZsQ3uH5PnBb7ImNBH7G62xfb7Oj8sXcjg
        kUFgbQ/whviEj89WUOFTldirSA==
X-Google-Smtp-Source: ABdhPJyBtb/um3G88EzMU4Kq9QyIxQlTChGUKgp2/W1s9MAQ5iKpigRZ0JWM11UwJXEolvoibo//FA==
X-Received: by 2002:aa7:9ac7:0:b029:18b:36d2:784b with SMTP id x7-20020aa79ac70000b029018b36d2784bmr825878pfp.20.1604646331033;
        Thu, 05 Nov 2020 23:05:31 -0800 (PST)
Received: from localhost ([122.172.12.172])
        by smtp.gmail.com with ESMTPSA id 16sm779560pfp.163.2020.11.05.23.05.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Nov 2020 23:05:30 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        digetx@gmail.com, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] devfreq: exynos: dev_pm_opp_put_*() accepts NULL argument
Date:   Fri,  6 Nov 2020 12:33:24 +0530
Message-Id: <b3c936d862b8c81ab568f38bd7acc438cb7efac8.1604646059.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1604646059.git.viresh.kumar@linaro.org>
References: <cover.1604646059.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The dev_pm_opp_put_*() APIs now accepts a NULL opp_table pointer and so
there is no need for us to carry the extra check. Drop them.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/devfreq/exynos-bus.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
index 1e684a448c9e..143fd58ec3dc 100644
--- a/drivers/devfreq/exynos-bus.c
+++ b/drivers/devfreq/exynos-bus.c
@@ -158,10 +158,8 @@ static void exynos_bus_exit(struct device *dev)
 
 	dev_pm_opp_of_remove_table(dev);
 	clk_disable_unprepare(bus->clk);
-	if (bus->opp_table) {
-		dev_pm_opp_put_regulators(bus->opp_table);
-		bus->opp_table = NULL;
-	}
+	dev_pm_opp_put_regulators(bus->opp_table);
+	bus->opp_table = NULL;
 }
 
 static void exynos_bus_passive_exit(struct device *dev)
@@ -444,10 +442,8 @@ static int exynos_bus_probe(struct platform_device *pdev)
 	dev_pm_opp_of_remove_table(dev);
 	clk_disable_unprepare(bus->clk);
 err_reg:
-	if (!passive) {
-		dev_pm_opp_put_regulators(bus->opp_table);
-		bus->opp_table = NULL;
-	}
+	dev_pm_opp_put_regulators(bus->opp_table);
+	bus->opp_table = NULL;
 
 	return ret;
 }
-- 
2.25.0.rc1.19.g042ed3e048af


Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F25EC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 14 Sep 2021 15:56:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F54961163
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 14 Sep 2021 15:56:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234457AbhINP5a (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 14 Sep 2021 11:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233875AbhINP53 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Sep 2021 11:57:29 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40A3DC061762
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Sep 2021 08:56:12 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id p15so24835176ljn.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Sep 2021 08:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q4orUGhIY8AIL0IaUBN0v2F6x+wP94qlQUHr4gzQ1HY=;
        b=xH/7ymzMCA4XcMiCojiw0g6bs54GiLlLySMqIyU/azwTgDlDc8dm1BM5B3ZtNofVZy
         CtlruqKxsj7Q4XODxjwk6CTBW58RKIYGTprrnYClD75XzK+fv/kFilw5nhIxVlJRhg3q
         ChAtMDKJ1ZfcawdBVGfyk0vyPlghG2sysom3cRHLHKYG9M52CCTNmZ9yS0g//VHLCOQ/
         IGLc6otc/Hqp0+lyyE22anuVBfcT5/m1z8LHgD4xfejk7CQzwY2z7UWPSRbmTck9qYsZ
         A2NQkvqd4uQOmdhiyKxfDlThhUQbxTP+aOnEcm7Gw6oLxuGAwdBdptuiMz5Ptkr2nEe7
         mmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q4orUGhIY8AIL0IaUBN0v2F6x+wP94qlQUHr4gzQ1HY=;
        b=La87d7sqBDCpFjUaSE/wH9NJ60/ZGqoe5YpsV2mDwAphB6kQZlFSgbDtcD8oe4Xkjk
         ocWIyzYlVJ7vsCEp/n13EHaicCYbDEvBR+stpYGhCedaNrM20L5lY7TG0sk7hiK3W0R4
         Mkqekbn6hxfRu1vWmkU6Vx/mAYfJbNIty1hmpZyZqUqXZMOnvbE+LgwNPsqbojnbUGXN
         XlX9SrINWhvSs3zx81JYuugRyjkMnDI8ex+BtlbVqVVWbTSVRHJqPPLqHRhFpGZKvFiw
         6EfdZe22LExfoMyPYMXvE9yMrPdtKhGHgzITJjYwGR5TTN7X1rx5EFul4ld2aWr/uc22
         KLzA==
X-Gm-Message-State: AOAM531rpBdfs69JmHAugpaJBDryiFknZoCL0xNm1qKiPxBiVxQSOgpg
        8QlquqBw6AbXXzB0OtaTnheSZQ==
X-Google-Smtp-Source: ABdhPJwO70aUjV39HqWuDerU0hehqKv9dn4e0sQk89xQLfwxXVsyHPTANAi2u/rHKEGtKWiko6h8mQ==
X-Received: by 2002:a2e:a4ad:: with SMTP id g13mr16112113ljm.391.1631634970657;
        Tue, 14 Sep 2021 08:56:10 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id b20sm1151951lfc.75.2021.09.14.08.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 08:56:09 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/6] clk: samsung: Enable bus clock on init
Date:   Tue, 14 Sep 2021 18:56:02 +0300
Message-Id: <20210914155607.14122-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210914155607.14122-1-semen.protsenko@linaro.org>
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

By default if bus clock has no users its "enable count" value is 0. It
might be actually running if it's already enabled in bootloader, but
then in some cases it can be disabled by mistake. For example, such case
was observed when dw_mci_probe() enabled bus clock, then failed to do
something and disabled that bus clock on error path. After that even
attempt to read the 'clk_summary' file in DebugFS freezed forever, as
CMU bus clock ended up being disabled and it wasn't possible to access
CMU registers anymore.

To avoid such cases, CMU driver must increment the ref count for that
bus clock by running clk_prepare_enable(). There is already existing
'.clk_name' field in struct samsung_cmu_info, exactly for that reason.
It was added in commit 523d3de41f02 ("clk: samsung: exynos5433: Add
support for runtime PM"). But the clock is actually enabled only in
Exynos5433 clock driver. Let's mimic what is done there in generic
samsung_cmu_register_one() function, so other drivers can benefit from
that `.clk_name' field. As was described above, it might be helpful not
only for PM reasons, but also to prevent possible erroneous clock gating
on error paths.

Another way to workaround that issue would be to use CLOCK_IS_CRITICAL
flag for corresponding gate clocks. But that might be not very good
design decision, as we might still want to disable that bus clock, e.g.
on PM suspend.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/clk/samsung/clk.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 1949ae7851b2..da65149fa502 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -357,6 +357,19 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
 
 	ctx = samsung_clk_init(np, reg_base, cmu->nr_clk_ids);
 
+	/* Keep bus clock running, so it's possible to access CMU registers */
+	if (cmu->clk_name) {
+		struct clk *bus_clk;
+
+		bus_clk = __clk_lookup(cmu->clk_name);
+		if (bus_clk) {
+			clk_prepare_enable(bus_clk);
+		} else {
+			pr_err("%s: could not find bus clock %s\n", __func__,
+			       cmu->clk_name);
+		}
+	}
+
 	if (cmu->pll_clks)
 		samsung_clk_register_pll(ctx, cmu->pll_clks, cmu->nr_pll_clks,
 			reg_base);
-- 
2.30.2


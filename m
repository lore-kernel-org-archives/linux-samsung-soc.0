Return-Path: <SRS0=KIUv=BQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A64DC433E3
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:38:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 782EF22D00
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596739123;
	bh=zSPJaWHqH2p/CnzlIYBwfeQwSQSWPlKg7XPNzrWLNhA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=i/eZYrVNnq8eYcMBvJwKLp8jOcL/5nugmmvyBhoX0n3pVyp+L8ImHxPDqkm7d2bNJ
	 8iNeyBcyxaBQwfziZtncRgDPrH59icHLuL8w5XogN/Hd5ZM7rEFqYbztbMrR+0u71w
	 DK2p2Akb9Q3l3Bg2MhD1c4f8bvANZr2opBheVwAE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbgHFSil (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 Aug 2020 14:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728888AbgHFSeN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 14:34:13 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFBA4C0617AA
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2020 11:34:12 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id 88so44905737wrh.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2020 11:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=BvZzFNHiosFLcH0DFWnAAvhZ6W4EhT+Q6WS2Z3nHJrw=;
        b=i+XjG+WSsCCuNWnuJj46a3E8UuY/dhvWCwiIV0NCGTW736KCLXScDeGN1OJH/DfRMW
         tHY46UfVAMgOM+h3KBRwSKcs5lNuo9m4/lmhb0TyTmWF+h7YW2f/v9gHPlA5UAkVXtiw
         eMdY2qqio8Q1MN0AzJ9QDawYEVADlAE1ul0lCsWruCeHmbe7V7KvQsYi5p0wmQ5DFCGS
         HzYiInjBV1mhLJoAn5qeRugv/2zjtc+mVNAYMmRm7ulxBhfcJIHfk72moHRZ7XLqAQax
         nmoPrPYow/NahrwxyNKEOFkPJI3H+8WYfkb+zFreFICAUd7FZswd+cBmLyMIoLEmQvkQ
         kyLw==
X-Gm-Message-State: AOAM53148nFnli521dWt1fuZ661NTylyR+ZzlU0ZdFChp39p/hXmWUQy
        RWlUgqHd4AuN7qNtMhhwuagvBwRvajA=
X-Google-Smtp-Source: ABdhPJwkXdxWhE6zbwxdrqvLA9mCL+HuoEptjSmgPQ3VlLwKJtt9PQM0R8tmqChqzLcs3rbcNR9KlA==
X-Received: by 2002:a5d:4802:: with SMTP id l2mr8154149wrq.183.1596738851211;
        Thu, 06 Aug 2020 11:34:11 -0700 (PDT)
Received: from kozik-lap ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id 15sm6980754wmo.33.2020.08.06.11.34.10
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 11:34:11 -0700 (PDT)
Received: by 2002:ab3:1105:0:0:0:0:0 with SMTP id j5csp1542385lta;
        Thu, 6 Aug 2020 11:24:34 -0700 (PDT)
X-Received: by 2002:aa7:8751:: with SMTP id g17mr9286481pfo.109.1596738273965;
        Thu, 06 Aug 2020 11:24:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596738273; cv=none;
        d=google.com; s=arc-20160816;
        b=S8H9YPW+Q1WQohBX9ejYOVXJT9Fw8OrTWT4tabjA0kB0X6GqCNykICJRRxUCX9LpbM
         QXCdS+iV6xShbbZM2fh95HLoC2/fzYHshewC7R4fdeR91mRwZmzZrLWK9eYc59ZzhXNt
         4s8ox3y3az290/MPZ4DL2UIv0+diw+0NsECpWKpSMklTaTXg76ORcZg9t4y4rWhd0frF
         j5J/DETSEvNslww+7eWqpqC38MIhVwuTJLJrQiDkTdLgPW4I9yO1Ep5Xn5aotuWInBl/
         6TfvvO/TEBQSLGssSc0DuIGqxXG5g/B2+X+yG0f8alMPJkPwmQAnhruPnSj9UtepmGI6
         XMsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:delivered-to;
        bh=BvZzFNHiosFLcH0DFWnAAvhZ6W4EhT+Q6WS2Z3nHJrw=;
        b=cpOkXe8NMaxYRdm0EV54y0uhHt4vNeTX9luVUpmQ3vLgCqj9/8pZipZyk9z90HFeRr
         B1B5wsyKczCHR18c4c+DLwkXNAzBEtvpz3AYuc3ifSmorgnup4/RtiMWITeVSSZG0GiS
         0XnN2XTw8kZmMdiumLC/A96cVN8ii1PxBQ9SMsTeAngeDbHh4EkbI1Y8ibsLr5O6IhvU
         8KpB5iV9u43MDiNLb1X+4wVP33F+N4dL8ymNVZ0OLdIU+33QhtLuCTYxz/JcG7YeLeeP
         EsCRVAk5pnyVmEUNUNGv63xf3ny3pol+dwIzIrlbHyf9UtjPU5RPlgx/GzNrGtV0+xvV
         n/FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=S5KbQ5A9;
       spf=pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=krzk@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id d20si4127992pgl.224.2020.08.06.11.24.33
        for <k.kozlowski.k+kernel@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 11:24:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix)
        id 02FE322EBE; Thu,  6 Aug 2020 18:24:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5D68A230FF;
        Thu,  6 Aug 2020 18:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596738273;
        bh=zSPJaWHqH2p/CnzlIYBwfeQwSQSWPlKg7XPNzrWLNhA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=S5KbQ5A9Y1pof988/YmoJ7Aa3Z9HTb54MDsEFrSUXTpzc8LRFH74k+14NcynvJz4r
         BUrQZBTHPraTFJJmjSlc1Ft3yqBz/GxSSihYvWiOsSKQStmqnmtun1SbwMXH6YATtp
         +dU3HKOOTlyG8degP9b5d7+7XoeTj1PK87Xl82lw=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH v2 36/41] cpufreq: s3c2412: use global s3c2412_cpufreq_setrefresh
Date:   Thu,  6 Aug 2020 20:20:53 +0200
Message-Id: <20200806182059.2431-36-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
X-TUID: XXZn3wgYpF5u
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

There are two identical copies of the s3c2412_cpufreq_setrefresh
function: a static one in the cpufreq driver and a global
version in iotiming-s3c2412.c.

As the function requires the use of a hardcoded register address
from a header that we want to not be visible to drivers, just
move the existing global function and add a declaration in
one of the cpufreq header files.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/cpufreq/s3c2412-cpufreq.c            | 23 --------------------
 include/linux/soc/samsung/s3c-cpufreq-core.h |  1 +
 2 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/cpufreq/s3c2412-cpufreq.c b/drivers/cpufreq/s3c2412-cpufreq.c
index 38dc9e6db633..a77c63e92e1a 100644
--- a/drivers/cpufreq/s3c2412-cpufreq.c
+++ b/drivers/cpufreq/s3c2412-cpufreq.c
@@ -25,8 +25,6 @@
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <mach/s3c2412.h>
-
 #include <mach/map.h>
 
 #define S3C2410_CLKREG(x) ((x) + S3C24XX_VA_CLKPWR)
@@ -156,27 +154,6 @@ static void s3c2412_cpufreq_setdivs(struct s3c_cpufreq_config *cfg)
 	clk_set_parent(armclk, cfg->divs.dvs ? hclk : fclk);
 }
 
-static void s3c2412_cpufreq_setrefresh(struct s3c_cpufreq_config *cfg)
-{
-	struct s3c_cpufreq_board *board = cfg->board;
-	unsigned long refresh;
-
-	s3c_freq_dbg("%s: refresh %u ns, hclk %lu\n", __func__,
-		     board->refresh, cfg->freq.hclk);
-
-	/* Reduce both the refresh time (in ns) and the frequency (in MHz)
-	 * by 10 each to ensure that we do not overflow 32 bit numbers. This
-	 * should work for HCLK up to 133MHz and refresh period up to 30usec.
-	 */
-
-	refresh = (board->refresh / 10);
-	refresh *= (cfg->freq.hclk / 100);
-	refresh /= (1 * 1000 * 1000);	/* 10^6 */
-
-	s3c_freq_dbg("%s: setting refresh 0x%08lx\n", __func__, refresh);
-	__raw_writel(refresh, S3C2412_REFRESH);
-}
-
 /* set the default cpu frequency information, based on an 200MHz part
  * as we have no other way of detecting the speed rating in software.
  */
diff --git a/include/linux/soc/samsung/s3c-cpufreq-core.h b/include/linux/soc/samsung/s3c-cpufreq-core.h
index c578b07ccd5d..e0c7217a0f53 100644
--- a/include/linux/soc/samsung/s3c-cpufreq-core.h
+++ b/include/linux/soc/samsung/s3c-cpufreq-core.h
@@ -248,6 +248,7 @@ extern int s3c2412_iotiming_calc(struct s3c_cpufreq_config *cfg,
 
 extern void s3c2412_iotiming_set(struct s3c_cpufreq_config *cfg,
 				 struct s3c_iotimings *iot);
+extern void s3c2412_cpufreq_setrefresh(struct s3c_cpufreq_config *cfg);
 #else
 #define s3c2412_iotiming_debugfs NULL
 #define s3c2412_iotiming_calc NULL
-- 
2.17.1


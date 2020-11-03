Return-Path: <SRS0=6Xyg=EJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1AD4C2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 15:29:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D71D223EA
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 15:29:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="doDInUww"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728534AbgKCP3a (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Nov 2020 10:29:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728523AbgKCP3a (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 10:29:30 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C73C061A04
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Nov 2020 07:29:29 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id b3so13090767wrx.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Nov 2020 07:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KAOtHAc1bsJpW+rLliOxjaTckSKYVoP83N5QdT3qSsE=;
        b=doDInUwwodLhGXQs8awNNS8kXdhdZIg/tUhIdyz9t4xqY/0Mm/CcWlW4ckUbGn63PM
         nkZKOLW37j2rDl9MyotYFUDWfXtNZQ75o3MbwJ7H3xixJdrQHv0oNn0Lq9pNBCAQ7n7h
         0EE68rUTJuLMPHJgUkt1zmz2dG6K/4IlcfiC/kd9FUmWn3xD5iWrTE3dFm6HS/ADLV9t
         1woLUC5MSyOmhYkRCGrGvd+ZLNGAl3aMqCQsppZeegy/sw1+CUg5pugsgGh45ENGXOQ7
         TBdBtMAiD2bwi4YZjlqLr6KrHWoorUy0Ow7zXD6U04GhFYSQmnT12/sN6/bLqIEJg7qK
         t7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KAOtHAc1bsJpW+rLliOxjaTckSKYVoP83N5QdT3qSsE=;
        b=o2ndYZ96EiwyjUrPD9718hmum6Tg0fiUyfAo1+k4/AT029GeF7aWPZOanHSsrKUI/b
         NFfskGxggFuKMKgzt2MKKlHFE3M3uOCUPrCcHhnAKJQH8YfNdhBq/AnxSL3B0JdVQirY
         4uWLT7RawGQtlo0XO8/U/3UZDnmi7vct0MYEQVwCrEIpMOIG934aFz/5SLkFWnAhSh2l
         Usl9pNSNGWlpeqlScK+qGvPtIE1hFdEhErODqVZ2QZJkoogL3X54RAabwezC36U5D81o
         gmogH61gwUJNPU6AjyYprW3gtEho9y0Ppqq8Z7XGw+ED9Ewm/KGaEuM7E/gPL/d0rS5M
         UX1Q==
X-Gm-Message-State: AOAM5328iXhpVhU1KJlqVx4huKmqnuZpMr9JL7ZrJn7eAGdUrg4sKsRb
        5SBhMHi1cJz94j/VNJQRrVzA4g==
X-Google-Smtp-Source: ABdhPJzjZkSv+KzIvPwjWBSTfMSDm6x9636dav/awqODx24ADwz3jbCIg5PoHjTLCYH52ivoPVhyPA==
X-Received: by 2002:adf:c101:: with SMTP id r1mr25706240wre.87.1604417368565;
        Tue, 03 Nov 2020 07:29:28 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id j127sm3491779wma.31.2020.11.03.07.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 07:29:27 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Ben Dooks <ben@simtec.co.uk>, linux-samsung-soc@vger.kernel.org
Subject: [PATCH 14/25] soc: samsung: s3c-pm-check: Fix incorrectly named variable 'val'
Date:   Tue,  3 Nov 2020 15:28:27 +0000
Message-Id: <20201103152838.1290217-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103152838.1290217-1-lee.jones@linaro.org>
References: <20201103152838.1290217-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/soc/samsung/s3c-pm-check.c:162: warning: Function parameter or member 'val' not described in 's3c_pm_runcheck'
 drivers/soc/samsung/s3c-pm-check.c:162: warning: Excess function parameter 'vak' description in 's3c_pm_runcheck'

Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ben Dooks <ben@simtec.co.uk>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/soc/samsung/s3c-pm-check.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/s3c-pm-check.c b/drivers/soc/samsung/s3c-pm-check.c
index ff3e099fc2080..439d5c3725125 100644
--- a/drivers/soc/samsung/s3c-pm-check.c
+++ b/drivers/soc/samsung/s3c-pm-check.c
@@ -151,7 +151,7 @@ static inline int in_region(void *ptr, int size, void *what, size_t whatsz)
 /**
  * s3c_pm_runcheck() - helper to check a resource on restore.
  * @res: The resource to check
- * @vak: Pointer to list of CRC32 values to check.
+ * @val: Pointer to list of CRC32 values to check.
  *
  * Called from the s3c_pm_check_restore() via s3c_pm_run_sysram(), this
  * function runs the given memory resource checking it against the stored
-- 
2.25.1


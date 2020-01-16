Return-Path: <SRS0=lUWc=3F=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B674AC33CB3
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Jan 2020 18:24:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 93F1D20684
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Jan 2020 18:24:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kZSr6tlx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436615AbgAPSYC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Jan 2020 13:24:02 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34442 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436589AbgAPSXn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Jan 2020 13:23:43 -0500
Received: by mail-wr1-f68.google.com with SMTP id t2so20197604wrr.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jan 2020 10:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jVFQAPxxxKh7BrL4PuCJstmTo/0eDvZwSXWF/c8o6TQ=;
        b=kZSr6tlxSDSMnhpEyb/7zL0zkHF/eQHJsSEZIjt4kMNTn7yeMUkfCQpBlCmhqiVs0L
         kaQsclQziov1CuI4PtdACm3Stz1bhl1yRQ9gXYmGBaTuV3kAw3+mqueisvUv5m6jYlRM
         TOznzUPgDAw/04lwlnAJ8Un+fydTco+kDdceRwDBWYW/kfHaJzDRyHAaRE8hPZUg/aWv
         Abj21FQ1ZpKllu317NhyxkQ124z8T0IygtlzAfjl8QEhVndCYngUlMc06TDR38ePDr1y
         rg9o7NOx8WEKf247RbRlmP/oskQ5yjD8QEy82KwbWIDJldVzkKQ1wPXiZL477W9kNEdh
         TLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jVFQAPxxxKh7BrL4PuCJstmTo/0eDvZwSXWF/c8o6TQ=;
        b=SLcnWmP4eUApqHePVcyINH4n9Z8MdvEhk3ze/zJm3pyLOhDcaExvhWyFu9+u0ul0aO
         ndReStVCeh1TZXnDfyNH7QnHtDVqIYc2mok0OitKGLCNoL/ImP7XBpIJ1wL+EQK9YUHZ
         3+aZni7zCKZRG57/errZApXIuB6llYbVmXThI07TRtAXIDLD0WEaZ+ZabdnMrjQiJ+i6
         BZazAHvP+IO+DfFuRM0DnLcE1FzirzdTFB0YS5GlbEh2JxPy3gU1cIOC+TxOeILBp0IL
         ug+GvbBkjMe/aPkf1xNjnXhvM39MoW++6rqbz6YnoN0TXLpzTqaKQ1RCIaLCQwrVw8qy
         gmfA==
X-Gm-Message-State: APjAAAXy5tSOO+iSXA267RLVr1GbMKt6wHA2xJLdFsvsNrWzHYLyIkfg
        4KEYKRzRSECfoxwczkbW4JTMeA==
X-Google-Smtp-Source: APXvYqxYBVzqX3/EddcHNcmwFI/IL+L51NjyXmq8HQM5xvfKCgh/wFpBEMU1Qnog3sNzqLpphKL6Lw==
X-Received: by 2002:adf:ef0b:: with SMTP id e11mr4719536wro.128.1579199022086;
        Thu, 16 Jan 2020 10:23:42 -0800 (PST)
Received: from mai.imgcgcw.net ([2a01:e34:ed2f:f020:6c63:1b50:1156:7f0f])
        by smtp.gmail.com with ESMTPSA id b137sm1087920wme.26.2020.01.16.10.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 10:23:41 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     tglx@linutronix.de
Cc:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG EXYNOS
        ARM ARCHITECTURES),
        linux-samsung-soc@vger.kernel.org (moderated list:ARM/SAMSUNG EXYNOS
        ARM ARCHITECTURES)
Subject: [PATCH 14/17] clocksource/drivers/exynos_mct: Rename Exynos to lowercase
Date:   Thu, 16 Jan 2020 19:23:01 +0100
Message-Id: <20200116182304.4926-14-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200116182304.4926-1-daniel.lezcano@linaro.org>
References: <74bf7170-401f-2962-ea5a-1e21431a9349@linaro.org>
 <20200116182304.4926-1-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

Fix up inconsistent usage of upper and lowercase letters in "Exynos"
name.

"EXYNOS" is not an abbreviation but a regular trademarked name.
Therefore it should be written with lowercase letters starting with
capital letter.

The lowercase "Exynos" name is promoted by its manufacturer Samsung
Electronics Co., Ltd., in advertisement materials and on website.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Link: https://lore.kernel.org/r/20200104152107.11407-12-krzk@kernel.org
---
 drivers/clocksource/exynos_mct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 74cb299f5089..a267fe31ef13 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2011 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
  *
- * EXYNOS4 MCT(Multi-Core Timer) support
+ * Exynos4 MCT(Multi-Core Timer) support
 */
 
 #include <linux/interrupt.h>
-- 
2.17.1


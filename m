Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7496C433ED
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 May 2021 20:29:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1D55613C2
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 May 2021 20:29:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234339AbhEFUam (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 May 2021 16:30:42 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49237 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234194AbhEFUal (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 May 2021 16:30:41 -0400
Received: from mail-qt1-f197.google.com ([209.85.160.197])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lekcv-0001dg-Kq
        for linux-samsung-soc@vger.kernel.org; Thu, 06 May 2021 20:29:41 +0000
Received: by mail-qt1-f197.google.com with SMTP id k13-20020ac8140d0000b02901bad0e39d8fso4330901qtj.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 May 2021 13:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MEVMUDWkqGHYlLcG9Az7Ro+mD4OVQo3sjNJ8RnA9DCE=;
        b=PEztYQOQ/Exnvb5CvL1B0yyIvBi47u9eOa+GE4uqf4RdwJI646/rg+xk7Q876u6mcE
         24bNneKkdEj7lOn2lmTmV4E4M4bcbvhkZyJN9xiC5gTIVQA4f2W7dOmoLWvO/pHWw0kB
         Ofw2bNZ/YsPIZsqr+FTcXzBfWlIx5UmILL9xNdxKCRg2f+lo9bHt7ygqA2MsKXjKvvNp
         VNhA8D8bzCBp9jYz7HnOZLnuslrhjbSBTvkO8BI9bsP2H8D+XQO8ODWlBBtyjmr7mKS7
         cGdVLg3vkgqPxK30fHZyret2k9sOO9NAvD+l5WK7DmJSBFmdWfgGPXyucuZwuUvhZD3r
         k1bg==
X-Gm-Message-State: AOAM530YBC/pyqrHil454LT3icOE/o2FwEJqWM/nbpwcKYm2C6OFjQvy
        fK1K7VTwg3rurbDtSyjg3jsbWwyrtIPlu40dYoP/ZtOdEQa70nqhp1VSvtoksBzNyk9t7TGDxED
        UoQKHqpRkNsxincyhmC864jYoYLvxy1UuZ3Z505SHBIgIoVS3
X-Received: by 2002:ac8:6a07:: with SMTP id t7mr6289060qtr.74.1620332980815;
        Thu, 06 May 2021 13:29:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGTOcflvNGn/QW/M44UQ6PapIvsGKyEKZR1mufl7BaAi09QOxao1TSWpkNhvwAlfCnFrWG3Q==
X-Received: by 2002:ac8:6a07:: with SMTP id t7mr6289043qtr.74.1620332980669;
        Thu, 06 May 2021 13:29:40 -0700 (PDT)
Received: from localhost.localdomain ([45.237.49.6])
        by smtp.gmail.com with ESMTPSA id r9sm3151363qtf.62.2021.05.06.13.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 13:29:40 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 5/5] MAINTAINERS: Include Samsung PWM in Samsung SoC entry
Date:   Thu,  6 May 2021 16:27:29 -0400
Message-Id: <20210506202729.157260-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210506202729.157260-1-krzysztof.kozlowski@canonical.com>
References: <20210506202729.157260-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Samsung PWM and PWM-based timer/clocksource drivers lacked dedicated
maintainers entry.  They are used on all Samsung SoC designs (although
timer/clocksource driver only on older platforms), so include them in
Samsung SoC entry maintained by Krzysztof Kozlowski.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

This can go via clocksource/drivers tree or I can take it via Samsung
SoC.
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efeaebe1bcae..bb9c5815a308 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2436,9 +2436,12 @@ F:	drivers/*/*/*s3c24*
 F:	drivers/*/*s3c24*
 F:	drivers/*/*s3c64xx*
 F:	drivers/*/*s5pv210*
+F:	drivers/clocksource/samsung_pwm_timer.c
 F:	drivers/memory/samsung/
+F:	drivers/pwm/pwm-samsung.c
 F:	drivers/soc/samsung/
 F:	drivers/tty/serial/samsung*
+F:	include/clocksource/samsung_pwm.h
 F:	include/linux/platform_data/*s3c*
 F:	include/linux/serial_s3c.h
 F:	include/linux/soc/samsung/
-- 
2.25.1

